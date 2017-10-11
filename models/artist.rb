require("PG")
require_relative("../db/sql_runner.rb")
require_relative("album.rb")


class Artist

  attr_reader(:id)
  attr_accessor(:name)

  def initialize (artist)
    @id = artist['id'].to_i if artist['id']
    @name = artist['name']
  end


  def save_artist()
    sql = "INSERT INTO artist(name) VALUES($1) RETURNING id"
    values = [@name]

    result = SqlRunner.run(sql,values)
    @id = result[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM artist"
    values = []
    artist = SqlRunner.run(sql,values)
    return artist.map {|artist| Artist.new(artist)}
  end

  def albums()
    sql = "SELECT * FROM album WHERE artist_id = $1"
    values = [@id]
    list = SqlRunner.run(sql,values)
    return list.map {|album| Album.new(album)}
  end

  def delete()
    sql = "DELETE FROM artist WHERE id = $1"
    values = [@id]
    name = @name
    SqlRunner.run(sql,values)
    return "#{name} was deleted"
  end

  def self.delete_all()
    sql = "DELETE FROM artist"
    values = []
    SqlRunner.run(sql,values)
    return "All artists cleared"
  end

  def update()
    sql = " UPDATE artist SET(name)=($1) WHERE id = $2"
    values = [@name, @id]
    name = @name
    SqlRunner.run(sql,values)
    return "#{name} was updated"
  end


end
