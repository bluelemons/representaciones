require "spec_helper"

describe EntidadesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/entidades" }.should route_to(:controller => "entidades", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/entidades/new" }.should route_to(:controller => "entidades", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/entidades/1" }.should route_to(:controller => "entidades", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/entidades/1/edit" }.should route_to(:controller => "entidades", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/entidades" }.should route_to(:controller => "entidades", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/entidades/1" }.should route_to(:controller => "entidades", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/entidades/1" }.should route_to(:controller => "entidades", :action => "destroy", :id => "1")
    end

  end
end
