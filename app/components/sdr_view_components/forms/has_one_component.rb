# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Encapsulates a has_one (non-repeatable) form.
    class HasOneComponent < BaseComponent
      def initialize(form:, field_name:, form_component:, **args)
        @form = form
        @field_name = field_name
        @form_component = form_component
        @args = args
        super()
      end

      attr_reader :form, :field_name, :form_component, :args

      # Returns a hash of arguments for the fieldset component.
      # Includes argument prefixed with 'fieldset_'.
      def fieldset_args
        args_for(args:, prefix: 'fieldset_')
      end

      # Returns a hash of arguments for the form component.
      # Includes argument prefixed with 'form_'.
      def form_component_args
        args_for(args:, prefix: 'form_')
      end
    end
  end
end
