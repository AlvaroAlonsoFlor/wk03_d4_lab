require('pry-byebug')
require_relative('models/movie')
require_relative('models/star')
require_relative('models/casting')

Movie.delete_all
Star.delete_all
Casting.delete_all


movie1 = Movie.new({
  'title' => 'Bourne Identity',
  'genre' => 'thriller'
  })
movie2 = Movie.new({
  'title' => 'Bourne Ultimatum',
  'genre' => 'thriller'
  })


star1 = Star.new({
  'first_name' => 'Matt',
  'last_name' => 'Damon'
  })

movie1.save
star1.save

casting1 = Casting.new({
  'movie_id' => movie1.id,
  'star_id' => star1.id,
  'fee' => 500
  })

casting1.save


binding.pry
nil
