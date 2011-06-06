class DirectosController < InheritedResources::Base
  def index
  end

  def new
    @deposito = Deposito.new
    @pago = Pago.new
    @cambio = Cambio.new
    @directo = Directo.new
    @search = Reserva.baja.search(:agency_id_eq=>0)
    @reservas = @search.paginate :page => params[:page], :per_page =>10
  end

  def create
    # 1. Deposita el dinero
    # 2. Graba un cambio si lo hubiese
    # 3. Graba el pago.
    @directo = Directo.new(params[:directo])
    @deposito = Deposito.new(params[:directo])
    @pago = Pago.new(params[:directo])
    ActiveRecord::Base.transaction do
      if depositar_dinero && cambiar_dinero && realizar_pago
        flash[:notice] = "El pago a sido registrado"
        redirect_to :action => 'new', :format =>'js'
      else
        @search = Reserva.baja.search(:agency_id_eq=>0)
        @reservas = @search.paginate :page => params[:page], :per_page =>10
        render 'new.js'
      end
    end
  end

  private

  def depositar_dinero
    @deposito.user = current_user
    @deposito.save
  end

  def cambiar_dinero
    if cambio?
      @cambio = Cambio.new(params[:directo])
      #actualizo la cuenta de cambio.
      @cambio.cuenta = @deposito.cuenta
      c = Cotizacion.buscar(@deposito.fecha,@deposito.reserva.total,@deposito.cuenta.monto)
      c.add_rate
      @cambio.monto = @cambio.monto.exchange_to(@deposito.reserva.total.currency)
      @cambio.user = current_user
      actualizar_monto_de_pago
      @cambio.save
    else
      true
    end
  end

  def cambio?
    @deposito.monto.currency != @deposito.reserva.total.currency
  end
  
  def actualizar_monto_de_pago
    @pago.cuenta = @cambio.cuenta_objetivo
    @pago.monto = @cambio.monto
  end

  def realizar_pago
    @pago.user = current_user
    @pago.save
  end
end

