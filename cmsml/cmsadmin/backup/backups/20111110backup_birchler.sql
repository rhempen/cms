#----------------------------------------------
# Backup der Datenbank cms_birchler
# Erstellt am 10.11.2011 20:31
#----------------------------------------------



# ----------------------------------------------------------
#
# Struktur von Tabelle 'cms_config'
#
DROP TABLE IF EXISTS cms_config;
CREATE TABLE cms_config (
    id tinyint(3) unsigned NOT NULL auto_increment,
    category char(20) NOT NULL,
    param char(40) NOT NULL,
    value char(125) NOT NULL,
    alternative char(125),
    longvalue longtext,
   PRIMARY KEY (id),
   KEY custcategory (category)
);

#
# Daten von Tabelle 'cms_config'
#
INSERT INTO cms_config VALUES ("1","general","THEME","birchler",NULL,NULL);
INSERT INTO cms_config VALUES ("2","general","COPYRIGHT","birchler architektur",NULL,NULL);
INSERT INTO cms_config VALUES ("3","general","MAX_THUMBS","4",NULL,NULL);
INSERT INTO cms_config VALUES ("4","general","MAX_LIST_ITEMS","4",NULL,NULL);
INSERT INTO cms_config VALUES ("5","general","LANGUAGE","DE",NULL,NULL);
INSERT INTO cms_config VALUES ("10","menu","HMENU_RICHTUNG","left","right",NULL);
INSERT INTO cms_config VALUES ("11","menu","HMENU_SUBMENU","submenu","dropdown",NULL);
INSERT INTO cms_config VALUES ("20","pictures","THUMB_PAGE_MAX_WIDTH","98",NULL,NULL);
INSERT INTO cms_config VALUES ("21","pictures","THUMB_PAGE_MAX_HEIGHT","98",NULL,NULL);
INSERT INTO cms_config VALUES ("22","pictures","THUMB_NAVI_MAX_WIDTH","358",NULL,NULL);
INSERT INTO cms_config VALUES ("23","pictures","THUMB_NAVI_MAX_HEIGHT","358",NULL,NULL);
INSERT INTO cms_config VALUES ("24","pictures","IMAGE_MAX_WIDTH","960",NULL,NULL);
INSERT INTO cms_config VALUES ("25","pictures","IMAGE_MAX_HEIGHT","480",NULL,NULL);
INSERT INTO cms_config VALUES ("14","menu","SMURL","ja","nein",NULL);
INSERT INTO cms_config VALUES ("13","menu","SUBNAV_SOFORT","ja","nein",NULL);
INSERT INTO cms_config VALUES ("7","general","TEMPLATE_DIR","frontend/themes/birchler/tpl",NULL,"");
INSERT INTO cms_config VALUES ("15","menu","SMURL_REFRESH","ausf&uuml;hren","",NULL);
INSERT INTO cms_config VALUES ("12","menu","SUBMENU_DIR","vertikal","horizontal",NULL);
INSERT INTO cms_config VALUES ("6","general","EMAIL_RECEIVER","info@birchler-architektur.ch",NULL,NULL);
INSERT INTO cms_config VALUES ("32","meta-tags","KEYWORDS","webdesign, php, html, xhtml, javascript, Zürich, Hempen, Roland Hempen, hempenweb",NULL,"Birchler, Architekt, Architektur, Einsiedeln");
INSERT INTO cms_config VALUES ("33","meta-tags","DESCRIPTION","hempenWeb ist eine kleine feine Internetagentur, die es sich zur Aufgabe macht, Ihren Internetauftritt individuell und einmal",NULL,"Ruedi Birchler Architekt ETH/SIA, Allmeindstrasse 17, 8840 Einsiedeln");
INSERT INTO cms_config VALUES ("34","meta-tags","PAGE_TOPIC","Webdesign, WebProgrammer, Php, Internetagentur, Zürich",NULL,"Architektur, Bauten, Lincoln, Brüel, Linsi, Energieberatung, ");
INSERT INTO cms_config VALUES ("35","meta-tags","PUBLISHER","Roland Hempen, WebPublisher, WebProgrammer Php, www.hempenweb.ch, Marianne Mathys, Grafik, Design, Zürich",NULL,"Roland Hempen, WebPublisher, WebProgrammer Php, hempenweb, Marianne Mathys, Grafik, Design, Zürich");
INSERT INTO cms_config VALUES ("26","pictures","DISK_DB_ADJUSTMENT","ausf&uuml;hren",NULL,NULL);
INSERT INTO cms_config VALUES ("8","general","GOOGLE_ANALYTICS","UA-10022482-1",NULL,NULL);
INSERT INTO cms_config VALUES ("36","pictures","MEDIA_ROOT_ADJUSTMENT","ausf&uuml;hren",NULL,NULL);



# ----------------------------------------------------------
#
# Struktur von Tabelle 'cms_fragmente'
#
DROP TABLE IF EXISTS cms_fragmente;
CREATE TABLE cms_fragmente (
    frag_id tinyint(3) unsigned NOT NULL,
    name char(25),
    sort_id tinyint(3) unsigned NOT NULL,
    content longtext,
   PRIMARY KEY (frag_id)
);

