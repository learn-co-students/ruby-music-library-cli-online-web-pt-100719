class Artist

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @songs = []
    @name = name
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
    song_obj.artist = self unless song_obj.artist != nil
    @songs << song_obj unless @songs.include?(song_obj)
  end

  def genres
    songs.collect do |song|
      song.genre
    end.uniq
  end
end
