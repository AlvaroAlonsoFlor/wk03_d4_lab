require('pry-byebug')
require_relative('models/movie')
require_relative('models/star')
require_relative('models/casting')

Movie.delete_all
Star.delete_all
Casting.delete_all

p "Welcome to the IMDB database simulator. In this app you will be introducing data about different movies"

def new_movie
  p "What is the name of your movie?"
  title = gets.chomp!
  p "What is the genre?"
  genre = gets.chomp!
  p "And the budget?"
  budget = gets.chomp!.to_i

  movie = Movie.new({
    'title' => title,
    'genre' => genre,
    'budget' => budget
    })
  movie.save
  p "Your movie has been added successfully"
end

def new_star

  p "What is the actor's first name?"
  first_name = gets.chomp!
  p "What is the actor's last name?"
  last_name = gets.chomp!

  star = Star.new({
    'first_name' => first_name,
    'last_name' => last_name
    })
  star.save
end

new_star


# movie1 = Movie.new({
#   'title' => 'Bourne Identity',
#   'genre' => 'thriller',
#   'budget' => 100000
#   })
# movie2 = Movie.new({
#   'title' => 'Bourne Ultimatum',
#   'genre' => 'thriller',
#   'budget' => 200000
#   })
#
#
# star1 = Star.new({
#   'first_name' => 'Matt',
#   'last_name' => 'Damon'
#   })
#
# star2 = Star.new({
#   'first_name' => 'Franka',
#   'last_name' => 'Potente'
#   })
#
# movie1.save
# movie2.save
# star1.save
# star2.save
#
# casting1 = Casting.new({
#   'movie_id' => movie1.id,
#   'star_id' => star1.id,
#   'fee' => 500
#   })
#
# casting2 = Casting.new({
#   'movie_id' => movie1.id,
#   'star_id' => star2.id,
#   'fee' => 400
#   })
#
# casting3 = Casting.new({
#   'movie_id' => movie2.id,
#   'star_id' => star1.id,
#   'fee' => 600
#   })
#
#
#
# casting1.save
# casting2.save
# casting3.save
#
#

binding.pry
nil
