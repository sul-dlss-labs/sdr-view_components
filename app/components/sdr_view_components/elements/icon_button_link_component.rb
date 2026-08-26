# frozen_string_literal: true

module SdrViewComponents
  module Elements
    # Component for a button which is an icon
    class IconButtonLinkComponent < BaseComponent
      def initialize(icon:, label:, classes: [], icon_classes: [], link: nil, disabled: false, **options) # rubocop:disable Metrics/ParameterLists
        @icon = icon
        @label = label
        @classes = classes
        @link = link
        @options = options
        @icon_classes = icon_classes
        @disabled = disabled
        super()
      end

      attr_reader :label, :link, :options, :disabled

      def classes
        merge_classes(%w[icon-button border border-0], @classes)
      end

      def button_icon
        helpers.public_send(:"#{@icon}_icon", classes: @icon_classes)
      end
    end
  end
end
