require 'spec_helper'

shared_examples_for 'a convertable object' do |object, expected|
  it 'can be converted into a SpaceObject::Base via #to_space_object' do
    expect(object.to_space_object).to eq(expected)
  end
end

shared_examples_for 'a convertable key' do |object, expected|
  it 'can be converted into a SpaceObject::Base-compatible key via #to_space_key' do
    expect(object.to_space_key).to eq(expected)
  end
end

shared_examples_for 'a convertable value' do |object, expected|
  it 'can be converted into a SpaceObject::Base-compatible value via #to_space_value' do
    expect(object.to_space_value).to eq(expected)
  end
end

shared_examples_for 'a convertable key or value' do |object, expected|
  it_should_behave_like 'a convertable key', object, expected
  it_should_behave_like 'a convertable value', object, expected
end

describe Array do
  it_should_behave_like 'a convertable object', ["foo", "bar"], SpaceObject.encode("0" => "foo", "1" => "bar")
end

describe FalseClass do
  it_should_behave_like 'a convertable key or value', false, 'false'
end

describe Float do
  f = 1.254583462345e10
  it_should_behave_like 'a convertable key or value', f, f.to_s
end

describe Integer do
  i = 12345678
  it_should_behave_like 'a convertable key or value', i, i.to_s
end

describe Hash do
  let(:hash) { {'foo' => 'bar'} }
  it 'encodes itself using SpaceObject::Encoder' do
    encoder = SpaceObject::Encoder.new(hash)
    SpaceObject::Encoder.stub(:new).and_return encoder

    expect(hash.to_space_object).to be_a(SpaceObject::Base)
    expect(SpaceObject::Encoder).to have_received(:new).with(hash)
  end
end

describe NilClass do
  it_should_behave_like 'a convertable key or value', nil, ''
end

describe Regexp do
  regexp = /\w+,\s\d+/
  it_should_behave_like 'a convertable key or value', regexp, regexp.to_s
end

describe String do
  it_should_behave_like 'a convertable key or value', 'foobar', 'foobar'
end

describe Symbol do
  it_should_behave_like 'a convertable key or value', :foobar, 'foobar'
end

describe TrueClass do
  it_should_behave_like 'a convertable key or value', true, 'true'
end