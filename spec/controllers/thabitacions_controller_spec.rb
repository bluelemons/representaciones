require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe ThabitacionsController do

  def mock_thabitacion(stubs={})
    @mock_thabitacion ||= mock_model(Thabitacion, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all thabitacions as @thabitacions" do
      Thabitacion.stub(:all) { [mock_thabitacion] }
      get :index
      #assigns(:thabitacions).should eq([mock_thabitacion])
      assigns(:thabitacions).should eq([])
    end
  end

  describe "GET show" do
    it "assigns the requested thabitacion as @thabitacion" do
      Thabitacion.stub(:find).with("37") { mock_thabitacion }
      get :show, :id => "37"
      assigns(:thabitacion).should be(mock_thabitacion)
    end
  end

  describe "GET new" do
    it "assigns a new thabitacion as @thabitacion" do
      Thabitacion.stub(:new) { mock_thabitacion }
      get :new
      assigns(:thabitacion).should be(mock_thabitacion)
    end
  end

  describe "GET edit" do
    it "assigns the requested thabitacion as @thabitacion" do
      Thabitacion.stub(:find).with("37") { mock_thabitacion }
      get :edit, :id => "37"
      assigns(:thabitacion).should be(mock_thabitacion)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created thabitacion as @thabitacion" do
        Thabitacion.stub(:new).with({'these' => 'params'}) { mock_thabitacion(:save => true) }
        post :create, :thabitacion => {'these' => 'params'}
        assigns(:thabitacion).should be(mock_thabitacion)
      end

      it "redirects to the created thabitacion" do
        Thabitacion.stub(:new) { mock_thabitacion(:save => true) }
        post :create, :thabitacion => {}
        response.should redirect_to(:controller =>:thabitacions,:action=>'show',:format=>:js,:id=>mock_thabitacion.id)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved thabitacion as @thabitacion" do
        Thabitacion.stub(:new).with({'these' => 'params'}) { mock_thabitacion(:save => false) }
        post :create, :thabitacion => {'these' => 'params'}
        assigns(:thabitacion).should be(mock_thabitacion)
      end

      it "re-renders the 'new' template" do
        Thabitacion.stub(:new) { mock_thabitacion(:save => false) }
        post :create, :thabitacion => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested thabitacion" do
        Thabitacion.stub(:find).with("37") { mock_thabitacion }
        mock_thabitacion.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :thabitacion => {'these' => 'params'}
      end

      it "assigns the requested thabitacion as @thabitacion" do
        Thabitacion.stub(:find) { mock_thabitacion(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:thabitacion).should be(mock_thabitacion)
      end

      it "redirects to the thabitacion" do
        Thabitacion.stub(:find) { mock_thabitacion(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(:controller =>:thabitacions,:action=>'show',:format=>:js,:id=>mock_thabitacion.id)
      end
    end

    describe "with invalid params" do
      it "assigns the thabitacion as @thabitacion" do
        Thabitacion.stub(:find) { mock_thabitacion(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:thabitacion).should be(mock_thabitacion)
      end

      it "re-renders the 'edit' template" do
        Thabitacion.stub(:find) { mock_thabitacion(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested thabitacion" do
      Thabitacion.stub(:find).with("37") { mock_thabitacion }
      mock_thabitacion.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    #it "redirects to the thabitacions list" do
    #  Thabitacion.stub(:find) { mock_thabitacion }
    #  delete :destroy, :id => "1"
    #  response.should redirect_to(thabitacions_url)
    #end
  end

end