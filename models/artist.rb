require('pg')

class Artist

  attr_reader :name, :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end



  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update()
    sql = "UPDATE artists SET (title) = ($1) WHERE id = $2"
    values = [@title, @id]
    result = SqlRunner(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM  artists"
    return SqlRunner.run(sql).map{|person| Artist.new(person)}
  end

  def self.delete_all
    sql = "DELETE FROM artists"
    result = SqlRunner.run(sql)
  end

  def albums
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    value = [@id]
    results = SqlRunner(sql, value)
    album = results.map{|record| Album.new(record)}
  end

  def delete
    sql = "DELETE FROM artists WHERE id = $1"
    value = [@id]
    result = SqlRunner(sql, value)
  end

  def find(id)
    sql = "SELECT * FROM artist WHERE id = $1"
    value = [@id]
    result = Artist.new(SqlRunner(sql, value).first)
  end

end
