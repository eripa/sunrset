# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sunrset/version'

Gem::Specification.new do |spec|
  spec.name          = "sunrset"
  spec.version       = Sunrset::VERSION
  spec.authors       = ["Eric Ripa"]
  spec.email         = ["eric@ripa.io"]
  spec.description   = %q{Ruby gem for easily getting local time, date, time zone, sunrise and sunset times based on coordinates. API: earthtools.org}
  spec.summary       = %q{Get Time, Date and Sunrise/Sunset based on coordinates}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "xml-simple"
end
