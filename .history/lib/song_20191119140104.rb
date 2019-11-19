require 'pry'

class Song
  attr_accessor :name, :artist, :genre
  extend Concerns::Findable
  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all #Class Method
    @@all
  end

  def self.destroy_all #Class Method
    @@all.clear
  end

  def save #Instance method
    @@all << self
  end

  def self.create(song_name)
    new_song = self.new(song_name)
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
    @genre = genre
    unless genre.songs.include?(self) # If genre already created, nil
      genre.songs << self # If genre isn't already created, push self
    end
  end

  # def self.find_by_name(name_of_song)
  #   @@all.detect {|song_name_obj| song_name_obj.name == name_of_song}
  # end

  # def self.find_or_create_by_name(name)
  #   self.find_by_name(name) || self.create(name) # Finds or creates instance
  # end

  def self.new_from_filename(filename)
    song_name = filename.split(" - ")[1]
    artist_obj = filename.split(" - ")[0]
    genre_obj = filename.split(" - ")[2].chomp(".mp3")
    song = self.find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(artist_obj)
    song.genre = Genre.find_or_create_by_name(genre_obj)
    # song
  end

  def self.create_from_filename(create_filename)
    @@all << self.new_from_filename(create_filename)
  end

end  
