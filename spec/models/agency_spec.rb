require 'rails_helper'
require 'models/entidad_shared'

describe Agency do
  it_behaves_like "Entidad" do
    let(:entidad) { FactoryGirl(:agency) }
  end
end
