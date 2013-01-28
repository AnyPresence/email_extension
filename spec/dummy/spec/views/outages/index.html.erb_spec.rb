require 'spec_helper'

describe "api/v1/outages/index" do
  before(:each) do
    assign(:outages, [
      stub_model(Api::V1::Outage),
      stub_model(Api::V1::Outage)
    ])
  end

  it "renders a list of outages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
