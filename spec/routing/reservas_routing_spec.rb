require "spec_helper"

describe ReservasController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/reservas" }.should route_to(:controller => "reservas", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/reservas/new" }.should route_to(:controller => "reservas", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/reservas/1" }.should route_to(:controller => "reservas", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/reservas/1/edit" }.should route_to(:controller => "reservas", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/reservas" }.should route_to(:controller => "reservas", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/reservas/1" }.should route_to(:controller => "reservas", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/reservas/1" }.should route_to(:controller => "reservas", :action => "destroy", :id => "1")
    end

  end
end
