require_relative('../db/sql_runner.rb')

class Movie

  attr_accessor :title, :genre
  attr_reader :id

  def initialize(info)
    @id = info['id'].to_i if info['id']
    @title = info['title']
    @genre = info['genre']
  end

  def save()
    sql = "INSERT INTO movies
    (title, genre)
    VALUES
    ($1, $2) RETURNING *"
    values = [@title, @genre]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM movies"
    movies = SqlRunner.run(sql)
    return movies.map { |movie| Movie.new(movie)  }
  end

end
