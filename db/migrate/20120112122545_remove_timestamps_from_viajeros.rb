class RemoveTimestampsFromViajeros < ActiveRecord::Migration
  def self.up
    remove_timestamps(:viajeros)
  end

  def self.down
    add_timestamps(:viajeros)
  end
end

