require "spec_helper"

describe ThabitacionsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/thabitacions" }.should route_to(:controller => "thabitacions", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/thabitacions/new" }.should route_to(:controller => "thabitacions", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/thabitacions/1" }.should route_to(:controller => "thabitacions", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/thabitacions/1/edit" }.should route_to(:controller => "thabitacions", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/thabitacions" }.should route_to(:controller => "thabitacions", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/thabitacions/1" }.should route_to(:controller => "thabitacions", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/thabitacions/1" }.should route_to(:controller => "thabitacions", :action => "destroy", :id => "1")
    end

  end
end
