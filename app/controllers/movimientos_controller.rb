class MovimientosController < InheritedResources::Base
  load_and_authorize_resource

  respond_to :html, :xml,:js

  # ver en inheritedresources como hacer para que solo haga index show, y restore.
  def index
    @search = Movimiento.baja.search((params[:search] if params[:search]))
    @total = Movimiento.total(@search)
    @movimientos = @search.paginate :page => params[:page], :per_page =>10
    respond_to do |format|
      format.js
      format.html
      format.pdf do
        output = MovimientoReport.new.to_pdf(@search)
        send_data output, :filename => "index_report.pdf",
                         :type => "application/pdf"
      end
    end

  end


  def show
    @movimiento = Movimiento.find(params[:id])
    @movimiento.revert_to(params[:version].to_i) if params[:version]
    show!
  end

  def restore
    @movimiento = Movimiento.find(params[:id])
    @movimiento.revert_to! params[:version_id]
	  redirect_to :action => 'show', :id => @pago
  end

end

