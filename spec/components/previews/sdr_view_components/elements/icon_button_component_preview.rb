# frozen_string_literal: true

module SdrViewComponents
  module Elements
    class IconButtonComponentPreview < ViewComponent::Preview
      # @!group Icon Buttons
      def delete
        render SdrViewComponents::Elements::IconButtonComponent.new(icon: :delete, label: 'Delete item')
      end

      def download
        render SdrViewComponents::Elements::IconButtonComponent.new(icon: :download, label: 'Download file')
      end
      # @!endgroup

      # @!group Disabled State
      def enabled
        render SdrViewComponents::Elements::IconButtonComponent.new(icon: :delete, label: 'Delete item',
                                                                    disabled: false)
      end

      def disabled
        render SdrViewComponents::Elements::IconButtonComponent.new(icon: :delete, label: 'Delete item',
                                                                    disabled: true)
      end
      # @!endgroup
    end
  end
end
