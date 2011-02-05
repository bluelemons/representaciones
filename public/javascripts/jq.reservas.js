var i=99
function unico(){
  return i+=1;
}
$(function() { 
  $( ".agencia_button" ).live('click',function(){
    $('.agencia_field').toggle();
    //$('#reserva_agencia_attributes_name').val('')
  });
  $( ".operadora_button" ).live('click',function(){
    $('.operadora_field').toggle();
    //$('#reserva_agencia_attributes_name').val('')
  });
  
  $(".pasajeros_fields a").live('click',function(){
    //esta funcion se activa cuando se hace click en el link eliminar del formulario de reservas
    //hay que hacer esto, pero primero hay que poner en blanco el campo _ids_ de cada renglon
    //$(this).parent().hide();
    alert("modifica esta funcion en javascript/jq.reservas.js");
  });
    
});
