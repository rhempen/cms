// cms - cmsadmin Javascript functions for the pages administration
// Copyright (c) 2007 Roland Hempen (http://www.hempenweb.ch)
//<![CDATA[


/**********************************************************************************
*
*  UTF-8 data encode / decode
*  http://www.webtoolkit.info/
*
**********************************************************************************/
 
var Utf8 = {
 
	// public method for url encoding
	encode : function (string) {
		string = string.replace(/\r\n/g,"\n");
		var utftext = "";
 
		for (var n = 0; n < string.length; n++) {
 
			var c = string.charCodeAt(n);
 
			if (c < 128) {
				utftext += String.fromCharCode(c);
			}
			else if((c > 127) && (c < 2048)) {
				utftext += String.fromCharCode((c >> 6) | 192);
				utftext += String.fromCharCode((c & 63) | 128);
			}
			else {
				utftext += String.fromCharCode((c >> 12) | 224);
				utftext += String.fromCharCode(((c >> 6) & 63) | 128);
				utftext += String.fromCharCode((c & 63) | 128);
			}
 
		}
 
		return utftext;
	},
 
	// public method for url decoding
	decode : function (utftext) {
		var string = "";
		var i = 0;
		var c = c1 = c2 = 0;
 
		while ( i < utftext.length ) {
 
			c = utftext.charCodeAt(i);
 
			if (c < 128) {
				string += String.fromCharCode(c);
				i++;
			}
			else if((c > 191) && (c < 224)) {
				c2 = utftext.charCodeAt(i+1);
				string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
				i += 2;
			}
			else {
				c2 = utftext.charCodeAt(i+1);
				c3 = utftext.charCodeAt(i+2);
				string += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
				i += 3;
			}
		}
		return string;
	}
}

