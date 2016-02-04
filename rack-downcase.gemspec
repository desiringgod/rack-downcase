# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/downcase/version'

Gem::Specification.new do |spec|
  spec.name          = "rack-downcase"
  spec.version       = Rack::Downcase::VERSION
  spec.authors       = ["Ben Hutton"]
  spec.email         = ["benhutton@gmail.com"]

  spec.summary       = %q{Redirect urls with uppercase letters to their lowercase equivalents.}
  spec.homepage      = "https://github.com/desiringgod/rack-downcase"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rack-test"
end
