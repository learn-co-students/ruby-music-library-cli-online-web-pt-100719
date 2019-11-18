class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(song_name, artist = nil, genre = nil)
    @name = song_name
    @genre = genre
    self.artist = artist if artist
    #self.genre = genre if genre
    #save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name_of_song)
    new_song = self.new(name_of_song)
    new_song.save
    new_song
  end
  
  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre
    @genre
  end

  def genre=(genre)
    song.genre.include?(genre) ? nil : genre.songs << self
  end

  def self.find_by_name(name)
    all.detect {|a| a.name == name}
  end

  def find_or_create_by_name(name)
    self.all.detect {|artist| artist.find_by_name(name) || self.new(name)}
  end
end