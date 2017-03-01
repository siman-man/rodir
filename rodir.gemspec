# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rodir/version'

Gem::Specification.new do |spec|
  spec.name          = "rodir"
  spec.version       = Rodir::VERSION
  spec.authors       = ["siman-man"]
  spec.email         = ["k128585@ie.u-ryukyu.ac.jp"]

  spec.summary       = %q{rodir is ruby object directory}
  spec.description   = %q{rodir is ruby object directory}
  spec.homepage      = "https://github.com/siman-man/rodir"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "object_tree", ">= 1.1.2"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
