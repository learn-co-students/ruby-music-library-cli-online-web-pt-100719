class Song
  
  attr_accessor :name, :genre, :filename
  attr_reader :artist
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    self.artist = artist if self.artist
    @genre = genre
    self.genre = genre if self.genre
    #@@all << self
  end
  
  # def filename
  #   self.filename = 
  # end
  
  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
  end
  
  def self.new_from_filename(filename)
    #binding.pry
    filename = filename.split(' - ')
    filename[-1] = filename[-1].split('.').reject{|s| s == "mp3"}
    filename = filename.flatten
    
    artist = Artist.find_or_create_by_name(filename[0])
    genre = Genre.find_or_create_by_name(filename[-1])
    
    song = Song.new(filename[1], artist, genre)
  end
  
  def self.find_or_create_by_name(name)
    # self.create(name) unless self.all.include?(name)
    if self.find_by_name(name) # 
      self.find_by_name(name)
    else
      song = Song.create(name)
    end
  end
  
  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
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
    song_obj = self.new(name)
    song_obj.save
    song_obj
  end
  
end