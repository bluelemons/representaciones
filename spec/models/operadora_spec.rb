require 'rails_helper'
require 'models/entidad_shared'

describe Operadora do
  it_behaves_like "Entidad" do
    let(:entidad) { FactoryGirl(:operadora) }
  end
end
