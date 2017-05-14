// Javascripts f�r cms Frontend
// Author: Roland Hempen
// Creation Date: 05.10.2007
// 

function setLinkCookie(referer) 
{
	// Cookie "CrossLink" setzen, welches bei der Anzeige im Frontend abgefragt wird,
	// um innerhalb der Pages-Section hin-und zur�ck zu navigieren
	// Wird vorwiegend da verwendet, wo der Benutzer zb. aus der Detailansicht eines K�nstlers
	// zur verlinkten Expo und wieder zur�ck navigieren kann.
	// Das Cookie wir in der Methode create_uebersicht_link der klasse frontendPresent ausgewertet
	// Es ist ein Stunden lang g�ltig
	var ablauf = new Date();
	var inEinerStunde = ablauf.getTime() + (60 * 60 * 1000);
	ablauf.setTime(inEinerStunde);
//	document.cookie = "CrossLink" + "=" + referrer;
	document.cookie = "CrossLink=" + referer + "; expires=" + ablauf.toGMTString();
//	alert(unescape(document.cookie));
}

function delLinkCookie(referer) 
{
	// Cookie "CrossLink" wieder l�schen, sobald der Benutzer auf den Link klickt
	var ablauf = new Date();
	var eineStungeZurueck = ablauf.getTime() + (60 * 60 * 1000 * (-1));
	ablauf.setTime(eineStungeZurueck);
	document.cookie = "CrossLink=" + referer + "; expires=" + ablauf.toGMTString();
//	alert(unescape(ablauf.toGMTString()));	
}


// Setzt ein Cookie (allgeimen)
function setCookie(iName, iValue) {
	var ablauf = new Date();
	var inEinerStunde = ablauf.getTime() + (60 * 60 * 1000);
	ablauf.setTime(inEinerStunde);
	document.cookie = iName+"=" + iValue + "; expires=" + ablauf.toGMTString();
//	alert(unescape(document.cookie));
}

// Löscht ein Cookie
function delCookie(iName) {
	// Cookie "CrossLink" wieder l�schen, sobald der Benutzer auf den Link klickt
	var ablauf = new Date();
	var eineStungeZurueck = ablauf.getTime() + (60 * 60 * 1000 * (-1));
	ablauf.setTime(eineStungeZurueck);
	document.cookie = iName+"=; expires=" + ablauf.toGMTString();
//	alert(unescape(ablauf.toGMTString()));	
}

/* Cookie auslesen */
function getCookie(iName) {
  var lMatch = document.cookie.match(new RegExp(iName+"=(.*?);"));
  return lMatch ? unescape( lMatch[1] ) : "";
}

/* Feldinhalt im Kontaktformular löschen bei onfocus */
function setFokus(iId) {
  var value = document.getElementById(iId).value;
  var feldwert = document.getElementById(iId).value.toLowerCase();
  switch(iId) {
    case "name":
      feldwert = feldwert.match(/n(o|a)m/) ? '' : value;
      break;
    case "adresse":
      feldwert = feldwert.match(/ad{1,2}res/) ? '' : value;
      break;
    case "plz_ort":
      feldwert = isNaN(feldwert.match(/\^d{4}/)) ? value : '';      
      break;
    case "telefon":
      feldwert = feldwert.replace(/\s/g, "");
      feldwert = isNaN(feldwert) ? '' : value;
      break;
    case "email":
      feldwert = isEmail(feldwert) ? value : '';
      break;
    case "kommentar":     
      feldwert = value;
      break;
    case "code":
      feldwert = feldwert.match(/code/) ? '' : value;
      break;
    default:
      feldwert = "";      
  }
  document.getElementById(iId).value = feldwert;  
}

/* Formulareingaben prüfen */
function check_form() {
  // Felder im Kontaktformular �berpr�fen
	var f = document.forms["formmail"];
   	var fehler = ""; 
	var fehler_code = "";
	var fehler_email = "";
	var fehler_telefon = "";
	// *** �berpr�fung auf vollst�ndige Ausf�llung
	  // Bild-code
   	if (f.code.value=="" || f.code.value.match(/Code/)) {
   	 	fehler += "bitte den Bild-Code eingeben"+"<br />\n";
   		$("code").setStyle({ border:'1px solid red' });
		$("code").focus();
   	} else {
  		$("code").setStyle({ border:'' });   		
   	}
   	// email
   	if (f.email.value=="") {
      	fehler += "bitte Email eingeben"+"<br />\n";
   		$("email").setStyle({ border:'1px solid red' });
		$("email").focus();
	} else if (!isEmail(f.email.value)) {
      	fehler_email = "Die Emailadresse ist ung&uuml;ltig!";
		fehler += fehler_email;
   		$("email").setStyle({ border:'1px solid red' });
		$("email").focus();
   	} else {
  		$("email").setStyle({ border:'' });   		
   	}
   	// Telefon
    var telefon = f.telefon.value.replace(/\s/g, "");
   	if (telefon=="") {
      	fehler += "bitte Telefonnummer eingeben"+"<br />\n";
   		$("telefon").setStyle({ border:'1px solid red' });
		$("telefon").focus();
   	} else {
  		$("telefon").setStyle({ border:'' });   		
   	}
   	// Postleitzahl
   	if (f.plz_ort.value=="") {
      	fehler += "bitte Plz und Ort eingeben"+"<br />\n";
   		$("plz_ort").setStyle({ border:'1px solid red' });
		$("plz_ort").focus();
   	} else {
  		$("plz_ort").setStyle({ border:'' });   		
   	}
   	// Adresse
   	if (f.adresse.value=="") {
      	fehler += "bitte Ihre Adresse eingeben"+"<br />\n";
   		$("adresse").setStyle({ border:'1px solid red' });
		$("adresse").focus()
   	} else {
  		$("adresse").setStyle({ border:'' });   		
   	}
	  // Namen
   	if (f.name.value=="") {
   	 	fehler += "bitte Ihren Namen und Vornamen eingeben"+"<br />\n";
   		$("name").setStyle({ border:'1px solid red' });
		$("name").focus();
   	} else {
  		$("name").setStyle({ border:'' });   		
   	}
    // *** Gegebenenfalls Fehlermeldung
   	if (fehler != ""){
    	var fehlertext = "Bitte f&uuml;llen Sie die markierten Felder aus ";
		if (fehler_telefon != '') { fehlertext += fehler_telefon; }
		if (fehler_email != '') { fehlertext += "<br />\n"+fehler_email; }
		$("kontaktmeldung").innerHTML = fehlertext;
      	$("kontaktmeldung").setStyle({ color:'red' });
      	return false;
   	}
   	return true;
}

