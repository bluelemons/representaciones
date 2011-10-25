class DepositosController < InheritedResources::Base
  belongs_to :reserva, :optional => true
  authorize_resource

  def index
    @search = Movimiento.baja.search((params[:search] if params[:search]))
    @total = Movimiento.total(@search)
    @movimientos = @search.paginate :page => params[:page], :per_page =>10
  end

  def create
    entidades = params[:deposito].delete :entidades
    error =false
    entidades.each do |entidad|

      if entidad !=""

        @deposito = Deposito.new(params[:deposito])
        @deposito.reserva_id = params[:reserva_id]
        @deposito.user = current_user
        @deposito.entidad_id = entidad
        if !@deposito.save
          error = true
        end
      end
    end

    if !error
      flash[:notice] = "El deposito fue registrado correctamente"
      redirect_to reservas_path
    else
      @reserva = Reserva.find params[:reserva_id]
      render 'new'
    end
  end
end

