require 'spec_helper'

describe SpaceObject do
  it "should have a VERSION constant" do
    expect(subject.const_get('VERSION')).not_to be_empty
  end

  describe "::parse" do
    let(:test_document) { 'foo bar' }

    it "creates a new SpaceObject::Parser" do
      instance = SpaceObject::Parser.new(test_document)
      SpaceObject::Parser.stub(:new).and_return(instance)
      SpaceObject.parse(test_document) and expect(SpaceObject::Parser).to have_received(:new).with(test_document)
    end
  end
end
