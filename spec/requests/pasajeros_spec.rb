require 'spec_helper'

describe "Pasajeros" do
  describe "GET /pasajeros" do
    it "works! (now write some real specs)" do
      visit pasajeros_path
      response.status.should be(200)
    end
  end
end
