require 'space_object/version'
require 'space_object/encode_error'
require 'space_object/base'
require 'space_object/parser'
require 'space_object/encoder'

module SpaceObject
  class << self
    def encode(object)
      Encoder.new(object).encode
    end

    def parse(document)
      Parser.new(document).parse
    end
  end
end