require 'spec_helper'

describe SpaceObject::Base do
  it 'is an ActiveSupport::OrderedHash' do
    expect(subject).to be_an(ActiveSupport::OrderedHash)
  end
end