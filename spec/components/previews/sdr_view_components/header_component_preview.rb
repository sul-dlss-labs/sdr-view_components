module SulViewComponents
  class HeaderComponentPreview < ViewComponent::Preview
    def primary
      render SdrViewComponents::HeaderComponent.new(title: 'Test Header', subtitle: 'Test Subtitle', current_user_sunetid: 'amcollie')
    end
  end
end
