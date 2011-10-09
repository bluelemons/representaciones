require 'test_helper'

class DepositosControllerTest < ActionController::TestCase
  setup do
    @deposito = movimientos(:deposito_vikingo)
    sign_in users(:susana)
  end

  test "should get new deposito for reserva" do
    get :new, :reserva_id => reservas(:grand_celebration).to_param
    assert_response :success
  end

  # test "should create pago" do
  #   assert_difference('Pago.count') do
  #     post :create, :pago => @pago.attributes
  #   end

  #   assert_redirected_to new_pago_path
  # end

  # test "should show pago" do
  #   get :show, :id => @pago.to_param
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, :id => @pago.to_param
  #   assert_response :success
  # end

  # test "should update pago" do
  #   put :update, :id => @pago.to_param, :pago => @pago.attributes
  #   assert_redirected_to pago_path(assigns(:pago))
  # end

  # test "should destroy pago" do
  #   assert_difference('Pago.count', -1) do
  #     delete :destroy, :id => @pago.to_param
  #   end

  #   assert_redirected_to pagos_path
  # end

  # test "create guarda el usuario" do
  #   sign_in users(:tester)

  #   post :create, :pago => @pago.attributes
  #   pago = Pago.last
  #   assert_equal "tester", pago.user.username, "el usuario no fue guardado en la carga"
  # end

  # test "update guarda el usuario" do
  #   sign_in users(:tester)

  #   pago = Pago.find(Fixtures.identify(:pago_vikingo))
  #   put :update, :id => pago.id, :pago => @pago.attributes
  #   assert_equal "tester", pago.reload.user.username, "el usuario no fue guardado en update"
  # end
end
