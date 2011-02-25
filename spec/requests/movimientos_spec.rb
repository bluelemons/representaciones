require 'spec_helper'

describe "Movimientos" do
  describe "GET /movimientos" do
    it "works! (now write some real specs)" do
      visit movimientos_path
      response.status.should be(200)
    end
  end
end
