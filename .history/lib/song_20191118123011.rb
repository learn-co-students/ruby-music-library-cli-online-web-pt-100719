class Song
  attr_accessor :song_name
  def initialize(song_name)
    @song_name = song_name
end  
# class Song
#   attr_accessor :name
#   attr_reader :artist, :genre
#   extend Concerns::Findable
#   @@all = []

#   def initialize(song_name, artist = nil, genre = nil)
#     @name = song_name
#     @genre = genre
#     self.artist = artist if artist # Assigns artist argument unless artist = nil
#     self.genre = genre if genre # Assigns genre argument unless genre = nil
#     #save
#   end

#   def self.all
#     @@all # Class method
#   end

#   def self.destroy_all
#     self.all.clear
#   end

#   def save
#     @@all << self # Instance method
#   end

#   def self.create(name_of_song)
#     new_song = self.new(name_of_song) # Creates new instance
#     new_song.save # Saves to @@all
#     new_song
#   end
  
#   def artist
#     @artist
#   end

#   def artist=(artist)
#     @artist = artist
#     artist.add_song(self)
#   end

#   def genre
#     @genre
#   end

#   def genre=(genre)
#     @genre = genre
#     genre.songs.include?(self) ? nil : genre.songs << self # If genre isn't already created, push self
#   end

#   def self.find_by_name(name)
#     @@all.detect {|a| a.name == name} # Iterated through @@all to find name
#   end

#   def self.find_or_create_by_name(name)
#     self.all.detect {|artist| artist.find_by_name(name) || self.new(name)} # Finds or creates instance
#   end
# end