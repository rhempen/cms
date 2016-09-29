#----------------------------------------------
# Backup der Datenbank cms_hempen
# Erstellt am 10.11.2011 20:50
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
INSERT INTO cms_config VALUES ("1","general","THEME","hempen",NULL,NULL);
INSERT INTO cms_config VALUES ("2","general","COPYRIGHT","hempenweb.ch 2009",NULL,NULL);
INSERT INTO cms_config VALUES ("3","general","MAX_THUMBS","7",NULL,NULL);
INSERT INTO cms_config VALUES ("4","general","MAX_LIST_ITEMS","8",NULL,NULL);
INSERT INTO cms_config VALUES ("5","general","LANGUAGE","DE",NULL,NULL);
INSERT INTO cms_config VALUES ("10","menu","HMENU_RICHTUNG","left","right",NULL);
INSERT INTO cms_config VALUES ("11","menu","HMENU_SUBMENU","submenu","dropdown",NULL);
INSERT INTO cms_config VALUES ("20","pictures","THUMB_PAGE_MAX_WIDTH","135",NULL,NULL);
INSERT INTO cms_config VALUES ("21","pictures","THUMB_PAGE_MAX_HEIGHT","90",NULL,NULL);
INSERT INTO cms_config VALUES ("22","pictures","THUMB_NAVI_MAX_WIDTH","300",NULL,NULL);
INSERT INTO cms_config VALUES ("23","pictures","THUMB_NAVI_MAX_HEIGHT","300",NULL,NULL);
INSERT INTO cms_config VALUES ("24","pictures","IMAGE_MAX_WIDTH","640",NULL,NULL);
INSERT INTO cms_config VALUES ("25","pictures","IMAGE_MAX_HEIGHT","640",NULL,NULL);
INSERT INTO cms_config VALUES ("14","menu","SMURL","ja","nein",NULL);
INSERT INTO cms_config VALUES ("13","menu","SUBNAV_SOFORT","nein","ja",NULL);
INSERT INTO cms_config VALUES ("6","general","CMS_ROOT","/cms2/",NULL,NULL);
INSERT INTO cms_config VALUES ("15","menu","SMURL_REFRESH","ausf&uuml;hren","",NULL);
INSERT INTO cms_config VALUES ("12","menu","SUBMENU_DIR","horizontal","vertikal",NULL);
INSERT INTO cms_config VALUES ("8","general","EMAIL_RECEIVER","hempen@bluewin.ch",NULL,NULL);
INSERT INTO cms_config VALUES ("32","meta-tags","KEYWORDS","",NULL,"webdesign, php, html, xhtml, javascript, Zürich, Hempen, Roland Hempen, hempenweb");
INSERT INTO cms_config VALUES ("33","meta-tags","DESCRIPTION","",NULL,"hempenWeb ist eine kleine feine Internetagentur, die es sich zur Aufgabe macht, Ihren Internetauftritt individuell und einmalig zu gestalten");
INSERT INTO cms_config VALUES ("34","meta-tags","PAGE_TOPIC","",NULL,"Webdesign, WebProgrammer, Php, Internetagentur, Zürich");
INSERT INTO cms_config VALUES ("35","meta-tags","PUBLISHER","",NULL,"Roland Hempen, WebPublisher, WebProgrammer Php, www.hempenweb.ch, Marianne Mathys, Grafik, Design, Zürich");
INSERT INTO cms_config VALUES ("26","pictures","DISK_DB_ADJUSTMENT","ausf&uuml;hren",NULL,NULL);
INSERT INTO cms_config VALUES ("7","general","TEMPLATE_DIR","frontend/themes/default/tpl","",NULL);
INSERT INTO cms_config VALUES ("36","meta-tags","GOOGLE_VERIFY","",NULL,"ttwBxblG2LButvHtEG8AmiCgf6RqivXOIwkS5k3hOXA");
INSERT INTO cms_config VALUES ("31","meta-tags","AUTHOR","Roland Hempen",NULL,NULL);
INSERT INTO cms_config VALUES ("27","pictures","MEDIA_ROOT_ADJUSTMENT","ausf&uuml;hren",NULL,NULL);



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
INSERT INTO cms_fragmente VALUES ("1","teaser1","5","<h2 style=\"text-align: center;\">Teaser 1</h2>
<p style=\"text-align: center;\"><a title=\"Roland et le petit Cléo!\" href=\"/cms2/media/navi_06/_images/img_0040.jpg\" target=\"_self\"><img src=\"/cms2/media/navi_06/_thumbs/th_img_0040.jpg\" border=\"0\" alt=\"\" width=\"98\" height=\"73\" /></a></p>
<p style=\"text-align: center;\">Das ist der Teaser Nummer 1<br />Mehr liegt einfach nicht drin!<br />ist das klar?</p>");
INSERT INTO cms_fragmente VALUES ("2","teaser2","3","<div class=\"teasertext\">
<h2 class=\"teasertitle\">Teaser 2: Das ist Teaser 2</h2>
<p class=\"teasertext\">Zur Zeit läuft im Fernsehen die Sendung ECO&nbsp;— Eine hochinteressante Sendung über Wirtschaft, Geld und Macht! Moderiert wird die Sendung von Reto Lipp</p>
<p class=\"teasertext\">Zur Zeit läuft im Fernsehen die Sendung ECO&nbsp;— Eine hochinteressante Sendung über Wirtschaft, Geld und Macht! Moderiert wird die Sendung von Reto Lipp<br /><br /></p>
</div>");
INSERT INTO cms_fragmente VALUES ("3","teaser3","4","<h2>Teaser 3</h2>
<p>Das ist der Teaser Nummer 3</p>");
INSERT INTO cms_fragmente VALUES ("4","teaser4","6","<p><img title=\"Licht an!\" src=\"/cms2/media/diverse/scheinwerfer.jpg\" alt=\"Licht an!\" width=\"720\" height=\"300\" /></p>");
INSERT INTO cms_fragmente VALUES ("5","footer","7","                                    <div id=\"impressum\">
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
INSERT INTO cms_fragmente VALUES ("7","Kopie von teaser1","1","<h2 style=\"text-align: center;\">Teaser 1</h2>
<p style=\"text-align: center;\"><a title=\"Roland et le petit Cléo!\" href=\"/cms2/media/navi_06/_images/img_0040.jpg\" target=\"_self\"><img src=\"/cms2/media/navi_06/_thumbs/th_img_0040.jpg\" border=\"0\" alt=\"\" width=\"98\" height=\"73\" /></a></p>
<p style=\"text-align: center;\">Das ist der Teaser Nummer 1<br />Mehr liegt einfach nicht drin!<br />ist das klar?</p>");
INSERT INTO cms_fragmente VALUES ("8","teaser5","2","<p>älkajdf<br />aälkjadf<br />$äklajdf<br />aälkdjf<br />äasdälkjfa$dölf<br /><img src=\"/cms2/media/diverse/scheinwerfer.jpg\" alt=\"Licht an!\" width=\"720\" height=\"300\" /></p>");



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
INSERT INTO cms_galerien VALUES ("613","70","1","N","../../media/navi_070/_images/art4art.jpg",NULL);
INSERT INTO cms_galerien VALUES ("614","70","2","N","../../media/navi_070/_images/gigijacquier.png",NULL);
INSERT INTO cms_galerien VALUES ("556","28","1","N","../../media/navi_06/_images/img_0040.jpg",NULL);
INSERT INTO cms_galerien VALUES ("557","130","1","P","../../media/navi_060003/_images/img_0049.jpg",NULL);
INSERT INTO cms_galerien VALUES ("615","70","3","N","../../media/navi_070/_images/orasch.gif",NULL);
INSERT INTO cms_galerien VALUES ("616","70","4","N","../../media/navi_070/_images/physio-steiner.jpg",NULL);
INSERT INTO cms_galerien VALUES ("617","70","5","N","../../media/navi_070/_images/raku.gif",NULL);
INSERT INTO cms_galerien VALUES ("618","71","1","N","../../media/navi_071/_images/th_rh_2.jpg",NULL);
INSERT INTO cms_galerien VALUES ("626","74","7","N","../../media/navi_074/_images/physio-allschwil.png",NULL);
INSERT INTO cms_galerien VALUES ("620","74","2","N","../../media/navi_074/_images/orasch.png",NULL);
INSERT INTO cms_galerien VALUES ("621","74","1","N","../../media/navi_074/_images/birchler-architektur.png",NULL);
INSERT INTO cms_galerien VALUES ("622","74","3","N","../../media/navi_074/_images/raku.png",NULL);
INSERT INTO cms_galerien VALUES ("623","74","4","N","../../media/navi_074/_images/art4art.png",NULL);
INSERT INTO cms_galerien VALUES ("624","74","5","N","../../media/navi_074/_images/physio-steiner.png",NULL);
INSERT INTO cms_galerien VALUES ("625","74","6","N","../../media/navi_074/_images/gigijacquier.png",NULL);
INSERT INTO cms_galerien VALUES ("633","136","2","P","../../media/navi_060004/_images/atemstellungen.jpg","atemerleichternde Haltungen");
INSERT INTO cms_galerien VALUES ("629","69","1","N","../../media/navi_069/_images/img_0040.jpg","Roland und Lionel");
INSERT INTO cms_galerien VALUES ("632","136","1","P","../../media/navi_060004/_images/atem.jpg","Pusteblume");
INSERT INTO cms_galerien VALUES ("631","119","1","P","../../media/navi_060002/_images/zahnbuerste.jpg","");



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
INSERT INTO cms_modules VALUES ("3","READ_TOP_EXPO_EVENT","Auflisten aktuellste Event und Expo");
INSERT INTO cms_modules VALUES ("2","KONTAKTFORMULAR","Kontaktformular");
INSERT INTO cms_modules VALUES ("1","PAGES_OVERVIEW","Unterseiten zur aktuellen Menuposition auflisten");
INSERT INTO cms_modules VALUES ("6","WEBMAIL","Webmail Login");
INSERT INTO cms_modules VALUES ("7","SITEMAP","Sitemap");



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
INSERT INTO cms_navigation VALUES ("28","navi_06","6","0","isabel","isabel","navi_06","j","n","H");
INSERT INTO cms_navigation VALUES ("69","navi_069","1","0","home","home","navi_069","j","n","H");
INSERT INTO cms_navigation VALUES ("70","navi_070","3","0","webdesign-old","webdesign-old","navi_070","n","n","H");
INSERT INTO cms_navigation VALUES ("71","navi_071","5","0","portrait","portrait","navi_071","j","n","H");
INSERT INTO cms_navigation VALUES ("72","navi_072","7","0","kontakt","kontakt","navi_072","j","n","S");
INSERT INTO cms_navigation VALUES ("73","navi_073","8","0","sitemap","sitemap","navi_073","j","n","S");
INSERT INTO cms_navigation VALUES ("74","navi_074","2","0","webdesign","webdesign","navi_074","j","n","H");
INSERT INTO cms_navigation VALUES ("75","navi_075","9","0","impressum","impressum","navi_075","n","n","H");
INSERT INTO cms_navigation VALUES ("76","navi_076","4","0","hosting","hosting","navi_076","j","n","H");
INSERT INTO cms_navigation VALUES ("77","navi_069","1","10","go home_10","go home_10","navi_069_10","n","n","");



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
    kurztext varchar(200),
    langtext longtext,
    inhalt2 longtext,
    template tinyint(3) unsigned,
    bild1 varchar(125),
    bild2 varchar(125),
    galerie enum('n','a','b') DEFAULT "n" NOT NULL,
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
INSERT INTO cms_pages VALUES ("119","28","navi_06","navi_060002","s zahbürschteli","isabel","0000-00-00 00:00:00","0000-00-00 00:00:00","ich ha mis zahbürschteli scho lang s isch pink und wiiss und wiegt ... gramm ich bruch mis bürschteli jedä tag drum ischs langsam verschlissä..","<p>ich ha mis zahbürschteli scho lang s isch pink und wiiss und wiegt ... gramm ich bruch mis bürschteli jedä tag drum ischs langsam verschlissä und d borschtä sind scho ewig chrumm und teilwiis sinds usgrissä und mängisch tänki bürschteli was machi numä wänns dich butzt ich ha mich doch so gwöhnt a dich cha ohni bürschteli nümä sii</p>
<p>jetz hani i dä migros gseh vo denä bürschteli gits no meh diä sind det alli neu und schön und s pink das lüchtet und d borschtä stönd drum hani grad zäh neui &nbsp;kauft han alli uspackt im zahglas verstaut jetz wächsli s bürschteli jedä tag ich weiss nöd wieso ich find znacht kä schlaf</p>
<p>&nbsp;</p>
<p>%teaser1%</p>",NULL,"2","../../media/navi_060002/_thumbs/th_zahnbuerste.jpg","","a","130","0","j","2");
INSERT INTO cms_pages VALUES ("130","28","navi_06","navi_060003","kafi für dich und mich","isabel","0000-00-00 00:00:00","2010-08-05 00:00:00","kafi für dich 
sie luägät weg er luägt sie aa/ sie isch ä hübschi er än maa/sie gaht ad bar und bstellt
","<p>&nbsp;</p>
<p>sie luägät weg er luägt sie aa/ sie isch ä hübschi er än maa/sie gaht ad bar und bstellt</p>
<p>&nbsp;</p>
<p>er luägt sie aa und redt und redt/ ununterbrochä seit er wett/ dass sie sich änderet</p>
<p>&nbsp;</p>
<p>sie luägät zrugg luägät ihn aa/ vom schönä gsicht isch nüt meh da/ sie lachäd churz und bitter uuf</p>
<p>&nbsp;</p>
<p>doch er redt wiiter bla bla bla/ sie luägäd läär er luägt sie aa/ und ihri mienä gfrüürt zu stei</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>sie staht uuf «ich gang jetz hei»/ er ränntärä nah sie seit ihm «nei»/ er trinkt sin kafi uus, ällei.</p>",NULL,"2","../../media/navi_060003/_thumbs/th_img_0049.jpg","","a","0","0","n","1");
INSERT INTO cms_pages VALUES ("136","28","navi_06","navi_060004","Atemtherapie","isabel","2010-01-01 00:00:00","2011-02-20 00:00:00","Kurztext","<p>Langtext<br /><br />%teaser2%<br /><br />weiterer Text</p>",NULL,"1","../../media/navi_060004/_thumbs/th_atem.jpg","","b","130","119","j","3");



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
INSERT INTO cms_redirect VALUES ("1","69","0","0","home");
INSERT INTO cms_redirect VALUES ("2","69","77","0","go_home_10");
INSERT INTO cms_redirect VALUES ("3","70","0","0","webdesignold");
INSERT INTO cms_redirect VALUES ("4","74","0","0","webdesign");
INSERT INTO cms_redirect VALUES ("5","76","0","0","hosting");
INSERT INTO cms_redirect VALUES ("6","71","0","0","portrait");
INSERT INTO cms_redirect VALUES ("7","28","0","0","isabel");
INSERT INTO cms_redirect VALUES ("8","72","0","0","kontakt");
INSERT INTO cms_redirect VALUES ("9","73","0","0","sitemap");
INSERT INTO cms_redirect VALUES ("10","75","0","0","impressum");
INSERT INTO cms_redirect VALUES ("11","28","0","119","s_zahbuerschteli");
INSERT INTO cms_redirect VALUES ("12","28","0","130","kafi_fuer_dich_und_m");
INSERT INTO cms_redirect VALUES ("13","28","0","136","atemtherapie");



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
    galerie enum('n','a','b','c') DEFAULT "a" NOT NULL,
   PRIMARY KEY (seiten_id)
);

#
# Daten von Tabelle 'cms_seiten'
#
INSERT INTO cms_seiten VALUES ("28","28","1","isabel",NULL,"5","1","<p><img src=\"/cms/media/navi_6/_thumbs/th_zahbuerschteli_2.jpg\" alt=\"\" width=\"480\" height=\"358\" /></p>
<h1 style=\"color: #3eaa16;\">zahbürschteli<br /></h1>
<p>ich ha mis zahbürschteli scho lang s isch pink und wiiss und wiegt ... gramm ich bruch mis bürschteli jedä tag drum ischs langsam verschlissä und d borschtä sind scho ewig chrumm und teilwiis sinds usgrissä und mängisch tänki bürschteli was machi numä wänns dich butzt ich ha mich doch so gwöhnt a dich cha ohni bürschteli nümä sii</p>
<p>jetz hani i dä migros gseh vo denä bürschteli gits no meh diä sind det alli neu und schön und s pink das lüchtet und d borschtä stönd drum hani grad zäh neui &nbsp;kauft han alli uspackt im zahglas verstaut jetz wächsli s bürschteli jedä tag ich weiss nöd wieso ich find znacht kä schlaf</p>","",NULL,"n");
INSERT INTO cms_seiten VALUES ("69","69","1","home","","6","0","<h1 class=\"verybig\">Licht an — Ihr Auftritt!</h1>
<div id=\"introbild\"><img title=\"Licht an — Ihr Auftritt!\" src=\"/cms2/media/diverse/scheinwerfer.jpg\" alt=\"Licht an — Ihr Auftritt!\" width=\"720\" height=\"300\" /> </div>
<p>&nbsp;</p>
<div id=\"intro\">
<div id=\"introcontent\">
<div class=\"teaserwrapper\">
<h2 class=\"teasertitle\">webdesign</h2>
<ul>
<li>Kundenorientierter und nach Ihren Bedürfnissen ausgerichteter Internetauftritt von A - Z</li>
<li>Projektorientiertes und strukturiertes Vorgehen</li>
<li>Für das Design ziehe ich bei Bedarf eine ausgewiesene Grafikerin hinzu</li>
<li>Barrierefreies Design und Berücksichtigung der W3C-Vorgaben</li>
<li>Eigenes Content-Management-System (cms)</li>
<li>Faire Preise = ausgewogenes Preis-Leistungsverhältnis!</li>
</ul>
<p class=\"teasertext\"><a href=\"/cms2/webdesign\" target=\"\\_self\">weiter...</a></p>
</div>
<div class=\"teaser\" style=\"margin-right: 20px;\">
<h2 class=\"teasertitle\">hosting</h2>
<p class=\"teasertext\">wenn Sie es wünschen, können Sie Ihre Website auch bei <em>hempenWeb</em> hosten. Damit haben Sie Ihren Internetauftritt aus einer Hand</p>
<p class=\"teasertext\"><a href=\"/cms2/hosting\" target=\"\\_self\">weiter...</a> </p>
</div>
<div class=\"teaser\">
<h2 class=\"teasertitle\">portrait</h2>
<p class=\"teasertext\"><em>hempenweb</em> macht es sich zur Aufgabe, Ihren Internetauftritt individuell und einmalig zu gestalten. Erfahren Sie, wer hinter <em>hempenweb</em> steckt...</p>
<p class=\"teasertext\"><a href=\"/cms2/portrait\" target=\"\\_self\">weiter...</a> </p>
</div>
</div>
</div>","","../gifs/blank.gif","n");
INSERT INTO cms_seiten VALUES ("70","70","1","webdesign-old","","6","0","<h2>hempenWeb — Design für Ihren Web-Auftritt</h2>
<table style=\"width: 100%; height: auto;\" border=\"0\">
<tbody>
<tr valign=\"top\">
<td>
<p>Sind Sie Privatperson oder führen Sie einen Kleinbetrieb und hätten schon lange gerne einen Internetauftritt? Wenn da nur nicht der einigermassen grosse Aufwand wäre, und wenn das nur nicht so schwierig wäre, ein paar ansprechende Internetseiten bereitzustellen...</p>
<p>Wie kommen Sie zu einer eigenen Domain und wo sollen Ihre Internetseiten veröffentlicht werden?</p>
<p>Fragen, auf die ich Ihnen kompetente und zielgerichtete Antworten geben kann. Alle Aufgaben rund um Ihren Internetauftritt erledige ich für Sie.</p>
<br />
<h2>Vorgehensmodell:</h2>
<div id=\"vertical_container\" style=\"padding-top: 5px;\">
<h2 class=\"accordion_toggle\">Phase 1: Projektinitialisierung</h2>
<div class=\"accordion_content\">
<p>In der ersten Phase werde ich mit Ihnen Ihre Wünsche und Bedürfnisse für Ihren Internetauftritt abklären.</p>
<p>Anhand einer kurzen Marktanalyse werden wir gemeinsam das Zielpublikum Ihrer Website feststellen, um darauf aufbauend die 2. Phase vorzubereiten.</p>
<p>Auch technische Aspekte müssen schon jetzt besprochen werden: Haben Sie schon einen ISP (Hostingpartner) und eine Domain?</p>
<p>Wieviel sind Sie bereit für Ihren Internetauftritt auszugeben? Aufgrund Ihrer Vorstellungen und Wünsche für Ihren Internetauftritt kann ich Ihnen einen unverbindlichen Kostenvoranschlag erstellen.</p>
<p>&nbsp;</p>
</div>
<h2 class=\"accordion_toggle\">Phase 2: Entwurf, Prototype erstellen</h2>
<div class=\"accordion_content\">
<p>Sobald die wichtigsten Aspekte Ihres Internetauftritts geklärt sind, erstelle ich einen ersten Entwurf und eventuell einen funktionsfähigen Prototypen.</p>
<p>Sie werden in der Lage sein, den Stand der Entwicklung mitzuverfolgen, da ich die Website laufend als Beta-Version ins Netz stellen werde.</p>
<p>Diese Phase ist geprägt von Konzepten: Farbkonzept, Navigationskonzept, Technisches Konzept, etc.</p>
<p>Sie sollten spätestens jetzt damit beginnen, für den Content (Inhalt) besorgt zu sein, denn ohne Ihre Texte, Bilder, Produkte usw. ist die Website nur eine Hülle.</p>
<p>&nbsp;</p>
</div>
<h2 class=\"accordion_toggle\">Phase 3: Realisierung</h2>
<div class=\"accordion_content\">
<p>In der Realisierungsphase beginnt Ihr Internetauftritt konkret zu werden. - Voraussetzung dafür ist Ihre Abnahme des Entwurfs einerseits und natürlich das Vorhandensein des Inhaltes und die Bereitstellung der grafischen Objekte, welche ein wichtiger Bestandteil einer Webseite sind.</p>
<p>Je fortgeschrittener die Website ist, um so mehr treten Testsszenarien und Schulungsaspekte in den Vordergrund.</p>
<p>&nbsp;</p>
</div>
<h2 class=\"accordion_toggle\">Phase 4: Einführung</h2>
<div class=\"accordion_content\">
<p>Die Einführung Ihres Internetauftritts beinhaltet nebst der Veröffentlichung der fertiggestellten Seiten die Festlegung von ausdruckstarken Stichworten, anhand derer Ihre Seite von Suchmaschinen gefunden werden.</p>
<p>Wenn Sie es wünschen, kann ich Ihre Webseiten bei verschiedenen Suchmaschinen und Verzeichnisdiensten registrieren lassen.</p>
<p>Ein weiterer Punkt ist die Schulung, die Sie soweit befähigen soll, Ihre Seite selbstständig zu aktualisieren, sofern es sich um ein CMS (Content-Management-System) handelt.</p>
<p>&nbsp;</p>
</div>
<h2 class=\"accordion_toggle\">Phase 5: Wartung, Weiterentwicklung</h2>
<div class=\"accordion_content\">
<p>Nach der Einführungsphase wird das Projekt normalerweise abgeschlossen und ich werde Ihnen meine Aufwände in Rechnung zu stellen.</p>
<p>Selbstverständlich überlasse ich Sie nicht einfach Ihrem \"Internet\"-Schicksal. Wenn Sie es wünschen, werde ich Ihnen einen Vorschlag machen, wie ich Ihre Seite weiterhin betreuen kann. Es liegt in Ihrem Ermessen, ob und wie Sie Ihren Internetauftritt aktuell halten wollen.</p>
<p>&nbsp;</p>
</div>
</div>
</td>
<td style=\"background-color: #f4f3e9;\" width=\"200\" align=\"center\" valign=\"top\">
<table style=\"width: auto; height: auto;\" border=\"0\">
<tbody>
<tr>
<td><a href=\"http://www.gigijacquier.ch\" target=\"_blank\"><img style=\"border: 0pt none;\" src=\"/cms2/media/navi_070/_images/gigijacquier.png\" alt=\"\" width=\"150\" height=\"101\" /></a>
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td><a href=\"http://www.art4art.ch\" target=\"_blank\"><img style=\"border: 0pt none;\" src=\"/cms/media/navi_070/_images/art4art.jpg\" border=\"0\" alt=\"\" width=\"150\" height=\"101\" /></a>
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td><a href=\"http://www.physio-steiner.ch\" target=\"_blank\"><img src=\"/cms/media/navi_070/_images/physio-steiner.jpg\" border=\"0\" alt=\"\" width=\"150\" height=\"101\" /></a>
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td><a href=\"http://www.orasch.ch\" target=\"_blank\"><img src=\"/cms/media/navi_070/_images/orasch.gif\" border=\"0\" alt=\"\" width=\"150\" height=\"101\" /></a>
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td><a href=\"http://www.raku.ch\" target=\"_blank\"><img src=\"/cms/media/navi_070/_images/raku.gif\" border=\"0\" alt=\"\" width=\"150\" height=\"101\" /></a>
<p>&nbsp;</p>
</td>
</tr>
</tbody>
</table>
<br /></td>
</tr>
</tbody>
</table>","","../../media/navi_070/_thumbs/th_gigijacquier.png","n");
INSERT INTO cms_seiten VALUES ("71","71","1","portrait",NULL,"2","0","<p>Mein Name ist Roland Hempen, ich wohne und arbeite in Zürich. Seit bald 20 Jahren bin ich in der Informatik tätig, als Projektleiter und Programmierer in verschiedenen Firmen. Seit vielen Jahren schon bin ich vorwiegend mit SAP beschäftigt. Zuerst als Systemadministrator, später als Entwickler.</p>
<div id=\"vertical_container\" style=\"padding-top: 5px;\">
<h2 class=\"accordion_toggle\">1990: Brauerei Hürlimann</h2>
<div class=\"accordion_content\">
<p>Den Einstieg in die Informatik schaffte ich als Quereinsteiger bei der damals noch in Zürich tätigen <a href=\"http://www.huerlimann.ch/\" target=\"_blank\">Brauerei Hürlimann</a></p>
<ul style=\"margin-left: 25px;\">
<li>Ausbildung on the job und in externen Kursen zum Programmierer auf DEC/VAX Systemen </li>
<li>1994/95 nebenberuflicher Lehrgang zum Informatik-Projektleiter an der <a href=\"http://www.wiss.ch/\" target=\"_blank\">WISS</a> mit eidg. Fachausweis. </li>
<li>Ab 1993 erster Kontakt mit SAP/R3 Rel. 2.0. Damals ging man davon aus, SAP lasse sich ohne Einbezug der Informatik einführen. Spätestens beim Drucken von Kundenrechnungen war ich als Systemadministrator extrem gefragt, die Drucker SAP-tauglich zu konfigurieren.</li>
</ul>
<p>&nbsp;</p>
</div>
<h2 class=\"accordion_toggle\">1997: Allianz Suisse</h2>
<div class=\"accordion_content\">
<p>Nachdem die Brauerei Hürlimann von Feldschlösschen übernommen wurde, entschloss ich mich zu einem Job-Wechsel und fand eine anspruchsvolle Stelle als SAP-Basis-Administrator bei der ELVIA-Versicherung in Zürich. Inzwischen wurde die ELVIA-Versicherung zusammen mit der Berner-Versicherung zur <a href=\"http://www.allianz-suisse.ch/\" target=\"_blank\">Allianz Suisse</a> fusioniert.</p>
<ul style=\"margin-left: 25px;\">
<li>Diverse Kursbesuche bei <a href=\"http://www.sap.ch/\" target=\"_blank\">SAP</a>.</li>
<li>Ich beginne mich privat und beruflich für das Internet und seine Möglichkeiten zu interessieren und besuche bei der <a href=\"http://www.wiss.ch/\" target=\"_blank\">WISS</a> einen WebPublisher-Kurs, den ich mit dem <a href=\"http://www.siz.ch/\" target=\"_blank\">SIZ</a>-Diplom abschliesse.</li>
</ul>
<p>&nbsp;</p>
</div>
<h2 class=\"accordion_toggle\">2005: Migros IT Services</h2>
<div class=\"accordion_content\">
<p>Im Jahre 2005 wechselte ich als SAP-Entwickler in die Retail-Entwicklungsabteilung (<a href=\"http://www.mits.ch\" target=\"_blank\">MITS</a>) beim <a href=\"http://www.migros.ch/\" target=\"_blank\">Migros</a> Genossenschaftsbund. Was ursprünglich als privates Interesse begonnen hatte, kommt mir nun auch im Beruf voll zugute. Denn jetzt entwickle ich HTML-basierte SAP-Applikationen, welche Sie in jeder grösseren Migros-Filiale live in Betrieb sehen können.</p>
<p>Ab Herbst 2006 besuchte ich an der <a href=\"http://www.eb-zuerich.ch/\" target=\"_blank\">EB-Zürich</a> den Lehrgang \"WebProgrammer PHP\". Dabei erlernte ich als Ergänzung zu meinen ASP-Kenntnissen die Programmiersprache PHP. Zu PHP gehört automatisch auch die Datenbank MySQL. Weitere Themen dieses Lehrganges waren: Web 2.0 mit AJAX und Datenverarbeitung mit XML. Als Abschluss dieser Weiterbildung habe ich eine Diplomarbeit erstellt &gt;&gt; <a href=\"http://www.art4art.ch/\" target=\"_blank\">www.art4art.ch</a><a href=\"http://www.art4art.ch/\" target=\"_blank\"><br /></a></p>
<p>&nbsp;</p>
</div>
</div>","","../../media/navi_071/_thumbs/th_th_rh_2.jpg","b");
INSERT INTO cms_seiten VALUES ("72","72","1","kontakt",NULL,"2","2","","",NULL,"n");
INSERT INTO cms_seiten VALUES ("73","73","1","","","2","7","","","","n");
INSERT INTO cms_seiten VALUES ("74","74","1","webdesign","","2","0","<h2>hempenWeb — Design für Ihren Web-Auftritt</h2>
<p>Sind Sie Privatperson oder führen Sie einen Kleinbetrieb und hätten schon lange gerne einen Internetauftritt? Wenn da nur nicht der einigermassen grosse Aufwand wäre, und wenn das nur nicht so schwierig wäre, ein paar ansprechende Internetseiten bereitzustellen...</p>
<p>%teaser1%<br /><br />Wie kommen Sie zu einer eigenen Domain und wo sollen Ihre Internetseiten veröffentlicht werden?</p>
<p>Fragen, auf die ich Ihnen kompetente und zielgerichtete Antworten geben kann. Alle Aufgaben rund um Ihren Internetauftritt erledige ich für Sie.&nbsp;</p>
<h2>Vorgehensmodell:</h2>
<div id=\"vertical_container\" style=\"padding-top: 5px;\">
<h2 class=\"accordion_toggle\">Phase 1: Projektinitialisierung</h2>
<div class=\"accordion_content\">
<p>In der ersten Phase werde ich mit Ihnen Ihre Wünsche und Bedürfnisse für Ihren Internetauftritt abklären.</p>
<p>Anhand einer kurzen Marktanalyse werden wir gemeinsam das Zielpublikum Ihrer Website feststellen, um darauf aufbauend die 2. Phase vorzubereiten.</p>
<p>Auch technische Aspekte müssen schon jetzt besprochen werden: Haben Sie schon einen ISP (Hostingpartner) und eine Domain?</p>
<p>Wieviel sind Sie bereit für Ihren Internetauftritt auszugeben? Aufgrund Ihrer Vorstellungen und Wünsche für Ihren Internetauftritt kann ich Ihnen einen unverbindlichen Kostenvoranschlag erstellen.</p>
<p>&nbsp;</p>
</div>
<h2 class=\"accordion_toggle\">Phase 2: Entwurf, Prototype erstellen</h2>
<div class=\"accordion_content\">
<p>Sobald die wichtigsten Aspekte Ihres Internetauftritts geklärt sind, erstelle ich einen ersten Entwurf und eventuell einen funktionsfähigen Prototypen.</p>
<p>Sie werden in der Lage sein, den Stand der Entwicklung mitzuverfolgen, da ich die Website laufend als Beta-Version ins Netz stellen werde.</p>
<p>Diese Phase ist geprägt von Konzepten: Farbkonzept, Navigationskonzept, Technisches Konzept, etc.</p>
<p>Sie sollten spätestens jetzt damit beginnen, für den Content (Inhalt) besorgt zu sein, denn ohne Ihre Texte, Bilder, Produkte usw. ist die Website nur eine Hülle.</p>
<p>&nbsp;</p>
</div>
<h2 class=\"accordion_toggle\">Phase 3: Realisierung</h2>
<div class=\"accordion_content\">
<p>In der Realisierungsphase beginnt Ihr Internetauftritt konkret zu werden. - Voraussetzung dafür ist Ihre Abnahme des Entwurfs einerseits und natürlich das Vorhandensein des Inhaltes und die Bereitstellung der grafischen Objekte, welche ein wichtiger Bestandteil einer Webseite sind.</p>
<p>Je fortgeschrittener die Website ist, um so mehr treten Testsszenarien und Schulungsaspekte in den Vordergrund.</p>
<p>&nbsp;</p>
</div>
<h2 class=\"accordion_toggle\">Phase 4: Einführung</h2>
<div class=\"accordion_content\">
<p>Die Einführung Ihres Internetauftritts beinhaltet nebst der Veröffentlichung der fertiggestellten Seiten die Festlegung von ausdruckstarken Stichworten, anhand derer Ihre Seite von Suchmaschinen gefunden werden.</p>
<p>Wenn Sie es wünschen, kann ich Ihre Webseiten bei verschiedenen Suchmaschinen und Verzeichnisdiensten registrieren lassen.</p>
<p>Ein weiterer Punkt ist die Schulung, die Sie soweit befähigen soll, Ihre Seite selbstständig zu aktualisieren, sofern es sich um ein CMS (Content-Management-System) handelt.</p>
<p>&nbsp;</p>
</div>
<h2 class=\"accordion_toggle\">Phase 5: Wartung, Weiterentwicklung</h2>
<div class=\"accordion_content\">
<p>Nach der Einführungsphase wird das Projekt normalerweise abgeschlossen und ich werde Ihnen meine Aufwände in Rechnung zu stellen.</p>
<p>Selbstverständlich überlasse ich Sie nicht einfach Ihrem \"Internet\"-Schicksal. Wenn Sie es wünschen, werde ich Ihnen einen Vorschlag machen, wie ich Ihre Seite weiterhin betreuen kann. Es liegt in Ihrem Ermessen, ob und wie Sie Ihren Internetauftritt aktuell halten wollen.</p>
<p>&nbsp;</p>
</div>
</div>","","../../media/navi_074/_thumbs/th_physio-allschwil.png","c");
INSERT INTO cms_seiten VALUES ("76","76","1","hosting","","2","0","<p>Seit dem Jahre 2008 habe ich die Möglichkeit, Websites auf&nbsp;meiner Domain <strong>hempenweb.ch</strong>&nbsp;zu hosten. Ihren Internetauftritt kann ich so vollumfänglich aus einer Hand anbieten.<br /><strong>hempenweb.ch</strong>&nbsp;wird übrigens bei <a title=\"Metanet \" href=\"http://www.metanet.ch/about_metanet\" target=\"_blank\">Metanet in Zürich</a> gehostet, ein gut etablierter Internet-Hosting-Provider mit hohen Sicherheitsstandards und grossem Qualitätsbewusstsein.</p>
<p>%teaser3%</p>
<p>&nbsp;</p>
<div class=\"teaserwrapper\" style=\"padding: 15px;\">
<h2>Angebot</h2>
<table style=\"width: 100%; border: #dedede 1px solid;\" border=\"0\" cellpadding=\"5\">
<tbody>
<tr style=\"background-color: #d0d0d0;\">
<td width=\"30%\">Domain</td>
<td width=\"60%\">1 Domain plus 3 Subdomains</td>
</tr>
<tr style=\"background-color: #dedede;\">
<td>Speicherplatz</td>
<td>max. 512 MB</td>
</tr>
<tr style=\"background-color: #d0d0d0;\">
<td>Email</td>
<td>5 Email-Adressen</td>
</tr>
<tr style=\"background-color: #dedede;\">
<td>Preis</td>
<td>6 CHF / Monat</td>
</tr>
</tbody>
</table>
</div>
<p><br />Bei Interesse melden Sie sich über das <a title=\"Kontaktformular\" href=\"/kontakt\" target=\"_self\">Kontaktformular</a>.</p>
<p>Gerne beziehe&nbsp;ich bei einer Offerte für Ihre zukünftige Website auch das Hosting ein.</p>
<p>%teaser1% </p>
<p>%teaser2% </p>
<p>%teaser3% </p>
<p>&nbsp;</p>","","","n");
INSERT INTO cms_seiten VALUES ("75","75","1","impressum",NULL,"1","0","","",NULL,"n");
INSERT INTO cms_seiten VALUES ("77","77","1","go home_10","","2","0","<p>lkandf</p>
<p>älknasdf</p>
<p>älkandf$</p>
<p>äkljasdf$</p>
<p>änhlka</p>
<p>sdfkj</p>","","","n");



# ----------------------------------------------------------
#
# Struktur von Tabelle 'cms_spezial'
#
DROP TABLE IF EXISTS cms_spezial;
CREATE TABLE cms_spezial (
    thema char(40) NOT NULL,
    name char(25) NOT NULL,
    wert1 char(25) DEFAULT "val" NOT NULL,
    wert2 char(25) DEFAULT "val",
    wert3 char(25) DEFAULT "val",
   PRIMARY KEY (thema, name, wert1)
);

#
# Daten von Tabelle 'cms_spezial'
#
INSERT INTO cms_spezial VALUES ("birchler","M2","480","180","val");
INSERT INTO cms_spezial VALUES ("birchler","M3","960","180","val");
INSERT INTO cms_spezial VALUES ("birchler","M1","348","348","val");
INSERT INTO cms_spezial VALUES ("martina","M2","280","280","val");
INSERT INTO cms_spezial VALUES ("martina","M3","135","90","val");
INSERT INTO cms_spezial VALUES ("birchler","M4","98","98","val");
INSERT INTO cms_spezial VALUES ("martina","CSS1","41","gruen","#459360");
INSERT INTO cms_spezial VALUES ("martina","CSS2","53","blau","#4D7FDE");
INSERT INTO cms_spezial VALUES ("martina","CSS3","44","orange","#F2672A");
INSERT INTO cms_spezial VALUES ("martina","CSS4","54","rot","#CC3659");
INSERT INTO cms_spezial VALUES ("martina","M1","640","213","val");



# ----------------------------------------------------------
#
# Struktur von Tabelle 'cms_templates'
#
DROP TABLE IF EXISTS cms_templates;
CREATE TABLE cms_templates (
    id tinyint(3) NOT NULL auto_increment,
    template_id tinyint(3) unsigned NOT NULL,
    template_name varchar(40) NOT NULL,
    template_descr varchar(125),
    thumbsize char(10),
   PRIMARY KEY (id),
   KEY tplid (template_id)
);

#
# Daten von Tabelle 'cms_templates'
#
INSERT INTO cms_templates VALUES ("4","1","zweispaltig_340_420_tpl.html","zweispaltig_340_420_tpl.html - 1. Spalte Bild, 2. Spalte Text","300x300");
INSERT INTO cms_templates VALUES ("5","2","zweispaltig_420_340_tpl.html","zweispaltig_420_340_tpl.html - 1. Spalte Text, 2. Spalte Bild","300x300");
INSERT INTO cms_templates VALUES ("7","3","zweispaltig_500_260v_tpl.html","zweispaltig_500_260v_tpl.html - 1. Spalte Text 2. Spalte Thumbnails","98x98");
INSERT INTO cms_templates VALUES ("8","4","einspaltig_760h_tpl.html","einspaltig_760h_tpl.html - obere Spalte Thumbnails, untere Spalte Text","98x98");
INSERT INTO cms_templates VALUES ("9","5","einspaltig_760v_tpl.html","einspaltig_760v_tpl.html - 1. Spalte Text, 2. Spalte Thumbnails","98x98");
INSERT INTO cms_templates VALUES ("10","6","einspaltig_760_nur_text_tpl.html","einspaltig_760_nur_text_tpl.html - Nur Textspalte 760 Pixel breit","720x300");
INSERT INTO cms_templates VALUES ("13","11","rb_zweispaltig_360_360_tpl.html","RB: zweispaltig_360_360 -  1.Spalte Text, 2. Spalte Bildergalerie","348x348");
INSERT INTO cms_templates VALUES ("14","12","rb_zweispaltig_480_240_180_tpl.html","RB: zweispaltig_480_240 -  1.Spalte oben Bild (H&ouml;he 180), unten Text, 2. Spalte leer","480x180");
INSERT INTO cms_templates VALUES ("18","14","rb_einspaltig_960_tpl.html","RB: einspaltig_960 - oben ganze Breite Bild, unten Text","960x180");
INSERT INTO cms_templates VALUES ("15","13","rb_zweispaltig_480_240_348_tpl.html","RB: zweispaltig_480_240 -  1.Spalte oben Bild (H&ouml;he 348), unten Text, 2. Spalte leer","348x348");
INSERT INTO cms_templates VALUES ("19","20","md_zweispaltig_480_400_tpl.html","MD: zweispaltig_480_400 -  1.Spalte Text, 2. Spalte Bild","280x280");
INSERT INTO cms_templates VALUES ("20","21","md_zweispaltig_400_480_tpl.html","MD: zweispaltig_400_480 - 1. Spalte Bild, 2. Spalte Textbox","280x280");
INSERT INTO cms_templates VALUES ("21","22","md_einspaltig_640_tpl.html","MD: einspaltig_640_tpl - oben Bilder, unten Kontaktdaten","640x213");
INSERT INTO cms_templates VALUES ("22","23","md_zweispaltig_400_400_tpl.html","MD: zweispaltig_400_400_tpl - 1. Spalte Thumbnail, 2. Spalte Kurztext und Link","135x90");
INSERT INTO cms_templates VALUES ("11","7","einspaltig_960_nur_text_tpl.html","einspaltig_960_nur_text_tpl.html - Nur Textspalte 960 Pixel breit",NULL);



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
INSERT INTO cms_users VALUES ("3","hempen","e9911456f39b5e6d738669ac8d438b20","NUFMKLBD");
INSERT INTO cms_users VALUES ("4","webprog10","a3e6096dbe9169213e7880821129428e","NUBD");
INSERT INTO cms_users VALUES ("6","birchler","8e2bee01a3fec73b1a7a4ea105fc21d5","NUBD");


