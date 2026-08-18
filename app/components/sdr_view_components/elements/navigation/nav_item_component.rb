# frozen_string_literal: true

module SdrViewComponents
  module Elements
    module Navigation
      # Component for navigation item link.
      class NavItemComponent < BaseComponent
        def initialize(text:, path: nil, data: {}, classes: [])
          @text = text
          @path = path
          @data = data
          @classes = classes
          super()
        end

        attr_reader :text, :path, :data

        def call
          tag.li class: 'nav-item' do
            if path.present?
              link_to text, path, class: classes, data:
            else
              tag.span text, class: classes
            end
          end
        end

        def classes
          merge_classes('nav-link', @classes)
        end
      end
    end
  end
end
