require 'spec_helper'

describe "Cotizaciones" do
  describe "GET /cotizaciones" do
    it "works! (now write some real specs)" do
      visit cotizaciones_path
      response.status.should be(200)
    end
  end
end
