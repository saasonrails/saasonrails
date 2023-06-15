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
end
