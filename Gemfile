# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in saasonrails.gemspec.
gemspec

gem "puma"

gem "sqlite3"

gem "sprockets-rails"

gem "rubocop-rails"
gem "rubocop-performance"
gem "rubocop-packaging"
# gem "rubocop-rspec"

group :test do
  gem "view_component"
  gem "capybara"
end

# Start debugger with binding.b [https://github.com/ruby/debug]
# gem "debug", ">= 1.0.0"
