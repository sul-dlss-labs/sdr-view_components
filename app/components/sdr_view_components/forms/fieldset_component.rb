# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for rendering a form fieldset.
    class FieldsetComponent < BaseComponent
      renders_one :legend # Provide legend or label
      renders_one :help_link # Optional

      def initialize(label: nil, hidden_label: false, classes: [], label_classes: [], legend_classes: [], # rubocop:disable Metrics/ParameterLists
                     tooltip: nil, mark_required: false, help_text: nil, **options)
        @label = label
        @hidden_label = hidden_label
        @classes = classes
        @label_classes = label_classes
        @legend_classes = legend_classes
        @tooltip = tooltip
        @options = options
        @mark_required = mark_required
        @help_text = help_text
        super()
      end

      attr_reader :options, :tooltip, :mark_required, :help_text

      def label_classes
        merge_classes(@label_classes, @hidden_label ? 'visually-hidden' : 'form-label fw-bold')
      end

      def label
        mark_label_required(label: @label, mark_required:) if @label.present?
      end

      def classes
        merge_classes('form-fieldset', @classes)
      end

      def legend_classes
        merge_classes(@legend_classes)
      end
    end
  end
end
