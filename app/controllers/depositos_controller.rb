class DepositosController < ApplicationController
  #load_and_authorize_resource

  def index
  end

  def new
    @deposito = Deposito.new
    @deposito.build_monto
  end

  def create
    @deposito = Deposito.new(params[:deposito])
    @deposito.user = current_user
    if @deposito.save
      flash[:notice] = "Por fin pagaron"
      redirect_to :action => 'new', :format =>'js'
    else
      render 'new.js'
    end
  end

end

