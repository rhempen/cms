/* 
    Document   : gmaps.js
    Created on : 22.01.2012, 08:48:42
    Author     : Roland Hempen
    Description: Javascript-Funktionen für Googgle-Maps 
*/

//<![CDATA[
  var phpfile = "ajax_gmxml_geocoding.php";
  var gLangu = getParameterByName("langu");
  var gLanguFile = "languages/datatable_"+gLangu+".txt";
  var gQuery = getParameterByName("query"); // wurde ein Suchstring eingegeben?
  var gPhpfile = phpfile+location.search;
  var gZoom = gQuery != '' ? 11 : 8; // Zoomfaktor abhängig vom Suchstring
  var gLatZentrum	= 46.80758;  // Mittelpunkt der Schweiz = Älggi-Alp bei Sachseln
  var gLngZentrum	= 8.234138;
  var gLat, gLng;
  var gZentrum;
  var gAnzahl, gModus;
  var gBtnMap, gBtnList;
  var map;

  var customIcons = {
    notfound: {
      icon: 'http://maps.gstatic.com/intl/de_ALL/mapfiles/marker.png',
      shadow: 'http://maps.gstatic.com/intl/de_ALL/mapfiles/shadow50.png'
    },
    lager: {
      icon: 'http://labs.google.com/ridefinder/images/mm_20_blue.png',
      shadow: 'http://labs.google.com/ridefinder/images/mm_20_shadow.png'
    },
    onlineshop: {
      icon: 'http://labs.google.com/ridefinder/images/mm_20_red.png',
      shadow: 'http://labs.google.com/ridefinder/images/mm_20_shadow.png'
    }
  };

  // selbstdefinierter Home-Button 
  function HomeControl(controlDiv, map) {
    // Set CSS styles for the DIV containing the control
    // Setting padding to 5 px will offset the control from the edge of the map
    controlDiv.style.padding = '5px';

    // Set CSS for the control border
    var controlUI = document.createElement('DIV');
    controlUI.style.backgroundColor = 'white';
    controlUI.style.borderStyle = 'solid';
    controlUI.style.borderWidth = '1px';
    controlUI.style.cursor = 'pointer';
    controlUI.style.textAlign = 'center';
    controlUI.title = 'Reset to starting Configuration';
    controlDiv.appendChild(controlUI);

    // Set CSS for the control interior
    var controlText = document.createElement('DIV');
    controlText.style.fontFamily = 'Arial,sans-serif';
    controlText.style.fontSize = '13px';
    controlText.style.paddingLeft = '6px';
    controlText.style.paddingRight = '6px';
    controlText.style.paddingTop = '1px';
    controlText.style.paddingBottom = '1px';
    controlText.innerHTML = 'Reset';
    controlUI.appendChild(controlText);

    // Setup the click event listeners: simply set the map to Olten
    google.maps.event.addDomListener(controlUI, 'click', resetMap);
  }

  function resetMap() {
    gZoom = 8;
    setZentrum( gLatZentrum, gLngZentrum );
    map.setZoom( gZoom );					
  }

  function createMap() {
    var latlng = new google.maps.LatLng(gLatZentrum,gLngZentrum);
    var myOptions = {
      zoom: gZoom,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("map"), myOptions);
    //createHomeControl();
  }

  function createHomeControl() {
    // Create the DIV to hold the control and
    // call the HomeControl() constructor passing in this DIV.
    var homeControlDiv = document.createElement('DIV');
    var homeControl = new HomeControl(homeControlDiv, map);			
    homeControlDiv.index = 1;
    map.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv);        
  }

  function initialize() {
    createMap();

    // Change this depending on the name of your PHP file
    downloadUrl(gPhpfile, function(data) {
      var i;
      var xml = parseXml(data);
      var markers = xml.documentElement.getElementsByTagName("marker");
      var anzahl  = xml.documentElement.getElementsByTagName("anzahl");
      var coords  = xml.documentElement.getElementsByTagName("coords");
      gAnzahl = anzahl.length != 0 ? anzahl[0].getAttribute("found") : 0;
      gModus  = anzahl[0].getAttribute("modus");
      // hier wird das neue Zentrum gesetzt
      if (coords.length != 0) { 
        for (i = 0; i < coords.length; i++) {
        gLat =  coords[i].getAttribute("lat"); 
        gLng =  coords[i].getAttribute("lng"); 
        }
      }
      // hier werden die Markers pro DB-Eintrag erstellt
      if (markers.length != 0) {
        // die Tabelle aufbauen fuer die Listen-Ansicht
        createTable(markers,'front'); 
        initTable(); // jQuery
        // Markers auf der Map definieren und positionieren
        createMarkers(markers);
      } else {
        createMap();
      }
    });
  }
  
  // Init jQuery-Table
  function initTable() {
    $(document).ready(function() { 
      var oTable = $('#resulttable').dataTable( {
                "bJQueryUI" : true,
                "bProcessing" : true,
                "bStateSave": true,
                "bPaginate": true,
                "sPaginationType" : "full_numbers",
                "oLanguage": { "sUrl": gLanguFile }
      }	);
    } );
  }
  
  // Initialisierung der Maintenance-Tabelle
  function initMaintenance() {
    // Ajax-Request ausführen   
    downloadUrl(gPhpfile, function(data) {
      var i;
      var xml = parseXml(data);
      var markers = xml.documentElement.getElementsByTagName("marker");
      var anzahl  = xml.documentElement.getElementsByTagName("anzahl");
      var coords  = xml.documentElement.getElementsByTagName("coords");
      gAnzahl = anzahl.length != 0 ? anzahl[0].getAttribute("found") : 0;
      // hier wird das neue Zentrum gesetzt
      if (coords.length != 0) { 
        for (i = 0; i < coords.length; i++) {
        gLat =  coords[i].getAttribute("lat"); 
        gLng =  coords[i].getAttribute("lng"); 
        }
      }
      // hier werden die Markers pro DB-Eintrag erstellt
      if (markers.length != 0) {
        // die Tabelle aufbauen fuer die Listen-Ansicht
        createTable(markers,'maint'); 
        initTableMaintain(); // jQuery
      } else {
//        createMap();
      }
    });
  }
  
  // Init jQuery-Table for Mainenance
  function initTableMaintain() {    
    $(document).ready(function() {
      var oTable = $('#resulttable').dataTable( {
                      "bJQueryUI" : true,
                      "bStateSave": true,
			          "bProcessing" : true,
                      "bFilter": true,
                      "bPaginate": true,
                      "sPaginationType": "full_numbers"
//                      "oLanguage": { "sUrl": gLanguFile } 
//                --> localisation funktionier leider noch nicht
      }	);
      
//    $('#resulttable').dataTable().makeEditable( {
      oTable.makeEditable( {
        sUpdateURL: "UpdateData.php",
        sAddURL: "AddData.php",
        sDeleteURL: "DeleteData.php",
        "aoColumns": [
                        {
                            type: 'select',
                            onblur: 'submit',
                            data: "{'lager':'lager','onlineshop':'onlineshop'}"
                        },
                        {   cssclass: "required",
                            indicator: 'Speichere Namen...',
                            tooltip: 'Doppelklick zum Bearbeiten..',
                            submit:'Speichern'
                        },
                        {   cssclass: "required",
                            indicator: 'Speichere Adresse...',
                            tooltip: 'Doppelklick zum Bearbeiten..',
                            submit:'Speichern'                          
                        },
                        {   cssclass: "required",
                            indicator: 'Speichere Plz/Ort...',
                            tooltip: 'Doppelklick zum Bearbeiten..',
                            submit:'Speichern'
                        },
                        {   cssclass: "required",
                            onblur: 'cancel',
                            submit: 'Speichern',
                        },
                        {   cssclass: "required",
                            onchange: 'cancel',
                            submit: 'Speichern',
                        },
                        {
                            type: 'select',
                            onblur: 'submit',
                            data: "{'aktiv':'aktiv','inaktiv':'inaktiv'}"
                        }
            ],
          oAddNewRowButtonOptions:  { label: "Neu...", icons: { primary:'ui-icon-plus' } },
          oDeleteRowButtonOptions:  { label: "Löschen", icons: { primary:'ui-icon-trash' } },
          oAddNewRowFormOptions:    { title: 'Neuer Datensatz',
                                      show: "blind",
                                      hide: "implode",
                                      modal: true
                                    },          
          sAddDeleteToolbarSelector: ".dataTables_length",
          fnShowError: function (message, action) {
              switch (action) {
                  case "update":
                      jAlert(message, "Update failed");
                      break;
                  case "delete":
                      jAlert(message, "Delete failed");
                      break;
                  case "add":
                      $("#lblAddError").html(message);
                      $("#lblAddError").show();
                      break;
              }
          },
          fnStartProcessingMode: function () {
              $("#processing_message").dialog();
          },
          fnEndProcessingMode: function () {
          		$("#processing_message").dialog("close");
          },
          fnOnDeleting: function (tr, id, fnDeleteRow) {
              jConfirm('Soll der Datensatz mit der id ' + id + ' wirklich gel&ouml;scht werden?', 'Löschen?', function (r) {
                if (r) {
                  fnDeleteRow(id);
                }
          });
          return false;
          }                      
      });      
    });
  }
  
  // Markers erstellen
  function createMarkers(markers) 
  {
    var googleLink = new Array();
    var infoWindow = new google.maps.InfoWindow;
    for (i = 0; i < markers.length; i++) {
      var mid = markers[i].getAttribute("mid");
      var nam = markers[i].getAttribute("nam");
      var adr = markers[i].getAttribute("adr");
      var ort = markers[i].getAttribute("ort");
      var typ = markers[i].getAttribute("typ");
      var point = new google.maps.LatLng(
      parseFloat(markers[i].getAttribute("lat")),
      parseFloat(markers[i].getAttribute("lng")));
      googleLink = createGoogleMapsLink(mid,nam,adr,ort);
      var html = "<h3>" + nam + "</h3>" + googleLink['HLNK']; 
      var icon = customIcons[typ] || {};
      var marker = new google.maps.Marker({
        map: map,
        position: point,
        icon: icon.icon,
        shadow: icon.shadow
      });
      bindInfoWindow(marker, map, infoWindow, html);
    }
    // Zentrierung der Karte abhängig, ob ein Suchstring eingegeben wurde
    if (gQuery != '') { 
      setZentrum( gLat, gLng ); 
    } else { 
//      setZentrum( gLatZentrum, gLngZentrum );
      resetMap();
    }		
	} 

  // Tabellensicht erstellen
  function createTable(markers,ui) 
  {
    var i, lTable, lThead, lTbody, lCont, lAttr, lClass;
    var lRow = new Array(), lCells = new Array(), googleLink = new Array();
    var lFields, lLst, lIcon, lImg, lLnk;
    var lMid, lNam, lAdr, lOrt;
    if (ui == 'front') {
      lFields = new Array("typ","nam","adr","ort");      
      lLst = document.getElementById("lst");
    } else {
      lFields = new Array("nam","adr","ort","lat","lng","typ","act");            
      lLst = document.getElementById("lstMaint");
    }
    if (!lLst) return false;
    
    // Tabelle und Tbody erstellen
    lTable=document.createElement('table');
    lTable.setAttribute('id','resulttable');
    lTable.setAttribute('border','0'); 
    lTable.setAttribute('width','100%'); 
		
	// Table-Header
    lThead=document.createElement('thead');
    lRow[0] = document.createElement('tr');
    lAttr = markers[0].attributes;
    for (i=0; i<lAttr.length; i++) {
      if (checkFields(lFields, lAttr[i].name) != -1) {
          lCells[i] = document.createElement('th');
          lCont = document.createTextNode(lAttr[i].name);
          lCells[i].appendChild(lCont);    		
          lRow[0].appendChild(lCells[i]);    		
      }
      lThead.appendChild(lRow[0]);  
    }
    lTable.appendChild(lThead);
    
    
	// Table-Body
    lTbody=document.createElement('tbody');    
    for (j=0; j<markers.length; j++) {
      // Pro Datensatz die gewünschten Attribute in TD übernehmen
      lAttr = markers[j].attributes;
      // im Maintain-Modus sollen Datensätze ohne MID nicht angezeigt werden
      if (ui == 'maint' && lAttr[0].value == '') { continue; }
      // CSS-Klasse setzen (Modulo)
      lClass = (j % 2 == 0) ? 'even' : 'odd'; 
      // Pro Datensatz einen Row kreiieren
      lRow[j] = document.createElement('tr');
      lRow[j].setAttribute('class',lClass); 
      
      // Attribute durchlaufen und entscheiden, ob sie angezeigt werden müssen
      for (i=0; i<lAttr.length; i++) {
        // die Row-Id wird in die Id des TR-Tags eingetragen
        if (lAttr[i].name == "mid" && lAttr[i].value != '') {
          lRow[j].setAttribute('id',lAttr[i].value);           
        }
        // Nur Werte für Feld in lFields ausgeben
        if (checkFields(lFields, lAttr[i].name) != -1) {
          lCells[i] = document.createElement('td');
          if (lAttr[i].name == "mid" && lAttr[i].value != '') {
            lCells[i].setAttribute('class','center disabled');
          }
          if (lAttr[i].name == "typ" && lAttr[i].value != '') {
            lCells[i].setAttribute('class','center');
          }
          // eindeutige ID pro TD vergeben
          lTdId = lAttr[i].name + j;
          lCells[i].setAttribute('id',lTdId);
          // Feldinhalt 
          if (lAttr[i].name == 'typ' && ui == 'front') {  
            lCont = createBildLink(lAttr);
          } else {
            lCont = document.createTextNode(lAttr[i].value);
          }
          lCells[i].appendChild(lCont);
          lRow[j].appendChild(lCells[i]);
        }
      }
      lTbody.appendChild(lRow[j]);  
    }
    // Tabelle abschliessen und ausgeben
    lTable.appendChild(lTbody);
    lLst.appendChild(lTable);
    return true;
  }

  // Bildlink in der Liste erstellen anhand lAttr
  function createBildLink(iAttr) 
  {
    var lMid, lNam, lAdr, lOrt, lTyp, lLnk, lImg;
    lMid = iAttr.getNamedItem("mid").value;
    lNam = iAttr.getNamedItem("nam").value;
    lAdr = iAttr.getNamedItem("adr").value;
    lOrt = iAttr.getNamedItem("ort").value;
    lTyp = iAttr.getNamedItem("typ").value;
    
    // Icon bestimmen
    lIcon = customIcons[lTyp].icon;
    
    // Link auf Google-Map erstellen
    googleLink = createGoogleMapsLink(lMid,lNam,lAdr,lOrt);            

    // DOM-Object Link erstellen
    lLnk = document.createElement("a");
    lLnk.setAttribute('href',googleLink['HTTP'])
    lLnk.setAttribute('target','exakt');
    lLnk.setAttribute('title','Google-Maps');

    // DOM-Objekt Bild erstellen
    lImg = document.createElement("img");
    lImg.setAttribute('border','0');
    lImg.setAttribute('src',lIcon);
    
    // Bild an Link anfügen
    lLnk.appendChild(lImg);
    
    // fertig erstelltes DOM-Objekt zurücklieferen
    return lLnk;    
  }
  
  // Link auf Google-Maps aus Adressdaten erstellen -->
  // wird sowohl in der Karte, als auch in der Liste verwendet
  function createGoogleMapsLink(iMid,iNam,iAdr,iOrt) 
  {
    var googleLink = new Array();
    var lQuery = iMid != "" ? iNam+","+iAdr+","+iOrt : gQuery;
    googleLink['HTTP'] = "http://maps.google.ch?f=q&q="+lQuery;
    googleLink['TEXT'] = iAdr+"<br>"+iOrt;
    googleLink['HLNK'] = "<a target='exakt' href='" + googleLink['HTTP'] + 
                         "'>"+googleLink['TEXT']+"</a>";
    return googleLink;
  }


  // Karte abhängig vom Suchresultat zentrieren
  function setZentrum( iLat, iLng) {
    if (!gZentrum) {
      gZentrum = new google.maps.LatLng( iLat, iLng ); 
    } else {
      gZentrum.Pa = iLat;
      gZentrum.Qa = iLng;
      gZentrum.Ra = iLng;
    }
    map.setCenter(gZentrum);				
  }

      // InfoFenster beim Click auf einen Punkt in der Karte
  function bindInfoWindow(marker, map, infoWindow, html) {
    google.maps.event.addListener(marker, 'click', function() {
      infoWindow.setContent(html);
      infoWindow.open(map, marker);
    });
  }

  function downloadUrl(url, callback) {
    var request = window.ActiveXObject ?
        new ActiveXObject('Microsoft.XMLHTTP') :
        new XMLHttpRequest;

    request.onreadystatechange = function() {
      if (request.readyState == 4) {
        request.onreadystatechange = doNothing;
        callback(request.responseText, request.status);
        doAfterRequest(request.responseText, request.status);
      }
    };

    request.open('GET', url, true);
    request.send(null);
  }

  function parseXml(str) {
    if (window.ActiveXObject) {
      var doc = new ActiveXObject('Microsoft.XMLDOM');
      doc.loadXML(str);
      return doc;
    } else if (window.DOMParser) {
      return (new DOMParser).parseFromString(str, 'text/xml');
    } 
  }

  function doNothing() {}

  function doAfterRequest(iText,iStatus) { 
    var lErgebnis = document.getElementById("ergebnis"); // Div im Eingabebereich oberhalb der Karte
    var lListButt = document.getElementById("liste"); // Button zum Anzeigen der Liste
    var lShowAnzahl = lErgebnis; 
    if (lShowAnzahl){
    // Roter oder gruener Rand
	    lShowAnzahl.className = gAnzahl == 0 ? 'red' : 'green'; 
	    lShowAnzahl.innerHTML = "Total: "+gAnzahl;
  	}
    // im Front-Modus soll die Anzahl gefundener Datensätze nicht angezeigt werden
    if (gModus == 'front') lErgebnis.className = 'hide';
    if (lListButt && gAnzahl != 0) lListButt.className = 'switch'; // Liste-Button anzeigen
    return true;
  }
  
  function getParameterByName(name)
  {
    name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    var regexS = "[\\?&]" + name + "=([^&#]*)";
    var regex = new RegExp(regexS);
    var results = regex.exec(window.location.href);
    if(results == null)
      return "";
    else
      return decodeURIComponent(results[1].replace(/\+/g, " "));
  }

  /* Längen-und Breitengrade mit dem Geocoder ermitteln während der Erfassung eines neuen Datensatzes */
  function getLatLngByAddress() {
    var geocoder = new google.maps.Geocoder();
    var address = document.getElementById("adr").value + ", "  +
                  document.getElementById("ort").value;
    geocoder.geocode( { 'address': address}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) { 
        var geocode = results[0].geometry.location;
        document.getElementById("lat").value = geocode.lat();
        document.getElementById("lng").value = geocode.lng();
      } else { 
        alert("Geocode was not successful for the following reason: " + status); 
      }    
    });
  }
       
  /* Längen-und Breitengrade mit dem Geocoder ermitteln während dem Update in der Tabelle */
  function getLatLngByAddressInput(iAdr,iOrt,iLat,iLng) {
    var geocoder = new google.maps.Geocoder();
    var address = document.getElementById(iAdr).value + ", " + document.getElementById(iOrt).value;
    geocoder.geocode( { 'address': address}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) { 
        var geocode = results[0].geometry.location;
        document.getElementById(iLat).value = geocode.lat();
        document.getElementById(iLng).value = geocode.lng();
      } else { 
        alert("Geocode was not successful for the following reason: " + status); 
      }    
    });
  }

  function switchView(iTxtLst, iTxtMap)
  {
    var lDivMap = document.getElementById("map");
    var lDivLst = document.getElementById("lst");
    var lLstBut = document.getElementById("liste");
    if (lDivLst.className == 'hide') {
      lDivMap.className = 'hide';
      lDivLst.className = 'show';
      lLstBut.innerHTML = iTxtMap;
    } else {
      lDivMap.className = 'show';
      lDivLst.className = 'hide';
      lLstBut.innerHTML = iTxtLst;
    }    
  }

  function checkFields(iFields,iAttr) 
  {
      for (var i=0; i<iFields.length; i++) {
          if (iFields[i] == iAttr) {
              return i;
              }
          }
          return -1;
  }
  //]]>


