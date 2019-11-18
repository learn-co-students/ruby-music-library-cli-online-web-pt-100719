require 'pry'
class MusicLibraryController
  def initialize(path = './db/mp3s')
    @path = path
    new_obj = MusicImporter.new(@path).import
  end

  def call
    puts "Welcome to your music library!"
  end

end