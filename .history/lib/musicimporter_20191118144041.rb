require 'pry'

class MusicImporter
  attr_reader :path
  @@all = []
  def initialize(path)
    @path = path
    binding.pry
  end

  def files
    @path.collect {|mp3| @@all << mp3}
  end
end