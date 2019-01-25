require_relative('../db/SQLRunner.rb')
require_relative('./Customer.rb')
require_relative('./Film.rb')

class Ticket
attr_reader :id, :customer_id, :screening_id
attr_writer :id, :customer_id, :screening_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @screening_id = options['screening_id'].to_i
  end

  def self.map_items(data_hash)
    result = data_hash.map { |data| self.new( data ) }
    return result
  end

  def self.list_all
    sql = 'SELECT * FROM tickets;'
    results = self.map_items(SQLRunner.execute(sql))
    return results
  end

  def self.delete_all
    sql = 'DELETE FROM tickets;'
    SQLRunner.execute(sql)
  end

  def self.show_ticket_sales
    sql = 'SELECT films.title, screenings.screening, COUNT(*)
          FROM films
          INNER JOIN screenings
          ON films.id = screenings.film_id
          INNER JOIN tickets
          ON screenings.id = tickets.screening_id
          GROUP BY films.title, screenings.screening
          ORDER BY count DESC;'
    return SQLRunner.execute(sql)
  end

  def self.count_screening_sales(the_screening_id)
    sql = 'SELECT COUNT(*)
           FROM tickets
           WHERE screening_id = $1;'
    values = [the_screening_id]
    return SQLRunner.execute(sql,values).first['count'].to_i
  end

  def save
    sql = 'INSERT INTO tickets (customer_id, screening_id) VALUES ($1, $2) RETURNING id;'
    values = [@customer_id, @screening_id]
    @id = SQLRunner.execute(sql, values).first['id'].to_i
  end

  def update
    sql = 'UPDATE tickets SET (customer_id, screening_id) = ($1, $2) WHERE id = $3;'
    values = [@customer_id, @screening_id, @id]
    SQLRunner.execute(sql, values)
  end

  def delete
    sql = "DELETE FROM tickets WHERE id = $1;"
    values = [@id]
    SQLRunner.execute(sql, values)
  end


end