/**********************************************************************************
*
* Ein AJAX-Request-Objekt erstellen
*
/*********************************************************************************/
/*------------------------------------------------------------------------------
  Funktion: create_request() --> xmlhttp-Objekt erstellen abh. vom Browsertype
------------------------------------------------------------------------------*/ 
function create_request() {
  try { XMLHttp = new XMLHttpRequest();
    } catch (trymicrosoft) {
    try { XMLHttp = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (othermicrosoft) {
        try { XMLHttp = new ActiveXObject("Microsoft.XMLHTTP");
        } catch (failed) { XMLHttp = null; }
    }
  }
  if (XMLHttp == null) { alert("Ajax nicht unterst�tzt"); }
  return XMLHttp;
}

/**********************************************************************************
*
* AJAX-Events deklarieren
*
/*********************************************************************************/
// Events deklarieren 
// Inplace-Editor f�r die Titelzeile
Event.observe(window, "load", function() {
// 1. Eine Instantz pro Element mit der Klasse "name" erstellen --> InPlaceEditor
	$A($$(".name")).each( function(element) {
		new Ajax.InPlaceEditor( element, "../_controllers/pages_co_maintain.php?action=nameSave&page_id=" + element.id, {});
	});

// Das Aktivflag updaten bei Mausklick
// Event.observe(window, "load", function() {
// 2. Eine Instantz pro Element mit der Klasse "aktivflag" erstellen --> AJAX-Request f�r den Update auf der DB
	$A($$(".aktivflag")).each(function(element) {
		Event.observe(element, "click", function() {
			update_aktivflag_pages(element.id);
		});
	});	
});

/**********************************************************************************
*
* Einen AJAX-Request ausf�hren
*
/*********************************************************************************/
function update_aktivflag_pages(id) {
	var wert = $(id).innerHTML; 
	var led = wert.search(/blocked/);
	if (led != -1) { wert = 'inaktiv'; } else { wert = 'aktiv'; }
	var pageid = id.substr(1, id.length);  
	var	url = "../_controllers/pages_co_maintain.php?action=aktivSave&wert=" + wert + "&page_id=" + pageid;
	// AJAX-Request kreiieren und ausf�hren
	XMLHttp = create_request();
	execute_request("GET", url, true, id, "aktivSave");
}

/*------------------------------------------------------------------------------
  Funktion: execute_request -> ausf�hren des xmlhttp-Requests
------------------------------------------------------------------------------*/ 
function execute_request(iMethod, iUrl, iType, iId, iAction) {
	var id = iId;
	if  (typeof(XMLHttp) == 'object') {
		XMLHttp.open(iMethod, iUrl, iType);
		XMLHttp.onreadystatechange = function() {
		  // Return-Value anzeigen			
		  if (XMLHttp.readyState == 4) {
  			if (XMLHttp.status == 200) {
  			  // responseText j/aktiv bzw. n/inaktiv in einen Array splitten
  			  var responseText = XMLHttp.responseText.split('/'); 
   				if (responseText[0] == 'j') {
//						$(id).innerHTML  = '<img src="../gifs/freed.gif" border="0" width="16" height="14" alt="'+responseText[1]+'" title="'+responseText[1]+'" />'; 
						$(id).innerHTML  = '<button type="button" class="freed" title="'+responseText[1]+'" />'; 
						$(id).title = responseText[1]; 
						$(id).setStyle({ color:'green' });
			  		} else {
//						$(id).innerHTML  = '<img src="../gifs/blocked.gif" border="0" width="16" height="14" alt="'+responseText[1]+'" title="'+responseText[1]+'" />'; 
						$(id).innerHTML  = '<button type="button" class="blocked" title="'+responseText[1]+'" />'; 
						$(id).title = responseText[1]; 
						$(id).setStyle({ color:'red' });
			  		}
				}
			}
			
		};
		XMLHttp.send(null);
	} 
}
/**********************************************************************************

/*------------------------------------------------------------------------------
  Funktion: toggle_visibility 
------------------------------------------------------------------------------*/ 
function toggle_visibility(id) {
/*  Anhand eines Loops �ber das tr-Tag wird der Stil des Elementes auf block oder none gesetzt,
	falls die Id des tr-Tags der zusammengesetzten newid entspricht.
	Zudem wird das Plus und Minus zeichen ausgetauscht
	Der Internet Explorer versteht die CSS-Anweisung display = table-row nicht, daher muss 
	der navigator.appName gecheckt werden.
*/
	var browser = navigator.appName;
	var ergebnis = browser.search("Microsoft");
	var disp = ergebnis == 0 ? 'block' : 'table-row';
	var anzahl = document.getElementsByTagName("tr").length;
	for ( var i=0; i <= anzahl; i++ )	
	{
		var newid = id + i; // newid = zB. fotografie + $i
		if (document.getElementById(newid)) {
			if(document.getElementById(newid).style.display == disp) {
				document.getElementById(newid).style.display = "none";
			} else {
				document.getElementById(newid).style.display = disp;
			}		
		} else {
			break;
		}
	}
	// Bildli austauschen
	toggle_plus_minus(id);
}

/******************************************************************************************************
* Damit im Php das $_Cookie mit dem richtigen Utf8-Wert ausgelesen wird, muss die ID hier Utf8-Encodiert
* werden. Das Cookie wird dann ebendfalls mit der utf8_id gesetzt. 
* Die utf8-codierung / decodierung ist im Script zuoberst programmiert.
******************************************************************************************************/
/*------------------------------------------------------------------------------
  Funktion: toggle_plus_minus 
------------------------------------------------------------------------------*/ 
function toggle_plus_minus(id) {
	var utf8_id =  Utf8.encode(id);
	//alert(utf8_id +'/'+id);

	var plus_minus = '';
	var plus = new Image;
	var minus = new Image;
	var arr = new Array();
	// Achtung: Wenn die ID eine Zahl ist (zb. 2007), so liefert document.images[id].src; einen Fehler
	// dann kann der Bildname auch mit document.getElementById(id).src ermittelt werden
	if (isNaN(id)) { 
		var img_src = document.images[id].src;
	} else {
		var img_src = document.getElementById(id).src;
	}		
	// die img_src in einen Array aufsplitten
	arr = img_src.split("/");
	// pop Schneidet das letzte Element des Arrays ab und speichert so den Bildnamen in bild
	var bild = arr.pop();  
	// join setzt den array wieder in den String pfad um
	var pfad = arr.join("/");
	// pfad und bild zusammengesetzt ergibt den vollen Bildpfad
	plus.src = pfad + "/plus_16.png";
	minus.src = pfad + "/minus_16.png";
	// das Cookie wurde initial in der Klasse pages_present.class.php (Server) initialisiert
	// Jetzt wird es auf dem Client je nach Bedarf umgesetzt
	if (getCookie(utf8_id) == 'open') { 
//		document.images[id].src = plus.src;
		document.getElementById(id).src = plus.src;
		plus_minus = 'close';
	} else {
//		document.images[id].src = minus.src;
		document.getElementById(id).src = minus.src;
		plus_minus = 'open';
	}
	//alert(document.cookie);
	// Cookie setzen, welches bei der Anzeige der Seite aus $_COOKIE pages_present.class.php abgefragt wird
	document.cookie = utf8_id + "=" + plus_minus;
}

/*------------------------------------------------------------------------------
  Funktion: getCookie --> Cookie auslesen 
------------------------------------------------------------------------------*/ 
function getCookie(iName) {
  var lMatch = document.cookie.match(new RegExp(iName+"=(.*?);"));
  return lMatch ? unescape( lMatch[1] ) : "";
}

/*--------------------------------------------------------------------------------------------
  Funktion: toggle_page_trans -> Auf- und Zuklappen Pages Seitentitel zum Uebersetzen
  Dabei wird auf die gerade eingestellte Backend-Sprache geachtet. Ein Satz mit dieser Sprache
  muss immer angezeigt werden.
----------------------------------------------------------------------------------------------*/ 
function toggle_page_trans(iLangId,iLang) { 
    var lElements = new Array();
    var lLang, elSave;
    // Alle TR-Elemente unterhalb Table Tbody sammeln
    lElements = $(iLangId).children[0].rows;
    gAnzShow = 0; // Zähler zurücksetzen
    // dann für jedes Element die Richtige Klasse setzen
    $A(lElements).each(function(el,index) {
      // Die Sprache des Elements aus der ID in TR-Tag lesen
      lLang = el.id.split("_")[1]; 
      if (lLang.toUpperCase() != iLang.toUpperCase())  {
        if (el.className.match(/show/)) {
          el.removeClassName('show');
          el.removeClassName('underline');
          el.addClassName('hide');
        } else {
          el.removeClassName('hide');
          el.addClassName('show');
          el.addClassName('underline');
          gAnzShow++;
        }
      } else {
        elSave = el;
      }      
    });
    // Wenn nur 1 Sprache angezeigt wird, soll kein Understrich gezeigt werden
    if (gAnzShow == 0) {
      elSave.removeClassName('underline');
    } else {
      elSave.addClassName('underline');      
    }
}


//]]>
