class PagosController < ApplicationController
  def index
  end

  def new
    @pago = Pago.new
    @pago.build_monto
  end

end

