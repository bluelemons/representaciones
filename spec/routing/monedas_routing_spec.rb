require "spec_helper"

describe MonedasController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/monedas" }.should route_to(:controller => "monedas", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/monedas/new" }.should route_to(:controller => "monedas", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/monedas/1" }.should route_to(:controller => "monedas", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/monedas/1/edit" }.should route_to(:controller => "monedas", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/monedas" }.should route_to(:controller => "monedas", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/monedas/1" }.should route_to(:controller => "monedas", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/monedas/1" }.should route_to(:controller => "monedas", :action => "destroy", :id => "1")
    end

  end
end
