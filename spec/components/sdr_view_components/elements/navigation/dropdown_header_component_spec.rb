# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Elements::Navigation::DropdownHeaderComponent, type: :component do
  it 'renders the header text' do
    render_inline(described_class.new(text: 'Section 1'))
    expect(page).to have_css('span.dropdown-header[role="heading"]', text: 'Section 1')
  end

  context 'with classes' do
    it 'merges the additional classes' do
      render_inline(described_class.new(text: 'Section 1', classes: %w[class1 class2]))
      expect(page).to have_css('span.dropdown-header.class1.class2')
    end
  end
end
