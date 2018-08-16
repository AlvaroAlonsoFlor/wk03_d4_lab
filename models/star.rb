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

end
