# frozen_string_literal: true

module SulViewComponents
  module Structure
    class HeaderComponentPreview < ViewComponent::Preview
      def primary
        render SdrViewComponents::Structure::HeaderComponent.new(title: 'Test Header', subtitle: 'Test Subtitle',
                                                                 current_user_sunetid: 'amcollie')
      end
    end
  end
end
