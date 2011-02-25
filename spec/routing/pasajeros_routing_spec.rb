require "spec_helper"

describe PasajerosController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/pasajeros" }.should route_to(:controller => "pasajeros", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/pasajeros/new" }.should route_to(:controller => "pasajeros", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/pasajeros/1" }.should route_to(:controller => "pasajeros", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/pasajeros/1/edit" }.should route_to(:controller => "pasajeros", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/pasajeros" }.should route_to(:controller => "pasajeros", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/pasajeros/1" }.should route_to(:controller => "pasajeros", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/pasajeros/1" }.should route_to(:controller => "pasajeros", :action => "destroy", :id => "1")
    end

  end
end
