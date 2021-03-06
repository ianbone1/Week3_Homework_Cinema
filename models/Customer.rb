require_relative('../db/SQLRunner.rb')

class Customer

  attr_reader :id, :name, :funds
  attr_writer :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_f.round(2)
  end

  def self.map_data(data_hash)
    result = data_hash.map { |data| self.new( data ) }
    return result
  end

  def self.list_all
    sql = 'SELECT * FROM customers;'
    return self.map_data(SQLRunner.execute(sql))
  end

  def self.delete_all
    sql = 'DELETE FROM customers;'
    SQLRunner.execute(sql)
  end

  def save
    sql = "INSERT INTO customers (name, funds) values ( $1, $2) RETURNING id;"
    values = [@name, @funds]
    @id = SQLRunner.execute(sql, values).first['id'].to_i
  end

  def update
    sql = 'UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3;'
    values = [@name, @funds, @id]
    SQLRunner.execute(sql, values)
  end

  def delete
    sql = 'DELETE FROM customers WHERE id = $1;'
    values = [@id]
    SQLRunner.execute(sql, values)
  end

  def films
    sql = 'SELECT films.* FROM films
    INNER JOIN screenings ON films.id = screenings.film_id
    INNER JOIN tickets ON tickets.screening_id = screenings.id
    WHERE tickets.customer_id = $1
    ORDER BY films.title;'
    values = [@id]
    return Film.map_data(SQLRunner.execute(sql, values))
  end

  def film_count
    sql = 'SELECT COUNT(id) FROM tickets
        WHERE customer_id = $1;'
    values = [@id]
    return SQLRunner.execute(sql, values).first['count'].to_i
  end

  def buy_ticket(the_screening)
    film_price = Film.find_film_price(the_screening.film_id)
    tickets_already_sold = Ticket.count_screening_sales(the_screening.id)

    return nil if the_screening.seats <= tickets_already_sold
    return nil if @funds < film_price
    #check if tickets available
    @funds -= film_price
    @funds = @funds.round(2)
 # binding.pry
    the_ticket = Ticket.new({'customer_id' => @id, 'screening_id' => the_screening.id})
    the_ticket.id = the_ticket.save()
    update()
    return the_ticket
  end
end
