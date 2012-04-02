// cms - cmsadmin Javascript functions for the navigation pages
// Copyright (c) 2009 Roland Hempen (http://www.hempenweb.ch)

//<![CDATA[
/**********************************************************************************
*
* Events und Functions für Zeichenzähler 
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


// Events deklarieren
Event.observe(window, 'load', kurztitel_zeichen_berechnen);

Event.observe(window, 'load', zusatztext_zeichen_berechnen);

//]]>
