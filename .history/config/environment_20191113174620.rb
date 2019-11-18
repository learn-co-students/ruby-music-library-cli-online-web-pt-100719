require 'bundler'
Bundler.require

module Concerns
  attr_accessor :name
  module Findable
    def find_by_name(name)
      all.detect {|a| a.name == name}
    end

    def self.find_or_create_by_name(name)
      self.all.detect {|artist| artist.name == name} || self.new(name)
    end
  end 
end

require_all 'lib'
