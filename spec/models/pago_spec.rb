# encoding: UTF-8
require 'spec_helper'

describe Pago do

  fixtures(:reservas)

  describe 'asociaciones' do
    it { should belong_to(:entidad)   }
    it { should belong_to(:reserva)   }
    it { should belong_to(:tdeposito) }
  end

  describe 'validaciones' do
    it { should validate_presence_of(:reserva)   }
    it { should validate_presence_of(:entidad)   }
    it { should validate_presence_of(:fecha)     }
    it { should validate_presence_of(:tdeposito) }

    pending 'la fecha debe ser pasada' do
      pago = Factory.build(:pago, :fecha => Date.today + 1 )
      pago.should be_invalid
      # TODO: pago.errors.should include match flat
    end

    pending { should ensure_inclusion_of(:monto_cents).in_range(1..1_000_000_00) }
    pending { should ensure_inclusion_of(:monto_original_cents).in_range(1..1_000_000_00) }

    pending 'advierte la falta de datos del comprobante'

    it 'monto debe tener la misma moneda que la reserva' do
      # FIX: ver que onda con los fixtures
      pago = Factory.build(:pago, :monto => "500 ARS", :reserva => reservas(:costa_magica))
      pago.should be_invalid
    end

    it 'permite cargar un pago correcto' do
      pago = Factory.build(:pago)
      pago.errors.should be_empty
      pago.should be_valid
      pago.save.should be_true
    end
  end
end

