require 'pry'

class Song

    attr_accessor :name
    attr_reader :artist, :genre
    @@all = []

    def initialize(name, artist_obj = nil, genre_obj = nil)
        @name = name
        #@@all << self unless @@all.include?(self)
        self.artist = artist_obj if artist_obj
        self.genre = genre_obj if genre_obj
    end

    def artist=(artist_obj)
        @artist = artist_obj
        artist_obj.add_song(self) 
    end

    def genre=(genre_obj)
        @genre = genre_obj
        unless genre_obj.songs.include?(self)
            genre_obj.songs << self
        end
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
        song = Song.new(name)
        song.save
        song
    end

    def self.find_by_name(song_name)
        @@all.find{|song| song.name == song_name}
    end

    def self.find_or_create_by_name(song_name)
       self.find_by_name(song_name) || self.create(song_name)
    end

    def self.new_from_filename(filename)
        details = filename.split(" - ")
        artist = Artist.find_or_create_by_name(details[0])
        genre = Genre.find_or_create_by_name(details[2].gsub(".mp3", ""))
        Song.new(details[1], artist, genre)
    end

    def self.create_from_filename(filename)
        song = self.new_from_filename(filename)
        song.save
    end

end