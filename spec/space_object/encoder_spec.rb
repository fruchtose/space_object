require 'spec_helper'

describe SpaceObject::Encoder do
  let(:valid_example) { {:hello => 'world', 'foo' => :bar, 'foobar' => {'baz' => 'zip'}} }
  let(:invalid_example) { { 'keys are not allowed' => 'value' } }
  let(:wrong_class) { ['foo'] }

  describe '#encode' do
    it 'only encodes Hash objects' do
      expect { SpaceObject::Encoder.new(wrong_class).encode }.to raise_error(ArgumentError)
    end

    it 'encodes a compliant Hash as a SpaceObject::Base' do |variable|
      space = SpaceObject::Encoder.new(valid_example).encode
      expect(space['hello']).to eq('world')
      expect(space['foo']).to eq('bar')
      expect(space['foobar baz']).to eq('zip')
    end

    it 'raises a SpaceObject::EncodeError if an invalid key is present' do
      expect { SpaceObject::Encoder.new(invalid_example).encode }.to raise_error(SpaceObject::EncodeError)
    end
  end
end