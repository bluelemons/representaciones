$(function() {

  $(".boucher_quitar").button({icons: {primary: "ui-icon-pencil"},text: true});
  $(".boucher_cargar").button({icons: {primary: "ui-icon-pencil"},text: true});

  $(".boucher_cargar").click(function() {
      var fecha = $("#boucher_date").val();
      if(fecha != ""){
        var id = $(this).attr("id");
        $(this).hide();
        $.getScript("/bouchers/"+id+"/cargar.js?boucher="+fecha);
      }
      else{
        alert("No cargaste fecha para los boucher");

      }
  });
  $(".boucher_quitar").click(function(){
      var id = $(this).attr("id");
      $(this).hide();
      $.getScript("/bouchers/"+id+"/bajar.js");
  })
});
