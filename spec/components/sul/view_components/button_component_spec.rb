# spec/components/my_components/button_component_spec.rb

require "rails_helper"

RSpec.describe Sul::ViewComponents::ButtonComponent, type: :component do
  it "renders the label" do
    render_inline(described_class.new(label: "Go"))
    expect(page).to have_button("Go")
  end

  it "applies scheme class" do
    render_inline(described_class.new(label: "X", scheme: :secondary))
    expect(page).to have_css(".mc-btn--secondary")
  end
end
