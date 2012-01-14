# coding: utf-8
desc "Simula la migración de los datos en los pagos para utilizar solo depositos"
task :migrate_pagos => :environment do
  require 'migrator'

  Migrator.migrate
end

