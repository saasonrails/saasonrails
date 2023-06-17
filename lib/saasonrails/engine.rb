# frozen_string_literal: true

module Saasonrails
  class Engine < ::Rails::Engine
    config.autoload_paths += Dir[Saasonrails::Engine.root.join("lib")]
    config.autoload_paths += Dir[Saasonrails::Engine.root.join("app", "javascript")]
    config.autoload_paths += Dir[Saasonrails::Engine.root.join("app", "frontend", "components")]
    # config.eagerload_paths += Dir[Saasonrails::Engine.root.join("app", "frontend", "components")]

    initializer "saasonrails.assets.precompile" do |app|
      app.config.assets.paths << Saasonrails::Engine.root.join("app", "javascript")
      app.config.assets.precompile += %w[saasonrails_manifest]
    end

    initializer "saasonrails.importmap", before: "importmap" do |app|
      app.config.importmap.paths << Engine.root.join("config/importmap.rb")
    end
  end
end
