class Genre
    extend Concerns::Findable
  
    attr_accessor :name
    attr_reader :songs
  
  # class variable @@allset to an empty array
  
    @@all = []
  
  
  # during the initialize method, the genre class accepts a name as an argument.
  # upon initialization of the new instance of genre. 
  
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
  # next we just save the new instance created and then call on that instance to get the return value.  
  
    def self.create(name)
      genre = self.new(name)
      genre.save
      genre
    end
  
    def artists
      artists = songs.map { |song|  song.artist if(song.genre==self) }
      artists.uniq
    end
end
  