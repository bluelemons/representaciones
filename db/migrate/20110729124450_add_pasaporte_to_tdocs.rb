class AddPasaporteToTdocs < ActiveRecord::Migration
  def self.up
    Tdoc.create(:name=>"Pasaporte")
  end
end
