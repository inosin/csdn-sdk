# -*- encoding: utf-8 -*-
require File.expand_path('../lib/csdn/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["inosin"]
  gem.email         = ["inosin7000@gmail.com"]
  gem.description   = %q{csdn is a Ruby gem that provides a wrapper for interacting with csdn API, 
                         which is currently the latest version. The output data format is Hashie::Mash}
  gem.summary       = "A oauth2 gem for csdn"
  gem.homepage      = "http://github.com/inosin/csdn"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "csdn-sdk"
  gem.require_paths = ["lib"]
  gem.version       = CsdnOAuth2::Version
  
  gem.add_development_dependency "rspec", "~> 2.6"
  
  gem.add_runtime_dependency 'oauth2', "~> 0.9.1"
  gem.add_runtime_dependency 'hashie', "~> 2.0.4"
  gem.add_runtime_dependency 'multi_json'  , "~> 1.7.2"
  gem.add_runtime_dependency 'rest-client', "~> 1.6.7"
end
