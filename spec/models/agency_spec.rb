require 'spec_helper'
require 'models/entidad_shared'

describe Agency do
  it_behaves_like "Entidad" do
    let(:entidad) { Factory(:agency) }
  end
end
