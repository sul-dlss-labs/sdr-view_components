# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Forms::HasOneComponent, type: :component do
  let(:nested_form_class) do
    Class.new(ApplicationForm) do
      attribute :name, :string
    end
  end

  let(:nested_model) { nested_form_class.new(name: 'Nested Value') }

  # `fields_for` only infers the nested object when the parent responds to
  # `<field_name>_attributes=`, which is how `accepts_nested_attributes_for` marks an association.
  let(:test_model) do
    nested = nested_model
    Class.new(ApplicationForm) do
      define_method(:nested_thing) { nested }
      define_method(:nested_thing_attributes=) { |_attrs| nil }
    end.new
  end

  let(:form) { build_form(test_model) }

  it 'renders the fieldset wrapping the nested form' do
    render_inline(described_class.new(
                    form:, field_name: :nested_thing,
                    form_component: SdrViewComponents::Forms::TextFieldComponent,
                    form_field_name: :name, fieldset_label: 'Nested Thing'
                  ))

    expect(page).to have_css('fieldset legend label', text: 'Nested Thing')
    expect(page).to have_css('div.mb-3 input[name="[nested_thing_attributes][name]"][value="Nested Value"]')
  end

  context 'when fieldset args are provided' do
    it 'passes them through to the fieldset component' do
      render_inline(described_class.new(
                      form:, field_name: :nested_thing,
                      form_component: SdrViewComponents::Forms::TextFieldComponent,
                      form_field_name: :name, fieldset_classes: 'my-fieldset'
                    ))

      expect(page).to have_css('fieldset.form-fieldset.my-fieldset')
    end
  end

  context 'when form args are provided' do
    it 'passes them through to the form component' do
      render_inline(described_class.new(
                      form:, field_name: :nested_thing,
                      form_component: SdrViewComponents::Forms::TextFieldComponent,
                      form_field_name: :name, form_container_classes: 'my-field-container'
                    ))

      expect(page).to have_css('div.my-field-container input[name="[nested_thing_attributes][name]"]')
    end
  end
end
