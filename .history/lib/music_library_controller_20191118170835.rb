require 'pry'
class MusicLibraryController
  def initialize(path = './db/mp3s')
    @path = path
    new_obj = MusicImporter.new(@path).import
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
    case
    when user_input == 'list songs'
      list_songs
    when user_input == 'list artists'
      list_artists
    when user_input == 'list genres'
      list_genres
    when user_input == 'list artist'
      list_artist
    when user_input == 'list artist'
      list_songs_by_artist
    end
  end
  def list_songs
    # sorted_songs = Song.all.sort_by do |song| 
    #   song.name
    # end
    sorted_songs.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    sorted_artists = Artist.all.sort_by do |artist|
      artist.name
    end
    sorted_artists.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end
  end

  def list_genres
    sorted_genres = Genre.all.sort_by do |genre|
      genre.name
    end
    sorted_genres.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_input = gets.chomp
    Artist.find_by_name(artist_input).songs.each.with_index(1) do |song, index|
      puts "#{index}. #{song.name} - #{song.genre}"
    end
  end

  def sorted_songs
    Song.all.sort_by {|song| song.artist.name}
  end
  binding.pry
end