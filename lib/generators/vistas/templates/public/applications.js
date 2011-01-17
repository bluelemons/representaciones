function togrid(){
  //$(".togrid").each(function(index) { // este each es un fix porque el tabletogrid no funciona con ".togrid" hay que ver
                                      // si lo arrglan en el futuro.
 /*   tableToGrid($(".togrid"),{
      datatype: "local",
      //onSelectRow: function(id){$('#togrid').getCell(id, 'ID');},
      //onSelectRow: function(id){$.getScript('contribuyentes/' + $('#togrid').getCell(id, 'ID') + '.js');}, 
      caption: "Nombre de la tabla"
     });  
  //});
  */
   
  }
function skin(){
  $(".action_bar *").button({icons: {primary: "ui-icon-pencil"},text: true});
  togrid();
}

$(function() {
  
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
