require_relative('../db/sql_runner.rb')

class Star

  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize(info)
    @id = info['id'].to_i if info['id']
    @first_name = info['first_name']
    @last_name = info['last_name']
  end

  def save
    sql = "INSERT INTO stars
    (first_name, last_name)
    VALUES
    ($1, $2)
    RETURNING *"
    values = [@first_name, @last_name]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def update()
    sql = "UPDATE stars
    SET title = $1, genre = $2
    WHERE id = $3 "
    values = [@first_name, @last_name, @id]
    SqlRunner.run(sql, values)

  end

  def delete()
    sql = "DELETE FROM stars
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.map_items(star_data)
    star_data.map { |star| Star.new(star)  }
  end

  def self.all
    sql = "SELECT * FROM stars"
    result = SqlRunner.run(sql)
    return self.map_items(result)
  end

  def self.delete_all
    sql = "DELETE FROM stars"
    SqlRunner.run(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM stars
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    if result.count > 0
      Star.map_items(result)
    else
      return nil
    end
  end

end
