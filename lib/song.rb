class Song
    attr_accessor :name, :artist, :genre 
  
# class variable @@all set to an empty array
    @@all = []
  
# during the initialize method, the song class accepts a name as an arguement. 
# and can be invoked with an optional second argument, of an Artist object. 
# an artist default values set to nil.  
# and can be invoked with an optional three argument, of an Genre object. 
# and genre default values set to nil as well. 
    
    def initialize(name, artist=nil, genre=nil)
      @name = name
      self.artist = artist if(artist!=nil)
      self.genre = genre if(genre!=nil)
      #@artist = artist
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
        #song_obj = Song.new(name_of_song) instanciate an object
        #song_obj.save (save the object - telling the class about the object)
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