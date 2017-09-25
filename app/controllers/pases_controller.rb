class PasesController < ApplicationController
  def new
    @pase = Pase.new source_id: params[:reserva]
  end

  def create
    @pase = Pase.new params[:pase]
    if @pase.save
      redirect_to @pase, notice: "El pase fue creado"
    else
      render :new
    end
  end

  def show
    @pase = Pase.new params[:id]
    render text: @pase.inspect
  end
end
