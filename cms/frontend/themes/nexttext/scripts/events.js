// Javascripts für cms Frontend (themenabhängig)
// Author: Roland Hempen
// Creation Date: 29.12.2009
// 
/*-------------------------------------------------------------------------------
  Kompatibilitaet fuer IE6 bei Dropdown-Menus 
  -------------------------------------------------------------------------------*/
  	sfHover = function() {
  		var sfEls = document.getElementById("navi").getElementsByTagName("LI");
  		for (var i=0; i<sfEls.length; i++) {
  			sfEls[i].onmouseover=function() {
  				this.className+=" sfhover";
  			}
  			sfEls[i].onmouseout=function() {
  				this.className=this.className.replace(new RegExp(" sfhover\\b"), "");
  			}
  		}
  	}

/*-------------------------------------------------------------------------------
	jQuery NoConflict laden und Datatables initialisieren
  -------------------------------------------------------------------------------*/
 // <![CDATA[
		jQuery.noConflict();
		jQuery(document).ready(function() { 
			var tab = jQuery('#datatab').dataTable( {
							"bPaginate": true,
							"bLengthChange": true,
							"bFilter": true,
							"bSort": true,
							"bInfo": true,
							"bAutoWidth": false } ); 
		} );
// ]]>

/*-------------------------------------------------------------------------------
  Accordion initialisieren bei onLoad
  -------------------------------------------------------------------------------*/
		jQuery.noConflict();
  	loadAccordion = function() {
    	if ($("vertical_container")) {
        var verticalAccordion = new accordion('vertical_container');
      }
    }

/*-------------------------------------------------------------------------------
  NiftyCorners aktivieren für Teaser etc.
  -------------------------------------------------------------------------------*/
	startNifty = function() {
		Nifty("div.teaser","big");
	}

/*-------------------------------------------------------------------------------
  Events bei onLoad registrieren
  -------------------------------------------------------------------------------*/
    Event.observe(window, 'load', sfHover, false);
    Event.observe(window, 'load', loadAccordion, false);
    Event.observe(window, 'load', startNifty, true);

