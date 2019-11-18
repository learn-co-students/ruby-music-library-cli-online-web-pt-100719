require 'pry'
class Artist
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

  def save
    @@all << self
  end

  def self.create(artist_name)
    new_artist = self.new(artist_name)
    new_artist.save
    new_artist
  end

end
# class Artist
#   attr_accessor :name, :songs, :genre
#   extend Concerns::Findable
#   @@all = []
#   def initialize(artist_name)
#     @name = artist_name
#     @songs = []
#   end

#   def self.all
#     @@all
#   end

#   def self.destroy_all
#     @@all.clear
#   end

#   def save
#     @@all << self
#   end

#   def self.create(name_of_artist)
#     new_artist = self.new(name_of_artist)
#     new_artist.save
#     new_artist
#   end

#   def songs
#     @songs
#   end

#   def add_song(song)
#     song.artist == nil ? song.artist = self : nil
#     self.songs.include?(song) ? nil : self.songs << song
#   end

#   def genres
#     arr = []
#     @songs.each {|song_obj| arr.include?(song_obj.genre) ? nil : arr << song_obj.genre} # Iterate through each song in @songs
#     arr
#   end
# end