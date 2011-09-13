require "spec_helper"

describe PagosController do
  describe "routing" do

    it "routes to #index" do
      get("/pagos").should route_to("pagos#index")
    end

    it "routes to #new" do
      get("/pagos/new").should route_to("pagos#new")
    end

    it "routes to #show" do
      get("/pagos/1").should route_to("pagos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pagos/1/edit").should route_to("pagos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pagos").should route_to("pagos#create")
    end

    it "routes to #update" do
      put("/pagos/1").should route_to("pagos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pagos/1").should route_to("pagos#destroy", :id => "1")
    end

  end
end
