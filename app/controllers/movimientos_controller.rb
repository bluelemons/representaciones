class MovimientosController < ApplicationController
  # GET /movimientos
  # GET /movimientos.xml
  def index
    @movimientos = Movimiento.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @movimientos }
    end
  end

  # GET /movimientos/1
  # GET /movimientos/1.xml
  def show
    @movimiento = Movimiento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @movimiento }
    end
  end

  # GET /movimientos/new
  # GET /movimientos/new.xml
  def new
    @movimiento = Movimiento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @movimiento }
    end
  end

  # GET /movimientos/1/edit
  def edit
    @movimiento = Movimiento.find(params[:id])
  end

  # POST /movimientos
  # POST /movimientos.xml
  def create
    @movimiento = Movimiento.new(params[:movimiento])

    respond_to do |format|
      if @movimiento.save
        format.html { redirect_to(@movimiento, :notice => 'Movimiento was successfully created.') }
        format.xml  { render :xml => @movimiento, :status => :created, :location => @movimiento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @movimiento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /movimientos/1
  # PUT /movimientos/1.xml
  def update
    @movimiento = Movimiento.find(params[:id])

    respond_to do |format|
      if @movimiento.update_attributes(params[:movimiento])
        format.html { redirect_to(@movimiento, :notice => 'Movimiento was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @movimiento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /movimientos/1
  # DELETE /movimientos/1.xml
  def destroy
    @movimiento = Movimiento.find(params[:id])
    @movimiento.destroy

    respond_to do |format|
      format.html { redirect_to(movimientos_url) }
      format.xml  { head :ok }
    end
  end
end
