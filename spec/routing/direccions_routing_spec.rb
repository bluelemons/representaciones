require "spec_helper"

describe DireccionsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/direccions" }.should route_to(:controller => "direccions", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/direccions/new" }.should route_to(:controller => "direccions", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/direccions/1" }.should route_to(:controller => "direccions", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/direccions/1/edit" }.should route_to(:controller => "direccions", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/direccions" }.should route_to(:controller => "direccions", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/direccions/1" }.should route_to(:controller => "direccions", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/direccions/1" }.should route_to(:controller => "direccions", :action => "destroy", :id => "1")
    end

  end
end
