class CompletarDepositos < ActiveRecord::Migration
  def self.up
    require 'migrator'

    Migrator.migrate(true)
  end

  def self.down
  end
end

