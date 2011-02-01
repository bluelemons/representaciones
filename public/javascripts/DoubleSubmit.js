/**
* PreventDoubleSubmit
* <http://henrik.nyh.se/2008/07/jquery-double-submission>
*
* @author     Henrik N
* @author     El_Hoy
*
* $(#form).preventDoubleSubmit()
*
*/

jQuery.fn.preventDoubleSubmit = function() {
  jQuery(this).submit(function() {
    if (this.beenSubmitted)
      return false;
    else
// deshabilita el formulario
      this.beenSubmitted = true;
// lo rehabilita en 3 segundos
      setTimeout(function() {
        this.beenSubmitted = false;
      },3000);
  });
};

