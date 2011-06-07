class MovimientosController < ApplicationController
#  load_and_authorize_resource

#  respond_to :html, :xml, :js

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
    redirect_to :action => 'show', :id => @movimiento
  end

  def destroy
    logger.debug "\e[1;32mDEBUG:\e[m Destroy called!"
    @movimiento = Movimiento.find(params[:id])
    logger.debug "Movimientos destruido:" + @movimiento.destroy.inspect
    # hasta acá anda todo bien, pero que le tengo que pasar a render
    # si le mando un js no se ejecuta, asi que no sirve de mucho
    if @movimiento.destroyed?
      # render 'destroy_exito.js', :layout => false
      flash[:notice] = "El movimiento ha sido eliminado"
      redirect_to :action => 'index', :format =>'js'
    else
      # Por otro lado estaria bueno poder mandar algo como un mensaje de error
      flash[:notice] = "Este movimiento no puede ser eliminado."
      redirect_to :action => 'index', :format =>'js'
    end
  end
end

