require 'bundler'

require_relative '../lib/concerns/findable'

Bundler.require

# require_relative "../lib/song.rb"
# require_relative "../lib/artist.rb"
# require_relative "../lib/genre.rb"

# module Concerns
# end

require_all 'lib'
