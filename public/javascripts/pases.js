$(document).on('change', '#pase_origen_id', function (e) {
  const selected = $(this.selectedOptions[0])
  $('span.origen_currency').text(selected.data('currency'))
  $('#pase_monto').val(selected.data('saldo'))
})

$(document).on('change', '#nuevo_destino', function (e) {
  const fieldset = document.querySelector('#destino')
    .content.querySelector('fieldset')
  const destinos = document.querySelector('.destinos')
  const clone = document.importNode(fieldset, true)

  // agrego el formulario de destino
  const selected = this.selectedOptions[0]
  document.sample_clone = clone
  const remaining = document.querySelector('#remaining')
  const current_value = Math.min(remaining.textContent, selected.dataset.debt)

  const template_data = {
    name: selected.innerText,
    id: selected.value,
    value: current_value,
    max: selected.dataset.debt,
    currency: selected.dataset.currency }

  clone.innerHTML = clone.innerHTML.replace(/{{[^}]*}}/g, function (match) {
    return template_data[match.slice(2, -2).trim()]
  })
  destinos.appendChild(clone);

  // evitamos dos veces el mismo destino
  selected.disabled = true
  this.options[0].selected = true
  console.log(selected.selected)

  // Actualizo saldo restante
  remaining.innerText = (parseFloat(remaining.innerText) - parseFloat(current_value)).toFixed(2)
})
