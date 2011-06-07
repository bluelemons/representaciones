require 'spec_helper'

shared_examples_for "un movimiento" do
  it { should belong_to(:entidad) }
  it { should validate_presence_of(:entidad) }
  it { should validate_presence_of(:fecha) }
  it { should validate_presence_of(:monto_cents) }
  it { should validate_presence_of(:monto_currency) }
  it "no es posible actualizarlos" do
    movimiento.entidad = Factory(:agency)
    movimiento.save.should be_false
  end
  it "al destruirlos se desacen los cambios" do
    movimiento.should_receive(:deshacer) { true }
    movimiento.destroy
    movimiento.destroyed?.should be_true
  end
end

