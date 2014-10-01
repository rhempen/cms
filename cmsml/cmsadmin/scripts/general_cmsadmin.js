// cms - cmsadmin general Javascript functions
// Copyright (c) 2007 Roland Hempen (http://www.hempenweb.ch)

function change_image(index, id)
{
	var bild, bild1, bild2;
	switch (id) {
		case 'thumbnails1':
            bild = $F("thumbnails1");
//			bild = document.page_edit.thumbnails1.options[index].value;
			bild1 = new Image();
			bild1.src = bild;
			window.document.bild1.src = bild1.src;
			break;
		case 'thumbnails2':
            bild = $F("thumbnails2");
//			bild = document.page_edit.thumbnails2.options[index].value;
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
                   //der nichtausgefuellten Felder
   	// *** Ueberpruefung auf vollstaendige Ausfuellung
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
      	//$("meldung").update(fehlertext).setStyle({ color:'#B70000' });
      	$("message").update(fehlertext).setStyle({ color:'#FF0000', fontWeight:'bold' });
        $("trMessage").removeClassName('hide');
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

/*--------------------------------------------------------------------------------------------
  Funktion: toggle_navi_trans -> Auf- und Zuklappen Navigationstexte zum Uebersetzen
  Dabei wird auf die gerade eingestellte Backend-Sprache geachtet. Ein Satz mit dieser Sprache
  muss immer angezeigt werden.
----------------------------------------------------------------------------------------------*/ 
function toggle_navi_trans(iLangId,iLang) { 
    var lElements = new Array();
    var lLang, elSave;
    // Alle TR-Elemente unter halb Table Tbody sammeln
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
          // Element nur zeigen, wenn es einen Wert in der 1. TD-Zelle gibt
          if (el.cells[0].innerHTML != '') {
            el.removeClassName('hide');
            el.addClassName('show');
            el.addClassName('underline');
            gAnzShow++;
          }
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

/* Sprachwechsel in der Editier-Ansicht einer Navi-Seite */
function setLanguForSave(iLangu) 
{
  if ($("languForSave")) { $("languForSave").value = iLangu; }
}

function setLanguForTranslation(iLangu,iEditId,iTemplate) 
{
  var lFormId, lUrl, lId, lRc;
  if (iTemplate == 'navi') {
    lFormId = 'naviSeitenEdit';
    lUrl    = "../_controllers/navi_co_maintain.php";
    lId     = 'nav_id='+iEditId;
  } else {
    lFormId = 'pageSeitenEdit';
    lUrl    = "../_controllers/pages_co_maintain.php";  
    lId     = 'page_id='+iEditId;
    lRc     = check_felder_pages();
    if (lRc === false) return;
  }
  // erst mal Prüfen, ob das Formular da ist
  if (!$(lFormId)) { alert('ID '+lFormId+' existiert nicht!'); return false; }
  
  var lLanguForSave = $("languForSave").value != '' ? $("languForSave").value : iLangu;
  // GET-Parameter an die URL anhängen
  lUrl = lUrl+"?action=edit&langu_tra="+iLangu+"&"+lId;

  // der Inhalt der Textareas muss mit einer Funktion von tinyMCE ermittelt und codiert werden,
  // damit er richtig an den Server übertragen wird. langu_sav muss ebenfalls mitgegeben werden.
  // die übrigen Felder des Formulars können wie üblich im PHP aus $_POST ermittelt werden
  // bei onComplete wird ein normaler Request an die URL abgesetzt und wieder in den Edit-Modus 
  // zu gelangen
  var innerHTML1 = encodeURIComponent(tinyMCE.get("inhalt1").getContent());
  var innerHTML2 = encodeURIComponent(tinyMCE.get("inhalt2").getContent());
  var lParam = "inhalt1="+innerHTML1+"&inhalt2="+innerHTML2+"&langu_sav="+lLanguForSave;
  $(lFormId).request({
    method: "post",
    parameters: lParam,
    asynchronous: false,
    onSuccess: zeige_resultat,
    onFailure: zeige_fehler,
    onComplete: function() { 
      lUrl = lUrl+"&msg_save="+$("msgFromSave").innerHTML+"&led_save="+$("ledFromSave").value;
      lUrl = lUrl+"&class_save="+$("classFromSave").value;
      location.href = lUrl;   
    }
  }); 
  return true;
}


  
var zeige_resultat = function(r)
{    
    $("ledLangu").src = '../gifs/ledgreen.gif';
    $("ledLangu").alt = r.responseText;
    $("ledLangu").title = r.responseText;
    $("msgFromSave").innerHTML = r.responseText;
    $("ledFromSave").value = '../gifs/ledgreen.gif';
    $("classFromSave").value = 'success';
//    $("message").addClassName('success');
//    $("message").innerHTML = r.responseText;
//    $("trMessage").removeClassName('hide');    
}

var zeige_fehler = function(r)
{
    $("ledLangu").src = '../gifs/ledred.gif';
    $("ledLangu").alt = r.statusText;
    $("ledLangu").title = r.statusText;
    $("msgFromSave").innerHTML = r.responseText;
    $("ledFromSave").value = '../gifs/ledred.gif';
    $("classFromSave").value = 'error';
//    $("message").addClassName('error');
//    $("meldung").innerHTML = "Fehler: " + r.status + " / " + r.statusText;
//    $("trMessage").removeClassName('hide');
}


document.onkeydown = function(event) {
  if (getKeyCode(event) == '13') {
    // auf Enter soll keine Reaktion erfolgen (zB. kein Submit des Formulars)
    return false;
  }
  return true;
}

// KeyCode abfragen
function getKeyCode(event) {
   event = event || window.event;
   return event.keyCode;
}

// Allgemeine Funktion für den Submit eines Formulars an eine URL
function genericSubmit(iUrl,iConfirm) {
  if (iConfirm != '') {
    var conf = confirm(iConfirm);
    if (conf == false) return;
  }
  var submitter = document.createElement("form"); 
  submitter.setAttribute("action",iUrl);
  submitter.setAttribute("method","post");
  document.body.appendChild(submitter); 
  submitter.submit();
}


Event.observe(window, 'load', function(){
// 1. Eine Instantz pro Element mit der Klasse "abbrechen" erstellen --> Button-Registrierung
    // navi_edit
    $A($$(".navi_abbrechen")).each( function(element) {
		Event.observe(element, "click", function() {
          var lUrl = '../_controllers/navi_co_maintain.php?action=esc';          
			location.href=lUrl;
		});
	});
    // page_edit
	$A($$(".page_abbrechen")).each( function(element) {
		Event.observe(element, "click", function() {
          var lUrl = '../_controllers/pages_co_maintain.php?action=esc';          
			location.href=lUrl;
		});
	});

    // 2. Eine Instantz pro Element mit der Klasse "speichern" erstellen --> Button-Registrierung
    // navi_edit
	$A($$(".navi_sichern")).each( function(element) {
		Event.observe(element, "click", function() {
          var lLanguTra = $("sprachen").value; // Wert des selektierten Eintrages in der Selectbox
          var lSeitenId = $("seitenId").innerHTML;
          var lTemplate = 'navi';
          setLanguForTranslation(lLanguTra,lSeitenId,lTemplate);
		});
	});
    // page_edit
    $A($$(".page_sichern")).each( function(element) {
		Event.observe(element, "click", function() {
          var lLanguTra = $("sprachen").value; // Wert des selektierten Eintrages in der Selectbox
          var lPageId   = $("pageId").innerHTML;
          var lDomain   = $("bildPfad").innerHTML;
          var lTemplate = 'page';
          setLanguForTranslation(lLanguTra,lPageId,lTemplate);
		});
	});
});
