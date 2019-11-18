require 'bundler'
Bundler.require

module Concerns
  attr_accessor :name
  module Findable
    def find_by_name(name)
      all.detect {|a| a.name == name}
    end
  end 
end

require_all 'lib'
