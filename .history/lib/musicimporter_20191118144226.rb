require 'pry'

class MusicImporter
  attr_reader :path
  @@all = []
  def initialize(path)
    @path = path
    files
  end

  def files
    @path.each do |mp3|
      @@all << mp3
    end
  end

  binding.pry
end