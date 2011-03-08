require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe DireccionsController do

  def mock_direccion(stubs={})
    @mock_direccion ||= mock_model(Direccion, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all direccions as @direccions" do
      Direccion.stub(:all) { [mock_direccion] }
      get :index
#      assigns(:direccions).should eq([mock_direccion])
      assigns(:direccions).should eq([])
    end
  end

  describe "GET show" do
    it "assigns the requested direccion as @direccion" do
      Direccion.stub(:find).with("37") { mock_direccion }
      get :show, :id => "37"
      assigns(:direccion).should be(mock_direccion)
    end
  end

  describe "GET new" do
    it "assigns a new direccion as @direccion" do
      Direccion.stub(:new) { mock_direccion }
      get :new
      assigns(:direccion).should be(mock_direccion)
    end
  end

  describe "GET edit" do
    it "assigns the requested direccion as @direccion" do
      Direccion.stub(:find).with("37") { mock_direccion }
      get :edit, :id => "37"
      assigns(:direccion).should be(mock_direccion)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created direccion as @direccion" do
        Direccion.stub(:new).with({'these' => 'params'}) { mock_direccion(:save => true) }
        post :create, :direccion => {'these' => 'params'}
        assigns(:direccion).should be(mock_direccion)
      end

      it "redirects to the created direccion" do
        Direccion.stub(:new) { mock_direccion(:save => true) }
        post :create, :direccion => {}
        response.should redirect_to(:controller =>:direccions,:action=>'show',:format=>:js,:id=>mock_direccion.id)
        
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved direccion as @direccion" do
        Direccion.stub(:new).with({'these' => 'params'}) { mock_direccion(:save => false) }
        post :create, :direccion => {'these' => 'params'}
        assigns(:direccion).should be(mock_direccion)
      end

      it "re-renders the 'new' template" do
        Direccion.stub(:new) { mock_direccion(:save => false) }
        post :create, :direccion => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested direccion" do
        Direccion.stub(:find).with("37") { mock_direccion }
        mock_direccion.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :direccion => {'these' => 'params'}
      end

      it "assigns the requested direccion as @direccion" do
        Direccion.stub(:find) { mock_direccion(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:direccion).should be(mock_direccion)
      end

      it "redirects to the direccion" do
        Direccion.stub(:find) { mock_direccion(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(:controller =>:direccions,:action=>'show',:format=>:js,:id=>mock_direccion.id)
      end
    end

    describe "with invalid params" do
      it "assigns the direccion as @direccion" do
        Direccion.stub(:find) { mock_direccion(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:direccion).should be(mock_direccion)
      end

      it "re-renders the 'edit' template" do
        Direccion.stub(:find) { mock_direccion(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested direccion" do
      Direccion.stub(:find).with("37") { mock_direccion }
      mock_direccion.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    #it "redirects to the direccions list" do
    #  Direccion.stub(:find) { mock_direccion }
    #  delete :destroy, :id => "1"
    #  response.should redirect_to(direccions_url)
    #end
  end

end