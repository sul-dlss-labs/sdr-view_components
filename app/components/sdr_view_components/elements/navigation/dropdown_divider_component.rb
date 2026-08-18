# frozen_string_literal: true

module SdrViewComponents
  module Elements
    module Navigation
      # Component for rendering a divider within a dropdown menu.
      class DropdownDividerComponent < BaseComponent
        def initialize(classes: [])
          @classes = classes
          super()
        end

        def call
          tag.hr class: classes
        end

        def classes
          merge_classes('dropdown-divider', @classes)
        end
      end
    end
  end
end
