class Artist
  attr_accessor :name
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
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

  def self.create(artist)
    artist = self.new(artist)
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist == nil ? song.artist = self : nil
    self.songs.include?(song) ? self.songs << song : nil
  end
end