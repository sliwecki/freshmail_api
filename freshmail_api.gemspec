lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'freshmail_api/version'

Gem::Specification.new do |spec|
  spec.version       = FreshmailApi::VERSION
  spec.name          = "freshmail_api"
  spec.authors       = ["Damian Śliwecki"]
  spec.email         = ["sliwecki@gmail.com"]
  spec.summary       = %q{Freshmail REST API v3.0}
  spec.description   = %q{Rails gem for fast Freshmail integration}
  spec.homepage      = "https://github.com/sliwecki"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 0.9.1"
  spec.add_dependency "json"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
