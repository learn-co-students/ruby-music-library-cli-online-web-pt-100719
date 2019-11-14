#genre has many artists through songs

class Genre
    # extend Concerns::Findable
    attr_accessor :name
    # attr_reader :songs
    @@all = []
  
    def initialize(genre_name)
      @name = genre_name
      @songs = []
    end
  
    def songs
      @songs
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
  
    def self.create(name_of_genre)
      genre_obj = self.new(name_of_genre) 
      genre_obj.save 
      genre_obj
    end
  
    def artists
      @songs.collect{|s_obj| s_obj.artist}.uniq
    end
  end