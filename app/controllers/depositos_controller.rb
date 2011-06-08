class DepositosController < InheritedResources::Base
  load_and_authorize_resource

  def index
  end

  def new
    @deposito = Deposito.new
  end

  def create
    @deposito = Deposito.new(params[:deposito])
    @deposito.user = current_user
    if @deposito.save
      flash[:notice] = "El deposito fue registrado correctamente"
      redirect_to :action => 'new', :format =>'js'
    else
      render 'new.js'
    end
  end
end

