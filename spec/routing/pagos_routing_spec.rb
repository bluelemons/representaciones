require "spec_helper"

describe PagosController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/pagos" }.should route_to(:controller => "pagos", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/pagos/new" }.should route_to(:controller => "pagos", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/pagos/1" }.should route_to(:controller => "pagos", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/pagos/1/edit" }.should route_to(:controller => "pagos", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/pagos" }.should route_to(:controller => "pagos", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/pagos/1" }.should route_to(:controller => "pagos", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/pagos/1" }.should route_to(:controller => "pagos", :action => "destroy", :id => "1")
    end

  end
end
