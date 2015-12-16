# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'telegram_bot/version'

Gem::Specification.new do |s|
  s.name          = "telegram_bot"
  s.version       = TelegramBot::VERSION
  s.authors       = ["Óscar de Arriba"]
  s.email         = ["odarriba@gmail.com"]

  s.summary       = %q{Ruby wrapper of Telegram's Bot API with webhooks functionality}
  s.description   = %q{Ruby wrapper of Telegram's Bot API to create applications making use of Webhooks functionality.}
  s.homepage      = ""
  s.license       = "MIT"

  s.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.bindir        = "exe"
  s.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'virtus'

  s.add_development_dependency "bundler", "~> 1.11"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", "~> 3.0"
end
