// cms - cmsadmin Javascript functions for the navigation pages
// Copyright (c) 2007 Roland Hempen (http://www.hempenweb.ch)

//<![CDATA[
/**********************************************************************************
*
* AJAX-Request deklarieren
*
**********************************************************************************/
var XMLHttp = null;
try {
	XMLHttp = new ActiveXObject("MSXML2.XMLHTTP");
	}
	catch (ex) {
	try {
	  XMLHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	catch (ex) {
	  if (typeof XMLHttpRequest != "undefined") 
		XMLHttp = new XMLHttpRequest;
	}
}

var gAnzShow = 0; // globaler Zähler

/**********************************************************************************
*
* AJAX-Events deklarieren
*
/*********************************************************************************/
// Events deklarieren 
Event.observe(window, "load", function() {
// 1. Eine Instantz pro Element mit der Klasse "bezeichnung" erstellen --> InPlaceEditor
	$A($$(".bezeichnung")).each( function(element) {
		new Ajax.InPlaceEditor( element, "../_controllers/navi_co_maintain.php?action=naviSave&nav_id=" + element.id, {});
	});

// 2. Eine Instantz pro Element mit der Klasse "aktivflag" erstellen --> AJAX-Request f�r den Update auf der DB
	$A($$(".aktivflag")).each(function(element) {
		Event.observe(element, "click", function() {
			update_aktivflag(element.id);
		});
	});

// 3. Eine Instantz pro Element mit der Klasse "typeflag" erstellen --> AJAX-Request f�r den Update auf der DB
	$A($$(".typeflag")).each(function(element) {
		Event.observe(element, "click", function() {
			update_typeflag(element.id);
		});
	});

// 4. Eine Instantz pro Element mit der Klasse "startseite" erstellen --> AJAX-Request f�r den Update auf der DB
	$A($$(".startflag")).each(function(element) {
		Event.observe(element, "click", function() {
			update_startflag(element.id);
		});
	})
});


Event.observe(window, "load", function() {
// Sortierbarkeit von DIV-Elementen 
	Sortable.create('navisDivs',{tag:"DIV",onUpdate:updateSortIndex,handle:"navisort",only:"navisort"});
  });

  var updateSortIndex = function(e) {
    var elements  = Sortable.serialize('navisDivs');  //$('debug').update(elements);
    var url       = '../_controllers/navi_co_maintain.php?action=naviSort&srtids='+elements; 
    var lRequest  = new Ajax.Request(url, { 
                    parameters: {action:"naviSort", srtids:elements}, 
                        method: 'post',
                     onSuccess: updateMessage
  		} );
  	}

  var updateMessage = function(transport) {
  	// Meldung ausgeben nach der Neusortierung der cms_fragmente-Tabelle
		  var msgtxt;
			if (transport.statusText == 'OK') {
				msgtxt = '<span class="success">'+transport.responseText+'</span>';
			} else {
				msgtxt = '<span class="error">'+transport.responseText+'</span>';
			}
  		$('debug').update(msgtxt);
            var tdId = new Array(), tdIdSave = new Array(), lIndex = 0;
			// Sortids updaten = durchnummerieren
			$$("td.sortid").each( function(row) { 
              tdId = row.id.split('_');
              row.setStyle({backgroundColor:'yellow'}); 
              if (tdId[0] != tdIdSave[0]) {
                lIndex++;                
              }
              row.innerHTML=lIndex; 
              tdIdSave = row.id.split('_');
            });
 	}


/*------------------------------------------------------------------------------
  Funktion: update_aktivflag -> Funktionsaufruf aus Event .aktivflag
------------------------------------------------------------------------------*/ 
function update_aktivflag(id) {
	var wert = $(id).innerHTML;
	var led = wert.search(/blocked/);
	if (led != -1) {wert = 'nein';} else {wert = 'ja';}
	var navid = id.substr(1, id.length);
	var	url = "../_controllers/navi_co_maintain.php?action=aktivSave&wert=" + wert + "&nav_id=" + navid; 
	// alert(url);
	// Wurde ein Objekt erstellt?
	if  (typeof(XMLHttp) == 'object') {
		XMLHttp.open("GET", url, true);
		XMLHttp.onreadystatechange = function() {
			// Return-Value anzeigen			
			if (XMLHttp.readyState == 4) {
				if (XMLHttp.status == 200) {
				  var responseText = XMLHttp.responseText.split('/'); // responseText j/Ja in einen Array splitten
					if (responseText[0] == 'j') {
						$(id).innerHTML  = '<button class="freed" title="aktiv" type="button"></button>'; 
						$(id).title = responseText[1]; 
						$(id).setStyle({color:'green'});						
			  		} else {
						$(id).innerHTML  = '<button class="blocked" title="inaktiv" type="button"></button>'; 
						$(id).title = responseText[1]; 
						$(id).setStyle({color:'red'});						
			  	}
              }
			}
		};
		XMLHttp.send(null);
	} 
}

/*------------------------------------------------------------------------------
  Funktion: update_typeflag -> Funktionsaufruf aus Event .typeflag
------------------------------------------------------------------------------*/ 
function update_typeflag(id) {
	var wert = $(id).innerHTML;
	var navid = id.substr(1, id.length);
	var	url = "../_controllers/navi_co_maintain.php?action=typeSave&wert=" + wert + "&nav_id=" + navid; 
  //	alert(url);
	// Wurde ein Objekt erstellt?
	if  (typeof(XMLHttp) == 'object') {
		XMLHttp.open("GET", url, true);
		XMLHttp.onreadystatechange = function() {
			// Return-Value anzeigen			
			if (XMLHttp.readyState == 4) {
				if (XMLHttp.status == 200) {
				  var responseText = XMLHttp.responseText.split('/'); // responseText j/Ja in einen Array splitten
					if (responseText[0] == 'S') {
						$(id).innerHTML = 'S'; 
						$(id).title = responseText[1]; 
						$(id).setStyle({color:'red'});						
			  		} else if (responseText[0] == 'V') {
						$(id).innerHTML  = 'V'; 		
						$(id).title = responseText[1]; 
						$(id).setStyle({color:'purple'});						
			  		} else {
						$(id).innerHTML  = 'H'; 		
						$(id).title = responseText[1]; 
						$(id).setStyle({color:'green'});
			  		}
			  	}
			}
		};
		XMLHttp.send(null);
	} 
}

/*------------------------------------------------------------------------------
  Funktion: update_startflag -> Funktionsaufruf aus Event .startflag
------------------------------------------------------------------------------*/ 
function update_startflag(id) {
	var wert = $(id).innerHTML;
	var led = wert.search(/red/);
	if (led != -1) {wert = 'nein';} else {wert = 'ja';}
	var navid = id.substr(2, id.length);
	var	url = "../_controllers/navi_co_maintain.php?action=startSave&wert=" + wert + "&nav_id=" + navid; 
	// alert(url);
	// Wurde ein Objekt erstellt?
	if  (typeof(XMLHttp) == 'object') {
		XMLHttp.open("GET", url, true);
		XMLHttp.onreadystatechange = function() {
			// Return-Value anzeigen			
			if (XMLHttp.readyState == 4) {
				if (XMLHttp.status == 200) {
				  var responseText = XMLHttp.responseText.split('/'); // responseText j/Ja in einen Array splitten
					if (responseText[0] == 'j') {
						$(id).innerHTML  = '<img src="../gifs/ledgreen.gif" border="0" width="16" height="14" alt="'+responseText[1]+'" title="'+responseText[1]+'" />'; 
						$(id).setStyle({color:'green'});						
			  		} else {
						$(id).innerHTML  = '<img src="../gifs/ledred.gif" border="0" width="16" height="14" alt="'+responseText[1]+'" title="'+responseText[1]+'" />'; 		
						$(id).setStyle({color:'red'});						
			  	}
              }
			}
		};
		XMLHttp.send(null);
	} 
}

/*--------------------------------------------------------------------------------------------
  Funktion: toggle_ukaps -> Auf- und Zuklappen von Ukaps
  jedes Kapitel hat im TR-Tag eine ID, die aus dem Feld Domain erstellt wird (zb. navi_7)
  Gibt es zum Kapitel Unterkapitel, werden die folgenden TR-Tags mit der Id vom Kapitel plus _99
  in 10-schritten gesetzt. (zb. navi_7_10).
  Dem Script werden folgende Parameter mitgegeben:
  1. Id des Bildes
  2. Id des TR-Tags mit dem Kapitel 
  3. Anzahl der Unterkapitel
  Anhand dieser Parameter k�nnen die Ukaps sichtbar gemacht oder versteckt und das Bild ausge-
  wechselt werden.
  Der aktuelle Zustand wird in einem Cookie gespeichert. Default sind die Ukaps sichtbar. 
----------------------------------------------------------------------------------------------*/ 
function toggle_ukaps(img,id,anz) {

    var src = $(img).src;
	var bild = src.search(/minus/g);	
	var i, plus_minus;
	var uid;
	// aktuelles Bild ist minus_16.png
	if (bild !== -1) {
		plus_minus = 'minus'
		bildneu = src.replace(/minus/g, "plus"); 
	} else { 
		plus_minus = 'plus';
		bildneu = src.replace(/plus/g, "minus"); 
	}
	// Bildwechsel
	$(img).src = bildneu;
	
	// Ukaps verbergen oder zeigen
	for (i=1; i<=anz; i++) {
		uid = id+'_'+(i*10);
		if (plus_minus == 'minus') {
			$(uid).hide();
		} else { 
			$(uid).show(); 
		}
	}
	
	// Cookie setzen, welches bei der Anzeige der Seite aus $_COOKIE navi_present.class.php abgefragt wird
	plus_minus = plus_minus == 'minus' ? 'plus' : 'minus'; // Wert umkehren f�r das Cookie
	document.cookie = id + "=" + plus_minus;
	//alert(document.cookie);
}

//]]>
