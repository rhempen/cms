// herocms - cmsadmin Javascript functions for the navigation pages
// Copyright (c) 2007 Roland Hempen (http://www.hempenweb.ch)

//<![CDATA[
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

// Events deklarieren 
Event.observe(window, "load", function() {
// Eine Instantz pro Element mit der Klasse "wert" erstellen --> InPlaceEditor
	$A($$(".wert")).each( function(element) {
		new Ajax.InPlaceEditor( element, "../_controllers/config_co_maintain.php?action=save&id="+element.id, {});
	});

	$A($$(".ltxt")).each( function(element) {
		new Ajax.InPlaceEditor( element, "../_controllers/config_co_maintain.php?action=save_ltxt&id="+element.id, {rows:5,cols:30});
	});

	$A($$(".spezial")).each( function(element) {
		new Ajax.InPlaceEditor( element, "../_controllers/config_co_maintain.php?action=save_spez&id="+element.id, {});
	});

    $A($$(".aktivflag")).each(function(element) {
		Event.observe(element, "click", function() { update_aktivflag_spezial(element.id); });
	});
    
});


function update_selbox(id, value) {
	var wert = value;
	var newid = id.substr(2, id.length) // id=sb+RowId
	var	url = "../_controllers/config_co_maintain.php?action=save&value="+wert+"&id="+newid; 
 	//alert(url);
	// Wurde ein Objekt erstellt?
	if  (typeof(XMLHttp) == 'object') {
		XMLHttp.open("GET", url, true);
		XMLHttp.onreadystatechange = function() {
			/* Return-Value anzeigen */		
			if (XMLHttp.readyState == 4) {
				if (XMLHttp.status == 200) {
					if (XMLHttp.responseText == value) {
						$(newid).setStyle({ border:'2px solid green' });						
			  		} else {
						$(newid).setStyle({ border:'2px solid red' });					
			  		}
				}
			}			
		};
		XMLHttp.send(null);
	} 
}

function update_selbox_themes(id, value) {
	var thema = value;
	var newid = id.substr(2, id.length) // id=sb+RowId
	var	url = "../_controllers/config_co_maintain.php?action=savethema&thema="+thema+"&id="+newid+"&param=THEME"; 
// adhoc-Formular erzeugen, befuellen und abschicken 
	var submitter = document.createElement("form"); 
	submitter.setAttribute("action",url);
 	submitter.setAttribute("method","post");
 	document.body.appendChild(submitter); 
	submitter.submit();
}

function update_radiobutton(id, value, alternative) {
	var wert 	= value;
	var altwert = alternative;
	var newid 	= id.substr(3, id.length); // id=rb0+RowId
	// Bestimmen der 2. Id f�r Setzen der Borders
	var idnr 	= id.substr(2, 1); // ist entweder 0 oder 1 --> rb "0" RowId
	var id2nr 	= idnr == '0' ? '1' : '0';
	var id2   	= id.substr(0,2) + id2nr + newid;
	var	url = "../_controllers/config_co_maintain.php?action=saverb&value="+wert+"&alternative="+altwert+"&id="+newid; 
 	// alert(url);
	// Wurde ein Objekt erstellt?
	if  (typeof(XMLHttp) == 'object') {
		XMLHttp.open("GET", url, true);
		XMLHttp.onreadystatechange = function() {
			/* Return-Value anzeigen */			
			if (XMLHttp.readyState == 4) {
				if (XMLHttp.status == 200) {
					// alle Borders zur�cksetzen
					$(id).setStyle( { border: 'none' } );
					$(id2).setStyle( { border: 'none' } );
					// Border f�r den angeklickten Radiobutton setzen
					if (XMLHttp.responseText == value) {
						$(id).setStyle({ border:'2px solid green' });						
			  		} else {
						$(id).setStyle({ border:'2px solid red' });					
			  		}
				}
			}		
		};
		XMLHttp.send(null);
	} 
}

// Update des Aktiv-Flags im Spezial-Tab
function update_aktivflag_spezial(id) {
  var wert = $(id).innerHTML;
  var led = wert.search(/blocked/);
  if (led != -1) {wert = 'nein';} else {wert = 'ja';}
  var lId = id;
  var lUrl = "../_controllers/config_co_maintain.php?action=aktivSaveSpez&wert=" + wert + "&id=" + lId; 
  new Ajax.Request(lUrl, {
    method: 'get',
    onSuccess: function(transport) {
      var responseText = transport.responseText.split('/'); 
      if (responseText[0] == 'j') {
          $(id).innerHTML  = '<button type="button" class="freed" title="'+responseText[1]+'" />'; 
          $(id).title = responseText[1]; 
          $(id).setStyle({ color:'green' });
      } else {
          $(id).innerHTML  = '<button type="button" class="blocked" title="'+responseText[1]+'" />'; 
          $(id).title = responseText[1]; 
          $(id).setStyle({ color:'red' });
      }      
    }    
  });
  
}

//]]>