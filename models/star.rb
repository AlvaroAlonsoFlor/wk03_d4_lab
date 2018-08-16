require_relative('../db/sql_runner.rb')

class Star
  attr_accessor :title, :genre
  attr_reader :id

  def intialize(info)
    @id = info['id'].to_i if info['id']
    @title = info['title']
    @genre = info['genre']
  end

end
