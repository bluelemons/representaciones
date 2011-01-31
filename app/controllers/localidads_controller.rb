class LocalidadsController < ApplicationController
  # GET /localidads
  # GET /localidads.xml
  def index    
    @search = Localidad.search(params[:search])
    @localidads = @search.paginate :page => params[:page], :per_page =>400
    respond_to do |format|
      format.html 
      format.xml  
    end
  end

  # GET /localidads/1
  # GET /localidads/1.xml
  def show
    @localidad = Localidad.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @localidad }
    end
  end

  # GET /localidads/new
  # GET /localidads/new.xml
  def new
    @localidad = Localidad.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @localidad }
    end
  end

  # GET /localidads/1/edit
  def edit
    @localidad = Localidad.find(params[:id])
  end

  # POST /localidads
  # POST /localidads.xml
  def create
    @localidad = Localidad.new(params[:localidad])

    respond_to do |format|
      if @localidad.save
        format.html { redirect_to(@localidad, :notice => 'Localidad was successfully created.') }
        format.xml  { render :xml => @localidad, :status => :created, :location => @localidad }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @localidad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /localidads/1
  # PUT /localidads/1.xml
  def update
    @localidad = Localidad.find(params[:id])

    respond_to do |format|
      if @localidad.update_attributes(params[:localidad])
        format.html { redirect_to(@localidad, :notice => 'Localidad was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @localidad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /localidads/1
  # DELETE /localidads/1.xml
  def destroy
    @localidad = Localidad.find(params[:id])
    @localidad.destroy

    respond_to do |format|
      format.html { redirect_to(localidads_url) }
      format.xml  { head :ok }
    end
  end
end
