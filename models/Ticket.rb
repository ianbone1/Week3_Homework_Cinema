require_relative('../db/SQLRunner.rb')
require_relative('./Customer.rb')
require_relative('./Film.rb')

class Ticket
attr_reader :id
attr_writer :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
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

  def save
    sql = 'INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2) RETURNING id;'
    values = [@customer_id, @film_id]
    @id = SQLRunner.execute(sql, values).first['id'].to_i
  end

  def update
    sql = 'UPDATE tickets SET (customer_id, film_id) = ($1, $2) WHERE id = $3;'
    values = [@customer_id, @film_id, @id]
    SQLRunner.execute(sql, values)
  end

  def delete
    sql = "DELETE FROM tickets WHERE id = $1;"
    values = [@id]
    SQLRunner.execute(sql, values)
  end


end
