# frozen_string_literal: true

require_relative "lib/bridgetown-rougify/version"

Gem::Specification.new do |spec|
  spec.name          = "bridgetown-rougify"
  spec.version       = BridgetownRougify::VERSION
  spec.author        = "Jonathan Greenberg"
  spec.email         = "jonathan@beflagrant.com"
  spec.summary       = "Rougify your syntax highlighting in Bridgetown markdown code blocks"
  spec.homepage      = "https://github.com/beflagrant/bridgetown-rougify"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r!^(test|script|spec|features|frontend)/!) }
  spec.test_files    = spec.files.grep(%r!^test/!)
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.7.0"

  spec.add_dependency "bridgetown", ">= 1.1", "< 2.0"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", ">= 13.0"
  spec.add_development_dependency "rubocop-bridgetown", "~> 0.3"
end
