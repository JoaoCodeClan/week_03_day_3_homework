class Artist

  attr_reader(:id, :name)

  def initialize (artist)
    @id = artist['id'].to_i if artist['id']
    @name = artist['name']
  end


end
