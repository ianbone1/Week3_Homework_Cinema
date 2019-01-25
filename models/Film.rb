class Film

  attr_reader :id, :title, :price
  attr_writer :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_f.round(2)
  end

  def self.map_data(data_hash)
    result = data_hash.map { |data| self.new( data ) }
    return result
  end

  def self.list_all
    sql = 'SELECT * FROM films;'
    results = self.map_data(SQLRunner.execute(sql))
    return results
  end

  def self.delete_all
    sql = 'DELETE FROM films;'
    SQLRunner.execute(sql)
  end

  def self.find_film_price(film_id)
    sql = 'SELECT films.price FROM films WHERE films.id = $1;'
    values = [film_id]
    return SQLRunner.execute(sql, values).first['price'].to_f.round(2)
  end

  def save
    sql = 'INSERT INTO films (title, price) values ( $1, $2) RETURNING id;'
    values = [@title, @price]
    @id = SQLRunner.execute(sql, values).first['id'].to_i
  end

  def update
    sql = 'UPDATE films SET (title, price) = ($1, $2) WHERE id = $3;'
    values = [@title, @price, @id]
    SQLRunner.execute(sql, values)
  end

  def delete
    sql = 'DELETE FROM films WHERE id = $1;'
    values = [@id]
    SQLRunner.execute(sql, values)
  end

  def customers
    sql = 'SELECT customers.*
    FROM customers
    INNER JOIN tickets
    ON customers.id = tickets.customer_id
    WHERE tickets.film_id = $1
    ORDER BY customers.name;'
    values = [@id]
    return Customer.map_data(SQLRunner.execute(sql, values))
  end

  def customer_count
    sql = 'SELECT COUNT(customers.*) FROM customers
    INNER JOIN tickets
    on tickets.customer_id = customers.id
    WHERE tickets.film_id = $1;'
    values = [@id]
    return SQLRunner.execute(sql, values).first['count'].to_i
  end

end
