# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Elements::Navigation::NavItemComponent, type: :component do
  context 'with a path' do
    it 'renders a link' do
      render_inline(described_class.new(text: 'Home', path: '/'))
      expect(page).to have_css('li.nav-item')
      expect(page).to have_link('Home', href: '/', class: 'nav-link')
    end
  end

  context 'without a path' do
    it 'renders plain text' do
      render_inline(described_class.new(text: 'Home'))
      expect(page).to have_css('li.nav-item span.nav-link', text: 'Home')
      expect(page).to have_no_link('Home')
    end
  end

  context 'with classes' do
    it 'merges the additional classes onto the link' do
      render_inline(described_class.new(text: 'Home', path: '/', classes: %w[class1 class2]))
      expect(page).to have_css('a.nav-link.class1.class2')
    end

    it 'merges the additional classes onto the span' do
      render_inline(described_class.new(text: 'Home', classes: %w[class1 class2]))
      expect(page).to have_css('span.nav-link.class1.class2')
    end
  end
end
