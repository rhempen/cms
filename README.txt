cms-by-hempenweb, ein leicht zu bedienendes CMS

[Changelog 2017]

Stand Mai 2017:
- Fehler beim Scandir in der Funktion neuer_ukap im Model navi_maintain.class.php
	der 2. Parameter $verzeichnisse muss als array() definiert werden, sonst wird das Verzeichnis zum 
	Ukap immer angelegt, was zum Verlust von bestehenden Dateien führt

- Erstellen einer neuen Funktion get_next_directory_for_ukap in der Klasse pictures_maintain.class.php 
	in dieser Funktion wird geprüft, ob das Verzeichnis gemäss bildpfad auf der Disk existiert oder nicht.
        Wenn NEIN, kann das entsprechende Verzeichnis angelegt werden, 
        wenn JA, wird das Verzeichnis mit der höchsten Nummer der entsprechenden Domain (zb. navi_11) gesucht und um 10 erhöht.
	Danach wird das neue Verzeichnis angelegt.

- Neuer Eintrag in der Datenbank / Tabelle cms_config: VERSION value = Aktuelle Version und ev. Datum
        Ausgabe dieser Information im cmsadmin unterhalb der Menuliste (Copyright)
        Anpassung der Funktion copyright() in /funcs/cmslogin.php


Februar 2017:
- Einbau der 2. Inhaltsspalte in die drei Templates:
    - rb_zweispaltig_360_360_tpl.html
    - rb_zweispaltig_480_240_180_tpl.html
    - rb_zweispaltig_480_240_348_tpl.html
  und ergänzen des CSS für CSS-Klasse  .inhalt2_container 

- Anpassung der Bildmasse für das rb_zweispaltig_480_240_348_tpl.html 
    - in der DB cms_templates von 348x348 zu 460x348
    - dazu muss ich in der Tabelle cms_spezial einen neuen Eintrag für das Template 360x360 machen 
- Überarbeiten der Dokumentation


Stand Januar 2017:
- Überarbeiten der Unterseiten-Funktionen
- Erneuerung der Javascript-Library Ligthbox für die Anzeige der Bilder
- Aktualisierung der Php-Resize-Funktion für Bilder wührend des Hochladens
- Anpassung der Controller-Datei pictures_co_maintain.php: 
	Zeile 200 ff: case 'upload_files': 
	Lesen des richtigen Templates für die Anzeige der richtigen Bildermasse im Screen Bild-Upload
- Überarbeiten der Dokumentation
- Anpassen der DB Tabelle navi_overview --> Typ des Feldes ukap von Tinyint (0-255) nach Smallint (0-65535)


Stand 12.03.2012:
- auf Seite Frontend vorbereitet f�r Mehrsprachigkeit (anzuzeigende Sprachen werden website-spezifisch in cms_spezial gespeichert
- Fehleingaben in der URL werden durch �berpr�fung der gespeicherten URL verhindert
- Klick auf das Logo führt bei Bedarf auf die 1. eingetragene Seite (gemäss Index in der Navigation)
- Unn�tige HTTP-Requests, ausgel�st durch jQuery und Niftycorners werden unterbunden. Perfomance-Verbesserung


Stand 30.12.2011:
- Kopierfunktion für Seiten der Hauptnavigation realisiert
- Navigationseinträge können nun mittels Drag&Drop verschoben werden (Sortable-Funktion von Scriptaculous)


Stand 16.12.2011:
Optimierung der Navigation ist vorl�ufig soweit gedeiht, dass alle bisherigen Websites
mit dieser Version einwandfrei laufen.
Es gibt in den HTML-Templates noch Optimierungspotential!!

nächste Entwicklung: Kopierfunktion f�r Menu-Eintr�ge und Seiten

Stand 15.11.2011:

Diese Version beinhaltet im Admin-Bereich die Funktion, von einer Website zur anderen zu wechseln.
Das betrifft alle Websites, welche mit dem vorliegenden CMS entwickelt wurden.
Mit dieser Funktion kann sicher gestellt werden, dass alle individuellen Websites innerhalb des CMS 
voll funktionsf�hg sind.

Nächste geplante Entwicklung: Mehrsprachigkeit --> Kopierfunktion geht vor!

rhe, 17.11.2011