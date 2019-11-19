require 'pry'

class MusicImporter
  attr_reader :path
  @@all = []
  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).select {|filename| filename.include?(".mp3")} # Iterates @path and selects all files that include ".mp3"
  end

  def import
    files.each {|file| Song.create_from_filename(file)} # Creates Song instance from files
  end
end