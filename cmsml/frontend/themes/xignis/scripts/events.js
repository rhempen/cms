// Javascripts fuer cms Frontend (themenabhaengig)
// Author: Roland Hempen
// Creation Date: 29.12.2009
//

/*-------------------------------------------------------------------------------
  Header anzeigen oder verbergen 
  Der Zustand wird in einem Cookie gespeichert, sodass er auch bei einem Server
  Roundtrip erhalten bleibt
  -------------------------------------------------------------------------------*/
  function showHideHeader() {
    var lClassName = $("header").className;
    if (lClassName == 'show') { 
      hideHeader();
    } else {
      showHeader();
    }
  }

// Header anzeigen
  function showHeader() {
    $("header").className = "show";
    $("header_balken_unten").removeClassName("hide");   
    $("navibereich").style.top = '-15px';
    if ($("subnavibereich_horizontal")) {
      $("subnavibereich_horizontal").style.top = "-41px";
      }
    $("aufzu").className = 'collapse';
    $("aufzu").title = 'collapse Header';    
  }

// Header verbergen  
  function hideHeader() {
    $("header_balken_unten").addClassName("hide");   
    $("header").className = "hide";   
    $("navibereich").style.top = '0px';
    if ($("subnavibereich_horizontal")) {
      $("subnavibereich_horizontal").style.top = "-25px";
      }
    $("aufzu").className = 'expand';
    $("aufzu").title = 'expand Header';    
  }
  
// Bei onLoad muss der Header gemäss dem Cookie eingestellt werden!
// Ausser der Wert von $("startseite") sie "j"
  function showHideHeaderOnLoad() {
    var lStartseite = $("startseite").value;
    var lClassName = $("classHeader").value;
    if (lClassName == 'hide' || lStartseite == 'j') { 
      hideHeader();
    } else {
      showHeader();
    }
    if (lStartseite == 'j') { adjust_startseite(); }
  }
  
  function adjust_startseite() {
 		// Gets the viewport as an object literal
  	var viewport = document.viewport.getDimensions();
		var lWidth = viewport.width; // Usable window width
		lWidth = lWidth >= 640 ? lWidth : 640;
		lWidth = lWidth <= 1280 ? lWidth : 1280;

		var lHeight = viewport.height; // Usable window height
		lHeight = lHeight >= 360 ? lHeight : 360;
		lHeight = lHeight <= 720 ? lHeight : 720;
		lWidth = Math.floor((lHeight/3)*4);


		lWidth = lWidth + 'px';
		lHeight = lHeight + 'px';

    $$("h1.h1mod").each( function(theH1) { theH1.hide(); } );
    $("klappe").hide();
    $("servicebereich").hide();

    $("main").setStyle({'width':'100%','height':'100%'});
    $$("div.spalte_900").each( function(theDiv) { theDiv.setStyle( {'width':lWidth,'height':lHeight,'margin':'0 auto' } ) });
    $$("img.intro").each( function(theImg) { theImg.setStyle( {'width':lWidth,'height':lHeight }) });
  }
  
// CSS-Klasse per Ajax in der PHP-Session speichern  
  function saveClassHeader( iClassHeader ) {
    var lWebroot = $("webroot").value;
    lWebroot = (lWebroot == '/') ? '' : lWebroot;
    var lUrl = lWebroot+"/frontend/_models/frontend_setdata.php?action=saveHeaderClass&class="+iClassHeader 
    var myAjax = new Ajax.Request( lUrl,
        {   
            method:'get',
            //onSuccess:zeige_resultat,
            onFailure:zeige_fehler
        }
    );     
  }
  
 var zeige_resultat = function(r)
{
    $("meldung").innerHTML = r.responseText;
}

var zeige_fehler = function(r)
{
   $("meldung").innerHTML = "Fehler: " + r.status + " / " + r.statusText;
}

/*-------------------------------------------------------------------------------
  Niftycubes initialisieren bei onLoad
  -------------------------------------------------------------------------------*/
    var niftycubes = function() {
      var agent = navigator.userAgent;
//    NiftyCorners funktionieren nur ab IE 8
//      if (agent.match(/MSIE/) && agent.match(/[MSIE\s]\d/) < 8) { return; }  
      Nifty("div#memberLogin","big");
      Nifty("fieldset","normal");
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
  Events bei onLoad registrieren
  -------------------------------------------------------------------------------*/
    Event.observe(window, 'load', sfHover, false);
    // Zustand des Header wieder herstellen
    Event.observe(window, 'load', showHideHeaderOnLoad, false);
    // Zustand beim Klick auf $("klappe") per Ajax in der PHP-Session speichern
    Event.observe(window, "load", function() {
      Event.observe($("klappe"),'click', function() { 
        saveClassHeader($("header").className);
      });
    } );
    // Nifty-Cubes
    Event.observe(window, 'load', niftycubes, false);
    Event.observe(window, 'resize', adjust_startseite, false);

