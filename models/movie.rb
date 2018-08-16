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

  def update()
    sql = "UPDATE movies
    SET title = $1, genre = $2
    WHERE id = $3 "
    values = [@title, @genre, @id]
    SqlRunner.run(sql, values)

  end

  def self.all
    sql = "SELECT * FROM movies"
    movies = SqlRunner.run(sql)
    return self.map_items(movies)
  end

  def self.map_items(movie_data)
    return movie_data.map { |movie| Movie.new(movie)  }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM movies
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)

    if result.count > 0
      return Movie.map_items(result)
    else
      return nil
    end
  end



end
