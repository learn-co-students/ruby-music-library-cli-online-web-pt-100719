class Artist
    extend Concerns::Findable
  
    attr_accessor :name
    attr_reader :songs
  
  # class variable @@allset to an empty array
    
    @@all = []
  
  # during the initialize method, the artist class accepts a name for a new artist. 
    
    def initialize(name)
      @name = name
      @songs = []
    end
  
  # this method is a class method that reads self.all 
   
    def self.all
      @@all
    end
  
  # the self_destroy_all is a class method that when invoked clears/removed all data stored in that class variable 
  # @@ll, which will return that variable to an empty array. 
    
    def self.destroy_all
      @@all.clear
    end
  
  # the save class allows all instances of the song class to be shovelled into the empty array (class variable)
  # the self key word is referring to the object that was created/instantiated.   
  
    def save
      @@all << self
    end
  
  # the self.create method is creating a new instance upon initialization passing through the argument name
  # so using that argument we are assigning that value which was passed in to the new instance of self. 
  # Next we just save the new instance created and then call on that instance to get the return value.  
  
    def self.create(name)
      artist = self.new(name)
      artist.save
      artist
    end
  
  # this add_song method assigns the current artist to the song's artist's property (song belongs to an artist)
  #  self is the instance of the song
    #def add_song(song)
      #@songs << song unless
      #song.artist = self
      #song.artist = self unless song.artist != nil
      #@songs << song unless @song.include?(song)
    #end
  
    def add_song(song)
      if(!song.artist)
        song.artist = self
      end
  
      if(!self.songs.include?song)
        self.songs << song
      end
    end
  
    def genres
      genres = songs.map {|song| song.genre if(song.artist == self)}
      genres.uniq
    end
  
end 