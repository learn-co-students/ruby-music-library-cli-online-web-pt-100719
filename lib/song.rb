require 'pry'
class Song
  
  attr_accessor :name, :genre
  attr_reader :artist
  
  @@all = []
  
  def initialize(name, artist_obj = nil, genre_obj = nil)
    @name = name
    self.artist= artist_obj if artist_obj
    self.genre= genre_obj if genre_obj 
  end
  
  def artist=(artist_obj)
    @artist = artist_obj
    artist_obj.add_song(self)
  end
  
  def genre=(genre_obj)
    @genre = genre_obj
    unless genre_obj.songs.include?(self)
    genre_obj.songs << self
    end
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
    song_new = Song.new(name)
    song_new.save
    song_new
  end
  
  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end
  
   def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end
  
  def self.new_from_filename(file)
    artist, song, genre = file.split(" - ")
    song_artist = Artist.find_or_create_by_name(artist)
    genre = genre.gsub(".mp3", "")
    song_genre = Genre.find_or_create_by_name(genre)
    new_song = Song.new(song, song_artist, song_genre)
  end
  
  def self.create_from_filename(file)
    self.new_from_filename(file).tap{|song| song.save}
  end
end