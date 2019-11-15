require 'pry'
class Artist
  
  extend Concerns::Findable
  
  attr_accessor :name 
  attr_reader :songs, :genres
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  # def songs
  #     # add the song to songs
  #   #binding.pry
  #   Song.all.select {|song| song.artist == self}
  # end

  def genres
     #binding.pry
    songs.map{|song| song.genre}.uniq #w/o duplicates
  end
  
  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless @songs.include?(song)
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
    artist_obj = self.new(name)
    artist_obj.save
    artist_obj
  end
  
end