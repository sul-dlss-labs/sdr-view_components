# frozen_string_literal: true

require 'view_component'

module SdrViewComponents
  # Engine class for the SDR View Components gem
  class Engine < ::Rails::Engine
    isolate_namespace SdrViewComponents

    initializer 'sdr_view_components.assets.precompile' do |app|
      app.config.assets.precompile += %w[sdr_view_components_manifest.js sdr_view_components_manifest.css]
    end

    initializer 'sdr_view_components.assets' do |app|
      app.config.assets.paths << Engine.root.join('app', 'assets', 'stylesheets')
    end
  end
end
