# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'geo_locale/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version = ">= 2.0.0"
  spec.name          = "geo_locale"
  spec.version       = GeoLocale::VERSION
  spec.date          = Date.today.to_s
  #spec.platform      = Gem::Platform::RUBY
  spec.authors       = ["Epigene"]
  spec.email         = ["augusts.bautra@gmail.com"]
  spec.summary       = ['A Rails 4+ gem for getting user country']
  spec.description   = ['Uses GeoIP gem and a free country database']
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.rubyforge_project = "geo_locale"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec', "~> 3.1.0"
  spec.add_development_dependency 'pry'

  spec.add_dependency 'geoip'
  spec.add_dependency 'geokit'
  spec.add_dependency 'geokit-rails'

end
