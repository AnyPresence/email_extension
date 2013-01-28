require 'spec_helper'

describe "api/v1/outages/edit" do
  before(:each) do
    @outage = assign(:outage, stub_model(Api::V1::Outage))
  end

  it "renders the edit outage form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => api_v1_outages_path(@outage), :method => "post" do
    end
  end
end
