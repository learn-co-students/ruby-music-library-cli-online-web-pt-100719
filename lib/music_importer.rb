class MusicImporter
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        Dir.entries(path).select{ |file| 
            file.end_with?(".mp3") }
    end

    def import
        new_files = self.files
		new_files.each do |file|
            new_song = Song.create_from_filename(file)
        end
    end

end