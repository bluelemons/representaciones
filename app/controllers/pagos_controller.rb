class PagosController < ApplicationController
  def index
  end

  def new
    @movimiento = Movimiento.new
    @movimiento.build_monto    
  end

end
