require 'space_object/version'
require 'space_object/base'
require 'space_object/parser'

module SpaceObject
  class << self
    def parse(document)
      Parser.new(document).parse
    end
  end
end