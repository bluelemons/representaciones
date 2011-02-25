require "spec_helper"

describe MovimientosController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/movimientos" }.should route_to(:controller => "movimientos", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/movimientos/new" }.should route_to(:controller => "movimientos", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/movimientos/1" }.should route_to(:controller => "movimientos", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/movimientos/1/edit" }.should route_to(:controller => "movimientos", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/movimientos" }.should route_to(:controller => "movimientos", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/movimientos/1" }.should route_to(:controller => "movimientos", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/movimientos/1" }.should route_to(:controller => "movimientos", :action => "destroy", :id => "1")
    end

  end
end
