# frozen_string_literal: true

require "test_helper"

class SaasonrailsTest < ActiveSupport::TestCase
  test "it has a version number" do
    assert Saasonrails::VERSION
  end

  test "it adds the engine's lib directory to the autoload paths" do
    assert_includes Rails.autoloaders.main.dirs, Saasonrails::Engine.root.join("lib").to_s
  end
end
