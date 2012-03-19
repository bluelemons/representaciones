class MovimientosController < ApplicationController
  load_and_authorize_resource

  def index
    @search = Deposito.search(params[:search])
    @movimientos = @search.paginate(:page=>params[:page], :per_page=>10)
    @movimientos = @movimientos.includes :entidad, :reserva => :pasajeros

    @reservas_search = Reserva.search()
    @reservas = @reservas_search.paginate :page => params[:page], :per_page =>10

    respond_to do |format|
      format.js
      format.html
      format.pdf do
        @total = Movimiento.total(@search)
        output = MovimientoReport.new.to_pdf(@search,@total)
        send_data output, :filename => "index_report.pdf",
                          :type     => "application/pdf"
      end
    end
  end

  def destroy
    @movimiento = Movimiento.find(params[:id])
    if @movimiento.destroy
      flash[:notice] = "El movimiento ha sido eliminado"
      redirect_to :action => 'index', :format =>'js'
    else
      flash[:notice] = "Este movimiento no puede ser eliminado."
      redirect_to :action => 'index', :format =>'js'
    end
  end
end
