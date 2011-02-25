require 'spec_helper'

describe "Entidades" do
  describe "GET /entidades" do
    it "works! (now write some real specs)" do
      visit entidades_path
      response.status.should be(200)
    end
  end
end
