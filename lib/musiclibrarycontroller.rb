require 'pry'

class MusicLibraryController

    def initialize(path = "./db/mp3s")
        new_importer = MusicImporter.new(path)
        Song.all << new_importer.import
    end

    def call 
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"
        user_input = gets.chomp
        
        case user_input
        when "list songs"
          self.list_songs
        when "list artists"
          self.list_artists
        when "list genres"
          self.list_genres
        when "list artist"
          self.list_songs_by_artist
        when "list genre"
          self.list_songs_by_genre
        when "play song"
          self.play_song
        when "exit"
          'exit'
        else
          call
        end
    end

    #CLI Methods

    def list_songs
      # binding.pry
       song_list = Song.all.sort_by {|a,b| a.name <=> b.name}
       song_list.each.with_index(1) do |song, i|
        puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
       end
    end

    def list_artists
      artist_list = Artist.sort {|a,b| a.name <=> b.name}
      artist_list.each.with_index(1) do |artist, i|
       puts "#{i}. #{artist.name}"
      end
    end

    def list_genres
      genre_list = Genre.sort {|a,b| a.name <=> b.name}
      genre_list.each.with_index(1) do |genre, i|
       puts "#{i}. #{genre.name}"
      end
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      artist_name = gets.strip
      if artist_name = Artist.find_by_name(artist_name)
        artist.songs.sort {|a,b| a.name <=> b.name}.each_with_index(1) do |song , i|
          puts "#{i}. #{song.name} - #{song.genre.name}"
        end
      end
    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      genre_name = gets.strip

      if genre_name = Artist.find_by_name(genre_name)
        genre.name.sort {|a,b| a.name <=> b.name}.each_with_index(1) do |genre , i|
          puts "#{i}. #{song.artist.name} - #{song.name}"
        end
      end
    end

    def play_song
      puts "Which song number would you like to play?"
      song = gets.strip


    end

end