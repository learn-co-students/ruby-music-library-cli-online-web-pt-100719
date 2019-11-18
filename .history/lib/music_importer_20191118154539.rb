require 'pry'

class MusicImporter
  attr_reader :path
  @@all = []
  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).select {|filename| filename.include?("mp3")}
  end

  def import
    files.split(,)
    Song.create_from_filename(files)
  end
end