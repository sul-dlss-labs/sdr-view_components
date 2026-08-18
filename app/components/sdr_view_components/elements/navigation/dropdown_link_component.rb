# frozen_string_literal: true

module SdrViewComponents
  module Elements
    module Navigation
      # Component for rendering a link within a dropdown menu.
      class DropdownLinkComponent < BaseComponent
        def initialize(label:, link:, classes: [], disabled: false, **options)
          @label = label
          @link = link
          @classes = classes
          @disabled = disabled
          @options = options
          super()
        end

        attr_reader :label, :link, :disabled

        def call
          link_to label, link, class: classes, **@options
        end

        def classes
          merge_classes('dropdown-item', disabled ? 'disabled' : nil, @classes)
        end
      end
    end
  end
end
