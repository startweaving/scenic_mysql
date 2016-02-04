# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scenic/adapters/mysql/version'

Gem::Specification.new do |spec|
  spec.name          = "scenic_mysql"
  spec.version       = Scenic::Adapters::Mysql::VERSION
  spec.authors       = ["Elpizo Choi"]
  spec.email         = ["fu7iin@gmail.com"]

  spec.summary       = %q{Adds MySQL support for Scenic gem}
  spec.description   = %q{Adds support for MySQL views in ActiveRecord via the Scenic gem}
  spec.homepage      = "http://github.com/startweaving/scenic_mysql"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "scenic", "~> 1.1.1"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
