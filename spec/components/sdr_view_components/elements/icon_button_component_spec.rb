# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Elements::IconButtonComponent, type: :component do
  it 'renders the button label' do
    render_inline(described_class.new(icon: :delete, label: 'Clear'))
    expect(page).to have_css('.btn.btn-outline-primary')
    expect(page).to have_css('span.visually-hidden', text: 'Clear')
    expect(page).to have_css('i.bi.bi-trash')
  end

  context 'with data' do
    it 'renders the button' do
      render_inline(described_class.new(icon: :delete, label: 'Clear', data: { controller: 'test' }))
      expect(page).to have_css('button[data-controller="test"]')
    end
  end

  context 'with classes' do
    it 'renders the button' do
      render_inline(described_class.new(icon: :delete, label: 'Clear', classes: %w[class1 class2]))
      expect(page).to have_css('.btn.class1.class2')
    end
  end

  context 'when disabled' do
    it 'renders the button with the disabled class' do
      render_inline(described_class.new(icon: :delete, label: 'Clear', disabled: true))
      expect(page).to have_css('.btn.disabled')
    end
  end

  context 'when not disabled' do
    it 'renders the button without the disabled class' do
      render_inline(described_class.new(icon: :delete, label: 'Clear', disabled: false))
      expect(page).to have_no_css('.btn.disabled')
    end
  end

  context 'with an unknown icon' do
    it 'raises UnknownComponentIcon' do
      expect { render_inline(described_class.new(icon: :nonexistent, label: 'Clear')) }
        .to raise_error(SdrViewComponents::Error::UnknownComponentIcon, /nonexistent/)
    end
  end
end
