require("pry")
require_relative("models/album.rb")
require_relative("models/artist.rb")

Album.delete_all()
Artist.delete_all()


artist_1 = Artist.new({'name'=>'Skunk Anansie'})
artist_1.save_artist()
artist_2 = Artist.new({'name'=> 'Moonspell'})
artist_2.save_artist()
artist_3 = Artist.new({'name'=> 'Sigur ros'})
artist_3.save_artist()

album_1 = Album.new({ 'title'=> 'Post orgasmic chill', 'genre'=>'Punk-rock', 'artist_id'=>artist_1.id})
album_2 = Album.new({ 'title'=> 'Takk', 'genre'=>'alternative', 'artist_id'=>artist_3.id})
album_3 = Album.new({ 'title'=> 'Night Eternal', 'genre'=>'metal', 'artist_id'=>artist_2.id})
album_4 = Album.new({ 'title'=> 'Paranoid and Sunburnt', 'genre'=>'punk', 'artist_id'=>artist_1.id})
album_2.save_album
binding.pry

nil
