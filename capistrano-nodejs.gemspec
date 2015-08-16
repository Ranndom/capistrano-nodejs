# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/nodejs/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-nodejs"
  spec.version       = Capistrano::NodeJS::VERSION
  spec.authors       = ["Ranndom"]
  spec.email         = ["ranndom@rnndm.xyz"]

  spec.summary       = %q{NodeJS/Grunt/Bower integration for Capistrano}
  spec.description   = %q{NodeJS/Grunt/Bower integration for Capistrano}
  spec.homepage      = "https://rnndm.xyz/capistrano/nodejs"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "capistrano", "~> 3.1"
  spec.add_dependency "sshkit", "~> 1.3"
end
