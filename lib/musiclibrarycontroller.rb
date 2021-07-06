require 'pry'

class MusicLibraryController

    def initialize(path = "./db/mp3s")
        new_importer = MusicImporter.new(path)
        new_importer.import
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
       song_list = Song.all.sort { |a,b| a.name <=> b.name}
        
       song_list.each.with_index(1) do |song, i|
        puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
       end
    end

    def list_artists
      artist_list = Artist.all.sort {|a,b| a.name <=> b.name}

      artist_list.each.with_index(1) do |artist, i|
       puts "#{i}. #{artist.name}"
      end
    end

    def list_genres
      genre_list = Genre.all.sort {|a,b| a.name <=> b.name}
      genre_list.each.with_index(1) do |genre, i|
       puts "#{i}. #{genre.name}"
      end
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      artist_name = gets.strip

      if artist = Artist.find_by_name(artist_name)
        list = artist.songs.sort { |a,b| a.name <=> b.name}
        list.each_with_index do |song , i|
          puts "#{i+1}. #{song.name} - #{song.genre.name}"
          i += 1
        end
      end
    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      genre_input = gets.strip
      
      if genre = Genre.find_by_name(genre_input)
        list = genre.songs.sort {|a,b| a.name <=> b.name}
        list.each_with_index do |song, i|
          puts "#{i + 1}. #{song.artist.name} - #{song.name}"
          i += 1
        end
      end
    end

    def play_song
      puts "Which song number would you like to play?"
      song_name = gets.strip.to_i

      songs = Song.all
  
      if (1..songs.length).include?(song_name)
        song = Song.all.sort{ |a, b| a.name <=> b.name }[song_name - 1]
      end
  

      puts "Playing #{song.name} by #{song.artist.name}" if song
      end

end