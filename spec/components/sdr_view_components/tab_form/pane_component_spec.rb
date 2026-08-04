# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::TabForm::PaneComponent, type: :component do
  context 'when this is the active tab' do
    it 'renders the pane as shown and active' do
      component = described_class.new(tab_name: :details, label: 'Details')
      component.active_tab_name = :details
      render_inline(component) { 'Pane content' }

      expect(page).to have_css('div.tab-pane.fade.show.active#details-pane[aria-labelledby="details-tab"]' \
                               '[data-sdr-tab-error-target="pane"]', text: 'Pane content')
      expect(page).to have_css('h2', text: 'Details')
    end
  end

  context 'when this is not the active tab' do
    it 'renders the pane without show/active classes' do
      component = described_class.new(tab_name: :details, label: 'Details')
      component.active_tab_name = :notes
      render_inline(component) { 'Pane content' }

      expect(page).to have_css('div.tab-pane.fade#details-pane:not(.show):not(.active)', visible: :all)
    end
  end

  context 'when help text, tooltip, help slot, and footer slot are provided' do
    it 'renders them' do
      component = described_class.new(tab_name: :details, label: 'Details', help_text: 'Some help',
                                      tooltip: 'A tooltip')
      component.active_tab_name = :details
      render_inline(component) do |c|
        c.with_help { 'Slotted help' }
        c.with_footer { 'Footer content' }
        'Pane content'
      end

      expect(page).to have_css('p', text: 'Some help')
      expect(page).to have_text('Footer content')
    end
  end

  context 'when no label or help is provided' do
    it 'does not render a pane header' do
      component = described_class.new(tab_name: :details)
      component.active_tab_name = :details
      render_inline(component) { 'Pane content' }

      expect(page).to have_no_css('.pane-header')
    end
  end
end
