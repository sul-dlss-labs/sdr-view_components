# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Forms::LabelComponent, type: :component do
  let(:form) { build_form(test_model) }
  let(:test_model) { build_model(test_string_field: nil) }
  let(:field_name) { :test_string_field }

  it 'renders a label' do
    render_inline(described_class.new(form:, field_name:, text: 'Title'))
    expect(page).to have_css('label.form-label:not(.visually-hidden)', text: 'Title')
    expect(page).to have_no_css('span.required')
  end

  context 'when mark_required is true' do
    it 'marks the label as required' do
      render_inline(described_class.new(form:, field_name:, text: 'Title', mark_required: true))
      expect(page).to have_css('label.form-label span.required', text: '*')
      expect(page).to have_css('label span.visually-hidden', text: '(required)')
    end
  end

  context 'when mark_required is false' do
    it 'does not mark the label as required' do
      render_inline(described_class.new(form:, field_name:, text: 'Title', mark_required: false))
      expect(page).to have_no_css('span.required')
    end
  end
end
