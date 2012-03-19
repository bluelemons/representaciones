require 'test_helper'

class DepositosControllerTest < ActionController::TestCase

  def setup
#    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in users(:susana)
  end

  def test_redirection_after_update
    deposito = movimientos(:deposito_ibero)
    deposito.numero = "31000062"
    form_data = deposito.attributes.slice :tdeposito_id, :fecha, :observaciones
    xhr :post, :update, :id => deposito.id, :deposito => form_data, :format => "js"
    assert_redirected_to :action => 'show', :id => deposito.id, :format =>'js'
  end

  def test_show_as_js
    xhr :get, :show, :format => :js, :id => movimientos(:deposito_ibero).to_param
    assert_response :success
    assert_equal movimientos(:deposito_ibero), assigns(:deposito)
  end

end

