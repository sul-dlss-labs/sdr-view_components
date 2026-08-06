# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::TabForm::TabComponent, type: :component do
  context 'when this is the active tab' do
    it 'renders a tab' do
      component = described_class.new(label: 'Tab 1', tab_name: :tab_one)
      component.active_tab_name = :tab_one
      render_inline(component)

      expect(page).to have_button('Tab 1', class: 'nav-link w-100 active')
      expect(page).to have_css('button[data-bs-toggle="tab"][data-bs-target="#tab_one-pane"]' \
                               '[data-sdr-tab-error-target="tab"]')
    end
  end

  context 'when this is not the active tab' do
    it 'renders a tab without active class' do
      component = described_class.new(label: 'Tab 1', tab_name: :tab_one)
      component.active_tab_name = :tab_two
      render_inline(component)

      expect(page).to have_button('Tab 1', class: 'nav-link w-100')
    end
  end

  context 'when mark_required is true' do
    it 'marks the label as required' do
      component = described_class.new(label: 'Tab 1', tab_name: :tab_one, mark_required: true)
      component.active_tab_name = :tab_one
      render_inline(component)

      expect(page).to have_css('button span.required', text: '*')
    end
  end

  context 'when data is provided' do
    it 'merges it with the data the component needs to function' do
      component = described_class.new(label: 'Tab 1', tab_name: :tab_one, data: { action: 'click->foo#bar' })
      component.active_tab_name = :tab_one
      render_inline(component)

      expect(page).to have_css('button[data-action="click->foo#bar"][data-bs-toggle="tab"]')
    end
  end
end
