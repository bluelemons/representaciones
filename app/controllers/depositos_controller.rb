class DepositosController < InheritedResources::Base
  belongs_to :reserva
  load_and_authorize_resource

  def index
  end

  def create
    @deposito = Deposito.new(params[:deposito])
    @deposito.user = current_user
    if @deposito.save
      flash[:notice] = "El deposito fue registrado correctamente"
      redirect_to reservas_path
    else
      render 'new'
    end
  end
end

