# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xproc/version'

Gem::Specification.new do |spec|
  spec.name          = "xproc"
  spec.version       = XProc::VERSION
  spec.authors       = ["Jonas Nicklas and Kim Burgestrand"]
  spec.email         = ["dev+jonas+kim@elabs.se"]

  spec.summary       = "Awesome short procs for Ruby"
  spec.homepage      = "https://github.com/jnicklas/xproc"

  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
