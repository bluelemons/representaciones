require "spec_helper"

describe OperadorasController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/operadoras" }.should route_to(:controller => "operadoras", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/operadoras/new" }.should route_to(:controller => "operadoras", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/operadoras/1" }.should route_to(:controller => "operadoras", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/operadoras/1/edit" }.should route_to(:controller => "operadoras", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/operadoras" }.should route_to(:controller => "operadoras", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/operadoras/1" }.should route_to(:controller => "operadoras", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/operadoras/1" }.should route_to(:controller => "operadoras", :action => "destroy", :id => "1")
    end

  end
end
