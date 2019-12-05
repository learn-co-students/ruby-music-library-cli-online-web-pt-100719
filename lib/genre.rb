require_relative "./concerns.rb"
class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs, :artists 
  
    @@all = []
  
  def initialize(name)
    @name = name
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
  
  def self.create(name)
    new = Genre.new(name)
    new.save
    new
  end
  
  def artists
    songs.collect do |song|
      song.artist
    end
    .uniq 
  end
  
end
