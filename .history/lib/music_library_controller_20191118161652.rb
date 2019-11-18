require 'pry'
class MusicLibraryController
  def initialize(path = './db/mp3s')
    @path = path
    new_obj = MusicImporter.new(@path).import
  end

  def call
    p "Welcome to your music library!"
    p "To list all of your songs, enter 'list songs'."
    p "To list all of the artists in your library, enter 'list artists'."
  end

end