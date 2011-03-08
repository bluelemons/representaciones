request = $.ajax();
  //agrega un tab con
  //model es el nombre del modelos, entidad, reserva, etc. en singular y minuscula
  //id es el id del registro en paticular, el que tiene en la base de datos.
  //name es el nombre del registro en particular como està en la base de datos.
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
  //$(".togrid").each(function(index) { // este each es un fix porque el tabletogrid no funciona con ".togrid" hay que ver
                                      // si lo arrglan en el futuro.
    tableToGrid($(".togrid"),{
      datatype: "local",
      width:700,
      //onSelectRow: function(id){$('#togrid').getCell(id, 'ID');},
      //onSelectRow: function(id){$.getScript('reservas/' + $('#togrid').getCell(id, 'ID') + '.js');},
      onSelectRow: function(id){$("input[id$=_reserva_id]").val($('#reserva_grid').getCell(id, 'ID'));},
      caption: "Listado"
     });
  //});


  }
function skin(){
  $('.action_bar *').button({icons: {primary: "ui-icon-pencil"},text: true});
  $('.new_button').button({icons: {primary: "ui-icon-plus"},text: false});

  $('.show_button').button({icons: {primary: "ui-icon-search"},text: false});
  $('.change_button').button({icons: {primary: "ui-icon-transferthick-e-w"},text: false});
  $('.edit_button').button({icons: {primary: "ui-icon-pencil"},text: false});

  $('.tohide').live('dblclick',function(){
    $(this).hide();
  });

  // pone calendario en .datepicker
  $( ".datepicker" ).datepicker({ dateFormat: 'yy-mm-dd' });
  //$( "#tabs" ).tabs();

  //convierte los divisores con .mytabs en tab, sortable permite al usuario ordenarlos.
  $( ".mytabs" ).tabs().find( ".ui-tabs-nav" ).sortable({ axis: "x" });;





  togrid();
}

$(function() {

  $("body").ajaxStart(function() {
    request.abort();
  });

  $('#entidad_new').click(function() {
    $.getScript("/entidads/new.js", togrid );
  });
  $('#programa_new').click(function() {
    $.getScript("/programas/new.js", togrid );
  });
  $('#pasajero_new').click(function() {
    $.getScript("/pasajeros/new.js", togrid );
  });
  $('#reserva_new').click(function() {
    $.getScript("/reservas/new.js", togrid );
  });

  $('#deposito_new').click(function() {
    $.getScript("/movimientos/new?t=deposito", togrid );
  });


  $('.pagination a').live('click', function () {
    $.getScript(this.href, togrid );
    return false;
  });

  $('.search input').keyup(function () {
    $.get($('.search').attr('action'),$('.search').serialize(), togrid, 'script');
    return false;
  });

  $('.search').submit(function () {
    $.get(this.action, $(this).serialize(), togrid, 'script');
    return false;
  });

  skin();
  });

