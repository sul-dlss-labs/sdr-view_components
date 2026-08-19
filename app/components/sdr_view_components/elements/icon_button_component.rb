# frozen_string_literal: true

module SdrViewComponents
  module Elements
    # Component for a button which is an icon
    class IconButtonComponent < BaseComponent
      def initialize(icon:, label:, classes: [], icon_classes: [], disabled: false, **options) # rubocop:disable Metrics/ParameterLists
        @icon = icon
        @label = label
        @classes = classes
        @icon_classes = icon_classes
        @disabled = disabled
        @options = options
        super()
      end

      def before_render
        raise SdrViewComponents::Error::UnknownComponentIcon, "Unknown icon type: #{@icon}" unless button_icon?
      end

      attr_reader :label, :options, :disabled

      def classes
        merge_classes(%w[border border-0], @classes)
      end

      def button_icon
        helpers.public_send(:"#{@icon}_icon", classes: @icon_classes)
      end

      private

      def button_icon?
        helpers.respond_to?(:"#{@icon}_icon")
      end
    end
  end
end
