$(document).on('change', '#pase_origen_id', function (e) {
  const selected = $(this.selectedOptions[0])
  $('span.origen_currency').text(selected.data('currency'))
  $('#pase_monto').val(selected.data('saldo'))
})

$(document).on('change', '#nuevo_destino', function (e) {
  const selected = $(this.selectedOptions[0])

  // el valor para llenar automáticamente
  const current_ammount = Math.min($('#pase_monto').val(),
      selected.data('debt'))

  // agrego el formulario de destino
  // TODO: mover a un template
  const destino_html ='<fieldset><legend>Pase a ' +
        selected.text() +
        '</legend>' +
        '<label>Monto <input type=number name="pase[destinos][' +
        selected.val() +
        ']" min="0" step="0.01" max="' +
        selected.data('debt') +
        '" value="' +
        current_ammount +
        '"></label> <span>' +
        selected.data('currency') +
        '<span></fieldset>'
  $('.destinos').append(destino_html)

  // evitamos dos veces el mismo destino
  selected.prop({ disabled: true }).parent().val('')

  // Actualizo saldo restante
  $('#remaining').text(function (_, remaining) {
    return (parseFloat(remaining) - parseFloat(current_ammount)).toFixed(2)
  })
})
