class Genre
  attr_accessor :name
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end

  def self.create(genre)
    genre = self.new(genre)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def genre=(song_genre)
    Song.genre = song_genre
  end
end