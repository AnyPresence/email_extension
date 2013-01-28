require "spec_helper"

describe Api::V1::OutagesController do
  describe "routing" do

    it "routes to #index" do
      get("/api/v1/outages").should route_to("api/v1/outages#index")
    end

    it "routes to #new" do
      get("/api/v1/outages/new").should route_to("api/v1/outages#new")
    end

    it "routes to #show" do
      get("/api/v1/outages/1").should route_to("api/v1/outages#show", :id => "1")
    end

    it "routes to #edit" do
      get("/api/v1/outages/1/edit").should route_to("api/v1/outages#edit", :id => "1")
    end

    it "routes to #create" do
      post("/api/v1/outages").should route_to("api/v1/outages#create")
    end

    it "routes to #update" do
      put("/api/v1/outages/1").should route_to("api/v1/outages#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/api/v1/outages/1").should route_to("api/v1/outages#destroy", :id => "1")
    end

  end
end
