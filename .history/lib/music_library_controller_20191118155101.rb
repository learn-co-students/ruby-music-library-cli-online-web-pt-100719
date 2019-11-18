require 'pry'
class MusicLibraryController
  def initialize(path = './db/mp3s')
    @path = path
    new_obj = MusicImporter.new(@path)
    self.import(new_obj)
  end


end