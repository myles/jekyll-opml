# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll/opml/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-opml"
  spec.version       = Jekyll::Opml::VERSION
  spec.authors       = ["Myles Braithwaite"]
  spec.email         = ["me@mylesbraithwaite.com"]

  spec.summary       = %q{A Jekyll plugin for displaying OPML documents.}
  spec.description   = %q{A Jekyll plugin for displaying OPML documents.}
  spec.homepage      = "https://github.com/myles/jekyll-opml"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_runtime_dependecy "opml"

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
