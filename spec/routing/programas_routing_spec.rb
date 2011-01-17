require "spec_helper"

describe ProgramasController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/programas" }.should route_to(:controller => "programas", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/programas/new" }.should route_to(:controller => "programas", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/programas/1" }.should route_to(:controller => "programas", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/programas/1/edit" }.should route_to(:controller => "programas", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/programas" }.should route_to(:controller => "programas", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/programas/1" }.should route_to(:controller => "programas", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/programas/1" }.should route_to(:controller => "programas", :action => "destroy", :id => "1")
    end

  end
end
