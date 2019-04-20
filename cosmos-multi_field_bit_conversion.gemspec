# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "cosmos-multi_field_bit_conversion"
  spec.version       = "0.1.0"
  spec.authors       = ["Nick Benoit"]
  spec.email         = ["nick.benoit14@gmail.com"]
  spec.description   = %q{A cosmos read conversion designed to combine the bits of several uint fields.
}
  spec.summary       = %q{Combine cosmos uint fields of differing bit lengths where values on the left are more significant, and values on the right are less significant. This conversaion will work with any number of uint fields, of any size.}
  spec.homepage      = "https://github.com/nick-benoit14/cosmos-multi_field_bit_conversion"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"


  spec.add_runtime_dependency "cosmos", "4.3"
end
