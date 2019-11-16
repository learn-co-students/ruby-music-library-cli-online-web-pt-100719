class MusicImporter
    attr_reader :path

    def initialize(filepath)
        @path = filepath
    end

    def files
        Dir.children(path)
    end

    def import
        files.each{|file| Song.create_from_filename(file)}
    end


end