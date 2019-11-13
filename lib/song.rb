class Song
  
  attr_accessor :name, :genre
  attr_reader :artist
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    self.artist = artist if self.artist
    @genre = genre
    self.genre = genre if self.genre
    #self.save
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    song_obj = self.new(name)
    song_obj.save
    song_obj
  end
  
end