# app/components/my_components/button_component.rb
module Sul
  module ViewComponents
    class ButtonComponent < ViewComponent::Base
      # Public API: keep it stable & documented
      def initialize(label:, scheme: :primary, size: :md, disabled: false, **html_options)
        @label        = label
        @scheme       = scheme
        @size         = size
        @disabled     = disabled
        @html_options = html_options
      end

      def call
        content_tag :button, @label, **default_options
      end

      private

      def default_options
        classes = [
          "mc-btn",
          "mc-btn--#{@scheme}",
          "mc-btn--#{@size}",
          ("is-disabled" if @disabled)
        ].compact.join(" ")

        { class: [ classes, @html_options[:class] ].compact.join(" "), disabled: @disabled }
          .merge(@html_options.except(:class))
      end
    end
  end
end
