require "spec_helper"

describe TdocsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/tdocs" }.should route_to(:controller => "tdocs", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/tdocs/new" }.should route_to(:controller => "tdocs", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/tdocs/1" }.should route_to(:controller => "tdocs", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/tdocs/1/edit" }.should route_to(:controller => "tdocs", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/tdocs" }.should route_to(:controller => "tdocs", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/tdocs/1" }.should route_to(:controller => "tdocs", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/tdocs/1" }.should route_to(:controller => "tdocs", :action => "destroy", :id => "1")
    end

  end
end
