# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Elements::Navigation::DropdownDividerComponent, type: :component do
  it 'renders the divider' do
    render_inline(described_class.new)
    expect(page).to have_css('hr.dropdown-divider')
  end

  context 'with classes' do
    it 'merges the additional classes' do
      render_inline(described_class.new(classes: %w[class1 class2]))
      expect(page).to have_css('hr.dropdown-divider.class1.class2')
    end
  end
end
