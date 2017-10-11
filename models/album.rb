require("PG")
require_relative("../db/sql_runner.rb")
require_relative("artist.rb")

class Album

  attr_reader(:id, :title, :genre, :artist_id)

  def initialize(album)
    @id = album['id'].to_i if album['id']
    @title = album['title']
    @genre = album['genre']
    @artist_id = album['artist_id']

  end

  def save_album()
    sql = " INSERT INTO album(title,genre,artist_id) VALUES($1,$2,$3) returning *"
    values = [@title,@genre,@artist_id]

    result = SqlRunner.run(sql,values)
    @id= result[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM album"
    values = []
    mega_string = SqlRunner.run(sql,values)
    return mega_string.map {|album| Album.new(album)}

  end

  def artist()
    sql = "SELECT * FROM artist WHERE id = $1"
    values = [@artist_id]
    list_of_artists = SqlRunner.run(sql,values)
    return list_of_artists.map {|artist| Artist.new(artist)}
  end




end
