require 'spec_helper'

describe SpaceObject::Base do
  let(:key) { 'foo' }
  let(:not_contained) { 'baz' }
  let(:value) { 'bar' }

  it 'is an Enumerable' do
    expect(subject).to be_an(Enumerable)
  end

  describe '[]' do
    subject { SpaceObject.encode({key => value}) }

    it 'returns nil if the key does not exist' do
      expect(subject[not_contained]).to be_nil
    end

    it 'returns the value for a key which exists' do
      expect(subject[key]).to eq(value)
    end

    it 'can query with a key which implements #to_s' do
      expect(subject[key.to_sym]).to eq(subject[key])
    end
  end

  describe '[]=' do
    subject { SpaceObject::Base.new }

    it 'can assign with a non-nested key' do
      subject[key] = value
      expect(subject[key]).to eq(value)
    end

    it 'can assign with a key which implements #to_s' do
      subject[key.to_sym] = value
      expect(subject[key]).to eq(value)
    end
  end
end