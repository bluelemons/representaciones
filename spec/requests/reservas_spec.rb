require 'spec_helper'

describe "Reservas" do
  describe "GET /reservas" do
    it "works! (now write some real specs)" do
      visit reservas_path
      response.status.should be(200)
    end
  end
end
