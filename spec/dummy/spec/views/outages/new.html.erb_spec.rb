require 'spec_helper'

describe "api/v1/outages/new" do
  before(:each) do
    assign(:outage, stub_model(Api::V1::Outage).as_new_record)
  end

  it "renders new outage form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => api_v1_outages_path, :method => "post" do
    end
  end
end
