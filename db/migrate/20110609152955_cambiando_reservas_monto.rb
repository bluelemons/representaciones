class CambiandoReservasMonto < ActiveRecord::Migration

  def self.up

    execute "update monedas set name = replace(name, 'Pesos','ARS')"
    execute "update monedas set name = replace(name, 'Dolares','USD')"
    execute "update monedas set name = replace(name, 'Euros','EUR')"

    execute "update reservas set total_currency = (select name from montos m left join monedas mo on m.moneda_id = mo.id where m.id = monto_id ),
total_cents = (select (valor * 100) from montos m where m.id = monto_id  )"

  end

end

