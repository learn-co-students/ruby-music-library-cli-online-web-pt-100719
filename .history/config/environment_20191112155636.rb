require 'bundler'
Bundler.require

module Concerns
  attr_accessor :name
end

require_all 'lib'
