require 'pry'

class MusicImporter
  attr_reader :path
  @@all = []
  def initialize(path)
    @path = path
    binding.pry
  end

  def files
    Dir.entries(@path).select {|filename| filename.include?("mp3")}
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end
end