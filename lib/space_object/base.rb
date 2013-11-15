require 'active_support/ordered_hash'
require 'space_object/core_ext/object/space_object'

module SpaceObject
  class Base < ActiveSupport::OrderedHash
    def [](key)
      key = convert_key!(key)
      unless key[' ']
        super(key)
      else
        first_key = key[/^[^ ]+/]
        value = self[first_key]

        return nil if hash.nil?
        rest_keys = key[(first_key.length + 1)..-1]
        value[rest_keys]
      end
    end

    def []=(key, value)
      key = convert_key!(key)
      unless key[' ']
        super(key, convert_value!(value))
      else
        first_key = key[/^[^ ]+/]
        value = (self[first_key] ||= self.class.new)
        value[(first_key.length + 1)..-1] = value
      end
    end

    alias_method :store, :[]=

    def default(key = nil)
      super(key ? convert_key!(key) : nil)
    end

    def default=(val)
      super(key ? convert_key!(key) : nil)
    end

    def fetch(key, *extras)
      key = convert_key!(key)
      first_key = key[/^[^ ]+/]

      value = self[first_key]
      if key[' '].nil? || hash.nil?
        super(key, *extras)
      else
        value.fetch(first_key, *extras)
      end
    end

    protected
    def convert_key(key)
      key.to_nested_space_key
    end

    def convert_key!(key)
      raise(ArgumentError, "#{key.class} cannot be stored as a key in a #{self.class}") unless key.respond_to?(:to_nested_space_key)
      convert_key(key)
    end

    def convert_value(val)
      val.to_space_value
    end

    def convert_value!(val)
      raise(ArgumentError, "#{val.class} cannot be stored as a key in a #{self.class}") unless val.respond_to?(:to_space_value)
      convert_value(val)
    end
  end
end