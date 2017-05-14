// cms - cmsadmin Javascript functions for the navigation pages
// Copyright (c) 2009 Roland Hempen (http://www.hempenweb.ch)

//<![CDATA[
/**********************************************************************************
*
* Events und Functions f�r Zeichenz�hler 
*
/*********************************************************************************/

var maxLaenge = 60;
// Berechne die Anzahl Zeichen, die der User eingibt

/*------------------------------------------------------------------------------
  Funktion: kurztitel_zeichen_berechnen
------------------------------------------------------------------------------*/ 
function kurztitel_zeichen_berechnen()
{
	$("maxzeichen_kurztitel").innerHTML = maxLaenge;
	berechneZeichenKurztitel();
	Event.observe($("kurztitel"), "change", berechneZeichenKurztitel);
	Event.observe($("kurztitel"), "focus", berechneZeichenKurztitel);
	Event.observe($("kurztitel"), "keydown", berechneZeichenKurztitel);
	Event.observe($("kurztitel"), "keyup", berechneZeichenKurztitel);
    Field.focus("kurztitel");
}

function berechneZeichenKurztitel() 
{  
    if ($F("kurztitel").length > maxLaenge) 
    {
      $("kurztitel").value = $F("kurztitel").substring(0, maxLaenge);
      restlicheZeichen = 0;
    }
    else 
    {
      restlicheZeichen = maxLaenge - $F("kurztitel").length;
    }
    $("anzeige_kurztitel").innerHTML = restlicheZeichen;
}

/*------------------------------------------------------------------------------
  Funktion: zusatz_zeichen_berechnen
------------------------------------------------------------------------------*/ 
function zusatztext_zeichen_berechnen()
{
	$("maxzeichen_zusatztext").innerHTML = maxLaenge;
	berechneZeichenZusatztext("zusatztext");
	Event.observe($("zusatztext"), "change", berechneZeichenZusatztext);
	Event.observe($("zusatztext"), "focus", berechneZeichenZusatztext);
	Event.observe($("zusatztext"), "keydown", berechneZeichenZusatztext);
	Event.observe($("zusatztext"), "keyup", berechneZeichenZusatztext);
    Field.focus("zusatztext");
}

function berechneZeichenZusatztext() 
{  
    if ($F("zusatztext").length > maxLaenge) 
    {
      $("zusatztext").value = $F("zusatztext").substring(0, maxLaenge);
      restlicheZeichen = 0;
    }
    else 
    {
      restlicheZeichen = maxLaenge - $F("zusatztext").length;
    }
    $("anzeige_zusatztext").innerHTML = restlicheZeichen;
}


/* mit diesem Script werden sprachabhängige Texte im Edit-Formular nave_edit
 * ausgetauscht sobald die Sprache gewechselt wird 
 * dieses Script wird aus general_cmsadmin.js aufgerufen  */
function update_navi_edit_formular(iEditId,iLangu) {
  var lUrl = "../_controllers/navi_co_maintain.php"; 
  var lTarget = "texteLangu";
  var lParams = "action=replaceTexts&nav_id="+iEditId+"&langu_tra="+iLangu
  var myAjax = new Ajax.Updater(lTarget, lUrl, { 
    method: 'get',
    evalScript: true,
    parameters: lParams }
);
}

  /* Beim Klick auf die Checkbox für das Memberlogin wird neben der Checkbox
   * ein entsprechender Text angezeigt, damit der Benutzer weiss, ob das 
   * Memberlogin erforderlich ist. X = erforderlich, '' = nicht erforderlich  
   * ist das Login erforderlich wird es in fetter, grüner Schrift angezeigt */
function setMemberLoginText() {
  var lCheckbox = this.id;
  if (lCheckbox) {
    if (this.checked) { 
      $("memberLoginText").innerHTML = $("mlErforderlich").innerHTML; 
      $("memberLoginText").addClassName("success");
      this.value = 'X';
    } else {
      $("memberLoginText").innerHTML = $("mlNichtErforderlich").innerHTML;       
      $("memberLoginText").removeClassName("success");
      this.value = '';
    }
  }
  
}

// Events deklarieren
Event.observe($("memberLogin"), 'click', setMemberLoginText);

Event.observe(window, 'load', kurztitel_zeichen_berechnen);

Event.observe(window, 'load', zusatztext_zeichen_berechnen);

//]]>
