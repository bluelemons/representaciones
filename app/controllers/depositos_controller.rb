class DepositosController < ApplicationController
  #load_and_authorize_resource

  def index
  end

  def new
    @deposito = Deposito.new
    @deposito.build_monto
  end

  def create
    @deposito = params[:deposito]
    @deposito[:monto] = Monto.new(@deposito.delete(:monto_attributes)).to_money
    @deposito = Deposito.new(@deposito)
    @deposito.user = current_user
    if @deposito.save
      flash[:notice] = "El deposito fue registrado correctamente"
      redirect_to :action => 'new', :format =>'js'
    else
      render 'new.js'
    end
  end

end

