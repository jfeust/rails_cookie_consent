# frozen_string_literal: true

require_relative "lib/rails_cookie_consent/version"

Gem::Specification.new do |spec|
  spec.name          = "rails_cookie_consent"
  spec.version       = RailsCookieConsent::VERSION
  spec.authors       = ["Tomas Kral"]
  spec.email         = ["tomas.kral@railsformers.com"]

  spec.summary       = "All in on solution to handle new EU GDPR Cookie consent."
  spec.description   = "All in one gem solution for handling EU Cookie Consent with easy configuration through YAML files."
  spec.homepage      = "https://gitlab.railsformers.com/railsformers/rails_cookie_consent"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = ""

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://gitlab.railsformers.com/railsformers/rails_cookie_consent"
  spec.metadata["changelog_uri"] = "https://gitlab.railsformers.com/railsformers/rails_cookie_consent/changelog.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  spec.add_dependency "railties"
  spec.add_dependency "rails-i18n"
  spec.add_development_dependency "activesupport", ">= 4.2"
end
