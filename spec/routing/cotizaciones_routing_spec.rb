require "spec_helper"

describe CotizacionesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/cotizaciones" }.should route_to(:controller => "cotizaciones", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/cotizaciones/new" }.should route_to(:controller => "cotizaciones", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/cotizaciones/1" }.should route_to(:controller => "cotizaciones", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/cotizaciones/1/edit" }.should route_to(:controller => "cotizaciones", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/cotizaciones" }.should route_to(:controller => "cotizaciones", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/cotizaciones/1" }.should route_to(:controller => "cotizaciones", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/cotizaciones/1" }.should route_to(:controller => "cotizaciones", :action => "destroy", :id => "1")
    end

  end
end
