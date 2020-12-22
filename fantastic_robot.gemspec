# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fantastic_robot/version'

Gem::Specification.new do |s|
  s.name          = "fantastic_robot"
  s.version       = FantasticRobot::VERSION
  s.authors       = ["Óscar de Arriba"]
  s.email         = ["odarriba@gmail.com"]

  s.summary       = %q{Ruby wrapper of Telegram's Bot API with web hooks functionality}
  s.description   = %q{Ruby wrapper of Telegram's Bot API to create applications using web hooks functionality.}
  s.homepage      = "https://github.com/odarriba/fantastic_robot"
  s.license       = "MIT"

  s.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.bindir        = "exe"
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.required_ruby_version = '>= 2.0.0'

  s.add_dependency "activemodel", '>= 4.0.0', '< 6.0.0'
  s.add_dependency "json", '>= 2.3.0'
  s.add_dependency "faraday", "~> 0.9.2"

  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "rake", "~> 12.3"
  s.add_development_dependency "minitest", "> 4.2", "< 6"
  s.add_development_dependency "factory_bot", "> 0"
  s.add_development_dependency "faker", "~> 1.6"
  s.add_development_dependency "appraisal", "~> 2.1.0"
end
