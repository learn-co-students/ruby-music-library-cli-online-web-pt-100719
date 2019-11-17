require 'pry'
#artist has many songs
#song belongs to artist
class Song
#   extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(song_name, artist_obj = nil, genre_obj=nil)
    @name = song_name
    # @artist = artist_obj
    # @genre = genre_obj
    self.artist = artist_obj if artist_obj
    self.genre = genre_obj if genre_obj
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
    song_obj = self.new(name_of_song) # instinate an obj
    song_obj.save #saving the obj, AKA telling the class about the obj
    song_obj
  end

  def self.find_by_name(name_str)
    @@all.find{|s_obj| s_obj.name == name_str}
  end

  def self.find_or_create_by_name(name_str)
    self.find_by_name(name_str) || self.create(name_str)
  end
  
  def artist=(artist_instance)
    # binding.pry
    @artist = artist_instance
    artist_instance.add_song(self) 
  end 

  def genre=(genre_instance)
    @genre = genre_instance 

    genre_instance.songs << self unless
    genre_instance.songs.include?(self) 
  end

  def self.new_from_filename(filename)
    song_name = filename.split(" - ")[1]
    artist_name = filename.split(" - ")[0]
    genre_name = filename.split(" - ")[2].chomp(".mp3")

    # song = self.new(song_name)
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    song = self.new(song_name, artist, genre)
    
    song
  end

  def self.create_from_filename(filename)
    file = Song.new_from_filename(filename)
    file.save
    file
  end

end