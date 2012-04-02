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
    $("navibereich").style.top = '-18px';
    if ($("subnavibereich_horizontal")) {
      $("subnavibereich_horizontal").style.top = "-41px";
      }
    $("aufzu").className = 'collapse';
    $("aufzu").title = 'collapse Header';    
  }

// Header verbergen  
  function hideHeader() {
    $("header").className = "hide";   
    $("navibereich").style.top = '0px';
    if ($("subnavibereich_horizontal")) {
      $("subnavibereich_horizontal").style.top = "-25px";
      }
    $("aufzu").className = 'expand';
    $("aufzu").title = 'expand Header';    
  }
  
// Bei onLoad muss der Header gemäss dem Cookie eingestellt werden!  
  function showHideHeaderOnLoad() {
    var lClassName = $("classHeader").value;
    if (lClassName == 'hide') { 
      hideHeader();
    } else {
      showHeader();
    }    
  }
  
// CSS-Klasse per Ajax in der PHP-Session speichern  
  function saveClassHeader( iClassHeader ) {
    var lWebroot = $("webroot").value;
    var lUrl = lWebroot+"/frontend/_models/frontend_setdata.php?action=saveHeaderClass&class="+iClassHeader 
    var myAjax = new Ajax.Request( lUrl,
        {   
            method:'get',
            onSuccess:zeige_resultat,
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
//        setCookie("classHeader",$("header").className);
      });
    } );
  //Event.observe(window, 'load', niftycubes, false);

