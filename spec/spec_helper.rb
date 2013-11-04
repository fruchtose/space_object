require 'rubygems'
require 'bundler/setup'

require 'space_object'

RSpec.configure do |c|
  c.alias_it_should_behave_like_to :it_has_behavior, 'has behavior:'
end