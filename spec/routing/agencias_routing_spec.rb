require "spec_helper"

describe AgenciasController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/agencias" }.should route_to(:controller => "agencias", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/agencias/new" }.should route_to(:controller => "agencias", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/agencias/1" }.should route_to(:controller => "agencias", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/agencias/1/edit" }.should route_to(:controller => "agencias", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/agencias" }.should route_to(:controller => "agencias", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/agencias/1" }.should route_to(:controller => "agencias", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/agencias/1" }.should route_to(:controller => "agencias", :action => "destroy", :id => "1")
    end

  end
end
