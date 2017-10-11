class Artist

  attr_accessor(:name)
  attr_reader(:id)

  def initialize (artist)
    @id = artist['id'].to_i if artist['id']
    @name = artist['name']
  end


end
