require 'spec_helper'

describe "Tarifas" do
  describe "GET /tarifas" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get tarifas_path
      response.status.should be(200)
    end
  end
end
