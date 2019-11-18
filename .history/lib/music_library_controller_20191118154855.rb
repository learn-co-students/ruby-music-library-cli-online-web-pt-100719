require 'pry'
class MusicLibraryController
  def initialize(path)
    @path = path
    binding.pry
    MusicImporter.new(@path)
  end


end