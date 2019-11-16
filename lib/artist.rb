#An artist has many songs
#An arrtist is connected to many genres through songs
require_relative '../lib/concerns/findable.rb'
class Artist 
    extend Concerns::Findable
    attr_accessor :name, :songs
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
        artist = Artist.new(name)
        artist.save
        artist
    end

    def add_song(song_obj)
        if song_obj.artist == nil
            song_obj.artist = self
        end
        unless self.songs.include?(song_obj)
            @songs << song_obj
        end
    end

    def genres
        genres = @songs.collect{|song| song.genre}.uniq
    end

end