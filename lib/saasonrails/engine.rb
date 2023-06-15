# frozen_string_literal: true

module Saasonrails
  class Engine < ::Rails::Engine
    config.autoload_paths += Dir[Saasonrails::Engine.root.join("lib")]
    config.autoload_paths += Dir[Saasonrails::Engine.root.join("app", "frontend", "components")]
    # config.eagerload_paths += Dir[Saasonrails::Engine.root.join("app", "frontend", "components")]
  end
end
