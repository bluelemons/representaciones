class CotizacionsController < InheritedResources::Base

  respond_to :html, :xml, :js
  def index
    if params[:search]
      @search = Cotizacion.search(params[:search])
    else
      @search = Cotizacion.search()
    end
    @cotizacions = @search.paginate :page => params[:page], :per_page => 10
    respond_to do |format|
      format.js
      format.html
    end

  end

  def show
    @cotizacion = Cotizacion.find(params[:id])
    show!
  end

  def restore
    @cotizacion = Cotizacion.find(params[:id])
    redirect_to :action => 'show', :id => @cotizacion
  end

  def update
    @cotizacion = Cotizacion.find(params[:id])
    if @cotizacion.update_attributes(params[:cotizacion])
      redirect_to :action => 'show', :id => @cotizacion, :format => 'js'
    else
      render 'edit.js'
    end
  end

  def create
    @cotizacion = Cotizacion.new(params[:cotizacion])
    if @cotizacion.save
      render 'new.js'
    end
  end
end

