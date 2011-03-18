class DepositosController < ApplicationController
  #load_and_authorize_resource

  def index
  end

  def new
    @deposito = Deposito.new
    @deposito.build_monto
  end

end

