require 'rails_helper'

RSpec.describe "Homepage", type: :routing do
  it "route root path to courses#index" do
    expect(get: '/').to route_to(controller: "courses", action: "index")
  end
end
