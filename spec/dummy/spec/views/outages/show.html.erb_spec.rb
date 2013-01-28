require 'spec_helper'

describe "api/v1/outages/show" do
  before(:each) do
    @outage = assign(:outage, stub_model(Api::V1::Outage))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
