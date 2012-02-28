$(function() {
  $(".autocomplete").each(function(){

    var table = $(this).attr("table");
    var input_id = "input[id$=" + table + "_id]";
    var input_name = "input[id$=" + table + "_name]";

    $(input_id).keyup(function() {

      $.ajax({
        url: get_url_id(table),
        error: function() {
          $(input_name).val("S/V");
        },
        success: function(data) {
          $(input_name).val( $(data).find("name").text() );
        }
      });
    });

    $("#" + table + "_name").keyup(function(event) {
      if (event.keyCode != '40' && event.keyCode != '38' ) {
        $.ajax({
          url: get_url(table),
          dataType: "xml",
          //mientras async este en true las busquedas son mas rapidas, pero cada tanto usa los datos que ya bajo
          //hay que ver si no se puede usar asi
          //async: false,
          //cache:false,
          success: function( xmlResponse ) {
            var data = $( table, xmlResponse ).map(function() {
              return {
                value : $( "name", this ).text(),
                id: $( "id", this ).text()
              };
            }).get();

            $(input_name).autocomplete({
              source: data,
              minLength: 0,
              select: function( event, ui ) {
                $(input_id).val(ui.item.id);
              }
            });
          }
        });
      }
    });
  });
});

function get_url(table){
  return ("/" + table + "s.xml?search[name_sw]="+ ($("#" + table + "_name").val()));
}
function get_url_id(table) {
  return "/" + table + "s/" + $("input[id$=" + table + "_id]").val() + ".xml";
}

