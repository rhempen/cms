// Javascripts f�r cms Frontend (themenabh�ngig)
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
  jQuery Accordion initialisieren bei onLoad
  http://http://jqueryui.com/demos/accordion/
  -------------------------------------------------------------------------------*/
// <![CDATA[
      jQuery.noConflict();
      jQuery(document).ready(function() {
        var accordion = jQuery( "#accordion" ).accordion({
			autoHeight: true,
            active: 0,
			collapsible: true
		});
      });  
// ]]>

/*-------------------------------------------------------------------------------
  Niftycubes initialisieren bei onLoad
  -------------------------------------------------------------------------------*/
    niftycubes = function() {
      var agent = navigator.userAgent;
//    NiftyCorners funktionieren nur ab IE 8 
      if (agent.match(/MSIE/) && agent.match(/7.0/)) { return; }  
      Nifty("div#page","big");
      Nifty("div#header","tl big, tr big");
      Nifty("div.txt_kuenstlerdetail","big");
      Nifty("div#intro","big");
      Nifty("div#introbild","big");
      Nifty("li.navi","top");
      Nifty("div.teaserwrapper","big");
      Nifty("div.teaser","big, same height");
//      Nifty("li.navi a:hover","tl big, tr big");
 //     Nifty("li.navi a.active","tl big, tr big");
    }

/*-------------------------------------------------------------------------------
  Events bei onLoad registrieren
  -------------------------------------------------------------------------------*/
    Event.observe(window, 'load', sfHover, false);
    Event.observe(window, 'load', niftycubes, false);

