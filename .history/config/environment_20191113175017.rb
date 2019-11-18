require 'bundler'
Bundler.require

module Concerns
  attr_accessor :name
  module Findable
    def find_by_name(name_obj)
      all.detect {|a| a.name == name_obj}
    end

    def find_or_create_by_name(name_create)
      self.all.detect {|artist| artist.name == name_create || self.new(name_create)}
    end
  end 
end

require_all 'lib'
