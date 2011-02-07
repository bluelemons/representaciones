request = $.ajax();
  
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

  $( ".datepicker" ).datepicker({ dateFormat: 'yy-mm-dd' });
  $( "#tabs" ).tabs();
  $( ".mytabs" ).tabs();  

  togrid();
}

$(function() {

  $("body").ajaxStart(function() {
    request.abort();
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
