# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'orenono/version'

# rubocop:disable LineLength
Gem::Specification.new do |spec|
  spec.name          = 'orenono'
  spec.version       = Orenono::VERSION
  spec.authors       = ['tbpgr']
  spec.email         = ['tbpgr@tbpgr.jp']
  spec.summary       = %q(New Brainf**k derivation language generator and executor.)
  spec.description   = %q(New Brainf**k derivation language generator and executor.)
  spec.homepage      = 'https://github.com/tbpgr/orenono'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
# rubocop:enable LineLength
