// Javascripts fuer cms Frontend (themenabhaengig)
// Author: Roland Hempen
// Creation Date: 06.07.2012
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
  Content anzeigen oder verbergen bzw. auf ein Minimum reduzieren
  -------------------------------------------------------------------------------*/
  function showHideContent() {
    var lClassName = $("main").className;
    if (lClassName == '' || lClassName == 'show') { 
      hideContent();
    } else {
      showContent();
    }    
  }
  
  function hideContent() {
    $("main").className = "hide";
    $("main").addClassName('hide');
//    if ($("sprachen")) $("sprachen").addClassName('hide');
    if ($("subnavibereich_horizontal")) $("subnavibereich_horizontal").addClassName('hide');
    if ($("aufzu")) $("aufzu").className = 'expand';
    if ($("aufzu")) $("aufzu").title = 'expand Content';    
  }
  
  function showContent() {
    $("main").className = "show";
    $("main").removeClassName('hide');
//    if ($("sprachen")) $("sprachen").removeClassName('hide');
    if ($("subnavibereich_horizontal")) $("subnavibereich_horizontal").removeClassName('hide');
    if ($("aufzu")) $("aufzu").className = 'collapse';
    if ($("aufzu")) $("aufzu").title = 'collapse Content';    
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
  pageWidth = Fensterbreite ermitteln
  pageHeight = Fensterhöhe ermitteln
  getPosition = Position eines DIV-Elementes bestimmen
  setHight = die Höhe des Contents id=main bei onload und onresize neu berechnen        
  -------------------------------------------------------------------------------*/
    pageWidth = function()  { return window.innerWidth != null? window.innerWidth : document.documentElement && document.documentElement.clientWidth ? document.documentElement.clientWidth : document.body != null ? document.body.clientWidth : null; }
    pageHeight = function() { return  window.innerHeight != null? window.innerHeight : document.documentElement && document.documentElement.clientHeight ?  document.documentElement.clientHeight : document.body != null? document.body.clientHeight : null; }

    getPosition = function(iElem) {
      return $(iElem).offsetTop
    }

    setHight = function() {
      var posMain = getPosition("main");
//      var posFoot = getPosition("footer");
      var lHeight = pageHeight();
      var lComputedHeight;
      lComputedHeight = lHeight - posMain - 60;
      $("main").style.height=lComputedHeight+'px';
    }
/*-------------------------------------------------------------------------------
  Events bei onLoad registrieren
  -------------------------------------------------------------------------------*/
    Event.observe(window, 'load', sfHover, false);
    // Zustand des Header wieder herstellen
    // Event.observe(window, 'load', showHideHeaderOnLoad, false);
    // Zustand beim Klick auf $("klappe") per Ajax in der PHP-Session speichern
//    Event.observe(window, "load", function() {
//      Event.observe($("klappe"),'click', function() { 
//        saveClassHeader($("header").className);
//      });
//    } );
    // Höhe des Contents "main" neu berechnen und setzen
    Event.observe(window, 'load', setHight, false);
    Event.observe(window, 'resize', setHight, false);

    // jQuery Functions initialisieren
    jQuery.noConflict();
    jQuery(document).ready(function(){
      jQuery("#sprachen").corner();
      jQuery("#servicebereich").corner();
      jQuery("#navibereich").corner();
      jQuery("#subnavibereich_horizontal").corner();
      jQuery("#subnavi_horizontal").corner();
      jQuery("#home_link").corner();
      jQuery("#main").corner("round 14px");
      jQuery("#footer").corner();
      jQuery("#memberLogin").corner();
    });

