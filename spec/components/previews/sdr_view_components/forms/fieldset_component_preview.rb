# frozen_string_literal: true

module SdrViewComponents
  module Forms
    class FieldsetComponentPreview < ViewComponent::Preview
      def default; end

      # @!group Label options
      def hidden_label; end

      def mark_required; end

      def with_tooltip; end

      def with_legend_slot; end
      # @!endgroup

      # @!group Help
      def with_help_text; end

      def with_help_link; end
      # @!endgroup
    end
  end
end
