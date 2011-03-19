class DirectosController < ApplicationController
  #load_and_authorize_resource

  def index
  end

  def new
    @directo = Directo.new
    @directo.build_monto
  end

  def create
    @directo = Directo.new(params[:directo])
    @directo.user = current_user
    if @directo.save
      flash[:notice] = "Por fin pagaron"
      redirect_to :action => 'new', :format =>'js'
    else
      render 'new.js'
    end
  end

end

