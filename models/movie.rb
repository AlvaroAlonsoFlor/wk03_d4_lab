class Movie

  attr_accessor :title, :genre
  attr_reader :id

  def intialize(info)
    @id = info['id'].to_i if info['id']
    @title = info['title']
    @genre = info['genre']
  end

end
