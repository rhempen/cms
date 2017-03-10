// cms - cmsadmin general Javascript functions
// Copyright (c) 2007 Roland Hempen (http://www.hempenweb.ch)

function change_image(index, id)
{
	var bild;
	switch (id) {
		case 'thumbnails1':
			bild = document.page_edit.thumbnails1.options[index].value;
			bild1 = new Image();
			bild1.src = bild;
			window.document.bild1.src = bild1.src;
			break;
		case 'thumbnails2':
			bild = document.page_edit.thumbnails2.options[index].value;
			bild2 = new Image();
			bild2.src = bild;
			window.document.bild2.src = bild2.src;
			break;
	}		
}

var datum_von;
var datum_bis;

function check_felder_pages()
{
	var f = document.forms["page_edit"];
   	var fehler = ""; //enth�lt die Bezeichnungen
                   //der nichtausgef�llten Felder
   	// *** �berpr�fung auf vollst�ndige Ausf�llung
   	if (f.name.value=="") {
   	 	fehler += "bitte einen Seitentitel eingeben"+"<br />\n";
   		$("name").setStyle({ border:'1px solid red' });
   	} else {
  		$("name").setStyle({ border:'' });   		
   	}
   	// Datum-von pr�fen
	var von = f.datum_von.value;	
	if (von != '' && von != '00.00.0000') {
		if (!gueltigesDatum('von', von)) {
	   		fehler += 'das Von-Datum ist ung&uuml;ltig'+"<br />\n";
	   		$("datum_von").setStyle({ border:'1px solid red' });
	   	} else {
	  		$("datum_von").setStyle({ border:'' });   		
	   	}
  	}
   	// Datum-bis pr�fen 	
	var bis = f.datum_bis.value;	
	if (bis != '' && bis != '00.00.0000') {
		if (!gueltigesDatum('bis', bis)) {
	   		fehler += 'das Bis-Datum ist ung&uuml;ltig'+"<br />\n";
	   		$("datum_bis").setStyle({ border:'1px solid red' });
	   	} else {
	  		$("datum_bis").setStyle({ border:'' });   		
	   	}
	}
   	// von-bis pr�fen
   	if (von != '' && bis != '' && datum_bis < datum_von) {
   		fehler += 'das Bis-Datum '+bis+' ist kleiner als das Von-Datum '+von+"<br />\n";
   		$("datum_bis").setStyle({ border:'1px solid red' });
   	} else {
  		$("datum_bis").setStyle({ border:'' });   		
   	}
   	
   	// Kurztext
   	if (f.kurztext.value=="") {
      	fehler += "bitte einen Kurztext eingeben"+"<br />\n";
   		$("shortxt").setStyle({ border:'1px solid red' });
   	} else {
  		$("shortxt").setStyle({ border:'' });   		
   	}
	/* Langtext
    if (f.langtext.value=="") {
    	fehler += "bitte einen Langtext eingeben"+"<br />\n";
   		$("longtxt").setStyle({ border:'1px solid red' });
   	} else {
  		$("longtxt").setStyle({ border:'' });   		
   	} */
   // *** Gegebenenfalls Fehlermeldung
   	if (fehler != ""){
    	var fehlertext = "Die folgenden Felder wurden nicht vollst&auml;ndig oder fehlerhaft ausgef&uuml;llt:"+"<br />\n";
      	fehlertext += fehler;
      	$("meldung").update(fehlertext).setStyle({ color:'#B70000' });
      	return false;
   	}
   	return true;
}

function gueltigesDatum(key, datum)
{
	 //(Schritt 1) Fehlerbehandlung
	 if (!datum) return false;
	 datum=datum.toString();
	
	 //(Schritt 2) Aufspaltung des Datums
	 datum=datum.split(".");
	 if (datum.length!=3) return false;
	
	 //(Schritt 3) Entfernung der fuehrenden Nullen und Anpassung des Monats	
	 datum[0]=parseInt(datum[0],10);
	 datum[1]=parseInt(datum[1],10)-1;
	
	 //(Schritt 4) Behandlung Jahr nur zweistellig
	 if (datum[2].length==2) datum[2]="20"+datum[2];
	
	 //(Schritt 5) Erzeugung eines neuen Dateobjektes
	 var kontrolldatum=new Date(datum[2],datum[1],datum[0]);
	 
	 //(Zwischenschritt) datum_von und datum_bis speichern f�r Vergleich bis < von
	 // Zahlen kleiner 10 werden mit einer f�hrenden 0 erg�nzt
	 var jahr = datum[2];
	 var monat = datum[1]; if (monat < 10) monat = '0' + monat;
	 var tag   = datum[0]; if (tag < 10) tag = '0' + tag;
	 if (key == 'von') {
	 	datum_von = jahr+monat+tag;
	 } else {
	 	datum_bis = jahr+monat+tag;
	 }
	
	 //(Schritt 6) Vergleich, ob das eingegebene Datum gleich dem JS-Datum ist
	 if (kontrolldatum.getDate()==datum[0] && kontrolldatum.getMonth()==datum[1] && kontrolldatum.getFullYear()==datum[2])
	     return true; else return false;
}