#
# Daten von Tabelle 'cms_fragmente'
#
INSERT INTO cms_fragmente VALUES ("1","teaser1","1","<div>
<h2 style=\"text-align: center;\">Teaser 1</h2>
<p class=\"teasertext\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi bibendum odio non augue auctor elementum rhoncus purus posuere. Praesent consequat urna ut odio dignissim eu porttitor felis congue. Suspendisse at ornare lectus. Vivamus ut odio eu ipsum porta egestas. Sed tincidunt tellus vitae quam sodales ac malesuada urna tempus. Suspendisse vel sapien justo, vitae hendrerit quam. Vestibulum quis enim enim. Sed rutrum lacinia augue, ac tristique odio rhoncus a. In quis erat nibh, sed rutrum magna. Nulla interdum, nisi at viverra molestie, nulla ligula fermentum lacus, ac volutpat quam lacus consequat erat. Integer nec ipsum aliquet lorem vestibulum hendrerit. </p>
</div>");
INSERT INTO cms_fragmente VALUES ("3","teaser2","2","<h2>Erbsensuppe</h2>
<p class=\"teasertext\"><img src=\"/beta/cms/media_birchler/navi_056/_thumbs/th_home_2.png\" alt=\"\" width=\"480\" height=\"90\" /> <br />Bouillon aufkochen. Erbsen beigeben, ca. 5 Minuten köcheln lassen. Pro Person 1 EL Erbsen herausnehmen und beiseite stellen. Suppe fein pürieren. Mit der Hälfte der Crème fraîche verfeinern und aufkochen. Butter und Mehl mit einer Gabel verkneten und in die kochende Suppe einrühren. Mit Salz und Pfeffer pikant würzen.</p>");
INSERT INTO cms_fragmente VALUES ("5","footer","3","                                    <div id=\"impressum\">
                                         <ul>
		          <li class=\"title\">Impressum</li>
		          <li>Roland Hempen</li>
		          <li>hempenweb.ch</li>
		          <li>8055 Z&uuml;rich</li>
		        </ul>
		      </div>
			  <div id=\"servlinks\">
			    <ul>
			      <li class=\"title\">Servicelinks</li>
			      <li><a href=\"home\">Home</a></li>
			      <li><a href=\"kontakt\">Kontakt</a></li>
			      <li><a href=\"sitemap\">Sitemap</a></li>
			    </ul>
	          </div>
			  <div id=\"reflinks\">
			    <ul>
			      <li class=\"title\">Portfolio</li>
			      <li><a target=\"_blank\" href=\"http://www.physio-allschwil.ch\" onmouseover=\"javascript:showRefPic(1);\" onmouseout=\"javascript:$(\'refpics\').hide();\">phyio-allschwil.ch</a></li>
			      <li><a target=\"_blank\" href=\"http://www.birchler-architektur.ch\" onmouseover=\"javascript:showRefPic(2);\" onmouseout=\"javascript:$(\'refpics\').hide();\">birchler-architektur.ch</a></li>
			      <li><a target=\"_blank\" href=\"http://www.gigijacquier.ch\" onmouseover=\"javascript:showRefPic(3);\" onmouseout=\"javascript:$(\'refpics\').hide();\">gigijacquier.ch</a></li>
			      <li><a target=\"_blank\" href=\"http://www.art4art.ch\" onmouseover=\"javascript:showRefPic(4);\" onmouseout=\"javascript:$(\'refpics\').hide();\">art4art.ch</a></li>
			      <li><a target=\"_blank\" href=\"http://www.orasch.ch\" onmouseover=\"javascript:showRefPic(5);\" onmouseout=\"javascript:$(\'refpics\').hide();\">orasch.ch</a></li>
			      <li><a target=\"_blank\" href=\"http://www.physio-steiner.ch\" onmouseover=\"javascript:showRefPic(6);\" onmouseout=\"javascript:$(\'refpics\').hide();\">phyio-steiner.ch</a></li>
			      <li><a target=\"_blank\" href=\"http://www.raku.ch\" onmouseover=\"javascript:showRefPic(7);\" onmouseout=\"javascript:$(\'refpics\').hide();\">raku.ch</a></li>
			    </ul>
			  </div>
			  <div id=\"refpics\" style=\"display:none;\">
			    <img id=\"refpic\" src=\"media/footer/th_physio-allschwil.png\">
			  </div>
");



# ----------------------------------------------------------
#
# Struktur von Tabelle 'cms_galerien'
#
DROP TABLE IF EXISTS cms_galerien;
CREATE TABLE cms_galerien (
    id smallint(6) unsigned NOT NULL auto_increment,
    ref_id smallint(6) unsigned NOT NULL,
    sortkey tinyint(3) unsigned NOT NULL,
    type char(1),
    bildpfad varchar(125) NOT NULL,
    kommentar tinytext,
   PRIMARY KEY (id),
   KEY refid (ref_id)
);

#
# Daten von Tabelle 'cms_galerien'
#
INSERT INTO cms_galerien VALUES ("551","140","1","P","../../media_birchler/navi_110001/_images/bauten_2.png",NULL);
INSERT INTO cms_galerien VALUES ("536","55","4","N","../../media_birchler/navi_11_10/_images/lincoln_ansicht_s.jpg","Ansicht Süd");
INSERT INTO cms_galerien VALUES ("537","55","2","N","../../media_birchler/navi_11_10/_images/lincoln_gaerten.jpg","Gärten");
INSERT INTO cms_galerien VALUES ("520","56","1","N","../../media_birchler/navi_056/_images/home_2.png",NULL);
INSERT INTO cms_galerien VALUES ("535","55","1","N","../../media_birchler/navi_11_10/_images/lincoln_ansicht_no.jpg","Ansicht Nord");
INSERT INTO cms_galerien VALUES ("472","51","2","N","../../media_birchler/navi_12/_images/home_1.png","Siedlung Lincoln in Einsiedeln beim Friedhof");
INSERT INTO cms_galerien VALUES ("497","51","1","N","../../media_birchler/navi_12/_images/home_2.png","Diverse Ansichten auf Bauten in Einsiedeln");
INSERT INTO cms_galerien VALUES ("498","57","1","N","../../media_birchler/navi_11_20/_images/bauten_1.png",NULL);
INSERT INTO cms_galerien VALUES ("499","57","2","N","../../media_birchler/navi_11_20/_images/bauten_2.png",NULL);
INSERT INTO cms_galerien VALUES ("500","57","3","N","../../media_birchler/navi_11_20/_images/bauten_3.png",NULL);
INSERT INTO cms_galerien VALUES ("538","55","3","N","../../media_birchler/navi_11_10/_images/lincoln_zwischenraum.jpg","Zwischenraum");
INSERT INTO cms_galerien VALUES ("539","58","1","N","../../media_birchler/navi_11_30/_images/linsi_aussenansicht.jpg",NULL);
INSERT INTO cms_galerien VALUES ("540","58","2","N","../../media_birchler/navi_11_30/_images/linsi_treppe.jpg",NULL);
INSERT INTO cms_galerien VALUES ("541","59","1","N","../../media_birchler/navi_11_40/_images/bruel_aussenansicht.jpg","Brüel Aussenansicht");
INSERT INTO cms_galerien VALUES ("548","142","2","P","../../media_birchler/navi_110003/_images/bauten_3.png",NULL);
INSERT INTO cms_galerien VALUES ("510","52","1","N","../../media_birchler/navi_14/_images/impressum_1.png",NULL);
INSERT INTO cms_galerien VALUES ("550","141","1","P","../../media_birchler/navi_110002/_images/bauten_1.png",NULL);
INSERT INTO cms_galerien VALUES ("555","41","1","N","../../media_birchler/navi_07/_images/teambirchler.jpg","Team Birchler-Architektur, Einsiedeln");
INSERT INTO cms_galerien VALUES ("542","59","6","N","../../media_birchler/navi_11_40/_images/bruel_schulzimmer2.jpg","2.Schulzimmer");
INSERT INTO cms_galerien VALUES ("543","59","3","N","../../media_birchler/navi_11_40/_images/bruel_korridor.jpg","Korridor");
INSERT INTO cms_galerien VALUES ("544","59","4","N","../../media_birchler/navi_11_40/_images/bruel_saal.jpg","Saal");
INSERT INTO cms_galerien VALUES ("545","59","2","N","../../media_birchler/navi_11_40/_images/bruel_treppenhaus.jpg","Treppenhaus");
INSERT INTO cms_galerien VALUES ("546","59","5","N","../../media_birchler/navi_11_40/_images/bruel_schulzimmer.jpg","1.Schulzimmer");
INSERT INTO cms_galerien VALUES ("547","54","1","N","../../media_birchler/navi_13/_images/plan_birchler.png",NULL);
INSERT INTO cms_galerien VALUES ("552","142","3","P","../../media_birchler/navi_110003/_images/lincoln_gaerten.jpg",NULL);
INSERT INTO cms_galerien VALUES ("553","142","1","P","../../media_birchler/navi_110003/_images/lincoln_zwischenraum.jpg",NULL);
INSERT INTO cms_galerien VALUES ("554","142","4","P","../../media_birchler/navi_110003/_images/lincoln_ansicht_no.jpg",NULL);



# ----------------------------------------------------------
#
# Struktur von Tabelle 'cms_modules'
#
DROP TABLE IF EXISTS cms_modules;
CREATE TABLE cms_modules (
    module_id tinyint(3) unsigned NOT NULL auto_increment,
    module_name varchar(40) NOT NULL,
    module_descr varchar(125),
   PRIMARY KEY (module_id)
);

#
# Daten von Tabelle 'cms_modules'
#
INSERT INTO cms_modules VALUES ("2","KONTAKTFORMULAR","Kontaktformular");
INSERT INTO cms_modules VALUES ("1","PAGES_OVERVIEW","Unterseiten zur aktuellen Menuposition auflisten");
INSERT INTO cms_modules VALUES ("3","SITEMAP","Sitemap");



# ----------------------------------------------------------
#
# Struktur von Tabelle 'cms_navigation'
#
DROP TABLE IF EXISTS cms_navigation;
CREATE TABLE cms_navigation (
    nav_id smallint(6) NOT NULL auto_increment,
    domain varchar(10),
    kap tinyint(3) unsigned DEFAULT "0" NOT NULL,
    ukap tinyint(3) unsigned DEFAULT "0" NOT NULL,
    bezeichnung varchar(40) NOT NULL,
    kuerzel varchar(20) NOT NULL,
    bildpfad varchar(125),
    aktiv enum('j','n') DEFAULT "j" NOT NULL,
    start enum('j','n') DEFAULT "n",
    nav_type set('','S','H','V') NOT NULL,
   PRIMARY KEY (nav_id),
   KEY domain (domain)
);

#
# Daten von Tabelle 'cms_navigation'
#
INSERT INTO cms_navigation VALUES ("53","navi_11","3","0","Bauten","Bauten","navi_11","j","n","H");
INSERT INTO cms_navigation VALUES ("54","navi_13","5","0","Kontakt","Kontakt","navi_13","j","n","H");
INSERT INTO cms_navigation VALUES ("41","navi_07","2","0","Über uns","Überuns","navi_07","j","n","H");
INSERT INTO cms_navigation VALUES ("55","navi_11","3","20","Siedlung Lincoln","SiedlungLincoln","navi_11_10","j","n","");
INSERT INTO cms_navigation VALUES ("44","navi_10","4","0","Energieberatung","Energieberatung","navi_10","n","n","H");
INSERT INTO cms_navigation VALUES ("52","navi_11","7","0","Impressum","Impressum","navi_14","j","n","H");
INSERT INTO cms_navigation VALUES ("51","navi_12","1","0","Home","Home","navi_12","j","j","H");
INSERT INTO cms_navigation VALUES ("56","navi_056","6","0","Links","Links","navi_056","j","n","H");
INSERT INTO cms_navigation VALUES ("57","navi_11","3","40","Reformierte Kirche","ReformierteKirche","navi_11_20","n","n","");
INSERT INTO cms_navigation VALUES ("58","navi_11","3","30","MFH Linsi","MFHLinsi","navi_11_30","j","n","");
INSERT INTO cms_navigation VALUES ("59","navi_11","3","10","Schulhaus Brüel","SchulhausBrüel","navi_11_40","j","n","");
INSERT INTO cms_navigation VALUES ("60","navi_11","3","50","Neus EFH","NeusEFH","navi_11_50","n","n","");



# ----------------------------------------------------------
#
# Struktur von Tabelle 'cms_pages'
#
DROP TABLE IF EXISTS cms_pages;
CREATE TABLE cms_pages (
    page_id smallint(6) unsigned NOT NULL auto_increment,
    nav_id smallint(6) unsigned NOT NULL,
    domain char(10) NOT NULL,
    kennzeichen char(15) NOT NULL,
    name varchar(125) NOT NULL,
    fach char(20) NOT NULL,
    datum_von datetime,
    datum_bis datetime,
    kurztext text,
    langtext longtext,
    inhalt2 longtext,
    template tinyint(3) unsigned,
    bild1 varchar(125),
    bild2 varchar(125),
    galerie enum('n','a','b') DEFAULT "a" NOT NULL,
    linkid1 smallint(6) unsigned,
    linkid2 smallint(6) unsigned,
    aktiv enum('j','n'),
    sort_id tinyint(3) unsigned NOT NULL,
   PRIMARY KEY (page_id),
   KEY navid (nav_id),
   KEY domain (domain)
);

#
# Daten von Tabelle 'cms_pages'
#
INSERT INTO cms_pages VALUES ("140","53","navi_11","navi_110001","Brücke über die Sihl","Bauten","2009-01-31 00:00:00","2010-10-10 00:00:00","Überdachte Holzbrücke über die Sihl in der Nähe von Einsiedeln","<p>Adipiscing Donec at eros malesuada lorem non Duis id In eu. Suscipit augue In semper euismod Curabitur ut pede turpis Curabitur risus. Nec fermentum nulla Vestibulum at ipsum sem tempor velit nisl Pellentesque. Elit ultrices dis tempor nec amet lacus ullamcorper pede auctor pellentesque. Quisque Nulla nunc Quisque risus augue eu nec laoreet ante auctor. Massa convallis tellus sed congue nibh Curabitur purus.<br /><br />Adipiscing Donec at eros malesuada lorem non Duis id In eu. Suscipit augue In semper euismod Curabitur ut pede turpis Curabitur risus. Nec fermentum nulla Vestibulum at ipsum sem tempor velit nisl Pellentesque. Elit ultrices dis tempor nec amet lacus ullamcorper pede auctor pellentesque. Quisque Nulla nunc Quisque risus augue eu nec laoreet ante auctor. Massa convallis tellus sed congue nibh Curabitur purus.<br /><br />Adipiscing Donec at eros malesuada lorem non Duis id In eu. Suscipit augue In semper euismod Curabitur ut pede turpis Curabitur risus. Nec fermentum nulla Vestibulum at ipsum sem tempor velit nisl Pellentesque. Elit ultrices dis tempor nec amet lacus ullamcorper pede auctor pellentesque. Quisque Nulla nunc Quisque risus augue eu nec laoreet ante auctor. Massa convallis tellus sed congue nibh Curabitur purus.</p>","","11","../../media_birchler/navi_110001/_thumbs/th_bauten_2.png","","n","0","0","n","3");
INSERT INTO cms_pages VALUES ("141","53","navi_11","navi_110002","Einfamilienhaus","Bauten","2009-07-01 00:00:00","2011-12-31 00:00:00","Einfamilienhaus,Einsiedeln, nach dem Minergiestandard erbaut","<p>Die Vermietung der Wohnungen wurde schwieriger und gelang nur mit dem Versprechen, eine Küche zu sanieren. Daraus ergab sich der Ersatz aller Küchen und Bäder und eine energetische Sanierung im Minergie-Standard. Mit gezielten Eingriffen wurden Verbesserungen angebracht, ohne die Grundrisse mit dem idealen Wohnungsmix zu verändern. Das enge und dunkle Treppenhaus wurde bis auf die Fassadenflucht mit verglasten Podesten erweitert und mit grossen Fenstern geöffnet. Den giebelseitigen Wohnungen wurde ein Estrichraum zugeschlagen. In der strassenseitigen 4-1/2-Zimmer-Wohnung in Form eines zusätzlichen Zimmers, in der seeseitigen 5-1/2-Zimmer mit einer Galerie. Die Küchen der grossen Wohnungen wurden zum Korridor hin geöffnet und mit einer breiten Schiebetür versehen, was beiden Räumen Weite und Tageslicht bringt. Generell sollte die äussere Erscheinung etwa gleich bleiben, um zusammen mit zwei gleichzeitig erbauten</p>","","12","../../media_birchler/navi_110002/_thumbs/th_bauten_1.png","","n","0","0","n","1");
INSERT INTO cms_pages VALUES ("142","53","navi_11","navi_110003","Mehrfamilienhaus","Bauten","2009-01-31 00:00:00","2011-10-10 00:00:00","Die Siedlung Lincoln liegt nordöstlich vom Ortskern Einsiedeln in einer lockeren Baustruktur...","<p style=\"text-align: left;\">Die Siedlung Lincoln liegt nordöstlich vom Ortskern Einsiedeln in einer lockeren Baustruktur. Die Erschliessung vom Lincolnweg in die Tiefe des Grundstückes gleicht der bestehenden Ordnung, ebenso das Höhenniveau der neuen Gebäude. Die Siedlung vereint 6 Reiheneinfamilienhäuser und ein Mehrfamilienhaus mit 7 Wohnungen. In der grossen Gesamtform finden 13 verschieden grosse und massgeschneiderte Wohnungen Platz. Die verdichtete Bauweise erlaubt eine Differenzierung des Aussenraums in kleinere private und grosszügige halböffentliche Freiflächen. Die Gebäudestruktur richtet sich in einer NO/SW Lage aus. Die Gebäude werden über die Nordostseite erschlossen, was eine Anordnung der privaten Gärten auf der Südwestseite erlaubt, mit Blick auf das Kloster, den Ort Einsiedeln und in das Alpthal. Die Häuser wurden in Massivbauweise errichtet und mit einer Holzschalung bekleidet. Raumhohe Fensteröffnungen gestalten die Fassade.</p>","","13","../../media_birchler/navi_110003/_thumbs/th_lincoln_zwischenraum.jpg","../../media_birchler/navi_110003/_thumbs/th_lincoln_ansicht_no.jpg","b","141","140","n","2");



# ----------------------------------------------------------
#
# Struktur von Tabelle 'cms_redirect'
#
DROP TABLE IF EXISTS cms_redirect;
CREATE TABLE cms_redirect (
    id smallint(5) unsigned NOT NULL auto_increment,
    navid tinyint(3) unsigned NOT NULL,
    subid tinyint(3) unsigned NOT NULL,
    pagid tinyint(3) unsigned NOT NULL,
    kuerzel char(20) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE pagid (navid, subid, pagid)
);

#
# Daten von Tabelle 'cms_redirect'
#
INSERT INTO cms_redirect VALUES ("1","51","0","0","home");
INSERT INTO cms_redirect VALUES ("2","41","0","0","ueber_uns");
INSERT INTO cms_redirect VALUES ("3","53","0","0","bauten");
INSERT INTO cms_redirect VALUES ("4","53","59","0","schulhaus_brueel");
INSERT INTO cms_redirect VALUES ("5","53","55","0","siedlung_lincoln");
INSERT INTO cms_redirect VALUES ("6","53","58","0","mfh_linsi");
INSERT INTO cms_redirect VALUES ("7","53","57","0","reformierte_kirche");
INSERT INTO cms_redirect VALUES ("8","53","60","0","neus_efh");
INSERT INTO cms_redirect VALUES ("9","44","0","0","energieberatung");
INSERT INTO cms_redirect VALUES ("10","54","0","0","kontakt");
INSERT INTO cms_redirect VALUES ("11","56","0","0","links");
INSERT INTO cms_redirect VALUES ("12","52","0","0","impressum");



# ----------------------------------------------------------
#
# Struktur von Tabelle 'cms_seiten'
#
DROP TABLE IF EXISTS cms_seiten;
CREATE TABLE cms_seiten (
    seiten_id smallint(6) NOT NULL auto_increment,
    nav_id smallint(6) DEFAULT "0" NOT NULL,
    nummer tinyint(4) DEFAULT "0" NOT NULL,
    kurztitel varchar(60),
    zusatztext varchar(60),
    template tinyint(3) DEFAULT "1" NOT NULL,
    modul tinyint(3) unsigned DEFAULT "0" NOT NULL,
    inhalt1 text NOT NULL,
    inhalt2 text NOT NULL,
    bild1 varchar(125),
    galerie enum('n','a','b') DEFAULT "n",
   PRIMARY KEY (seiten_id)
);

#
# Daten von Tabelle 'cms_seiten'
#
INSERT INTO cms_seiten VALUES ("56","56","1","Links",NULL,"12","0","<ul>
<li><a title=\"hempenweb die kleine feine Internetagentur\" href=\"http://www.hempenweb.ch\" target=\"_blank\">hempenweb die kleine feine Internetagentur</a></li>
</ul>","","../../media_birchler/navi_056/_thumbs/th_home_2.png","n");
INSERT INTO cms_seiten VALUES ("53","53","1","Bauten",NULL,"12","0","","",NULL,"n");
INSERT INTO cms_seiten VALUES ("55","55","1","Siedlung Lincoln, Einsiedeln Neubau 2007",NULL,"11","0","<p style=\"text-align: left;\">Die Siedlung Lincoln liegt nordöstlich vom Ortskern Einsiedeln in einer lockeren Baustruktur. Die Erschliessung vom Lincolnweg in die Tiefe des Grundstückes gleicht der bestehenden Ordnung, ebenso das Höhenniveau der neuen Gebäude. Die Siedlung vereint 6 Reiheneinfamilienhäuser und ein Mehrfamilienhaus mit 7 Wohnungen. In der grossen Gesamtform finden 13 verschieden grosse und massgeschneiderte Wohnungen Platz. Die verdichtete Bauweise erlaubt eine Differenzierung des Aussenraums in kleinere private und grosszügige halböffentliche Freiflächen. Die Gebäudestruktur richtet sich in einer NO/SW Lage aus. Die Gebäude werden über die Nordostseite erschlossen, was eine Anordnung der privaten Gärten auf der Südwestseite erlaubt, mit Blick auf das Kloster, den Ort Einsiedeln und in das Alpthal. Die Häuser wurden in Massivbauweise errichtet und mit einer Holzschalung bekleidet. Raumhohe Fensteröffnungen gestalten die Fassade.</p>","","../../media_birchler/navi_11_10/_thumbs/th_lincoln_ansicht_s.jpg","b");
INSERT INTO cms_seiten VALUES ("51","51","1","Home","Das ist die Homeseite","14","0","<p>Allmeindstrasse 17<br />8840 Einsiedeln<br /><br /><a href=\"mailto:info@birchler-architektur.ch\">info@birchler-architektur.ch</a></p>","","../../media_birchler/navi_12/_thumbs/th_home_2.png","n");
INSERT INTO cms_seiten VALUES ("52","52","1","Impressum",NULL,"12","0","<p><strong>Betreiber &amp; Inhalt </strong><br />Architekturbüro Ruedi Birchler, Einsiedeln<br /><a href=\"mailto:info@birchler-architektur.ch \">info@birchler-architektur.ch</a></p>
<p><a title=\"Homepage Birchler Architektur\" href=\"http://www.birchler-architektur.ch \" target=\"_blank\">www.birchler-architektur.ch<br /></a></p>
<p>&nbsp;<br /><strong>Gestaltung &amp; Design<br /></strong>Marianne Mathys, Zürich<br /><a href=\"mailto:marianne_mathys@bluewin.ch\">marianne_mathys@bluewin.ch</a></p>
<p><br /><strong>Programmierung<br /></strong>Roland Hempen, Zürich <br /><a title=\"hempenweb - die kleine feine Internetagentur\" href=\"http://www.hempenweb.ch\" target=\"_blank\">www.hempenweb.ch</a></p>
<p style=\"text-align: left;\"><br /><strong>Haftungsausschluss</strong><br />Der Inhalt dieser Webseiten wird mit grösstmöglicher Sorgfalt gepflegt. Trotzdem wird für den Inhalt keine Haftung übernommen. Druckfehler, Irrtümer und Änderungen vorbehalten. Der Inhalt ist urheberrechtlich geschützt. Das gilt sowohl für die Texte, als auch für die Bilder.<br />Für die Inhalte externer Links übernehmen wir keine Haftung. Für den Inhalt der verlinkten Seiten sind ausschliesslich deren Betreiber verantwortlich.</p>
<p>&nbsp;</p>
<p>&nbsp;</p>","","../../media_birchler/navi_14/_thumbs/th_impressum_1.png","n");
INSERT INTO cms_seiten VALUES ("54","54","1","Kontakt",NULL,"11","0","<p>Wir freuen uns über Ihre Kontaktaufnahme und werden uns so schnell als möglich mit Ihnen in Verbindung setzen. Senden Sie uns Ihre Anfrage mittels untenstehendem Link.<br />Vielen Dank, Ihr Birchler-Architektur-Team</p>
<p>&nbsp;</p>
<p><span class=\"detailname\">Ruedi Birchler dipl. Architekt ETH/SIA</span><br />
                Allmeindstrasse 17<br />
                 
																    8840 Einsiedeln</p>
<p><strong>Telefon:&nbsp; 055 412 77 17</strong></p>
<p class=\"detail_inline\"> <strong>Fax:&nbsp; 055  412 54 03</strong></p>
<p>&nbsp;</p>
<p class=\"info_url\"><a title=\"Main an Birchler-Architektur\" href=\"mailto:info@birchler-architektur.ch\">info@birchler-architektur.ch</a></p>
<p> <a href=\"http://www.birchler-architektur.ch\" target=\"_self\">www.birchler-architektur.ch</a></p>","","../../media_birchler/navi_13/_thumbs/th_plan_birchler.png","b");
INSERT INTO cms_seiten VALUES ("41","41","1","Über uns",NULL,"12","0","<ul>
<li><strong><a title=\"Mail an Lukas Hasler senden\" href=\"mailto:l.hasler@birchler-architektur.ch\">Lukas Hasler</a></strong>, Bachelor of Arts in Architecture</li>
<li><strong><a title=\"Mail an Ruedi Birchler senden\" href=\"mailto:r.birchler@birchler-architektur.ch\">Ruedi Birchler</a>,</strong> dipl. Architekt ETH/SIA</li>
<li><a title=\"Mail an Conradin Landolt senden\" href=\"mailto:c.landolt@birchler-architektur.ch\">Conradin Landolt</a>, Lernender Hochbauzeichner</li>
<li><a title=\"Mail an Jörg Reding senden\" href=\"mailto:j.reding@birchler-architektur.ch\">Jörg Reding</a>, Hochbauzeichner, Bauleiter</li>
</ul>","","../../media_birchler/navi_07/_thumbs/th_teambirchler.jpg","n");
INSERT INTO cms_seiten VALUES ("44","44","1","Energieberatung",NULL,"12","0","","",NULL,"n");
INSERT INTO cms_seiten VALUES ("57","57","1",NULL,NULL,"13","0","<p>Die evangelisch-reformierte Kirchgemeinde Einsiedeln ist eine Diasporagemeinde und eine der wenigen Kirchgemeinden, deren Mitgliederzahl kontinuierlich wächst. Dies führt zu weiterem Raumbedarf. Aus Kostengründen musste der Bau eines neuen Kirchgemeindezentrums mit grosszügigem Saal aufgegeben werden. Mit dem Anbau eines Kirchgemeindehauses an die Kirche, wurden deren Nutzungs-Möglichkeiten optimiert und für die Jugend und den Unterricht zusätzliche Räume geschaffen. Die Anordnung der Küche auf dem Niveau des Festplatzes und der Kirche, eine Erweiterungsmöglichkeit der Kirche und eine vollständige Behinderten-<br />Gängigkeit waren von Priorität. Die Kirche steht unter Denkmalschutz und konnte in ihrer Substanz erhalten werden. Zusammen mit dem Pfarrhaus und dem Neubau bildet sie um einen attraktiven Innenhof ein Ensemble. Auf drei unterschiedlichen Niveaus befinden sich der Vorplatz, der Pfarrgarten und der Festplatz der Kirche. Die in der Mitte gelegene Kirche behält ihre dominierende Stellung und wird mit dem neuen Zugang vom Schlüsselmattweg aufgewertet.<br />Im ersten Geschoss des Neubaus sind die Jugendräume angeordnet. Im zweiten befinden sich die Unterrichtsräume in verschiedenen Grössen. Der grösste Raum dient als Cafeteria, Kirchgemeindesaal und Erweiterung der Kirche.</p>","","../../media_birchler/navi_11_20/_thumbs/th_bauten_1.png","b");
INSERT INTO cms_seiten VALUES ("60","60","1","Neus EFH",NULL,"11","0","<h1>kljadflkja </h1>
<h2>ölasdöla</h2>
<h2>ljkadf</h2>","",NULL,"n");
INSERT INTO cms_seiten VALUES ("58","58","1","MFH Linsi, Thalwil, Minergiesanierung 2003",NULL,"11","0","<p>Die Vermietung der Wohnungen wurde schwieriger und gelang nur mit dem Versprechen, eine Küche zu sanieren. Daraus ergab sich der Ersatz aller Küchen und Bäder und eine energetische Sanierung im Minergie-Standard. Mit gezielten Eingriffen wurden Verbesserungen angebracht, ohne die Grundrisse mit dem idealen Wohnungsmix zu verändern. Das enge und dunkle Treppenhaus wurde bis auf die Fassadenflucht mit verglasten Podesten erweitert und mit grossen Fenstern geöffnet. Den giebelseitigen Wohnungen wurde ein Estrichraum zugeschlagen. In der strassenseitigen 4-1/2-Zimmer-Wohnung in Form eines zusätzlichen Zimmers, in der seeseitigen 5-1/2-Zimmer mit einer Galerie. Die Küchen der grossen Wohnungen wurden zum Korridor hin geöffnet und mit einer breiten Schiebetür versehen, was beiden Räumen Weite und Tageslicht bringt. Generell sollte die äussere Erscheinung etwa gleich bleiben, um zusammen mit zwei gleichzeitig erbauten Nachbargebäuden weiterhin ein Ensemble zu bilden, ohne jedoch die Modernisierung zu verstecken. Das in seiner Grundsubstanz solide und gut erhaltene Gebäude wurde mit einer 18cm dicken verputzten Mineralwolldämmung versehen. Die schmalen und auskragenden Balkone wurden abgefräst und auf der Südseite mit neuen, grösseren ersetzt. Es wurden neue Monobloc-Fenster eingesetzt, welche bei optimaler Dämmung von Leibung und Rahmen keinen Glaslichtverlust bringen. <br />Zum Minergie-Standard gehört auch die Komfortlüftung, die an der Zürcherstrasse auch aus Schallschutzgründen sinnvoll ist. Das Lüftungsgerät ist im Estrich platziert, die Abluft wird über teils alte, teils neue Kanäle aus den Nasszellen geführt. Die Zuluft wird über die Fassade in die Schlaf- und Wohnräume geblasen. Das Gebäude wurde im Betrieb, das heisst ohne Umzug der Bewohner saniert.</p>","","../../media_birchler/navi_11_30/_thumbs/th_linsi_aussenansicht.jpg","b");
INSERT INTO cms_seiten VALUES ("59","59","1","Schulhaus Brüel, Einsiedeln  Renovation & Modernisierung 05",NULL,"11","0","<p>Das Schulhaus Brüel ist das grosszügigste profane Gebäude in der Umgebung von Einsiedeln. Es dokumentiert eindrücklich die Bedeutung der Volksschule im ausgehenden 19. Jahrhundert. Aufgrund der grosszügigen räumlichen Konzeption und der, in seiner Grundstruktur sehr guten Bausubstanz kann dieses Haus der Schule durchaus weitere 100 Jahre dienen. 34 Jahre nach der letzten Gesamtsanierung wurde das Haus sanft renoviert und in Bezug auf die schulischen Einrichtungen modernisiert. Dach, Fassade, Treppenhaus und Aula wurden in enger Zusammenarbeit mit der Denkmalpflege nahe der historischen Fassung restauriert. Die Schulzimmer wurden gemäss den Bedürfnissen der Schule erneuert, d.h. mit Akustikdecken und zeitgemässen Einrichtungen versehen. Die grossen Korridore wurden mit einer Glaswand vom Treppenhaus abgetrennt und dienen nun nicht nur als Garderobe, sondern auch als Gruppenraum für die zwei dahinter liegenden Schulzimmer. Die Gruppenräume bilden den Übergang vom historischen Treppenhaus zu den modernen Schulzimmern. Mit dem Einbau eines Liftes wurde das gesamte Schulhaus rollstuhlgängig.</p>
<p>&nbsp;</p>","","../../media_birchler/navi_11_40/_thumbs/th_bruel_aussenansicht.jpg","b");



# ----------------------------------------------------------
#
# Struktur von Tabelle 'cms_spezial'
#
DROP TABLE IF EXISTS cms_spezial;
CREATE TABLE cms_spezial (
    thema char(40) NOT NULL,
    name char(25) NOT NULL,
    wert1 char(25) NOT NULL,
    wert2 char(25),
    wert3 char(25),
   PRIMARY KEY (thema, name, wert1)
);

#
# Daten von Tabelle 'cms_spezial'
#
INSERT INTO cms_spezial VALUES ("birchler","M2","480","180",NULL);
INSERT INTO cms_spezial VALUES ("birchler","M3","960","180",NULL);
INSERT INTO cms_spezial VALUES ("birchler","M1","348","348",NULL);



# ----------------------------------------------------------
#
# Struktur von Tabelle 'cms_templates'
#
DROP TABLE IF EXISTS cms_templates;
CREATE TABLE cms_templates (
    id tinyint(3) NOT NULL auto_increment,
    template_id tinyint(3) unsigned NOT NULL,
    template_name varchar(40) DEFAULT "zweispaltig_340_420_tpl.html" NOT NULL,
    template_descr varchar(125),
    thumbsize char(10),
   PRIMARY KEY (id),
   KEY tplid (template_id)
);

#
# Daten von Tabelle 'cms_templates'
#
INSERT INTO cms_templates VALUES ("19","15","rb_einspaltig_760v_tpl.html","einspaltig_760_tpl - links Kurztexte rechts max. 2 Thumbnails","98x98");
INSERT INTO cms_templates VALUES ("13","11","rb_zweispaltig_360_360_tpl.html","zweispaltig_360_360 -  1.Spalte Text, 2. Spalte Bildergalerie","348x348");
INSERT INTO cms_templates VALUES ("14","12","rb_zweispaltig_480_240_180_tpl.html","zweispaltig_480_240 -  1.Spalte oben Bild (H&ouml;he 180), unten Text, 2. Spalte leer","480x180");
INSERT INTO cms_templates VALUES ("18","14","rb_einspaltig_960_tpl.html","einspaltig_960 - oben ganze Breite Bild, unten Text","960x180");
INSERT INTO cms_templates VALUES ("15","13","rb_zweispaltig_480_240_348_tpl.html","zweispaltig_480_240 -  1.Spalte oben Bild (H&ouml;he 348), unten Text, 2. Spalte leer","348x348");



# ----------------------------------------------------------
#
# Struktur von Tabelle 'cms_users'
#
DROP TABLE IF EXISTS cms_users;
CREATE TABLE cms_users (
    id tinyint(4) NOT NULL auto_increment,
    username varchar(32) NOT NULL,
    password varchar(32) NOT NULL,
    menu char(10),
   PRIMARY KEY (id),
   KEY username (username),
   KEY username_2 (username)
);

#
# Daten von Tabelle 'cms_users'
#
INSERT INTO cms_users VALUES ("3","hempen","e9911456f39b5e6d738669ac8d438b20","NUMKLBD");
INSERT INTO cms_users VALUES ("4","webprog10","a3e6096dbe9169213e7880821129428e","NUBD");
INSERT INTO cms_users VALUES ("6","birchler","4c2506eaf029fef2c569ff52c0d93d1a","NUBD");


