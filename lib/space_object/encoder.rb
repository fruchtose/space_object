require 'space_object/base'
require 'pry'

module SpaceObject
  class Encoder
    def initialize(object, options = {})
      self.object = object
      @as_key = !options.has_key?(:key) || options[:key]
    end

    def encode
      raise(ArgumentError, "#{@object} is not a Hash") unless @object.is_a?(Hash)
      @object.inject(Base.new) do |space, (key, val)|
        space[key.to_space_key] = val.to_space_value
        space
      end
    end

    def object=(object)
      @object = object
    end
  end
end