/* Formularcheck f�r Webmail */
function check_webmail() {
	var f = document.forms["webmail"];
   	var fehler = ""; 
	var fehler_email = "";
	// *** �berpr�fung auf vollst�ndige Ausf�llung
   	// email
   	alert(f.login_username.value);
   	if (f.login_username.value=="") {
      	fehler += "bitte Email eingeben"+"<br />\n";
   		$("login_username").setStyle({ border:'1px solid red' });
		$("login_username").focus();
	} else if (!isEmail(f.email.value)) {
      	fehler_email = "Die Emailadresse ist ung&uuml;ltig!";
		fehler += fehler_email;
   		$("email").setStyle({ border:'1px solid red' });
		$("email").focus();
   	} else {
  		$("email").setStyle({ border:'' });   		
   	}
   	// passwort
	if (f.passw.value=="") {
      	fehler += "bitte das Passwort eingeben"+"<br />\n";
   		$("passw").setStyle({ border:'1px solid red' });
		$("passw").focus();
	}
}

function isEmail(string) {
	if (string.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1) { 
		return true; 
	} else {
		return false;
	}
}

/* Start des Formulars im Member-Login-Bereich */
function start_memberform(action) {
	var act = action.toUpperCase();
    if (act == 'LOGOUT') {
      document.getElementById('logout').value=act;
      document.memberlogout.submit();	
    } else {      
      document.getElementById('action').value=act;
      document.memberlogin.submit();	
    }
}


/* Bilderwechsel indem mit der Maus �ber die entsprechenden B�xchen unterhalb des Bildes gefahren wird. 
   das Erscheinungsbild kann g�nzlich in der CSS-Datei gesteuert werden - Keine CSS-Notation hier drin! */
function picSwitch(switchnr) {
	// erst alle Elemente ausblenden
	var x = 0;
	var pict_alle = 'pict_' + x;
	var rect_alle = 'rect_' + x;
	while($(pict_alle)) {
		if ($(pict_alle)) {
			$(pict_alle).style.display = 'none';
		}
		$(rect_alle).className = 'bildleiste rect_passiv';
		var pict_alle = 'pict_' + x;
		var rect_alle  = 'rect_' + x++;
	}
	// dann das aktive Elemente einblenden und den Schalter aktiv schalten
	var pict_switch = 'pict_' + switchnr;
	var rect_switch = 'rect_' + switchnr;
  	if ($(pict_switch)) $(pict_switch).style.display = 'inline';
  	if ($(rect_switch)) $(rect_switch).className = 'bildleiste rect_aktiv';
}	

/* Google Analytics */
function google_analytics(iGaKonto) {
  var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
  document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
  try{
    var pageTracker = _gat._getTracker("+ iGaKonto +");
    pageTracker._trackPageview();
  } catch(err) {}
}


/* Bilder anzeigen beim hovern der Reflinks */
function showRefPic(iNr) {
  var lMedia = document.getElementById("mediadir").value;
  switch (iNr) {
    case 1:
      $('refpic').src = lMedia+"/footer/th_feednsmile.png";
	  break;
    case 2:
      $('refpic').src = lMedia+"/footer/th_physio-allschwil.png";
    	break;
    case 3:
      $('refpic').src = lMedia+"/footer/th_birchler-architektur.png";
    	break;
    case 4:
      $('refpic').src = lMedia+"/footer/th_gigijacquier.png";
    	break;
    case 5:
      $('refpic').src = lMedia+"/footer/th_art4art.png";
   	  break;
    case 6:
      $('refpic').src = lMedia+"/footer/th_orasch.png";
      break;
    case 7:
      $('refpic').src = lMedia+"/footer/th_physio-steiner.png";
   	  break;
    case 8:
      $('refpic').src = lMedia+"/footer/th_raku.png";
      break;
    default:
      $('refpic').src = lMedia+"/footer/th_feednsmile.png";
      break;
  }
  $('refpics').show();
}
