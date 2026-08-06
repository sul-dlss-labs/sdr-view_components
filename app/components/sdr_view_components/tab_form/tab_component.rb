# frozen_string_literal: true

module SdrViewComponents
  module TabForm
    # Component for a tab in a SdrViewComponents::TabForm::TabListComponent.
    class TabComponent < BaseComponent
      attr_accessor :active_tab_name

      def initialize(label:, tab_name:, mark_required: false, data: {})
        @label = label
        @tab_name = tab_name
        @mark_required = mark_required
        @data = data
        super()
      end

      attr_reader :tab_name

      def selected?
        tab_name == active_tab_name
      end

      def classes
        merge_classes('nav-link w-100', selected? ? 'active' : nil)
      end

      def id
        "#{tab_name}-tab"
      end

      def pane_id
        "#{tab_name}-pane"
      end

      def mark_required?
        @mark_required
      end

      def label
        mark_label_required(label: @label, mark_required: mark_required?, hidden_label: 'contains required fields')
      end

      # Callers can pass their own `data:` (e.g. an `action:` to wire up other Stimulus controllers);
      # it's merged with the data this component needs to function as a Bootstrap tab wired to
      # TabListComponent's sdr-tab-error controller.
      def data
        { bs_toggle: 'tab', bs_target: "##{pane_id}", sdr_tab_error_target: 'tab' }.merge(@data)
      end
    end
  end
end
