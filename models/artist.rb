require("PG")
require_relative("../db/sql_runner.rb")


class Artist

  attr_reader(:id, :name)

  def initialize (artist)
    @id = artist['id'].to_i if artist['id']
    @name = artist['name']
  end


  def save_artist()
    sql="INSERT INTO artist(name) VALUES($1) RETURNING id"
    values = [@name]

    result = SqlRunner.new(sql,values)
    @id = result[0]['id'].to_i
  end
  

end
