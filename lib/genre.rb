require_relative '../lib/concerns/findable.rb'
class Genre
    extend Concerns::Findable
    attr_accessor :name, :songs
    @@all = []

    def initialize(genre_name)
        @name = genre_name
        @@all << self
        @songs = []
    end

    def self.all
        @@all.uniq
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(genre_name)
        genre = Genre.new(genre_name)
        genre.save
        genre
    end

    def artists
        self.songs.collect{|song| song.artist}.uniq
    end

end