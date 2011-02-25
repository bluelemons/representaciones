class PasajerosController < ApplicationController
  # GET /pasajeros
  # GET /pasajeros.xml
  def index
    @pasajeros = Pasajero.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pasajeros }
    end
  end

  # GET /pasajeros/1
  # GET /pasajeros/1.xml
  def show
    @pasajero = Pasajero.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pasajero }
    end
  end

  # GET /pasajeros/new
  # GET /pasajeros/new.xml
  def new
    @pasajero = Pasajero.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pasajero }
    end
  end

  # GET /pasajeros/1/edit
  def edit
    @pasajero = Pasajero.find(params[:id])
  end

  # POST /pasajeros
  # POST /pasajeros.xml
  def create
    @pasajero = Pasajero.new(params[:pasajero])

    respond_to do |format|
      if @pasajero.save
        format.html { redirect_to(@pasajero, :notice => 'Pasajero was successfully created.') }
        format.xml  { render :xml => @pasajero, :status => :created, :location => @pasajero }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pasajero.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pasajeros/1
  # PUT /pasajeros/1.xml
  def update
    @pasajero = Pasajero.find(params[:id])

    respond_to do |format|
      if @pasajero.update_attributes(params[:pasajero])
        format.html { redirect_to(@pasajero, :notice => 'Pasajero was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pasajero.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pasajeros/1
  # DELETE /pasajeros/1.xml
  def destroy
    @pasajero = Pasajero.find(params[:id])
    @pasajero.destroy

    respond_to do |format|
      format.html { redirect_to(pasajeros_url) }
      format.xml  { head :ok }
    end
  end
end
