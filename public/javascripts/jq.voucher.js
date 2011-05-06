$(function() {

  $(".voucher_quitar").button({icons: {primary: "ui-icon-pencil"},text: true});
  $(".voucher_cargar").button({icons: {primary: "ui-icon-pencil"},text: true});

  $(".voucher_cargar").click(function() {
      var fecha = $("#voucher_date").val();
      if(fecha != ""){
        var id = $(this).attr("id");
        $(this).hide();
        $.getScript("/vouchers/"+id+"/cargar.js?voucher="+fecha);
      }
      else{
        alert("No cargaste fecha para los voucher");

      }
  });
  $(".voucher_quitar").click(function(){
      var id = $(this).attr("id");
      $(this).hide();
      $.getScript("/vouchers/"+id+"/bajar.js");
  })
});

