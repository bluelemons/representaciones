MoneyRails.configure do |config|
  # Moneda por defecto de la app (heredado del app original).
  config.default_currency = :ars

  # El app original monetizaba con composed_of, sin validaciones
  # numericas automaticas.
  config.include_validations = false
end

# Simbolos particulares de la app (heredados del override a
# Money::Currency::TABLE del app original).
Money::Currency.inherit("USD", symbol: "u$s ")
Money::Currency.inherit("ARS", symbol: "$ ")

# El formato (separadores, orden del simbolo) sale de la locale es,
# activa por defecto en config/application.rb y rails.es.yml.
Money.locale_backend = :i18n