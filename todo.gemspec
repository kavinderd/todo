# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'todo/version'

Gem::Specification.new do |spec|
  spec.name          = "tnt"
  spec.version       = Todo::VERSION
  spec.authors       = ["Kavinder Dhaliwal"]
  spec.email         = ["kavinderd@gmail.com"]
  spec.summary       = %q{TNT's Not a Todo}
  spec.description   = %q{Because if you spend all day at the terminal you might as well keep your todos there as well}
  spec.homepage      = "https://github.com/kavinderd/todo"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "pry-debugger", "~>0.2"
  spec.add_runtime_dependency "main", "~>6.0"
end
