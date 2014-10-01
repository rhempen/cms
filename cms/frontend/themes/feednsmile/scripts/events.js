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
  Niftycubes initialisieren bei onLoad
  -------------------------------------------------------------------------------*/
    var niftycubes = function() {
      var agent = navigator.userAgent;
//    NiftyCorners funktionieren nur ab IE 8
      if (agent.match(/MSIE/) && agent.match(/[MSIE\s]\d/) < 8) { return; }  
      Nifty("div#page","big");
      Nifty("div#header","tl big, tr big");
//      Nifty("div#home_bild","tr big");
      
      Nifty("div.teaser","big");
      Nifty("div.teasertext,p.teasertext","normal");

//      Nifty("li.navi a:hover","tl big, tr big");
 //     Nifty("li.navi a.active","tl big, tr big");
    }

/*-------------------------------------------------------------------------------
  Tabelle "Preisliste" soll ein Zebramuster erhalten 
  -------------------------------------------------------------------------------*/
 	var zebraPreisliste = function() {
    var lClass, lDiv, allTrs;
    if ($("preisliste")) 
    {
    	allTrs = $$('#preisliste tr');
    	allTrs.each(function(el, index) {
  			lDiv = index % 2;
  			el.className = '';
  			if (lDiv == 0) { 
  				el.addClassName('even');
  			} else {
  				el.addClassName('odd');	
  			}
  		});
    }
	}


/*-------------------------------------------------------------------------------
  Events bei onLoad registrieren
  -------------------------------------------------------------------------------*/
    Event.observe(window, 'load', sfHover, false);
    Event.observe(window, 'load', niftycubes, false);
    Event.observe(window, 'load', zebraPreisliste, false);

