require('pg')

class SQLRunner


  def self.execute(sql, values = [])
    begin
      db = PG.connect({dbname: 'cinema', host: 'localhost'})
      db.prepare('the_sql', sql)
      results = db.exec_prepared('the_sql', values)
    ensure
      db.close unless db == nil
    end
    return results
  end


end
