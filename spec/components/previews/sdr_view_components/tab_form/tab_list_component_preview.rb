# frozen_string_literal: true

module SdrViewComponents
  module TabForm
    class TabListComponentPreview < ViewComponent::Preview
      def default; end

      class TabFormPreviewModel
        include ActiveModel::Model
        include ActiveModel::Attributes

        attribute :title, :string, default: nil
        attribute :notes, :string, default: nil
      end
    end
  end
end
