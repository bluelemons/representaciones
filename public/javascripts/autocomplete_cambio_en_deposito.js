(function($) {
  var converter;
  $.converter = converter = {
    baseSelector: "#deposito_monto_fields_monto",
    baseCurrencySelector: "#deposito_monto_fields_monto_currency",
    targetSelector: "#deposito_monto_final_fields_monto_final",
    targetCurrencySelector: "#deposito_monto_final_fields_monto_final_currency",
    fechaSelector: "#deposito_fecha",
    url: "/cotizaciones/consultar",
    actualizarMonto: function(data, textStatus, jqXHR) {
      $(converter.target).val = data.target;
      return converter.currentEvent = false;
    },
    consultarMonto: function(event) {
      return $.get(converter.url, {
        base: $(converter.baseSelector).val(),
        baseCurrency: $(converter.baseCurrencySelector).val(),
        targetCurrency: $(converter.targetCurrencySelector).val(),
        fecha: $(converter.fechaSelector).val()
      }, converter.actulizarMonto);
    },
    currentEvent: false
  };
  return $(document).delegate("" + converter.baseSelector + ", " + converter.baseCurrencySelector, 'change', function(event) {
    if (!($(converter.targetSelector).data("manual") || $(converter.targetCurrencySelector).val() === $(converter.baseCurrencySelector).val())) {
      if (converter.currentEvent) clearTimeout(converter.currentEvent);
      return converter.currentEvent = setTimeout(function() {
        return converter.consultarMonto(event);
      }, 300);
    }
  });
})(jQuery);

