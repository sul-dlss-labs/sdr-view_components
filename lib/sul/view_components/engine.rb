require "view_component"

module Sul
  module ViewComponents
    class Engine < ::Rails::Engine
      isolate_namespace Sul::ViewComponents

      # # Make `app/components` autoload/eager load correctly
      # config.eager_load_paths << root.join("app/components")

      # # initializer "my_components.assets" do |app|
      # #   # Ensure CSS/JS ship to host app’s pipeline
      # #   app.config.assets.precompile += %w[my_components.css my_components.js]
      # # end

      # # initializer "my_components.i18n" do
      # #   config.i18n.load_path += Dir[root.join("config/locales/*.yml")]
      # # end

      # # Optional: view_component previews in host app (Rails 7/8)
      # initializer "sul-view-components.view_component" do
      #   require "view_component/engine"

      #   # If you want previews to be available in host apps:
      #   # config.view_component.preview_paths << root.join("app/components/previews")
      #   # You can also push more component paths if needed:
      #   # config.view_component.view_component_path = root.join("app/components")
      # end
    end
  end
end
