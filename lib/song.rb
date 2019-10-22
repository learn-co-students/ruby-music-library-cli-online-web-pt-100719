class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if(artist!=nil)
    self.genre = genre if(genre!=nil)
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
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if(!genre.songs.include?self)
      genre.songs << self
    end
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end

  def self.new_from_filename(filename)
    song_name = filename.split(" - ")[1].to_s
    artist_name = filename.split(" - ")[0].to_s
    genre_name = filename.split(" - ")[2].split(".")[0].to_s

    if !self.find_by_name(song_name)
      song = self.find_or_create_by_name(song_name)
      song.artist = Artist.find_or_create_by_name(artist_name)
      song.genre = Genre.find_or_create_by_name(genre_name)
    end
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
end
