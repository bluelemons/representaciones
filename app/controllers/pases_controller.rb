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
    @pase = Pase.find params[:id]
  end

  def destroy
    @pase = Pase.find params[:id]
    reserva = @pase.depositos.first.reserva
    @pase.destroy
    redirect_to reserva, notice: 'El pase fue eliminado'
  end
end
