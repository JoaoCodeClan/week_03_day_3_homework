require("pry")
require_relative("models/album.rb")
require_relative("models/artist.rb")

artist_1 = Artist.new({'name'=>'Skunk Anansie'})
artist_2 = Artist.new({'name'=> 'Moonspell'})
artist_3 = Artist.new({'name'=> 'Sigur ros'})

# album_1 = Album.new({ 'title'=> 'Post orgasmic chill', 'genre'=>'Punk-rock', 'artist_id'=> artist})

binding.pry

nil
