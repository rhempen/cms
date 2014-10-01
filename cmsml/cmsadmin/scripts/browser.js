// art4art - cmsadmin Javascript functions for the browser
// Copyright (c) 2007 Roland Hempen (http://www.hempenweb.ch)

//<![CDATA[
// Update des Bildkommentars per AJAX
var nr = 0;
function update_kommentar(id, value) {
	nr = id;
    var textId, bildId, textLangu, textValue;
    var kommentar, comments, json;
    var lTr = $$('#'+id+' tr[class=display_inline]');
    json = '{';
    lTr.each(function(iTr,index) {      
      // Text ermitteln von TR-Elementen mit der CSS-Klasse display_inline
      textId = iTr.children[1].children[0].id;
      bildId = textId.split("_")[0];
      textLangu = textId.split("_")[1];
      textValue = iTr.children[1].children[0].value;
      kommentar = '"' + textLangu + '":"' + textValue + '"';
      comments = index == 0 ? kommentar : ',' + kommentar;
      json = json + comments;
    });
    json = json + '}';

    // Update des sprachabhängigen Textes 
    var myAjax = new Ajax.Request(
        "../_controllers/pictures_co_maintain.php?action=kommentarSave",
        {   
            method:'get',
//            parameters:'&bild_id='+bildId+'&kommentar='+textValue+'&langu_tra='+textLangu,
            parameters:'&bild_id='+bildId+'&kommentar='+json,
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

