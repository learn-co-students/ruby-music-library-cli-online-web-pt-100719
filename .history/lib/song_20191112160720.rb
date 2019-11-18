class Song
  attr_accessor :name, :artist
  @@all = []
  def initialize(name)
    @name = name
    @artist = artist
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
end