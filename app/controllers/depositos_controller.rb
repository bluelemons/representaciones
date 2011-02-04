class DepositosController < ApplicationController
  #load_and_authorize_resource
  
  def index
  end

  def new
    @movimiento = Movimiento.new
    @movimiento.build_monto
  end

end
