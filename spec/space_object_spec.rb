require 'spec_helper'

describe SpaceObject do
  it "should have a VERSION constant" do
    expect(subject.const_get('VERSION')).not_to be_empty
  end

  describe(:encode) do
    let(:hash) { {'foo' => 'bar'} }
    let(:encoder) { SpaceObject::Encoder.new(hash) }

    before(:each) {
      @instance = encoder
      @instance.stub(:encode)
      SpaceObject::Encoder.stub(:new).and_return(@instance)

      SpaceObject.encode(hash)
    }

    it "creates a new SpaceObject::Encoder" do
      expect(SpaceObject::Encoder).to have_received(:new).with(hash)
    end

    it "calls SpaceObject::Parser#encode" do
      expect(@instance).to have_received(:encode)
    end
  end

  describe "::parse" do
    let(:test_document) { 'foo bar' }
    let(:parser) { SpaceObject::Parser.new(test_document) }

    before(:each) {
      @instance = parser
      @instance.stub(:parse)
      SpaceObject::Parser.stub(:new).and_return(@instance)

      SpaceObject.parse(test_document)
    }

    it "creates a new SpaceObject::Parser" do
      expect(SpaceObject::Parser).to have_received(:new).with(test_document)
    end

    it "calls SpaceObject::Parser#parse" do
      expect(@instance).to have_received(:parse)
    end
  end
end
