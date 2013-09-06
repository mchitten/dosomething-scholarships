require "spec_helper"

describe ShareAStatsController do
  describe "routing" do

    it "routes to #index" do
      get("/share_a_stats").should route_to("share_a_stats#index")
    end

    it "routes to #new" do
      get("/share_a_stats/new").should route_to("share_a_stats#new")
    end

    it "routes to #show" do
      get("/share_a_stats/1").should route_to("share_a_stats#show", :id => "1")
    end

    it "routes to #edit" do
      get("/share_a_stats/1/edit").should route_to("share_a_stats#edit", :id => "1")
    end

    it "routes to #create" do
      post("/share_a_stats").should route_to("share_a_stats#create")
    end

    it "routes to #update" do
      put("/share_a_stats/1").should route_to("share_a_stats#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/share_a_stats/1").should route_to("share_a_stats#destroy", :id => "1")
    end

  end
end
