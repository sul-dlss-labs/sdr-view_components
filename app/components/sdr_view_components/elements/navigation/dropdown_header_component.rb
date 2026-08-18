# frozen_string_literal: true

module SdrViewComponents
  module Elements
    module Navigation
      # Component for rendering a header within a dropdown menu.
      class DropdownHeaderComponent < BaseComponent
        def initialize(text:, classes: [])
          @text = text
          @classes = classes
          super()
        end

        attr_reader :text

        def call
          tag.span text, class: classes, role: 'heading'
        end

        def classes
          merge_classes('dropdown-header', @classes)
        end
      end
    end
  end
end
