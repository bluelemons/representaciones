require "spec_helper"

describe TarifasController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/tarifas" }.should route_to(:controller => "tarifas", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/tarifas/new" }.should route_to(:controller => "tarifas", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/tarifas/1" }.should route_to(:controller => "tarifas", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/tarifas/1/edit" }.should route_to(:controller => "tarifas", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/tarifas" }.should route_to(:controller => "tarifas", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/tarifas/1" }.should route_to(:controller => "tarifas", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/tarifas/1" }.should route_to(:controller => "tarifas", :action => "destroy", :id => "1")
    end

  end
end
