# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'imgurruby/version'

Gem::Specification.new do |spec|
  spec.name          = "imgurruby"
  spec.version       = Imgurruby::VERSION
  spec.authors       = ["Asitha de Silva"]
  spec.email         = ["asithade@gmail.com"]
  spec.summary       = %q{Imgur image uploader via Imgur API}
  spec.homepage      = ""

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
