require 'spec_helper'

describe SpaceObject::Parser do
  describe '#parse' do
    shared_examples_for 'correctness' do |document, expected|
      subject { SpaceObject::Parser.new(document) }
      it 'parses the string correctly' do
        result = subject.parse
        expect(result).to eql(expected)
      end
    end

    context 'when given nil' do
      it_has_behavior 'correctness', nil, SpaceObject::Base.new
    end

    context 'when given an empty string' do
      it_has_behavior 'correctness', '', SpaceObject::Base.new
    end

    context 'when given a key-value pair' do
      it_has_behavior 'correctness', 'key value', SpaceObject::Base.try_convert({'key' => 'value'})
    end

    context 'when given multiple key-value pairs' do
      it_has_behavior 'correctness', "1 2\na b", SpaceObject::Base.try_convert({'1' => '2', 'a' => 'b'})
    end
  end
end