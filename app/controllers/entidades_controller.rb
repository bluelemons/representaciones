class EntidadesController < ApplicationController
  # GET /entidades
  # GET /entidades.xml
  def index
    @entidades = Entidad.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entidades }
    end
  end

  # GET /entidades/1
  # GET /entidades/1.xml
  def show
    @entidad = Entidad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @entidad }
    end
  end

  # GET /entidades/new
  # GET /entidades/new.xml
  def new
    @entidad = Entidad.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entidad }
    end
  end

  # GET /entidades/1/edit
  def edit
    @entidad = Entidad.find(params[:id])
  end

  # POST /entidades
  # POST /entidades.xml
  def create
    @entidad = Entidad.new(params[:entidad])

    respond_to do |format|
      if @entidad.save
        format.html { redirect_to(@entidad, :notice => 'Entidad was successfully created.') }
        format.xml  { render :xml => @entidad, :status => :created, :location => @entidad }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entidad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /entidades/1
  # PUT /entidades/1.xml
  def update
    @entidad = Entidad.find(params[:id])

    respond_to do |format|
      if @entidad.update_attributes(params[:entidad])
        format.html { redirect_to(@entidad, :notice => 'Entidad was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entidad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /entidades/1
  # DELETE /entidades/1.xml
  def destroy
    @entidad = Entidad.find(params[:id])
    @entidad.destroy

    respond_to do |format|
      format.html { redirect_to(entidades_url) }
      format.xml  { head :ok }
    end
  end
end
