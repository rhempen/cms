// art4art - cmsadmin Javascript functions for the browser
// Copyright (c) 2007 Roland Hempen (http://www.hempenweb.ch)

//<![CDATA[
// Update des Bildkommentars per AJAX
var nr = 0;
function update_kommentar(id, value) {
	nr = id;
    var myAjax = new Ajax.Request(
        "../_controllers/pictures_co_maintain.php?action=kommentarSave&bild_id="+nr+"&kommentar="+value,
        {   
            method:'get',
            onLoading:function(r) { $("meldung"+nr).innerHTML="Saving..."; },
            onSuccess:zeige_resultat,
            onFailure:zeige_fehler
        }
    ); 
}

var zeige_resultat = function(r)
{
    $("meldung"+nr).innerHTML = r.responseText;
}

var zeige_fehler = function(r)
{
   $("meldung"+nr).innerHTML = "Fehler: " + r.status + " / " + r.statusText;
}
//]]>

