require 'pry'
class Artist
  extend Concerns::Findable
  include Concerns::InstanceMethods
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

  def self.create(artist_name)
    new_artist = self.new(artist_name)
    new_artist.save
    new_artist
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist == nil ? song.artist = self : nil
    self.songs.include?(song) ? nil : self.songs << song
  end

  def genres
    genre_arr = []
    @songs.each do |song_obj|
      unless genre_arr.include?(song_obj.genre)
        genre_arr << song_obj.genre
      end
    end
    genre_arr
  end

end
