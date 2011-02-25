class CotizacionesController < ApplicationController
  # GET /cotizaciones
  # GET /cotizaciones.xml
  def index
    @cotizaciones = Cotizacion.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cotizaciones }
    end
  end

  # GET /cotizaciones/1
  # GET /cotizaciones/1.xml
  def show
    @cotizacion = Cotizacion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cotizacion }
    end
  end

  # GET /cotizaciones/new
  # GET /cotizaciones/new.xml
  def new
    @cotizacion = Cotizacion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cotizacion }
    end
  end

  # GET /cotizaciones/1/edit
  def edit
    @cotizacion = Cotizacion.find(params[:id])
  end

  # POST /cotizaciones
  # POST /cotizaciones.xml
  def create
    @cotizacion = Cotizacion.new(params[:cotizacion])

    respond_to do |format|
      if @cotizacion.save
        format.html { redirect_to(@cotizacion, :notice => 'Cotizacion was successfully created.') }
        format.xml  { render :xml => @cotizacion, :status => :created, :location => @cotizacion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cotizacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cotizaciones/1
  # PUT /cotizaciones/1.xml
  def update
    @cotizacion = Cotizacion.find(params[:id])

    respond_to do |format|
      if @cotizacion.update_attributes(params[:cotizacion])
        format.html { redirect_to(@cotizacion, :notice => 'Cotizacion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cotizacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cotizaciones/1
  # DELETE /cotizaciones/1.xml
  def destroy
    @cotizacion = Cotizacion.find(params[:id])
    @cotizacion.destroy

    respond_to do |format|
      format.html { redirect_to(cotizaciones_url) }
      format.xml  { head :ok }
    end
  end
end
