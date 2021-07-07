require 'pry'
class MusicLibraryController
  

  attr_accessor :path, :music_importer


  def initialize(path='./db/mp3s')
    @path = path
    @music_importer = MusicImporter.new(path)
    @music_importer.import
  end
  
  def call
      $stdout.puts("Welcome to your music library!")
      $stdout.puts("To list all of your songs, enter 'list songs'.")
      $stdout.puts("To list all of the artists in your library, enter 'list artists'.")
      $stdout.puts("To list all of the genres in your library, enter 'list genres'.")
      $stdout.puts("To list all of the songs by a particular artist, enter 'list artist'.")
      $stdout.puts("To list all of the songs of a particular genre, enter 'list genre'.")
      $stdout.puts("To play a song, enter 'play song'.")
      $stdout.puts("To quit, type 'exit'.")
      $stdout.puts("What would you like to do?")
    input = nil
    while input != 'exit'
      input = gets
      if input == 'list songs'
        self.list_songs
      elsif input == 'list artists'
        self.list_artists
      elsif input == 'list genres'
        self.list_genres
      elsif input == 'list artist'
        self.list_songs_by_artist
      elsif input == 'list genre'
        self.list_songs_by_genre
      elsif input == 'play song'
        self.play_song
      end
    end
  end
  
  def list_songs
    #binding.pry
    Song.all.sort_by{|song| song.name}.each_with_index {|song, i| $stdout.puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
  
  def list_artists
    #binding.pry
    Artist.all.sort_by{|artist| artist.name}.each_with_index {|artist, i| puts "#{i+1}. #{artist.name}"}
  end
  
  def list_genres
    Genre.all.sort_by{|genre| genre.name}.each_with_index {|genre, i| puts "#{i+1}. #{genre.name}"}
  end
  
  def list_songs_by_artist
    #binding.pry
    $stdout.puts("Please enter the name of an artist:")
    artist_name = nil
    artist_name = gets
    Song.all.sort_by{|song| song.name}.select{|song| song.artist.name == artist_name}.each_with_index {|song, i| puts "#{i+1}. #{song.name} - #{song.genre.name}"}
  end
  
  def list_songs_by_genre
    #binding.pry
    $stdout.puts("Please enter the name of a genre:")
    genre_name = nil
    genre_name = gets
    Song.all.sort_by{|song| song.name}.select{|song| song.genre.name == genre_name}.each_with_index {|song, i| puts "#{i+1}. #{song.artist.name} - #{song.name}"}
  end
  
  def play_song
    $stdout.puts("Which song number would you like to play?")
    song_number = gets
    sorted_songs = Song.all.sort_by{|song| song.name}
    if song_number.to_i >= 1 && song_number.to_i <= sorted_songs.count
      #binding.pry
      $stdout.puts("Playing #{sorted_songs[song_number.to_i- 1].name} by #{sorted_songs[song_number.to_i- 1].artist.name}")
    end
    #binding.pry

    
    
    # Song.all.sort_by{|song| song.name}.each_with_index do |song, i|
    #     if song_number.to_i >= 1 && song_number.to_i <= self.list_songs.count
          
    #     $stdout.puts("Playing #{song.name} by #{song.artist.name}")
    #   end
    # end
    
    # self.list_songs.each_with_index do |song,i|
    #   if song_number == i+1
    #     $stdout.puts("Playing #{song.name} by #{song.artist.name}")
    #   end
    
    # end
    # binding.pry
    # Song.all.sort_by{|song| song.name}.each_with_index do |song, i|
    #   i =+ 1
    #   while song_number  Song.all.count
    #     song_number = gets
    #     if song_number == i
    #     puts "Playing #{song.name} by #{song.artist.name}"
    #     end
    #   end
    # end
  end
  
  
  
end


