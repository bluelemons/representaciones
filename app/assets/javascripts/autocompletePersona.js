function autocomplete(){
  $('.autocomplete_persona').each(function(){
    //por cada field con la clase autocomplete_persona hace una busqueda. el campo con esta clase es el campo
    //en el que se pone el id, en este caso en campo con el que se carga el dni
    var id = $(this).attr("i");
    //busca el valor del atributi i. i, es un incremental que se le otorga a cada field y se lo almacena
    //en la variable id. entonces puedo difenciar uno de los campos de los otros
    $("input[class$=_"+id+"_doc]").keyup(function() {//cuando se escriba cualquier cosa en el campo
      $.ajax({
        //hace una busqueda por dni a la direccion /pasajeros_dni/:dni.xml . :dni es un dni cualquiera
        url: ("/pasajeros_dni/" + $("input[class$=_"+id+"_doc]").val() + ".xml"),
        error: function() {//si falla
          $("input[class$=_"+id+"_name]").val("");
          $("input[class$=_"+id+"_ids_]").val("");
        },
        success: function(data) {
          // si tiene exito completa los campo de name y nacimiento
          $("input[class$=_"+id+"_ids_]").val( $(data).find("id").text() );
          $("input[class$=_"+id+"_name]").val( $(data).find("name").text() );
          $("input[class$=_"+id+"_nacimiento]").val( $(data).find("nacimiento").text() );
        }
      });
    });
  });
  $(".autocomplete").each(function(){
    //por cada campo con la clase autocomplete
    var table = $(this).attr("table");
    var id = $(this).attr("i");
   	//almacena el atributo table e id en variables. table es el nombre del modelo, id, es un incremental
   	//para diferenciar los que se llamen igual.
    $("input[class$=_"+id+"_name]").keyup(function(event) {//cuando una tecla se oprime
      if (event.keyCode != '40' && event.keyCode != '38' ) {// que no sean 2 que ahora no recuerdo cuales son
  	    $.ajax({
  	      //busca por nombre
  	      url: ("/" + table + "s.xml?search[name_sw]="+ ($("input.reserva_pasajero_"+ id +"_name").val())),
  	      dataType: "xml",
  	      //mientras async este en true las busquedas son mas rapidas, pero cada tanto usa los datos que ya bajo
  	      //hay que ver si no se puede usar asi
  	      //async: false,
  	      //cache:false,
  	      success: function( xmlResponse ) {
  	        //si tiene exito, almacena en data el xml que optubo en la busquedas
            var data = $( table, xmlResponse ).map(function() {
  	          return {
  	      	    value : $( "name", this ).text(),//es el campo name
  	      	    id : $( "id", this ).text(),// es el campo id
	      	    doc : $( "doc", this ).text(),// es el campo doc
	      	    nacimiento : $( "nacimiento", this ).text(),//es el campo nacimiento
	      	    //POR ALGUN MOTIVO EL CAMPO NACIMIENTO NO SE MUESTRA CUANDO BUSCAS POR NOMBRE
  	      	    id: $( "id", this ).text()// es el campo id
  	          };
  	    	}).get();

  	    	$( "input[class$=_"+id+"_name]" ).autocomplete({
  	    	  //en data esta el resultado de la busqueda. la funcion autocomplete genera el dropdown
  	    	  //con los datos en data.
  	    	  source: data,
  	    	  minLength: 3,//es el minimo de caracteres con el que empieza a buscar
  	    	  select: function( event, ui ) {
  	    	   // $("input[id$=" + table + "_id]").val(ui.item.id);
                $("input[class$=_"+id+"_ids_]").val(ui.item.id);//es el valor de documento
  	    	    $("input[class$=_"+id+"_doc]").val(ui.item.doc);//es el valor de documento
  	    	    $("input[class$=_"+id+"_nacimiento]").val(ui.item.nacimiento);//es el valo de nacimiento
  	    	  }
            });
          }
        });
      }
    });
  });
};

