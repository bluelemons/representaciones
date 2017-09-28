(function () {
  $(document).on('change', '#nuevo_destino', function (e) {
    const fieldset = document.querySelector('#destino')
      .content.querySelector('fieldset')
    const destinos = document.querySelector('.destinos')

    // agrego el formulario de destino
    const selected = this.selectedOptions[0]
    const saldo = exchange(saldo_restante(), selected.dataset.currency)
    const current_value = Math.min(saldo.amount, selected.dataset.debt)

    const template_data = {
      name: selected.textContent,
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

  $(document).on('change', '#pase_debit , .destinos input , .info input',
    actualizar_saldo_restante)

  function saldo_restante () {
    const remaining = document.querySelector('#remaining')
    const debit = document.querySelector('#pase_debit')

    return { amount: parseFloat(remaining.textContent),
             currency: debit.dataset.currency }
  }

  function actualizar_saldo_restante () {
    const remaining = document.querySelector('#remaining')
    const debit = document.querySelector('#pase_debit')
    const debit_amount = parseFloat(debit.value)

    const saldo = debit_amount - saldo_asignado(debit.dataset.currency)

    if (Number.isNaN(saldo)) {
      remaining.innerText = 'No es posible calcular, ingrese valor de cambio'
      remaining.parentNode.className = 'info danger'
      return saldo
    }

    remaining.innerText = saldo.toFixed(2)

    if (saldo < -0.001) {
      remaining.parentNode.className = 'info danger'
    } else if (saldo > 0.001) {
      remaining.parentNode.className = 'info warning'
    } else {
      remaining.parentNode.className = 'info success'
    }

    recalcular_destinos_monto_nulo()

    return saldo
  }

  // calcula el saldo asignado en la moneda indicada
  function saldo_asignado (currency) {
    let asignado = 0
    const destinos = document.querySelectorAll('.destinos input')
    for (var i = 0; i < destinos.length; ++i) {
      const destino = destinos[i]
      asignado += exchange({ amount: parseFloat(destino.value),
        currency: destino.dataset.currency },
        currency).amount
    }
    return asignado
  }

  function exchange (money, currency) {
    if (money.currency === currency) {
      return money
    }

    const dolar = document.getElementById('cambio_dolar').value
    const euro = document.querySelector('#cambio_euro').value

    const matrix = {
      ARS: { USD: 1 / dolar, EUR: 1 / euro },
      USD: { ARS: dolar, EUR: dolar / euro },
      EUR: { USD: euro / dolar, ARS: euro }}

    return { amount: money.amount * matrix[money.currency][currency],
             currency: currency }
  }

  function render(template, data) {
    const clone = document.importNode(template, true)
    clone.innerHTML = clone.innerHTML.replace(/{{[^}]*}}/g, function (match) {
      return data[match.slice(2, -2).trim()]
    })
    return clone
  }

  function recalcular_destinos_monto_nulo () {
    const destinos = document.querySelectorAll('.destinos input')
    for (var i = 0; i < destinos.length; ++i) {
      const destino = destinos[i]
      if (destino.value === '0') {
        const saldo = exchange(saldo_restante(), destino.dataset.currency)
        const value = Math.min(saldo.amount, destino.max)
        destino.value = value
      }
    }
  }
})()
