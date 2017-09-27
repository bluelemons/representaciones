(function () {
  $(document).on('change', '#nuevo_destino', function (e) {
    const fieldset = document.querySelector('#destino')
      .content.querySelector('fieldset')
    const destinos = document.querySelector('.destinos')

    // agrego el formulario de destino
    const selected = this.selectedOptions[0]
    const remaining = document.querySelector('#remaining')
    const current_value = Math.min(remaining.textContent, selected.dataset.debt)

    const template_data = {
      name: selected.innerText,
      id: selected.value,
      value: current_value,
      max: selected.dataset.debt,
      currency: selected.dataset.currency }

    const nuevo_destino = render(fieldset, template_data)
    destinos.appendChild(nuevo_destino);

    // evitamos dos veces el mismo destino
    selected.disabled = true
    this.options[0].selected = true

    actualizar_saldo_restante()
  })

  function actualizar_saldo_restante () {
    const remaining = document.querySelector('#remaining')
    const debitar = parseFloat(document.querySelector('#pase_debit').value)
    let acreditar = 0
    const destinos = document.querySelectorAll('.destinos input')
    for (var i = 0; i < destinos.length; ++i) {
      const destino = destinos[i]
      acreditar += parseFloat(destino.value)
    }

    const saldo = (debitar - acreditar).toFixed(2)
    remaining.innerText = saldo
    return saldo
  }

  function render(template, data) {
    const clone = document.importNode(template, true)
    clone.innerHTML = clone.innerHTML.replace(/{{[^}]*}}/g, function (match) {
      return data[match.slice(2, -2).trim()]
    })
    return clone
  }
})()
