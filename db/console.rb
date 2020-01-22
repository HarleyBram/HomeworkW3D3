(require("pry")
require_relative("../models/artist")
require_relative("../models/album")
require_relative("../models/sql_runner")


Artist.delete_all()
Album.delete_all()


artist1 = Artist.new({
'name' => 'Death Grips'
})
artist1.save

artist2 = Artist.new({
'name' => 'Sylvan Esso'
})
artist2.save

album1 = Album.new({
'title' => 'The Money Store',
'genre' => 'just noise tbh',
'artist_id' => artist1.id
})
album1.save

album2 = Album.new ({
'title' => 'Year Of The Snitch',
'genre' => 'just noise tbh',
'artist_id' => artist1.id
})
album2.save

album3 = Album.new ({
  'title' => 'Sylan Esso',
  'genre' => 'electropop',
  'artist_id' => artist2.id
  })
album3.save

album4 = Album.new ({
    'title' => 'What Now',
    'genre' => 'electropop',
    'artist_id' => artist2.id
    })
album4.save

binding.pry
nil
