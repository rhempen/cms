// cms - cmsadmin Javascript functions for the navigation pages
// Copyright (c) 2009 Roland Hempen (http://www.hempenweb.ch)

//<![CDATA[

/**********************************************************************************
*
* Events und Functions für Zeichenzähler 
*
/*********************************************************************************/

var maxLaengeKurztext = $("maxzeichen").innerHTML;
if (maxLaengeKurztext == 0)  maxLaengeKurztext = 150;
var maxLaengeName = 60;
// Berechne die Anzahl Zeichen, die der User eingibt
/*------------------------------------------------------------------------------
  Funktion: start_zeichen_berechnen --> Feld Kurztext
------------------------------------------------------------------------------*/ 
function start_zeichen_berechnen()
{
	$("maxzeichen").innerHTML = maxLaengeKurztext;
	berechneZeichen();
	Event.observe($("shortxt"), "change", berechneZeichen);
	Event.observe($("shortxt"), "focus", berechneZeichen);
	Event.observe($("shortxt"), "keydown", berechneZeichen);
	Event.observe($("shortxt"), "keyup", berechneZeichen);
    Field.focus("shortxt");
}
Event.observe(window, 'load', start_zeichen_berechnen);

function berechneZeichen() 
{  
    if ($F("shortxt").length > maxLaengeKurztext) 
    {
      $("shortxt").value = $F("shortxt").substring(0, maxLaengeKurztext);
      restlicheZeichen = 0 + "  (Sie haben alle Zeichen aufgebraucht!!)";
    }
    else 
    {
      restlicheZeichen = maxLaengeKurztext - $F("shortxt").length;
    }
    $("anzeige").innerHTML = restlicheZeichen;
}


/*------------------------------------------------------------------------------
  Funktion: name_zeichen_berechnen
------------------------------------------------------------------------------*/ 
function name_zeichen_berechnen()
{
	$("maxzeichen_name").innerHTML = maxLaengeName;
	berechneZeichenName();
	Event.observe($("name"), "change", berechneZeichenName);
	Event.observe($("name"), "focus", berechneZeichenName);
	Event.observe($("name"), "keydown", berechneZeichenName);
	Event.observe($("name"), "keyup", berechneZeichenName);
    Field.focus("name");
}
Event.observe(window, 'load', name_zeichen_berechnen);

function berechneZeichenName() 
{  
    if ($F("name").length > maxLaengeName) 
    {
      $("name").value = $F("name").substring(0, maxLaengeName);
      restlicheZeichen = 0;
    }
    else 
    {
      restlicheZeichen = maxLaengeName - $F("name").length;
    }
    $("anzeige_name").innerHTML = restlicheZeichen;
}

//]]>
