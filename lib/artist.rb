#artist has many songs
#song belongs to artist
#artist has many genre through songs

require 'pry'
class Artist
  #extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(artist_name)
    @songs = []
    @name = artist_name
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

  def self.create(name_of_artist)
    artist_obj = self.new(name_of_artist) 
    artist_obj.save 
    artist_obj
  end

  def add_song(song_obj)
    # self == instanct of Artist class
    # binding.pry
    song_obj.artist = self unless song_obj.artist != nil
    # @songs << song_obj unless @songs.include?(song_obj)

    @songs << song_obj unless @songs.detect {|s_obj| s_obj == song_obj}
  end

  def genres
    @songs.collect{|s_obj| s_obj.genre}.uniq
  end
end