class Screening

  attr_reader :id, :film_id, :screening, :seats
  attr_writer :film_id, :screening
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id'].to_i
    @screening = options['screening']
    @seats = options['seats'].to_i
  end

  def self.map_items(data_hash)
    result = data_hash.map { |data| self.new( data ) }
    return result
  end

  def self.list_all
    sql = 'SELECT * FROM screenings;'
    results = self.map_items(SQLRunner.execute(sql))
    return results
  end

  def self.delete_all
    sql = 'DELETE FROM screenings;'
    SQLRunner.execute(sql)
  end

  def self.get_all_film_screenings
    sql = 'SELECT films.id, films.title, films.price, screenings.id, screenings.screening, screenings.seats
    FROM films
    INNER JOIN screenings
    ON films.id = screenings.film_id;'
    results = SQLRunner.execute(sql)
  end

  def save
    sql = 'INSERT INTO screenings (film_id, screening, seats) VALUES ($1, $2, $3) RETURNING id;'
    values = [@film_id, @screening, @seats]
    @id = SQLRunner.execute(sql, values).first['id'].to_i
  end

  def update
    sql = 'UPDATE screenings SET (film_id, screening, seats) = ($1, $2, $3) WHERE id = $4;'
    values = [@film_id, @screening, @seats, @id]
    SQLRunner.execute(sql, values)
  end

  def delete
    sql = "DELETE FROM screenings WHERE id = $1;"
    values = [@id]
    SQLRunner.execute(sql, values)
  end

end
