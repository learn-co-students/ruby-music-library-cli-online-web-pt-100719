require 'pry'
class MusicLibraryController
  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(@path).import
  end

  def call
    user_input = ""
    while user_input != 'exit'
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
    end
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
    Song.all.sort{|a, b| a.name <=> b.name}.each.with_index(1){|song, index| puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"} 
    # sorted_songs = Song.all.sort_by do |song| 
    #   song.name
    # end
    # sorted_songs.each.with_index(1) do |song, index|
    #   puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    # end
  end
  
  def list_artists
    Artist.all.sort{|a, b| a.name <=> b.name}.each.with_index(1){|song, index| puts "#{index}. #{song.name}"}
    # sorted_artists = Artist.all.sort{|a, b| a.artist <=> b.artist}.each.with_index(1){|song, index| puts "#{index}. #{song}"} 
    # sorted_artists.each.with_index(1) do |artist, index|
    #   puts "#{index}. #{artist.name}"
    # end
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
    if artist = Artist.find_by_name(artist_input)
      artist.songs.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |song, index|
        puts "#{index}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of an genre:"
    genre_input = gets.chomp
    if genre = Genre.find_by_name(genre_input)
      genre.songs.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |song, index|
        puts "#{index}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  # def sorted_songs
  #   Song.all.sort_by {|song_obj| song_obj.name}
  # end
end