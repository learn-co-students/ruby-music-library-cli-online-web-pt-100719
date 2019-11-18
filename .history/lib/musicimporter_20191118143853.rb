class MusicImporter
  attr_reader :path
  def initialize(path)
    @path = path
  end

  def self.files
    @path
  end
end