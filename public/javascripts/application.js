// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
// esto es lo que mueve el fondo

$(function(){
  $(".sq-edit").button({icons: {primary: "ui-icon-pencil"},text: true});
  $(".sq-show").button({icons: {primary: "ui-icon-search"},text: true});  
  $(".sq-index").button({icons: {primary: "ui-icon-search"},text: true});
  $(".sq-new").button({icons: {primary: "ui-icon-plus"},text: true});
  $(".sq-destroy").button({icons: {primary: "ui-icon-trash"},text: true});
  

  //$( "*" ).draggable();
  //$("h2").addClass("ui-widget-header ui-corner-all");
  /*$("*").click(function(){
    $(this).addClass( "border", 100, removeborder );
  });*/
  //$("#menu a").button();
  $("#user_nav a").button();
  $( "a", ".demo" ).click(function() { return false; });

  /* funcion para que los comentarios se actualizen cada tanto */		  
  if ($('#comments').length > 0) {  
    setTimeout(updateComments, 10000);  
  }
  /* configuracion del layout */
   
});

function removeborder(){
  setTimeout(function() {
    $( "*" ).removeClass( "border" );
  }, 3500 );

};
function updateComments() {
  var comment_id = $('#comments').attr('comment_id');
  var after =0 ;
  if($('.post:last').attr('data_time')){
    after =$('.post:last').attr('data_time');  	
  	 }
  $.getScript('/comments/'+comment_id+'.js?after='+after);  
  setTimeout(updateComments, 10000);  
} 