/*
   -------------------------------------------------
   jQuery-Selektoren, Klassen, IDs anpassen!

   Falls 'nav' keine ID hat und es nur 1 'nav' gibt,
   dann z.B.: $("nav ul").
   -------------------------------------------------
*/

jQuery.noConflict();

jQuery(document).ready(function(){
  // Folgende Funktion wird ausgefuehrt,
  // - bei Seitenaufruf oder
  // - bei jedem Resize des Browser-Fensters:

	var setMainPosition = function() {
		var posMenu, menuHeight, newPos = '';
    if (jQuery("#navibereich_horizontal").css("display") != 'none') { 
	    posMenu = jQuery("#navibereich_horizontal").position();
	    menuHeight = jQuery("#navibereich_horizontal").height();
	    newPos  = posMenu.top + menuHeight;
	  }
    }
	
    var adjust_my_nav = function() {

    // Falls '.fontawesome-align-justify' sichtbar
    //    s. '.fontawesome-align-justify' im Stylesheet mit 'display:block'
    //    bei @media only screen and (max-width: 480px)!

    if ( jQuery(".aufklappmenu").css('display') != 'none' ) {

      // verstecke zuerst die sichtbare Navigation...
      jQuery("#navibereich_horizontal").css("display", "none");

      // ...und bei Klick auf '.fontawesome-align-justify'
      // zeige/verstecke die Navigation mittels 'slideToggle()':

      jQuery(".aufklappmenu").on("click", function(ev){
        ev.preventDefault();
        jQuery("#navibereich_horizontal").slideToggle( { "duration" : "slow",
                                                         "step" : setMainPosition,
                                                         "complete" : setMainPosition });
      });
    }
    else {
      jQuery("#navibereich_horizontal").css("display", "block");
    }
  };
  // end of function 'adjust_my_nav'


  // bei Seitenaufruf:
  adjust_my_nav();

  // bei jedem Fenster-resize:
  jQuery(window).resize(function() {
    // Reset toggle  (falls Resizing bei sichtbarer Nav gemacht wird)
    jQuery(".aufklappmenu a").off();

    adjust_my_nav();
  });

});