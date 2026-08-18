# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Elements::Navigation::DropdownLinkComponent, type: :component do
  it 'renders a link with the dropdown-item class' do
    render_inline(described_class.new(label: 'Action', link: '#'))
    expect(page).to have_link('Action', href: '#', class: 'dropdown-item')
  end

  context 'with classes' do
    it 'merges the additional classes' do
      render_inline(described_class.new(label: 'Action', link: '#', classes: %w[class1 class2]))
      expect(page).to have_css('a.dropdown-item.class1.class2')
    end
  end

  context 'with additional options' do
    it 'passes them on to link_to' do
      render_inline(described_class.new(label: 'Action', link: '#', data: { turbo: false }))
      expect(page).to have_css('a.dropdown-item[data-turbo="false"]')
    end
  end

  context 'when disabled' do
    it 'adds the disabled class' do
      render_inline(described_class.new(label: 'Action', link: '#', disabled: true))
      expect(page).to have_css('a.dropdown-item.disabled')
    end
  end

  context 'when not disabled' do
    it 'does not add the disabled class' do
      render_inline(described_class.new(label: 'Action', link: '#'))
      expect(page).to have_no_css('a.disabled')
    end
  end
end
