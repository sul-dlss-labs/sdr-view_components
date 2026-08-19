# frozen_string_literal: true

module SdrViewComponents
  module Elements
    # Generic button component
    class ButtonComponent < BaseComponent
      def initialize(label: nil, classes: [], variant: nil, size: nil, bordered: true, disabled: false, **options) # rubocop:disable Metrics/ParameterLists
        @label = label
        @classes = classes
        @variant = variant
        @size = size
        @options = options
        @bordered = bordered
        @disabled = disabled
        super()
      end

      attr_reader :options, :label

      def call
        tag.button(
          class: ComponentSupport::ButtonSupport.classes(variant: @variant, size: @size, classes: @classes,
                                                         bordered: @bordered, disabled: @disabled),
          type: 'button',
          **options
        ) do
          label || content
        end
      end
    end
  end
end
