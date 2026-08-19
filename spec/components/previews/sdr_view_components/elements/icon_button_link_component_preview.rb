# frozen_string_literal: true

module SdrViewComponents
  module Elements
    class IconButtonLinkComponentPreview < ViewComponent::Preview
      def default
        render SdrViewComponents::Elements::IconButtonLinkComponent.new(
          icon: :download,
          label: 'Download item',
          link: '/example'
        )
      end

      # @!group Disabled State
      def enabled
        render SdrViewComponents::Elements::IconButtonLinkComponent.new(
          icon: :download,
          label: 'Download item',
          link: '/example',
          disabled: false
        )
      end

      def disabled
        render SdrViewComponents::Elements::IconButtonLinkComponent.new(
          icon: :download,
          label: 'Download item',
          link: '/example',
          disabled: true
        )
      end
      # @!endgroup
    end
  end
end
