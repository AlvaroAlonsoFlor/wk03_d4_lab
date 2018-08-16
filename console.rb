require('pry-byebug')
require_relative('models/movie')


movie1 = Movie.new({
  'title' => 'Bourne Identity',
  'genre' => 'thriller'
  })
movie2 = Movie.new({
  'title' => 'Bourne Ultimatum',
  'genre' => 'thriller'
  })

binding.pry
nil
