class DirectosController < InheritedResources::Base
  def index
  end

  def new
    @deposito = Deposito.new
    @pago = Pago.new
    @cambio = Cambio.new
    @directo = Directo.new
  end

  def create
    # 1. Deposita el dinero
    # 2. Graba un cambio si lo hubiese
    # 3. Graba el pago.
    @directo = Directo.new(params[:directo])
    @deposito = Deposito.new(params[:directo])
    @pago = Pago.new(params[:directo])
    @cambio = Cambio.new(params[:directo])

    ActiveRecord::Base.transaction do
      if depositar_dinero && cambiar_dinero && realizar_pago
        flash[:notice] = "El pago a sido registrado"
      else
        raise ActiveRecord::Rollback
      end
    end
    render 'new.js'
  end

  private

  def depositar_dinero
    @deposito.user = current_user
    @deposito.save
  end

  def cambiar_dinero
    if cambio?
      #actualizo la cuenta de cambio.
      @cambio.cuenta = @deposito.cuenta
      if cotizacion?
        @cambio.monto = @cambio.monto.exchange_to(@deposito.reserva.total.currency)
        @cambio.user = current_user
        actualizar_monto_de_pago
        @cambio.save
      else
        flash.notice = "La cotización de esta fecha no está cargada"
        false
      end
    else
      true
    end
  end

  def cambio?
    if @deposito.reserva
      @deposito.monto.currency != @deposito.reserva.total.currency
    end
  end

  def cotizacion?
    c = Cotizacion.buscar(@deposito.fecha, @deposito.reserva.total, @deposito.cuenta.monto)
    c && c.add_rate
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

