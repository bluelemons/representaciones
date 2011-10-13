//request = $.ajax();
  //agrega un tab con
  //model es el nombre del modelos, entidad, reserva, etc. en singular y minuscula
  //id es el id del registro en paticular, el que tiene en la base de datos.
  //name es el nombre del registro en particular como està en la base de datos.


//TODO: agregar funcion para deshabilitar el boton de submit del formulario al primer click.
function addTab(model,id,name) {

  if($("#tabs-"+id).length == 0){
    var $tabs = $( "#tabs-"+model+"s").tabs({
      tabTemplate: "<li><a href='#{href}'>#{label}</a> <span class='ui-icon ui-icon-close'>Remove Tab</span></li>",
      add: function( event, ui ) {
        var tab_content = "<div id='" + model + "_form"+ id +"'></div>";
        $( ui.panel ).append( tab_content );
      }
    });

    $tabs.tabs( "add", "#tabs-"+id, id +" "+ name);

    $( "span.ui-icon-close" ).click(function() {
      var index = $( "li", $tabs ).index( $( this ).parent() );
      if(index>=0){
        $tabs.tabs( "remove", index );
      }
    });
  }

    var index = $("#tabs-"+id).index();
    $('#tabs-'+model+"s").tabs('select', index-1);

}

function togrid(){
  $(".togrid").each(function(index) {

    var i = $(this).attr("id");
    i=i.substring(0,i.search(/_grid/i));//le saco el _grid al nombre de la

    tableToGrid($(this),{
      datatype: "local",
      autowidth:true,
      //onSelectRow: function(id){$('#togrid').getCell(id, 'ID');},
      //onSelectRow: function(id){$.getScript('reservas/' + $('#togrid').getCell(id, 'ID') + '.js');},
      //onSelectRow: getSelectedRow(),
      onSelectRow: function(id){

        var idx =$(this).getCell(id, 'ID');
        $("input[id$=_"+i+"_id]").val(idx).change();
        }
     });
//    var top_rowid = $('#'+i+'_grid tbody:first-child tr:nth-child(2)').attr('id');
//    $("input[id$=_"+i+"_id]").val(top_rowid);


     //var top_rowid = $('#'+i+'_grid').getDataIds()[0];


  //});
//    function busca_reserva(idx){
//      $.getJSON("/reservas/"+idx+".json",function(data){
//        //alert(data.reserva["id"]);
//      });
    });
  }
function skin(){

  $(".notice").each(function() {
    if($(this).html().length != 0){
      var text =$(this).html();

      $(this).empty();
      $("#freeow").freeow(text,"", {
        classes: ["gray", "error"],
        autoHideDelay:5000
      });
    }

  });

  $('.action_bar *').button({icons: {primary: "ui-icon-pencil"},text: true});
/*  $('.new_button').button({icons: {primary: "ui-icon-plus"},text: false});

  $('.show_button').button({icons: {primary: "ui-icon-search"},text: false});
  $('.change_button').button({icons: {primary: "ui-icon-transferthick-e-w"},text: false});
  $('.edit_button').button({icons: {primary: "ui-icon-pencil"},text: false});

  $('.tohide').live('dblclick',function(){
    $(this).hide();
  });*/

  // pone calendario en .datepicker
  // TODO: delete the first one that is wrong, but first fix all forms
  $( ".datepicker" ).datepicker({ dateFormat: 'dd-mm-yy' });
  $( ".datepicker input" ).datepicker({ dateFormat: 'dd-mm-yy' });
  //$( "#tabs" ).tabs();

  //convierte los divisores con .mytabs en tab, sortable permite al usuario ordenarlos.
  $( ".mytabs" ).tabs().find( ".ui-tabs-nav" ).sortable({ axis: "x" });;

  togrid();
}

$(function() {


  //$("body").ajaxStart(function() {
  //  //request.abort();
  //});

  $('#operadora_new').click(function() {
    $.getScript("/operadoras/new.js", togrid );
  });
  $('#agencia_new').click(function() {
    $.getScript("/agencies/new.js", togrid );
  });

  $('#programa_new').click(function() {
    $.getScript("/programas/new.js", togrid );
  });
  $('#thabitacion_new').click(function() {
    $.getScript("/thabitacions/new.js", togrid );
  });
  $('#pasajero_new').click(function() {
    $.getScript("/pasajeros/new.js", togrid );
  });
  $('#reserva_new').click(function() {
    $.getScript("/reservas/new.js", togrid );
  });

  $('#deposito_new').click(function() {
    $.getScript("/depositos/new.js", togrid );
  });
  $('#pago_new').click(function() {
    $.getScript("/pagos/new.js", togrid );
  });
  $('#directo_new').click(function() {
    $.getScript("/directos/new.js", togrid );
  });
  $('#cambio_new').click(function() {
    $.getScript("/cambios/new.js", togrid );
  });
  $('#cotizacion_new').click(function() {
    $.getScript("/cotizacions/new.js", togrid );
  });


  $('.pagination a').live('click', function () {
    $.getScript(this.href, togrid );
    return false;
  });

  $('.search input').keyup(function () {
    $(this).parent().submit();
  });

  $('.search').submit(function () {
    $.get(this.action, $(this).serialize(), togrid, 'script');
    return false;
  });

  skin();
  });

