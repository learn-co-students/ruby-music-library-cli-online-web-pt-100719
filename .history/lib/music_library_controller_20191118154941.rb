require 'pry'
class MusicLibraryController
  def initialize(path)
    @path = ./db/mp3s
    MusicImporter.new(@path)
  end


end