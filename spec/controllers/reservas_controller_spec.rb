require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe ReservasController do

  def mock_reserva(stubs={})
    @mock_reserva ||= mock_model(Reserva, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all reservas as @reservas" do
      Reserva.stub(:all) { [mock_reserva] }
      get :index
      assigns(:reservas).should eq([mock_reserva])
    end
  end

  describe "GET show" do
    it "assigns the requested reserva as @reserva" do
      Reserva.stub(:find).with("37") { mock_reserva }
      get :show, :id => "37"
      assigns(:reserva).should be(mock_reserva)
    end
  end

  describe "GET new" do
    it "assigns a new reserva as @reserva" do
      Reserva.stub(:new) { mock_reserva }
      get :new
      assigns(:reserva).should be(mock_reserva)
    end
  end

  describe "GET edit" do
    it "assigns the requested reserva as @reserva" do
      Reserva.stub(:find).with("37") { mock_reserva }
      get :edit, :id => "37"
      assigns(:reserva).should be(mock_reserva)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created reserva as @reserva" do
        Reserva.stub(:new).with({'these' => 'params'}) { mock_reserva(:save => true) }
        post :create, :reserva => {'these' => 'params'}
        assigns(:reserva).should be(mock_reserva)
      end

      it "redirects to the created reserva" do
        Reserva.stub(:new) { mock_reserva(:save => true) }
        post :create, :reserva => {}
        response.should redirect_to(reserva_url(mock_reserva))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved reserva as @reserva" do
        Reserva.stub(:new).with({'these' => 'params'}) { mock_reserva(:save => false) }
        post :create, :reserva => {'these' => 'params'}
        assigns(:reserva).should be(mock_reserva)
      end

      it "re-renders the 'new' template" do
        Reserva.stub(:new) { mock_reserva(:save => false) }
        post :create, :reserva => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested reserva" do
        Reserva.stub(:find).with("37") { mock_reserva }
        mock_reserva.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :reserva => {'these' => 'params'}
      end

      it "assigns the requested reserva as @reserva" do
        Reserva.stub(:find) { mock_reserva(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:reserva).should be(mock_reserva)
      end

      it "redirects to the reserva" do
        Reserva.stub(:find) { mock_reserva(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(reserva_url(mock_reserva))
      end
    end

    describe "with invalid params" do
      it "assigns the reserva as @reserva" do
        Reserva.stub(:find) { mock_reserva(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:reserva).should be(mock_reserva)
      end

      it "re-renders the 'edit' template" do
        Reserva.stub(:find) { mock_reserva(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested reserva" do
      Reserva.stub(:find).with("37") { mock_reserva }
      mock_reserva.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the reservas list" do
      Reserva.stub(:find) { mock_reserva }
      delete :destroy, :id => "1"
      response.should redirect_to(reservas_url)
    end
  end

end
