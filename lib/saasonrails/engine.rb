# frozen_string_literal: true

module Saasonrails
  class Engine < ::Rails::Engine
    config.autoload_paths += Dir[Saasonrails::Engine.root.join("lib")]
  end
end
