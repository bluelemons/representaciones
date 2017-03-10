require 'rails_helper'

describe PagosController do

  def mock_pago(stubs={})
    @mock_pago ||= mock_model(Pago, stubs).as_null_object
  end

  describe "GET new as js" do
    it "assigns a new pago as @pago" do
      Pago.stub(:new) { mock_pago }
      get :new, :format => :js
      assigns(:pago).should be(mock_pago)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created pago as @pago" do
        Pago.stub(:new).with({'these' => 'params'}) { mock_pago(:save => true) }
        post :create, :pago => {'these' => 'params'}
        assigns(:pago).should be(mock_pago)
      end

      it "assigns a user to the created pago" do
        Pago.stub(:new).with({'these' => 'params'}) { mock_pago(:save => true) }
        controller.stub(:current_user) { "current_user" }
        mock_pago.should_receive(:"user=").with("current_user")
        post :create, :pago => {'these' => 'params'}
        assigns(:pago).should be(mock_pago)
      end


      it "redirects to a new pago form" do
        Pago.stub(:new) { mock_pago(:save => true) }
        post :create, :pago => {}, :format => :js
        response.should redirect_to(:controller =>:pagos, :action=>'new', :format=>:js)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved pago as @pago" do
        Pago.stub(:new).with({'these' => 'params'}) { mock_pago(:save => false) }
        post :create, :pago => {'these' => 'params'}
        assigns(:pago).should be(mock_pago)
      end

      it "re-renders the 'new' template" do
        Pago.stub(:new) { mock_pago(:save => false) }
        post :create, :pago => {}
        response.should render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested pago" do
      Pago.stub(:find).with("37") { mock_pago }
      mock_pago.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the pagos list" do
      Pago.stub(:find) { mock_pago }
      delete :destroy, :id => "1"
      response.should redirect_to(pagos_url)
    end
  end
end

