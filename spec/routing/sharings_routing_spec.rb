require "spec_helper"

describe SharingsController do
  describe "routing" do

    it "routes to #index" do
      get("/sharings").should route_to("sharings#index")
    end

    it "routes to #new" do
      get("/sharings/new").should route_to("sharings#new")
    end

    it "routes to #show" do
      get("/sharings/1").should route_to("sharings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sharings/1/edit").should route_to("sharings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sharings").should route_to("sharings#create")
    end

    it "routes to #update" do
      put("/sharings/1").should route_to("sharings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sharings/1").should route_to("sharings#destroy", :id => "1")
    end

  end
end
