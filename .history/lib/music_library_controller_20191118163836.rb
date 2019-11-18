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
      Genre.all.sort
    when user_input == 'list artist'
      nil
    end

    def list_songs
      sorted_song = Song.all.sort_by {|song| song.name}
      sorted_song.each.with_index(1) do |song, index|
        puts "#{index}. #{song.name}"
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

  end

end