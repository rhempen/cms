/* hempenweb - cmsadmin Javascript functions for the browser
 * Copyright (c) 2011 Roland Hempen (http://www.hempenweb.ch)
 */

//<![CDATA[

/* die folgenden Funktionen werden benötigt, um den richtigen Pfad für 
 * die Website und tinyMCE-Editor zu bestimmen
 */
// den Pfad richtig aufbauen
function splitPathname() {
	var webroot = document.getElementById("webroot");
	var cms = "";
	if (webroot) { // Frontend
		cms = webroot.value;
	} else { // cmsadmin
		var path = location.pathname.split("/");
		for (var i=0; i<path.length; i++) {
			if (!path[i].match(/cmsadmin/) && !path[i].match(/index/)) {
				cms = cms + path[i] + "/";
			} else {
				break;
			}
		}
	}
	return cms;
}
// anhand GET-Parameter die base_url bestimmen
function werteListe (querystring) {
  if (querystring == '') return;
  var wertestring = querystring.slice(1);
  var paare = wertestring.split("&");
  var paar, name, wert;
  for (var i=0; i<paare.length;i++) {
    paar = paare[i].split("=");
    name = paar[0];
    wert = paar[1];
    name = unescape(name).replace("+", " ");
    wert = unescape(wert).replace("+", " ");
    this[name] = wert;
  }
}
// den MEDIA-Verzeichnisnamen herauslösen
function mediaDir(pfad) {
	if (pfad == undefined) { pfad = splitPathname() + 'media*'; }
	var pfade	= pfad.split('/');
	for (var j=0; j<pfade.length; j++) {
		if (pfade[j].match(/media/)) {
			var mediadir = pfade[j];
			break;
		}
	} 
	if (mediadir == undefined || mediadir == '') { mediadir = 'media_hempenweb'; }
	return mediadir;
}

//]]>