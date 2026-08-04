# frozen_string_literal: true

module SdrViewComponents
  module TabForm
    # Component for a tab pane in a SdrViewComponents::TabForm::TabListComponent.
    # Based on https://getbootstrap.com/docs/5.3/components/navs-tabs/#javascript-behavior
    class PaneComponent < BaseComponent
      renders_one :footer
      renders_one :help

      attr_accessor :active_tab_name

      def initialize(tab_name:, label: nil, help_text: nil, tooltip: nil, pane_header_class: 'pane-header')
        @tab_name = tab_name
        @label = label
        @help_text = help_text
        @tooltip = tooltip
        @pane_header_class = pane_header_class
        super()
      end

      attr_reader :tab_name, :label, :help_text, :tooltip, :pane_header_class

      def selected?
        tab_name == active_tab_name
      end

      def classes
        merge_classes(%w[tab-pane fade h-100], selected? ? 'show active' : nil)
      end

      def id
        "#{tab_name}-pane"
      end

      def tab_id
        "#{tab_name}-tab"
      end
    end
  end
end
