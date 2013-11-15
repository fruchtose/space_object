# List of classes to encode mirrors JSON encodable objects in ActiveSupport

require 'time'
require 'space_object/string_encodable'

class Array
  def to_space_object
    each_with_index.map do |item, index|
      {index => item}.to_space_object
    end
  end

  def to_space_value
    to_space_object
  end
end

class Date
  include SpaceObject::StringEncodable
end

class DateTime
  include SpaceObject::StringEncodable
end

module Enumerable
  def to_space_object
    to_a.to_space_object
  end

  def to_space_value
    to_space_object
  end
end

class FalseClass
  include SpaceObject::StringEncodable
end

class Hash
  def to_space_object
    SpaceObject::Encoder.new(self).encode
  end
end

class NilClass
  include SpaceObject::StringEncodable
end

class Numeric
  include SpaceObject::StringEncodable
end

class Object
  # Highly inspired by ActiveSupport
  def to_space_object
    hash = respond_to?(:to_hash) ? to_hash : insance_values
    hash.to_space_object
  end

  def to_space_value
    to_space_object
  end
end

class Process::Status
  include SpaceObject::StringEncodable
end

class Regexp
  include SpaceObject::StringEncodable
end

class String
  include SpaceObject::StringEncodable
end

class Symbol
  include SpaceObject::StringEncodable
end

class Struct
  # Highly inspired by ActiveSupport
  def to_space_object
    hash = Hash[members.zip(values)]
    hash.to_space_object
  end

  def to_space_value
    to_space_object
  end
end

class Time
  include SpaceObject::StringEncodable
end

class TrueClass
  include SpaceObject::StringEncodable
end