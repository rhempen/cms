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
  Accordion initialisieren bei onLoad
  -------------------------------------------------------------------------------*/
  	loadAccordion = function() {
    	if ($("vertical_container")) {
        var verticalAccordion = new accordion('vertical_container');
      }
    }


/*-------------------------------------------------------------------------------
  Events bei onLoad registrieren
  -------------------------------------------------------------------------------*/
    Event.observe(window, 'load', sfHover, false);
    Event.observe(window, 'load', loadAccordion, false);

