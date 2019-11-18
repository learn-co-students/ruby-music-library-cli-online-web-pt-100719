class Artist
  extend Concerns::Findable
  attr_accessor :name
  @@all = []
  def initialize(artist_name)
    @name = artist_name
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

  def self.create(name_of_artist)
    new_artist = self.new(name_of_artist)
    new_artist.save
    new_artist
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist == nil ? song.artist = self : nil
    self.songs.include?(song) ? nil : self.songs << song
  end

  def genres
    arr = []
    @songs.collect {|song_obj| arr.include?(song.genre) ? nil : arr << song.genre}
  end
end