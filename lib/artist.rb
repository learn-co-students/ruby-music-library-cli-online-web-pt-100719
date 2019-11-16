require_relative "../config/environment.rb"

class Artist 
  
  extend Concerns::Findable 
  
  attr_accessor :name
  attr_reader :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end 
  
  def Artist.destroy_all
    @@all.clear
  end 
  
  def save
    @@all << self
  end
  
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end
  
  def add_song(song)
      song.artist = self unless song.artist
      songs << song unless songs.include?(song)
      # @songs.uniq!
  end
  
  def genres
    # self.songs.collect {|song| song.genre}
    songs.collect { |song| song.genre}.uniq
  end

  
end