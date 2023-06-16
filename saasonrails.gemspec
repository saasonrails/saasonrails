# frozen_string_literal: true

require_relative "lib/saasonrails/version"

Gem::Specification.new do |spec|
  spec.name        = "saasonrails"
  spec.version     = Saasonrails::VERSION
  spec.authors     = ["KIQR"]
  spec.email       = ["hello@kiqr.dev"]
  spec.homepage    = "https://saasonrails.dev"
  spec.summary     = "Saas on Rails core functionality."
  spec.description = "Saas on Rails core functionality."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/saasonrails/saasonrails"
  spec.metadata["changelog_uri"] = "https://github.com/saasonrails/saasonrails/tree/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.5"
  spec.add_dependency "devise", "~> 4.9"
  spec.add_dependency "simple_form", "~> 5.2"
  spec.add_dependency "importmap-rails", "~> 1.1.6"

  spec.add_dependency "omniauth", "~> 2.1.1"
  spec.add_dependency "omniauth-rails_csrf_protection", "~> 1.0.1"

  spec.add_dependency "view_component", "~> 3.1"
  spec.add_dependency "view_component-contrib", "~> 0.1.4"

  spec.add_dependency "dry-initializer", "~> 3.1"
  spec.add_dependency "public_uid", "~> 2.2.0"
end
