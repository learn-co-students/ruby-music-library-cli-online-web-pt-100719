require 'pry'

class MusicImporter
  attr_reader :path
  @@all = []
  def initialize(path)
    @path = path
  end

  def files(path)
    @path.each do |mp3|
      @@all << mp3
    end
  end
end