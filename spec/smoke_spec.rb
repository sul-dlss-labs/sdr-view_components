# spec/smoke_spec.rb
require "rails_helper"

RSpec.describe "Engine boots", type: :request do
  it "loads the dummy app root" do
    get "/"
    expect(response.status).to be_between(200, 399)
  end
end
