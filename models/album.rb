require('pg')

class Album

  attr_reader :title, :genre, :artist_id

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @genre, @artist_id]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def update()
    sql = "UPDATE albums SET (title, genre, artist_id) = ($1, $2, $3) WHERE id = $4"
    values = [@title, @genre, @artist_id, @id]
    result = SqlRunner(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM albums"
    return SqlRunner.run(sql).map{|record| Album.new(record)}
  end

  def self.delete_all
    sql = "DELETE FROM albums"
    result = SqlRunner.run(sql)
  end

  def artist
    sql = "SELECT * FROM artists WHERE id = $1"
    value = [@artist]
    return Artist.new(SqlRunner.run(sql, value).first)
  end

  #note to self; .first is returning the first value in the array, but there is only one value in the array so it's just the syntax for retrunging a single value from an array

  def delete
    sql = "DELETE FROM artists WHERE id = $1"
    value = [@id]
    result = SqlRunner(sql, value)
  end

  def find(id)
    sql = "SELECT * FROM album WHERE id = $1"
    value = [@id]
    result = Album.new(SqlRunner(sql, value).first)
  end
end
