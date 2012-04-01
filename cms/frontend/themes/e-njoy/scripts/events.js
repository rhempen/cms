// Javascripts fuer cms Frontend (themenabhaengig)
// Author: Roland Hempen
// Creation Date: 29.12.2009
//

/*-------------------------------------------------------------------------------
  Header anzeigen oder verbergen 
  -------------------------------------------------------------------------------*/
  function showHideHeader() {
    if ($("header").className == 'hide') { 
      $("header").className = 'show';
      $("navibereich").style.top = '-18px';
      if ($("subnavibereich_horizontal")) {
      	$("subnavibereich_horizontal").style.top = "-39px";
    	}
      $("aufzu").className = 'collapse';
      $("aufzu").title = 'collapse Header';
    } else {
      $("header").className = 'hide';   
      $("navibereich").style.top = '0px';
      if ($("subnavibereich_horizontal")) {
      	$("subnavibereich_horizontal").style.top = "-22px";
    	}
      $("aufzu").className = 'expand';
      $("aufzu").title = 'expand Header';
    }
  }
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
  eventuell muss ein Redirect gemacht werden und zwar dann, wenn die Website mit
  index.php oder mit dem Root-Verzeichnis / aufgerufen wird
  -------------------------------------------------------------------------------*/
    

/*-------------------------------------------------------------------------------
  Niftycubes initialisieren bei onLoad
  -------------------------------------------------------------------------------*/
//    var niftycubes = function() {
//      var agent = navigator.userAgent;
//    NiftyCorners funktionieren nur ab IE 8
//      if (agent.match(/MSIE/) && agent.match(/[MSIE\s]\d/) < 8) { return; }  
//      Nifty("div#page","big");
//      Nifty("div#header","tl big, tr big");
//      Nifty("div.teaser","big");
//      Nifty("div.teasertext,p.teasertext","normal");

//      Nifty("li.navi a:hover","tl big, tr big");
//     Nifty("li.navi a.active","tl big, tr big");
//    }

/*-------------------------------------------------------------------------------
  Events bei onLoad registrieren
  -------------------------------------------------------------------------------*/
    Event.observe(window, 'load', sfHover, false);
//    Event.observe(window, 'load', niftycubes, false);

