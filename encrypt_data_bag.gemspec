# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'encrypt_data_bag/version'

Gem::Specification.new do |spec|
  spec.name          = "encrypt_data_bag"
  spec.version       = EncryptDataBag::VERSION
  spec.authors       = ["Sean Porter"]
  spec.email         = ["portertech@gmail.com"]
  spec.summary       = "CLI tool for encrypting Chef data bag items"
  spec.description   = "CLI tool for encrypting Chef data bag items"
  spec.homepage      = "https://github.com/portertech/encrypt_data_bag"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "chef"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end
