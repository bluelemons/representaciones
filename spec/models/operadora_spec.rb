require 'spec_helper'
require 'models/entidad_shared'

describe Operadora do
  it_behaves_like "Entidad" do
    let(:entidad) { Factory(:operadora) }
  end
end
