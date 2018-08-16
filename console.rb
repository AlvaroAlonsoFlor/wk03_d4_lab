require('pry-byebug')
require_relative('models/movie')
require_relative('models/star')


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

binding.pry
nil
