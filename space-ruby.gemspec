# -*- encoding: utf-8 -*-

require File.expand_path('../lib/space_object/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "space_object"
  gem.version       = SpaceObject::VERSION
  gem.summary       = %q{A lightweight language for objects}
  gem.license       = "MIT"
  gem.authors       = ["Robert Fruchtman"]
  gem.email         = "rfruchtose@gmail.com"
  gem.homepage      = "https://github.com/fruchtose/space_object#readme"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^spec/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'rdoc', '~> 3.0'
  gem.add_development_dependency 'rspec', '~> 2.4'
  gem.add_development_dependency 'rubygems-tasks', '~> 0.2'
  gem.add_runtime_dependency 'activesupport', '~> 4.0'
end
