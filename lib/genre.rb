class Genre
  
  attr_accessor :name, :songs
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
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
  
  def self.create(name)
    genre_new = Genre.new(name)
    genre_new.save
    genre_new
  end
  
  def artists
    artist = songs.collect{|song| song.artist}.uniq
  end
end