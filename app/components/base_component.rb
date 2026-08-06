# frozen_string_literal: true

# Base component.
class BaseComponent < ViewComponent::Base
  # Merge classes together.
  #
  # @param args [Array<String>, String] The classes to merge (array, classes, space separated classes).
  # @return [String] The merged classes.
  def merge_classes(*)
    ComponentSupport::CssClasses.merge(*)
  end

  # Merge data-actions together.
  #
  # @param args [Array<String>, String] The actions to merge (array, classes, space separated classes).
  # @return [String] The merged classes.
  def merge_actions(*)
    ComponentSupport::CssClasses.merge(*)
  end

  # Extract args with a given prefix.
  #
  # @param args [Hash] The args to extract from.
  # @param prefix [String] The prefix to look for.
  # @return [Hash] The extracted args with the prefix removed.
  def args_for(args:, prefix:)
    args.each_with_object({}) do |(key, value), h|
      h[key.to_s.delete_prefix(prefix).to_sym] = value if key.to_s.start_with?(prefix)
    end
  end

  # Append a required-field marker to a label.
  #
  # @param label [String] The label text.
  # @param mark_required [Boolean] Whether to append the marker.
  # @param hidden_label [String] The screen-reader-only text describing why the marker is present.
  # @return [String] The label, marked as required if requested.
  def mark_label_required(label:, mark_required: false, hidden_label: 'required')
    label.to_s.dup.tap do |label_text|
      if mark_required
        label_text << "&nbsp;<span class=\"required\">*</span><span class=\"visually-hidden\"> (#{hidden_label})</span>".html_safe # rubocop:disable Rails/OutputSafety, Layout/LineLength
      end
    end.html_safe # rubocop:disable Rails/OutputSafety
  end
end
