require 'space_object/encode_error'

module SpaceObject
  module StringEncodable
    def to_nested_space_key
      to_s
    end

    def to_space_key
      str = to_nested_space_key
      raise(EncodeError, "`#{str}' contains spaces and cannot be used as a key") if str[' ']
      str
    end

    def to_space_value
      to_s
    end
  end
end