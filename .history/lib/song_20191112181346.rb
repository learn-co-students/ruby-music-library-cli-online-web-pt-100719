class Song
  attr_accessor :artist
  attr_reader :name
  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    save
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

  def self.create(song)
    song = self.new(song)
    song
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
    @genre == nil ? @genre = genre : @genre = @genre
  end

  def self.find_by_name(name)
    all.detect {|a| a.name == name}
  end

  def find_or_create_by_name

  end

end