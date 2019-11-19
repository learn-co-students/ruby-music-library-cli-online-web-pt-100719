class Genre
  extend Concerns::Findable
  attr_accessor :name
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

  # def save
  #   @@all << self
  # end

  def self.create(genre_name)
    new_genre = self.new(genre_name)
    new_genre.save
    new_genre
  end

  def songs
    @songs
  end

  def artists
    artist_arr = []
    @songs.each do |song_obj|
      unless artist_arr.include?(song_obj.artist)
        artist_arr << song_obj.artist
      end
    end
    artist_arr
  end

end
