class Casting

  attr_reader :id
  attr_accessor :fee, :movie_id, :star_id

  def initialize(info)
    @id = info['id'].to_i if info['id']
    @movie_id = info['movie_id'].to_i
    @star_id = info['star_id'].to_i
    @fee = info['fee']
  end

  def save
    sql = "INSERT INTO castings
    (movie_id, star_id, fee)
    VALUES
    ($1, $2, $3)
    RETURNING *"
    values = [@movie_id, @star_id, @fee]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def update()
    sql = "UPDATE stars
    SET movie_id = $1, star_id = $2, fee = 3
    WHERE id = $4 "
    values = [@movie_id, @star_id, @fee, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM casting
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.map_items(casting_data)
    casting_data.map { |casting| Casting.new(casting)  }
  end

  def self.all
    sql = "SELECT * FROM castings "
    result = SqlRunner.run(sql)
    return self.map_items(result)
  end

  def self.delete_all
    sql = "DELETE FROM castings"
    SqlRunner.run(sql)
  end



end
