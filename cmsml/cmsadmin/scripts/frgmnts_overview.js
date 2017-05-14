// herocms - cmsadmin Javascript functions for the fragments Maintenance
// Copyright (c) 2009 Roland Hempen (http://www.hempenweb.ch)

//<![CDATA[
// Events deklarieren
Event.observe(window, "load", function() {
// Eine Instantz pro Element mit der Klasse "frgnamedit" erstellen --> InPlaceEditor
	$A($$(".frgnamedit")).each( function(element) {
		var InplacEdit = new Ajax.InPlaceEditor( element, "../_controllers/frgmnts_co_maintain.php?action=frgNameSave&frgid="+element.id, {});
	});
});


Event.observe(window, "load", function() {
// Sortierbarkeit von LI-Elementen 
		Sortable.create('frgmnts',{ tag:"LI",onUpdate:updateSortIndex,handle:"fragment_move" });

// Mouseover-Event deklarieren zum Anzeigen von Bearbeitungsoption je Row
//  	$$("ul#frgmnts div.divwork").each( function(element) {
//	   element.observe( 'mouseover', showOptions );
//	   } );
//  	$$("ul#frgmnts div.divwork").each( function(element) {
//	   element.observe( 'click', showOptions );
//	   } );
});
	
	showOptions = function(e) {
    $('msg').update(e.type+"\n"+this.id);
    var workid    = this.id; // andere Browser
    if (workid === undefined) {
      workid = e.srcElement.id; // IE8!!
    }
    var frgid     = workid.match(/\d+/);
    var mnuid     = 'menu'+frgid;
    var url       = '../_controllers/frgmnts_co_maintain.php';
    if (e.type == 'mouseover' || e.type == 'click') {
      var lUpdater  = new Ajax.Updater(mnuid, url, { 
                		  parameters: { action:"workMenu", frgid:frgid }, 
                		  method: 'get'
		    } );
        $(mnuid).show();
    } else {
//      if ($(mnuid)) { $(mnuid).hide(); }
    }
  }
	
	updateSortIndex = function(e) {
    var elements  = Sortable.serialize('frgmnts'); // $('debug').update(elements);
    var url       = '../_controllers/frgmnts_co_maintain.php?action=newSort&srtids='+elements; 
    var lRequest  = new Ajax.Request(url, { 
                    parameters: { action:"newSort", srtids:elements }, 
                        method: 'post',
                     onSuccess: updateMessage
  		} );
  	}

  updateMessage = function(transport) {
  	// Meldung ausgeben nach der Neusortierung der cms_fragmente-Tabelle
		  var msgtxt;
			if (transport.statusText == 'OK') {
				msgtxt = '<span class="success">'+transport.responseText+'</span>';
			} else {
				msgtxt = '<span class="error">'+transport.responseText+'</span>';
			}
  		$('msg').update(msgtxt);
			// Sortids updaten = durchnummerieren
			$$("div.sortid").each( function(row) { row.setStyle({backgroundColor:'yellow'}); row.innerHTML=i++; });
			//var ids = Sortable.sequence('frgmnts');
  	}

	setModus = function(iModus, iFrgId) {
		var url	= '../_controllers/frgmnts_co_maintain.php?action='+iModus+'&frgid='+iFrgId;
		window.location.href = url;
	}

	saveFrgContent = function(iFrgId) {  /*
		var url		= '../_controllers/frgmnts_co_maintain.php?action=save&frgid='+iFrgId;
		window.location.href	= url; */
	}

	editMode = function(iFrgId) {
		var url		= '../_controllers/frgmnts_co_maintain.php?action=edit&frgid='+iFrgId;
		window.location.href = url;
	}

	leaveEditMode = function( ) {
		var url		='../_controllers/frgmnts_co_maintain.php?tab=Fragmente';
		//alert($("frgcontent").innerHTML);
		window.location.href = url;
	}
//]]>
