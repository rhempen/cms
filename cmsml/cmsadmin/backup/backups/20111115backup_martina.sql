#----------------------------------------------
# Backup der Datenbank cms_martina
# Erstellt am 15.11.2011 17:57
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
INSERT INTO cms_config VALUES ("1","general","THEME","martina",NULL,NULL);
INSERT INTO cms_config VALUES ("2","general","COPYRIGHT","Physiotherapie am Lindenplatz",NULL,NULL);
INSERT INTO cms_config VALUES ("3","general","MAX_THUMBS","4",NULL,NULL);
INSERT INTO cms_config VALUES ("4","general","MAX_LIST_ITEMS","6",NULL,NULL);
INSERT INTO cms_config VALUES ("5","general","LANGUAGE","DE",NULL,NULL);
INSERT INTO cms_config VALUES ("10","menu","HMENU_RICHTUNG","left","right",NULL);
INSERT INTO cms_config VALUES ("11","menu","HMENU_SUBMENU","submenu","dropdown",NULL);
INSERT INTO cms_config VALUES ("20","pictures","THUMB_PAGE_MAX_WIDTH","98",NULL,NULL);
INSERT INTO cms_config VALUES ("21","pictures","THUMB_PAGE_MAX_HEIGHT","98",NULL,NULL);
INSERT INTO cms_config VALUES ("22","pictures","THUMB_NAVI_MAX_WIDTH","640",NULL,NULL);
INSERT INTO cms_config VALUES ("23","pictures","THUMB_NAVI_MAX_HEIGHT","300",NULL,NULL);
INSERT INTO cms_config VALUES ("24","pictures","IMAGE_MAX_WIDTH","720",NULL,NULL);
INSERT INTO cms_config VALUES ("25","pictures","IMAGE_MAX_HEIGHT","480",NULL,NULL);
INSERT INTO cms_config VALUES ("14","menu","SMURL","ja","nein",NULL);
INSERT INTO cms_config VALUES ("13","menu","SUBNAV_SOFORT","nein","ja",NULL);
INSERT INTO cms_config VALUES ("15","menu","SMURL_REFRESH","ausf&uuml;hren","",NULL);
INSERT INTO cms_config VALUES ("12","menu","SUBMENU_DIR","horizontal","vertikal",NULL);
INSERT INTO cms_config VALUES ("8","general","EMAIL_RECEIVER","frontend/themes/martina/tpl",NULL,NULL);
INSERT INTO cms_config VALUES ("32","meta-tags","KEYWORDS","",NULL,"Physiotherapie Allschwil, Physiotherapie, Allschwil, Basel, Physio am Lindenplatz, Physio, Lindenplatz, Martina Dürmüller, physio-allschwil, Rheumathologie, Chirurgie, Lymphdrainage, Massage, aktive und passive Methoden");
INSERT INTO cms_config VALUES ("33","meta-tags","DESCRIPTION","",NULL,"Physiotherapie am Lindenplatz in 4123 Allschwil, Inhaberin Martina Dürmüller, Telefon 061/481 84 74");
INSERT INTO cms_config VALUES ("34","meta-tags","PAGE_TOPIC","",NULL,"Physiotherapie am Lindenplatz in Allschwil, Inhaberin Martina Dürmüller, physio-allschwil");
INSERT INTO cms_config VALUES ("35","meta-tags","PUBLISHER","",NULL,"Roland Hempen, WebPublisher, WebProgrammer Php, www.hempenweb.ch, Marianne Mathys, Grafik, Design, Zürich");
INSERT INTO cms_config VALUES ("26","pictures","DISK_DB_ADJUSTMENT","ausf&uuml;hren",NULL,NULL);
INSERT INTO cms_config VALUES ("9","general","GOOGLE_ANALYTICS","UA-9758474-1",NULL,NULL);
INSERT INTO cms_config VALUES ("7","general","TEMPLATE_DIR","frontend/themes/martina/tpl",NULL,NULL);
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
   PRIMARY KEY (frag_id),
   UNIQUE name (name, frag_id),
   KEY name_2 (name)
);

#
# Daten von Tabelle 'cms_fragmente'
#
INSERT INTO cms_fragmente VALUES ("1","teaser1","1","<p>Das ist Text in dem es auch einen Link auf eine Bilddatei hat.</p>
<p><a href=\"/beta/cms/media_martina/navi_003/_images/roland_0174.jpg\"><img src=\"/beta/cms/media_martina/navi_003/_thumbs/th_roland_0174.jpg\" alt=\"\" width=\"280\" height=\"186\" /></a></p>
<p>&nbsp;</p>
<p>Ausserdem gibt es auch einen Link auf eine Website.</p>
<p>hier ist der Link: <a title=\"hempenweb\" href=\"http://www.hempenweb.ch\" target=\"_blank\">hempenweb</a></p>");
INSERT INTO cms_fragmente VALUES ("2","teaser2","2","<div class=\"teasertext\">
<h2 class=\"teasertitle\">Teaser 2: Das ist Teaser 2</h2>
<p class=\"teasertext\">Zur Zeit lÃ¤uft im Fernsehen die Sendung ECO&nbsp;â€” Eine hochinteressante Sendung Ã¼ber Wirtschaft, Geld und Macht! Moderiert wird die Sendung von Reto Lipp</p>
<p class=\"teasertext\">Zur Zeit lÃ¤uft im Fernsehen die Sendung ECO&nbsp;â€” Eine hochinteressante Sendung Ã¼ber Wirtschaft, Geld und Macht! Moderiert wird die Sendung von Reto Lipp<br /><br /></p>
</div>");
INSERT INTO cms_fragmente VALUES ("3","teaser3","3","<h2>Teaser 3</h2>
<p>Das ist der Teaser Nummer 3</p>");
INSERT INTO cms_fragmente VALUES ("4","teaser4","4","");
INSERT INTO cms_fragmente VALUES ("5","footer","5","<div id=\"impressum\">
                                         
<ul>
<li class=\"title\">Impressum</li>
<li>Roland Hempen</li>
<li>hempenweb.ch</li>
<li>8055 Zürich</li>
</ul>
</div>
<div id=\"servlinks\">
			    
<ul>
<li class=\"title\">Servicelinks</li>
<li><a href=\"/beta/cms/media*/home\">Home</a></li>
<li><a href=\"/beta/cms/media*/kontakt\">Kontakt</a></li>
<li><a href=\"/beta/cms/media*/sitemap\">Sitemap</a></li>
</ul>
</div>
<div id=\"reflinks\">
			    
<ul>
<li class=\"title\">Portfolio</li>
<li><a onmouseover=\"javascript:showRefPic(1);\" onmouseout=\"javascript:$(\'refpics\').hide();\" href=\"http://www.physio-allschwil.ch\" target=\"_blank\">phyio-allschwil.ch</a></li>
<li><a onmouseover=\"javascript:showRefPic(2);\" onmouseout=\"javascript:$(\'refpics\').hide();\" href=\"http://www.birchler-architektur.ch\" target=\"_blank\">birchler-architektur.ch</a></li>
<li><a onmouseover=\"javascript:showRefPic(3);\" onmouseout=\"javascript:$(\'refpics\').hide();\" href=\"http://www.gigijacquier.ch\" target=\"_blank\">gigijacquier.ch</a></li>
<li><a onmouseover=\"javascript:showRefPic(4);\" onmouseout=\"javascript:$(\'refpics\').hide();\" href=\"http://www.art4art.ch\" target=\"_blank\">art4art.ch</a></li>
<li><a onmouseover=\"javascript:showRefPic(5);\" onmouseout=\"javascript:$(\'refpics\').hide();\" href=\"http://www.orasch.ch\" target=\"_blank\">orasch.ch</a></li>
<li><a onmouseover=\"javascript:showRefPic(6);\" onmouseout=\"javascript:$(\'refpics\').hide();\" href=\"http://www.physio-steiner.ch\" target=\"_blank\">Physio Steiner</a></li>
<li><a onmouseover=\"javascript:showRefPic(7);\" onmouseout=\"javascript:$(\'refpics\').hide();\" href=\"http://www.raku.ch\" target=\"_blank\">Raku</a></li>
</ul>
</div>");



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
INSERT INTO cms_galerien VALUES ("108","1","4","N","../../media_martina/navi_1/_images/home4.jpg",NULL);
INSERT INTO cms_galerien VALUES ("109","5","2","N","../../media_martina/navi_005/_images/dsc_0172.jpg","Wegweiser zur Praxis");
INSERT INTO cms_galerien VALUES ("4","1","1","N","../../media_martina/navi_1/_images/home.png",NULL);
INSERT INTO cms_galerien VALUES ("107","1","3","N","../../media_martina/navi_1/_images/home3.jpg",NULL);
INSERT INTO cms_galerien VALUES ("106","1","2","N","../../media_martina/navi_1/_images/home2.jpg",NULL);
INSERT INTO cms_galerien VALUES ("128","2","2","N","../../media_martina/navi_002/_images/dsc_0006.jpg","Alice Baumgartner");
INSERT INTO cms_galerien VALUES ("119","3","4","N","../../media_martina/navi_003/_images/roland_0118.jpg",NULL);
INSERT INTO cms_galerien VALUES ("131","5","3","N","../../media_martina/navi_005/_images/dsc_0536.jpg",NULL);
INSERT INTO cms_galerien VALUES ("62","2","3","N","../../media_martina/navi_002/_images/roland_0027.jpg","Mélanie Hénault");
INSERT INTO cms_galerien VALUES ("51","10","3","N","../../media_martina/navi_002_30/_images/roland_0210.jpg",NULL);
INSERT INTO cms_galerien VALUES ("122","8","3","N","../../media_martina/navi_002_10/_images/dsc_0106.jpg",NULL);
INSERT INTO cms_galerien VALUES ("127","9","1","N","../../media_martina/navi_002_20/_images/dsc_0006.jpg",NULL);
INSERT INTO cms_galerien VALUES ("24","8","2","N","../../media_martina/navi_002_10/_images/stefan_021.jpg",NULL);
INSERT INTO cms_galerien VALUES ("22","6","2","P","../../media_martina/navi_0040006/_images/roland_0160.jpg",NULL);
INSERT INTO cms_galerien VALUES ("50","10","2","N","../../media_martina/navi_002_30/_images/roland_0086.jpg",NULL);
INSERT INTO cms_galerien VALUES ("49","10","1","N","../../media_martina/navi_002_30/_images/roland_0027.jpg",NULL);
INSERT INTO cms_galerien VALUES ("28","2","2","P","../../media_martina/navi_0040002/_images/roland_0163.jpg",NULL);
INSERT INTO cms_galerien VALUES ("63","11","1","N","../../media_martina/navi_003_10/_images/dsc_0107.jpg",NULL);
INSERT INTO cms_galerien VALUES ("30","14","1","N","../../media_martina/navi_003_40/_images/roland_0155.jpg",NULL);
INSERT INTO cms_galerien VALUES ("71","14","3","N","../../media_martina/navi_003_40/_images/dsc_0050.jpg",NULL);
INSERT INTO cms_galerien VALUES ("32","14","2","N","../../media_martina/navi_003_40/_images/roland_0118.jpg",NULL);
INSERT INTO cms_galerien VALUES ("33","15","1","N","../../media_martina/navi_003_50/_images/stefan_199.jpg",NULL);
INSERT INTO cms_galerien VALUES ("34","15","2","N","../../media_martina/navi_003_50/_images/stefan_207.jpg",NULL);
INSERT INTO cms_galerien VALUES ("35","13","2","N","../../media_martina/navi_003_30/_images/stefan_086.jpg",NULL);
INSERT INTO cms_galerien VALUES ("66","12","2","N","../../media_martina/navi_003_20/_images/dsc_0045.jpg",NULL);
INSERT INTO cms_galerien VALUES ("37","8","2","P","../../media_martina/navi_0040008/_images/roland_0094.jpg",NULL);
INSERT INTO cms_galerien VALUES ("38","9","3","P","../../media_martina/navi_0040009/_images/roland_0143.jpg",NULL);
INSERT INTO cms_galerien VALUES ("39","9","3","P","../../media_martina/navi_0040009/_images/roland_0092.jpg",NULL);
INSERT INTO cms_galerien VALUES ("40","3","1","P","../../media_martina/navi_0040003/_images/roland_0139.jpg",NULL);
INSERT INTO cms_galerien VALUES ("41","3","2","P","../../media_martina/navi_0040003/_images/roland_0141.jpg",NULL);
INSERT INTO cms_galerien VALUES ("42","1","1","P","../../media_martina/navi_0040001/_images/stefan_042.jpg",NULL);
INSERT INTO cms_galerien VALUES ("43","4","3","P","../../media_martina/navi_0040004/_images/roland_0118.jpg",NULL);
INSERT INTO cms_galerien VALUES ("44","4","1","P","../../media_martina/navi_0040004/_images/roland_0156.jpg",NULL);
INSERT INTO cms_galerien VALUES ("82","5","1","P","../../media_martina/navi_0040005/_images/dsc_0088.jpg",NULL);
INSERT INTO cms_galerien VALUES ("81","5","2","P","../../media_martina/navi_0040005/_images/dsc_0069.jpg",NULL);
INSERT INTO cms_galerien VALUES ("112","4","1","N","../../media_martina/navi_004/_images/roland_0139.jpg","passive Therapie");
INSERT INTO cms_galerien VALUES ("111","4","3","N","../../media_martina/navi_004/_images/dsc_0107.jpg","aktive Therapie");
INSERT INTO cms_galerien VALUES ("70","13","1","N","../../media_martina/navi_003_30/_images/dsc_0104.jpg",NULL);
INSERT INTO cms_galerien VALUES ("72","7","1","P","../../media_martina/navi_0040007/_images/dsc_0071.jpg",NULL);
INSERT INTO cms_galerien VALUES ("130","8","1","N","../../media_martina/navi_002_10/_images/dsc_0015.jpg",NULL);
INSERT INTO cms_galerien VALUES ("126","9","2","N","../../media_martina/navi_002_20/_images/dsc_0063.jpg",NULL);
INSERT INTO cms_galerien VALUES ("125","9","3","N","../../media_martina/navi_002_20/_images/dsc_0130.jpg",NULL);
INSERT INTO cms_galerien VALUES ("64","11","2","N","../../media_martina/navi_003_10/_images/dsc_0191.jpg",NULL);
INSERT INTO cms_galerien VALUES ("65","11","3","N","../../media_martina/navi_003_10/_images/dsc_0696.jpg",NULL);
INSERT INTO cms_galerien VALUES ("67","12","3","N","../../media_martina/navi_003_20/_images/dsc_0152.jpg",NULL);
INSERT INTO cms_galerien VALUES ("69","12","1","N","../../media_martina/navi_003_20/_images/dsc_0720.jpg",NULL);
INSERT INTO cms_galerien VALUES ("73","7","2","P","../../media_martina/navi_0040007/_images/dsc_0079.jpg",NULL);
INSERT INTO cms_galerien VALUES ("74","7","3","P","../../media_martina/navi_0040007/_images/dsc_0084.jpg",NULL);
INSERT INTO cms_galerien VALUES ("75","9","2","P","../../media_martina/navi_0040009/_images/dsc_0036.jpg",NULL);
INSERT INTO cms_galerien VALUES ("76","8","2","P","../../media_martina/navi_0040008/_images/dsc_0040.jpg",NULL);
INSERT INTO cms_galerien VALUES ("77","8","3","P","../../media_martina/navi_0040008/_images/dsc_0186.jpg",NULL);
INSERT INTO cms_galerien VALUES ("78","3","3","P","../../media_martina/navi_0040003/_images/roland_0148.jpg",NULL);
INSERT INTO cms_galerien VALUES ("79","1","2","P","../../media_martina/navi_0040001/_images/dsc_0066.jpg",NULL);
INSERT INTO cms_galerien VALUES ("80","4","2","P","../../media_martina/navi_0040004/_images/dsc_0052.jpg",NULL);
INSERT INTO cms_galerien VALUES ("83","5","3","P","../../media_martina/navi_0040005/_images/dsc_0090.jpg",NULL);
INSERT INTO cms_galerien VALUES ("129","2","1","N","../../media_martina/navi_002/_images/dsc_0015.jpg","Martina Dürmüller");
INSERT INTO cms_galerien VALUES ("114","3","3","N","../../media_martina/navi_003/_images/dsc_0104.jpg",NULL);
INSERT INTO cms_galerien VALUES ("120","3","1","N","../../media_martina/navi_003/_images/roland_0174.jpg",NULL);
INSERT INTO cms_galerien VALUES ("116","3","2","N","../../media_martina/navi_003/_images/dsc_0720.jpg",NULL);
INSERT INTO cms_galerien VALUES ("118","7","1","N","../../media_martina/navi_007/_images/christoph_0553.jpg",NULL);
INSERT INTO cms_galerien VALUES ("90","12","1","P","../../media_martina/navi_0040012/_images/stefan_199.jpg",NULL);
INSERT INTO cms_galerien VALUES ("91","12","2","P","../../media_martina/navi_0040012/_images/stefan_207.jpg",NULL);
INSERT INTO cms_galerien VALUES ("92","6","1","P","../../media_martina/navi_0040006/_images/dsc_0644.jpg",NULL);
INSERT INTO cms_galerien VALUES ("97","10","1","P","../../media_martina/navi_0040010/_images/dsc_0107.jpg",NULL);
INSERT INTO cms_galerien VALUES ("96","10","2","P","../../media_martina/navi_0040010/_images/roland_065.jpg",NULL);
INSERT INTO cms_galerien VALUES ("98","10","3","P","../../media_martina/navi_0040010/_images/dsc_0161.jpg",NULL);
INSERT INTO cms_galerien VALUES ("99","11","1","P","../../media_martina/navi_0040011/_images/roland_0001.jpg",NULL);
INSERT INTO cms_galerien VALUES ("100","11","2","P","../../media_martina/navi_0040011/_images/roland_0174.jpg",NULL);
INSERT INTO cms_galerien VALUES ("101","11","3","P","../../media_martina/navi_0040011/_images/dsc_0144.jpg",NULL);
INSERT INTO cms_galerien VALUES ("102","13","2","P","../../media_martina/navi_0040013/_images/dsc_0066.jpg",NULL);
INSERT INTO cms_galerien VALUES ("103","13","1","P","../../media_martina/navi_0040013/_images/dsc_0138.jpg",NULL);
INSERT INTO cms_galerien VALUES ("104","14","1","P","../../media_martina/navi_0040014/_images/dsc_0104.jpg",NULL);
INSERT INTO cms_galerien VALUES ("105","14","2","P","../../media_martina/navi_0040014/_images/stefan_086.jpg",NULL);
INSERT INTO cms_galerien VALUES ("110","5","1","N","../../media_martina/navi_005/_images/dsc_0174.jpg","die Praxis befindet sich an der Lindenstrasse 9 im 2. Stock (oberhalb des Coop-Logos)");
INSERT INTO cms_galerien VALUES ("113","4","2","N","../../media_martina/navi_004/_images/dsc_0036.jpg","manuelle Therapie");
INSERT INTO cms_galerien VALUES ("132","19","1","N","../../media_martina/navi_019/_images/stefan_035.jpg",NULL);
INSERT INTO cms_galerien VALUES ("133","19","2","N","../../media_martina/navi_019/_images/roland_0001.jpg",NULL);
INSERT INTO cms_galerien VALUES ("134","19","3","N","../../media_martina/navi_019/_images/dsc_0696.jpg",NULL);
INSERT INTO cms_galerien VALUES ("135","19","4","N","../../media_martina/navi_019/_images/dsc_0720.jpg",NULL);
INSERT INTO cms_galerien VALUES ("139","6","3","P","../../media_martina/navi_0040006/_images/mcith","");



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
INSERT INTO cms_modules VALUES ("3","SITEMAP","Sitemap");
INSERT INTO cms_modules VALUES ("2","KONTAKTFORMULAR","Kontaktformular");
INSERT INTO cms_modules VALUES ("1","PAGES_OVERVIEW","Unterseiten zur aktuellen Menuposition auflisten");



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
    nav_type set('','S','H','V'),
   PRIMARY KEY (nav_id),
   KEY domain (domain)
);

#
# Daten von Tabelle 'cms_navigation'
#
INSERT INTO cms_navigation VALUES ("1","navi_1","1","0","home","home","navi_1","j","j","H");
INSERT INTO cms_navigation VALUES ("2","navi_002","2","0","wer","wer","navi_002","j","n","H");
INSERT INTO cms_navigation VALUES ("3","navi_003","3","0","was","was","navi_003","j","n","H");
INSERT INTO cms_navigation VALUES ("4","navi_004","4","0","wie","wie","navi_004","j","n","H");
INSERT INTO cms_navigation VALUES ("5","navi_005","5","0","wo","wo","navi_005","j","n","H");
INSERT INTO cms_navigation VALUES ("6","navi_006","6","0","links","links","navi_006","n","n","S");
INSERT INTO cms_navigation VALUES ("7","navi_007","8","0","impressum","impressum","navi_007","j","n","S");
INSERT INTO cms_navigation VALUES ("8","navi_002","2","10","Martina Dürmüller","MartinaDürmüller","navi_002_10","j","n",NULL);
INSERT INTO cms_navigation VALUES ("19","navi_019","7","0","sitemap","sitemap","navi_019","j","n","S");
INSERT INTO cms_navigation VALUES ("9","navi_002","2","20","Alice Baumgartner","AliceBaumgartner","navi_002_20","j","n",NULL);
INSERT INTO cms_navigation VALUES ("10","navi_002","2","30","Mélanie Hénault","MélanieHénault","navi_002_30","j","n",NULL);
INSERT INTO cms_navigation VALUES ("11","navi_003","3","10","Rheumatologie","Rheumatologie","navi_003_10","j","n",NULL);
INSERT INTO cms_navigation VALUES ("12","navi_003","3","20","Operationen","Operationen","navi_003_20","j","n",NULL);
INSERT INTO cms_navigation VALUES ("13","navi_003","3","30","Neurologie","Neurologie","navi_003_30","j","n",NULL);
INSERT INTO cms_navigation VALUES ("14","navi_003","3","40","Lymphdrainage","Lymphdrainage","navi_003_40","j","n",NULL);
INSERT INTO cms_navigation VALUES ("15","navi_003","3","50","Inkontinenztherapie","Inkontinenztherapie","navi_003_50","j","n",NULL);
INSERT INTO cms_navigation VALUES ("16","navi_004","4","10","aktive Therapie","aktiveTherapie","navi_004_10","j","n",NULL);
INSERT INTO cms_navigation VALUES ("17","navi_004","4","20","passive Therapie","passiveTherapie","navi_004_20","j","n",NULL);
INSERT INTO cms_navigation VALUES ("18","navi_004","4","30","manuelle Therapie","manuelleTherapie","navi_004_30","j","n",NULL);



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
    galerie enum('n','a','b','c') DEFAULT "n" NOT NULL,
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
INSERT INTO cms_pages VALUES ("1","17","navi_004","navi_0040001","Bindegewebsmassage","passive_Therapie","0000-00-00 00:00:00","0000-00-00 00:00:00","Die medizinische Bindegewebsmassage ist eine Massage der Haut, Unterhaut, Muskulatur und der Faszien.","<p>Die medizinische Bindegewebsmassage ist eine Massage der Haut, Unterhaut, Muskulatur und der Faszien. Behandelt wird mit mechanischen Dehnreizen und mit Hilfe einer bestimmten Zug- Schiebe und Strichtechnik</p>
<p>Sie gehört zu den Reflexzonenmassagen. Die Behandlung hat nicht nur einen lokalen Effekt, sondern wirkt über Nervenreflexbögen auch auf innere Organe und stabilisiert das vegetative Nervensystem.</p>","","2","../../media_martina/navi_0040001/_thumbs/th_stefan_042.jpg","","b","5","6","j","4");
INSERT INTO cms_pages VALUES ("2","17","navi_004","navi_0040002","Elektrotherapie","passive_Therapie","0000-00-00 00:00:00","0000-00-00 00:00:00","Die medizinische Elektrotherapie ist die Behandlung des Patienten mit Hilfe diverser elektrischer Ströme.","<p>Die medizinische Elektrotherapie ist die Behandlung des Patienten mit Hilfe diverser elektrischer Ströme. Bei der Behandlung werden Elektroden auf der Haut angebracht. Je nach gewählter Stromform und Frequenz werden verschiedene physikalische und chemische Prozesse ausgelöst, welche zur Schmerzlinderung, Durchblutungsförderung, Ödemresorption oder Muskelreizung eingesetzt werden.</p>","","2","../../media_martina/navi_0040002/_thumbs/th_roland_0163.jpg","","b","6","7","j","6");
INSERT INTO cms_pages VALUES ("3","17","navi_004","navi_0040003","Klassische Massage","passive_Therapie","0000-00-00 00:00:00","0000-00-00 00:00:00","Die Klassische Massage ist eine Massage der Haut, Unterhaut, des Bindegewebes und der Muskulatur durch Dehnungs- Zug- und Druckreize.","<p>Die Klassische Massage ist eine Massage der Haut, Unterhaut, des Bindegewebes und der Muskulatur durch Dehnungs- Zug- und Druckreize. Verschiedene Handgriffe bewirken unterschiedliche Wirkungen. Zu den Griffen gehören die Effleurage (Streichungen), Petrissage (Knetung, Walkung), Friktion (Reibung), Tapotement (Klopfung) und die Vibration. Ziel ist je nach Anwendung die Normalisierung der Muskelspannung, die Förderung der Durchblutung, das Lösen von Verhärtungen und Gewebsverklebungen. Nebenbei trägt die Massage zur allgemeinen Entspannung und zum Wohlbefinden bei.</p>","","2","../../media_martina/navi_0040003/_thumbs/th_roland_0139.jpg","","b","7","4","j","1");
INSERT INTO cms_pages VALUES ("4","17","navi_004","navi_0040004","Lymphdrainage","passive_Therapie","0000-00-00 00:00:00","0000-00-00 00:00:00","Die medizinische Lymphdrainage versteht sich als komplexe physikalische Entstauungstherapie.","<p>Die medizinische Lymphdrainage versteht sich als komplexe physikalische Entstauungstherapie. Sie besteht aus der manuellen Lymphdrainage, entstauungsfördernden Übungen und der Kompression (Bandagierung oder Kompressionsstrumpf). Die Lymphdrainage wird durch spezielle Handgriffe ausgeführt, die auf das Gewebe eine Sog- und Druckwirkung ausüben. Somit werden die Lymphgefässe angeregt und die Lymphflüssigkeit der geschwollenen Gebiete in die Lymphbahnen geleitet und abtransportiert. Es ist eine sanfte Anwendung die zur Verbesserung des lymphatischen und venösen Rückflusses führt.</p>","","2","../../media_martina/navi_0040004/_thumbs/th_roland_0118.jpg","","b","3","5","j","2");
INSERT INTO cms_pages VALUES ("5","17","navi_004","navi_0040005","Triggerpunkttherapie","passive_Therapie","0000-00-00 00:00:00","0000-00-00 00:00:00","Triggerpunkt bezeichnet im medizinischen Bereich einen Auslöse-Punkt.","<p>Triggerpunkt bezeichnet im medizinischen Bereich einen Auslöse-Punkt. Aktiviert werden diese Punkte, wenn der Muskel überdehnt oder chronisch überlastet wird. Es handelt sich um kleine schlecht durchblutete Stellen im verspannten Muskel. Diese sind speziell auf Druck und Zug empfindlich und können in angrenzende Areale ausstrahlen. Bei der Behandlung werden die Muskeln punktuell gedrückt, im Faserverlauf ausgestrichen oder mit Druck und aktiver Bewegung kombiniert. Die Behandlung ist kurzzeitig schmerzhaft. Der Schmerz lässt nach einer gewissen Zeit nach.</p>","","2","../../media_martina/navi_0040005/_thumbs/th_dsc_0069.jpg","","b","4","1","j","3");
INSERT INTO cms_pages VALUES ("6","17","navi_004","navi_0040006","Ultraschall","passive_Therapie","0000-00-00 00:00:00","0000-00-00 00:00:00","Der therapeutische Ultraschall umfasst die Anwendung von Schallwellen mit einer Schwingfrequenz oberhalb des Hörbereichs.","<p>Der therapeutische Ultraschall umfasst die Anwendung von Schallwellen mit einer Schwingfrequenz oberhalb des Hörbereichs. Er bewirkt eine Mikromassage die durch mechanische Schwingen erzeugt wird und hat weiter einen thermischen Effekt. Beides führt zu einer Schmerzlinderung, Durchblutungsförderung, Stoffwechselverbesserung und Entspannung im Muskel- Sehnenbereich. Der Ultraschall wird erfolgreich eingesetzt etwa bei Tendinitis (z.B. Tennis-Ellbogen), Narbenbehandlungen, und Verspannungen im lokalen Muskelbereich.</p>","","2","../../media_martina/navi_0040006/_thumbs/th_dsc_0644.jpg","","b","1","2","j","5");
INSERT INTO cms_pages VALUES ("7","17","navi_004","navi_0040007","Wärme oder Kältepackungen","passive_Therapie","0000-00-00 00:00:00","0000-00-00 00:00:00","Die Wärmepackung wirkt muskelentspannend, die Kälteanwendung führt zu Schmerzreduktion.","<p>Die Wärmepackung wirkt muskelentspannend, durchblutungsfördernd, schmerzlindernd und trägt zur allgemeinen Beruhigung bei.</p>
<p><br />Die Kälteanwendung führt zu Schmerzreduktion, Verminderung der Durchblutung und senkt die Muskelspannung.</p>","","2","../../media_martina/navi_0040007/_thumbs/th_dsc_0071.jpg","","b","2","3","j","7");
INSERT INTO cms_pages VALUES ("8","18","navi_004","navi_0040008","Analytische Biomechanik nach R. Sohier","manuelle_Therapie","0000-00-00 00:00:00","0000-00-00 00:00:00","Die biomechanischen Gesetzmässigkeiten des menschlichen Bewegungs-apparates sind die Grundlagen dieses Behandlungskonzeptes.","<p>Die biomechanischen Gesetzmässigkeiten des menschlichen Bewegungsapparates sind die Grundlagen dieses physiotherapeutischen Behandlungskonzeptes. Pathomechanische Abweichungen der Bewegung und der Statik werden analysiert. Mit selektiven und speziellen Grifftechniken und der darauf aufbauenden Muskelkräftigung werden die Gelenke zentriert und die Bewegungsabläufe neu stimuliert.</p>
<p>Das Sohier- Konzept wurde vor 45 Jahren in Belgien von Raymond Sohier begründet und hat sich seither stets weiterentwickelt. </p>","","1","../../media_martina/navi_0040008/_thumbs/th_roland_0094.jpg","","b","9","0","j","2");
INSERT INTO cms_pages VALUES ("9","18","navi_004","navi_0040009","Das Kaltenborn – Evjenth – Konzept","manuelle_Therapie","0000-00-00 00:00:00","0000-00-00 00:00:00","Diese Methode basiert auf der ganzheitlichen Untersuchung und Behandlung von Dysfunktionen eines Gelenkes oder Körperteiles.","<p>Auch diese Methode basiert auf der ganzheitlichen Untersuchung und Behandlung von Dysfunktionen eines Gelenkes oder Körperteiles. Die Gelenksbeweglichkeit, der Status der Muskulatur und die Haltung des Patienten deuten auf die Ursache der Beschwerden hin. Neben der Mobilisation der passiven Gelenkstrukturen entwickelte O. Evjenth zusätzlich spezifische Behandlungsmethoden für Weichteile wie Muskeldehnungen, spezifische Weichteiltechniken und Nervenmobilisationstechniken.</p>","","1","../../media_martina/navi_0040009/_thumbs/th_dsc_0036.jpg","","b","8","0","j","1");
INSERT INTO cms_pages VALUES ("10","16","navi_004","navi_0040010","Bewegungstherapie","aktive_Therapie","0000-00-00 00:00:00","0000-00-00 00:00:00","Nach einer umfassenden Analyse von funktionellen Bewegungseinschränkungen des Patienten wird die Therapie individuell aufgebaut.","<p>Nach einer umfassenden Analyse von funktionellen Bewegungseinschränkungen des Patienten wird die Therapie individuell aufgebaut. Beweglichkeit der Gelenke, Dehnfähigkeit und Kraft der Muskulatur, sowie Qualität der Bewegung werden untersucht und entsprechende Defizite behandelt. Das Schwergewicht liegt auf der qualitativen Beeinflussung, das heisst Schulung von Haltung, Bewegung, Koordination und Ganganalyse. Die täglichen Bewegungsabläufe sollen möglichst ökonomisch angepasst werden. Diese müssen wiederholt eingeübt werden, um automatisiert zu werden. Der Therapeut wählt verschiedene Ausgangspositionen und kann diverse Hilfsmittel wie z.B. Ball oder Theraband verwenden.</p>",NULL,"2","../../media_martina/navi_0040010/_thumbs/th_roland_065.jpg",NULL,"b","11","0","j","1");
INSERT INTO cms_pages VALUES ("11","16","navi_004","navi_0040011","Trainingstherapie","aktive_Therapie","0000-00-00 00:00:00","0000-00-00 00:00:00","Kraft, Ausdauer, Beweglichkeit und Koordination bilden die Grundlagen eines gesunden Körpers. Im Mittelpunkt der Trainingstherapie stehen...","<p>Kraft, Ausdauer, Beweglichkeit und Koordination bilden die Grundlagen eines gesunden Körpers. Im Mittelpunkt der Trainingstherapie stehen Wiederherstellung und Verbesserung der allgemeinen Leistungsfähigkeit und körperlichen Kondition. Die verschiedenen Gewebsstrukturen wie Muskeln, Sehnen, Knochen und Bänder werden spezifisch belastet und dadurch gestärkt. Damit wird die Belastungsfähigkeit des Patienten in Beruf und Sport individuell trainiert.</p>
<p>Zugapparat, Kurzhanteln, Langhantel, Bike oder Kreisel und Schaukelbrett dienen als Trainingsgeräte. Durch Übungsauswahl, Gewicht, Widerstand, Wiederholungszahl, Schnelligkeit wird der Trainingsaufbau optimal gestaltet. Die medizinische Trainingstherapie kann auch in der Rehabilitation eingesetzt werden und wirkt präventiv vor Verletzungen und Überlastungsschäden.</p>","","2","../../media_martina/navi_0040011/_thumbs/th_roland_0001.jpg","","b","12","0","j","2");
INSERT INTO cms_pages VALUES ("12","16","navi_004","navi_0040012","Inkontinenztherapie","aktive_Therapie","0000-00-00 00:00:00","0000-00-00 00:00:00","Nach einer eingehenden Befundaufnahme wird die Patientin über die Möglichkeiten und den Aufbau einer Inkontinenztherapie informiert.","<p>Nach einer eingehenden Befundaufnahme wird die Patientin über die Möglichkeiten und den Aufbau einer Inkontinenztherapie informiert. Diese basiert auf mehreren Säulen:</p>
<p>&nbsp;</p>
<ol>
<li>Information über die Anatomie des Beckens und des Beckenbodens</li>
<li>Wahrnehmungsschulung des Beckenbodens, die Patientin lernt ihren Körper und ihren Beckenboden besser spühren.</li>
<li>Kräfigung der Beckenbodenmuskulatur. Die muskuläre Kontraktion kann durch Elektrostimulation und Biofeedback unterstützt werden.</li>
<li>Einbezug des Beckenbodentrainings in den Alltag und Verhaltensänderung und Schulung der Körperhaltung.</li>
</ol>","","2","../../media_martina/navi_0040012/_thumbs/th_stefan_199.jpg","","b","13","0","j","3");
INSERT INTO cms_pages VALUES ("13","16","navi_004","navi_0040013","Atemtherapie","aktive_Therapie","0000-00-00 00:00:00","0000-00-00 00:00:00","In der Atemtherapie lernt der Patient eine optimale Atemtechnik. Die Behandlung führt zu einer physiologischen Atmung durch Vertiefung der Atmung.","<p>In der Atemtherapie lernt der Patient eine optimale Atemtechnik. Die Behandlung führt zu einer physiologischen Atmung durch Vertiefung der Atmung, durch Lösung und Mobilisation des Sekretes und durch Förderung der Thoraxbeweglichkeit. Meist wird die Atemtherapie von einer Bewegungstherapie begleitet, um die körperliche Leistungsfähigkeit zu steigern. Damit kann die Lebensqualität im Alltag verbessert werden.</p>
<p>Bei folgenden Erkrankungen ist eine physiotherapeutische Atemtherapie  angezeigt:</p>
<ul>
<li>Asthma</li>
<li>Chronisch obstruktive Lungenkrankheiten</li>
<li>Nach Bauchoperationen</li>
<li>Cystische Fibrose</li>
<li>Andere Erkrankungen der Lunge</li>
</ul>
<p>Die Atemtherapie wird oft als ergänzende Massnahme bei Erkrankungen oder nach Operationen empfohlen. Auch Schmerzen am Bewegungsapparat können durch Atemübungen beeinflusst werden. Zudem führt die Atemtherapie zu einer verbesserten Körperwahrnehmung und allgemeinen Entspannung.</p>","","2","../../media_martina/navi_0040013/_thumbs/th_dsc_0138.jpg","","b","14","0","j","4");
INSERT INTO cms_pages VALUES ("14","16","navi_004","navi_0040014","Neurorehabilitation nach Bobath","aktive_Therapie","0000-00-00 00:00:00","0000-00-00 00:00:00","In der Nachbehandlung von Erkrankungen des zentralen Nervensystems arbeiten wir unter anderem mit dem Bobath-Konzept.","<p>In der Nachbehandlung von Erkrankungen des zentralen Nervensystems arbeiten wir unter anderem mit dem Bobath-Konzept. Das Konzept wurde in der 40er Jahren vom Ehepaar Bobath entwickelt. Es basiert auf der Annahme der Plastizität des Gehirns. Das Gehirn ist lernfähig und verlorengegangene Funktionen können von gesunden Hirnregionen ganz oder teilweise übernommen werden. Prinzipien sind Regulation des Muskeltonus und Anbahnung von physiologischen Bewegungsabläufen um eine grösstmögliche Selbstständigkeit zu erlangen.</p>","","2","../../media_martina/navi_0040014/_thumbs/th_dsc_0104.jpg","","b","10","0","j","5");



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
    kuerzel char(50) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE pagid (navid, subid, pagid)
);

#
# Daten von Tabelle 'cms_redirect'
#
INSERT INTO cms_redirect VALUES ("1","1","0","0","home");
INSERT INTO cms_redirect VALUES ("2","2","0","0","wer");
INSERT INTO cms_redirect VALUES ("3","2","8","0","martina_duermueller");
INSERT INTO cms_redirect VALUES ("4","2","9","0","alice_baumgartner");
INSERT INTO cms_redirect VALUES ("5","2","10","0","melanie_henault");
INSERT INTO cms_redirect VALUES ("6","3","0","0","was");
INSERT INTO cms_redirect VALUES ("7","3","11","0","rheumatologie");
INSERT INTO cms_redirect VALUES ("8","3","12","0","operationen");
INSERT INTO cms_redirect VALUES ("9","3","13","0","neurologie");
INSERT INTO cms_redirect VALUES ("10","3","14","0","lymphdrainage");
INSERT INTO cms_redirect VALUES ("11","3","15","0","inkontinenztherapie");
INSERT INTO cms_redirect VALUES ("12","4","0","0","wie");
INSERT INTO cms_redirect VALUES ("13","4","16","0","aktive_therapie");
INSERT INTO cms_redirect VALUES ("14","4","17","0","passive_therapie");
INSERT INTO cms_redirect VALUES ("15","4","18","0","manuelle_therapie");
INSERT INTO cms_redirect VALUES ("16","5","0","0","wo");
INSERT INTO cms_redirect VALUES ("17","6","0","0","links");
INSERT INTO cms_redirect VALUES ("18","19","0","0","sitemap");
INSERT INTO cms_redirect VALUES ("19","7","0","0","impressum");
INSERT INTO cms_redirect VALUES ("20","4","17","1","bindegewebsmassage");
INSERT INTO cms_redirect VALUES ("21","4","17","2","elektrotherapie");
INSERT INTO cms_redirect VALUES ("22","4","17","3","klassische_massage");
INSERT INTO cms_redirect VALUES ("23","4","17","4","lymphdrainage");
INSERT INTO cms_redirect VALUES ("24","4","17","5","triggerpunkttherapie");
INSERT INTO cms_redirect VALUES ("25","4","17","6","ultraschall");
INSERT INTO cms_redirect VALUES ("26","4","17","7","waerme_oder_kaeltepackungen");
INSERT INTO cms_redirect VALUES ("27","4","18","8","analytische_biomechanik_nach_r_sohier");
INSERT INTO cms_redirect VALUES ("28","4","18","9","das_kaltenborn__evjenth__konzept");
INSERT INTO cms_redirect VALUES ("29","4","16","10","bewegungstherapie");
INSERT INTO cms_redirect VALUES ("30","4","16","11","trainingstherapie");
INSERT INTO cms_redirect VALUES ("31","4","16","12","inkontinenztherapie");
INSERT INTO cms_redirect VALUES ("32","4","16","13","atemtherapie");
INSERT INTO cms_redirect VALUES ("33","4","16","14","neurorehabilitation_nach_bobath");



# ----------------------------------------------------------
#
# Struktur von Tabelle 'cms_seiten'
#
DROP TABLE IF EXISTS cms_seiten;
CREATE TABLE cms_seiten (
    seiten_id smallint(6) NOT NULL auto_increment,
    nav_id smallint(6) DEFAULT "0" NOT NULL,
    nummer tinyint(4) DEFAULT "0" NOT NULL,
    kurztitel varchar(125) NOT NULL,
    zusatztext varchar(125),
    template tinyint(3) DEFAULT "1" NOT NULL,
    modul tinyint(3) unsigned DEFAULT "0" NOT NULL,
    inhalt1 text NOT NULL,
    inhalt2 text,
    bild1 varchar(125),
    aktiv enum('j','n') DEFAULT "j" NOT NULL,
    galerie enum('n','a','b','c') DEFAULT "a" NOT NULL,
   PRIMARY KEY (seiten_id)
);

#
# Daten von Tabelle 'cms_seiten'
#
INSERT INTO cms_seiten VALUES ("1","1","1","home","","4","0","<h1 style=\"text-align: left;\">PHYSIOTHERAPIE AM LINDENPLATZ</h1>
<p><br />Praxis&nbsp;am Lindenplatz<br />Martina Dürmüller<br />Dipl.&nbsp;Physiotherapeutin<br />Lindenstrasse 9<br />4123 Allschwil<br />Telefon: 061 481 84 74</p>
<p><a href=\"mailto:info@physio-allschwil.ch\">info@physio-allschwil.ch</a> </p>
<p>&nbsp;</p>
<p>%teaser1%</p>","","../../media_martina/navi_1/_thumbs/th_home.png","n","c");
INSERT INTO cms_seiten VALUES ("2","2","1","wer","","2","0","<p>Seit über 10 Jahren engagieren wir uns für Ihr Wohlbefinden. Mit Freude am Beruf, fundiertem Fachwissen und Einfühlungsvermögen bieten wir Ihnen spezifische Lösungen für Ihre Gesundheit. Wir nehmen uns Zeit für Sie in angenehmer und einladender Atmosphäre.</p>
<p>&nbsp;</p>
<p><a href=\"/beta/cms/wer/martina_duermueller\" target=\"_self\">&gt; Martina Dürmüller</a></p>
<p><a href=\"/beta/cms/wer/alice_baumgartner\" target=\"_self\">&gt; Alice Baumgartner</a></p>
<p><a href=\"/beta/cms/wer/melanie_henault\" target=\"_self\">&gt; Mélanie Hénault</a></p>","","../../media_martina/navi_002/_thumbs/th_dsc_0015.jpg","j","b");
INSERT INTO cms_seiten VALUES ("3","3","1","was","","2","0","<p>Wir behandeln vorwiegend Patienten mit Erkrankungen oder Beschwerden aus den folgenden Bereichen:</p>
<p>&nbsp;</p>
<p><a href=\"/beta/cms/was/rheumatologie\" target=\"_self\">&gt; Rheumatologie</a></p>
<p><a href=\"/beta/cms/was/operationen\" target=\"_self\">&gt; Operationen</a></p>
<p><a href=\"/beta/cms/was/neurologie\" target=\"_self\">&gt; Neurologie</a></p>
<p><a href=\"/beta/cms/was/lymphdrainage\" target=\"_self\">&gt; Lymphdrainage</a></p>
<p><a href=\"/beta/cms/was/inkontinenztherapie\" target=\"_self\">&gt; Inkontinenztherapie</a></p>","","../../media_martina/navi_003/_thumbs/th_roland_0174.jpg","j","b");
INSERT INTO cms_seiten VALUES ("4","4","1","wie","","2","0","<h2>Aktive Therapie</h2>
<p>Die aktive Therapie besteht aus der Bewegungsschulung zur Verbesserung und zum Aufbau von Kraft, Ausdauer, Beweglichkeit, Koordination und Gleichgewicht. Durch geziehlte und befundorientierte Instruktion lernt der Patient Alltagsaufgaben in Beruf, Sport und Freizeit wieder zu bewältigen.</p>
<p><a href=\"/beta/cms/wie/aktive_therapie\" target=\"_self\">&gt; mehr<br /></a>&nbsp;</p>
<h2>Passive Therapie</h2>
<p>Unter passiver Therapie versteht man eine Anwendungsform zur
Linderung von Schmerzzuständen und Krankheitsbeschwerden ohne aktive
Beteiligung des Patienten.</p>
<p><a href=\"/beta/cms/wie/passive_therapie\" target=\"_self\">&gt; mehr<br /></a>&nbsp;</p>
<h2>Manuelle Therapie</h2>
<p>Die manuelle Therapie dient zur Diagnose und Behandlung von Funktionsstörungen am Bewegungsapparat wie Gelenken und Muskeln. Sie wird mit den Händen des Therapeuten, also manuell ausgeführt. Die speziellen Techniken und Handgriffe werden zur Mobilisation sowie der Wiederherstellung der Biomechanik eingesetzt.<br /><a title=\"Manuelle Therapie\" href=\"/beta/cms/wie/manuelle_therapie\" target=\"_self\">&gt; mehr<br /></a></p>","","../../media_martina/navi_004/_thumbs/th_dsc_0107.jpg","j","b");
INSERT INTO cms_seiten VALUES ("5","5","1","wo","So finden Sie uns","2","0","<p>Unsere Physiotherapie befindet sich direkt am Lindenplatz in Allschwil. Sie erreichen uns einfach:</p>
<p>&nbsp;</p>
<h3>Öffentlicher Verkehr </h3>
<ul>
<li>mit der Tramlinie 6 bis Lindenplatz</li>
<li>Mit der Buslinie 36 bis Morgartenring: Fussweg 5 Min.</li>
</ul>
<p>&nbsp;</p>
<h3>Mit dem Auto</h3>
<p>Es befinden sich genügend Parkplätze am Lindenplatz<br /><a href=\"http://maps.google.ch/maps?q=LINDENSTRASSE+9,+Allschwil&amp;hl=de&amp;cd=1&amp;ei=O1jYStXWJcL7_Aa218GCCw&amp;sig2=degy9WmBUHgTyatKunxBgA&amp;ie=UTF8&amp;view=map&amp;cid=17992405630932066745&amp;iwloc=A\" target=\"_blank\">&gt; Google maps</a> </p>
<p>&nbsp;</p>
<h3>Kosten</h3>
<ul>
<li>Bei Überweisung durch den Arzt wird die physiotherapeutische Behandlung von allen Unfall- und Krankenkassen übernommen.</li>
<li>Privatbehandlungen ohne ärztliche Überweisung: CHF 48.- / 30 Minuten</li>
<li>Hausbesuche möglich</li>
</ul>
<p>&nbsp;</p>
<h3>Anmeldung</h3>
<p>Anmeldungen sind nur mit telefonischer Vereinbarung möglich</p>","","../../media_martina/navi_005/_thumbs/th_dsc_0174.jpg","j","b");
INSERT INTO cms_seiten VALUES ("6","6","1","links",NULL,"2","0","<ul>
<li><a href=\"http://www.hempenweb.ch\" target=\"_blank\">hempenweb die kleine feine Internetagentur</a></li>
</ul>",NULL,NULL,"j","n");
INSERT INTO cms_seiten VALUES ("7","7","1","impressum",NULL,"2","0","<h3><strong>Betreiberin der Website</strong></h3>
<p>Physiotherapie am Lindenplatz, Allschwil<br />Martina Dürmüller</p>
<p><a href=\"mailto:info@physio-allschwil.ch\">info@physio-allschwil.ch</a></p>
<p>&nbsp;</p>
<h3><strong>Haftungsausschluss</strong></h3>
<p>Der Inhalt dieser Webseiten wird mit grösstmöglicher Sorgfalt gepflegt. Trotzdem wird für den Inhalt keine Haftung übernommen. Druckfehler, Irrtümer und Änderungen vorbehalten. Der Inhalt ist urheberrechtlich geschützt.&nbsp;Das gilt sowohl für die Texte, als auch für die Bilder, welche allesamt selber hergestellt wurden.<br />Für die Inhalte externer Links übernehmen wir keine Haftung. Für den Inhalt der verlinkten Seiten sind ausschliesslich deren Betreiber verantwortlich.</p>
<p>&nbsp;</p>
<h3><strong>Webdesign</strong></h3>
<p>Marianne Mathys, Zürich<br /><a href=\"mailto:marianne_mathys@bluewin.ch\">marianne_mathys@bluewin.ch</a></p>
<p>&nbsp;</p>
<h3><strong>Programmierung</strong></h3>
<p>Roland Hempen, Zürich <br /><a title=\"hempenweb - die kleine feine Internetagentur\" href=\"http://www.hempenweb.ch\" target=\"_blank\">www.hempenweb.ch</a></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>","","../../media_martina/navi_007/_thumbs/th_christoph_0553.jpg","j","n");
INSERT INTO cms_seiten VALUES ("8","8","1","Martina Dürmüller","","2","0","<h3>Ausbildung</h3>
<ul>
<li>1988 Abschluss der Physiotherapie- Ausbildung im Stadtspital Triemli </li>
</ul>
<h3>Praxiserfahrung</h3>
<ul>
<li>1988 Stadtspital Triemli</li>
<li>1989 Physiotherapie Brunner Richterswil</li>
<li>1989-1998 Bethesda-Spital Basel</li>
<li>Seit 1998 Eigene Praxis in Allschwil</li>
</ul>
<h3>Weiterbildungen</h3>
<ul>
<li>Manualtherapie</li>
<li>Sportphysiotherapie</li>
<li>Triggerpunktbehandlung</li>
<li>Biomechanik nach R. Sohier </li>
<li>Manuelle Lymphdrainage</li>
<li>Beckenbodentraining</li>
<li>Mobilisation des Nervensystems</li>
<li>Taping</li>
<li>Nordic Walking Instruktor</li>
</ul>
<h3>Sprachen</h3>
<ul>
<li>Deutsch</li>
<li>Französisch</li>
<li>Englisch</li>
<li>Wenig Spanisch</li>
</ul>","","../../media_martina/navi_002_10/_thumbs/th_dsc_0015.jpg","j","a");
INSERT INTO cms_seiten VALUES ("9","9","1","Alice Baumgartner",NULL,"2","0","<h3>Ausbildung</h3>
<ul>
<li>2009 Diplom der Physiotherapie-Ausbildung Bethesda-Schule Basel</li>
</ul>
<h3>Praxiserfahrung und Praktika</h3>
<ul>
<li>Bethesda-Spital</li>
<li>Kantonsspital Bruderholz</li>
<li>Spital und Kurzentrum Rheinfelden</li>
<li>Hirslandenklinik Birshof</li>
<li>Regionalspital Delémont</li>
<li>Gesundheitszentrum Fricktal</li>
<li>Seit 2009 Physiotherapie am Lindenplatz</li>
</ul>
<h3>Weiterbildung</h3>
<ul>
<li>Manuelle Lymphdrainage</li>
<li>Biomechanik nach R. Sohier</li>
<li>Easytaping</li>
</ul>
<h3>Sprachen</h3>
<ul>
<li>Deutsch</li>
<li>Englisch</li>
<li>Französich</li>
</ul>","","../../media_martina/navi_002_20/_thumbs/th_dsc_0006.jpg","j","b");
INSERT INTO cms_seiten VALUES ("10","10","1","Mélanie Hénault",NULL,"2","0","<h3>Ausbildung</h3>
<ul>
<li>2000 Diplom der Physiotherapie-Ausbildung VPT Akademie D-Schmiden </li>
</ul>
<h3>Praxiserfahrung</h3>
<ul>
<li>2001 Universitätsklinik Ulm</li>
<li>2002 Volontariat Blessed Gerard’s Care Centre&amp;Hospice Süd-Afrika</li>
<li>2003 Gesundheitszentrum Solemar, Bad Dürrheim</li>
<li>2003-2008 Physiotherapie-Privatpraxen</li>
<li>2008 Physiotherapie am Lindenplatz</li>
</ul>
<h3>Weiterbildung</h3>
<ul>
<li>Manualtherapie</li>
<li>Sportphysiotherapie</li>
<li>Manuelle Lymphdrainage</li>
<li>Mobilisation des Nervensystems</li>
<li>Fussreflexzonentherapie</li>
<li>Taping</li>
<li>Tinnitus Grundlagen und Behandlung</li>
<li>Behandlung von craniomandibulären und craniofascialen Schmerzsyndromen</li>
</ul>
<h3>Sprachen</h3>
<ul>
<li>Deutsch</li>
<li>Englisch</li>
</ul>
<p>Frau Hénault befindet sich momentan im Mutterschaftsurlaub und wird das Team während Ferienabsenzen vertreten.</p>","","../../media_martina/navi_002_30/_thumbs/th_roland_0027.jpg","j","b");
INSERT INTO cms_seiten VALUES ("11","11","1","Rheumatologie",NULL,"2","0","<p>Die Rheumatologie ist jene medizinische Fachrichtung, die sich mit der Diagnose und Therapie von chronischen Krankheiten beschäftig. Meistens machen sich die Symptome durch Schmerzen im Bereich des Bewegungsapparates bemerkbar. Wir behandeln sämtliche Beschwerdebilder aus dem Bereich der Rheumatologie:</p>
<ul>
<li>Rückenschmerzen</li>
<li>Nackenschmerzen</li>
<li>Gelenksbeschwerden</li>
<li>Muskel- und Sehnenprobleme </li>
<li>Kopfschmerzen</li>
<li>Chronische Schmerzzustände</li>
</ul>
<p>&nbsp;</p>
<h3>Die Ursachen sind vielfältig</h3>
<ul>
<li>Degenerative- rheumatische Veränderungen etwa Arthrose </li>
<li>Entzündlich-rheumatische Erkrankungen wie rheumatoide Arthritis</li>
<li>Muskelverspannungen- oder Schwächen</li>
<li>Bandscheibenvorfall, Discushernie</li>
<li>Stoffwechselerkrankungen etwa Osteoporose </li>
<li>Fibromyalgie</li>
<li>Morbus Bechterew, Morbus Scheuermann</li>
<li>Haltungsprobleme</li>
<li>Schleudertrauma</li>
</ul>","","../../media_martina/navi_003_10/_thumbs/th_dsc_0107.jpg","j","b");
INSERT INTO cms_seiten VALUES ("12","12","1","Operationen",NULL,"2","0","<p>Nach chirurgischen Eingriffen ist oft eine physiotherapeutische Behandlung unerlässlich um die volle Funktion des Bewegungsapparates wieder herzustellen. Der Patient muss für Beruf, Sport und Hobby wieder voll rehabilitiert werden. Etwa nach folgenden Operationen ist eine physiotherapeutische Nachbehandlung angezeigt:</p>
<ul>
<li>Wirbelsäulenoperationen</li>
<li>Bandscheibenoperationen </li>
<li>Gelenksprothesen etwa Hüft- oder Knieprothesen</li>
<li>Knochenbrüchen</li>
<li>Bänder- und Sehnen Rekonstruktionen</li>
<li>Sportverletzungen</li>
</ul>","","../../media_martina/navi_003_20/_thumbs/th_dsc_0720.jpg","j","b");
INSERT INTO cms_seiten VALUES ("13","13","1","Neurologie",NULL,"2","0","<p>Die Neurologie befasst sich mit den Erkrankungen des Nervensystems. Es können das Zentralnervensystem, also Gehirn und Rückenmark, aber auch periphere Nervenbahnen betroffen sein. Die Symptome nach einem neurologischen Trauma sind so komplex und vielfältig, dass eine gründliche Befundaufnahme der Therapie vorausgeht. Die Ausfälle betreffen meist den Bewegungsapparat im Sinn von Lähmungserscheinungen, Sensibilitätsstörungen, Wahrnehmungsstörungen und psychischen Defiziten. Ziel ist die bestmögliche Rehabilitation des Patienten in seinem gesamten alltäglichen Umfeld.</p>
<p><br />Die häufigsten Diagnosen, die zu einer Zuweisung einer physiotherapeutischen Behandlung führen sind:</p>
<ul>
<li>Hirnverletzungen etwa nach Schlaganfall oder Unfällen die unter anderem zu Halbseitenlähmungen führen können</li>
<li>Rückenmarksverletzungen z.B. bei Bandscheibenvorfällen oder Unfällen</li>
<li>Multiple Sklerose</li>
<li>Guillain Barré</li>
</ul>","","../../media_martina/navi_003_30/_thumbs/th_dsc_0104.jpg","j","b");
INSERT INTO cms_seiten VALUES ("14","14","1","Lymphdrainage",NULL,"2","0","<p>Die komplexe physikalische Entstauung ist eine Therapieform, die bei ungenügendem lymphatischem oder venösem Rückfluss und Ödembildung angezeigt ist. Sie besteht aus der manuellen Lymphdrainage, Entstauungsübungen und wenn nötig Kompressionsbandagen. Die manuelle Lymphdrainage wird durch spezielle Griffe ausgeführt, die auf das Gewebe eine Sog- und Druckwirkung ausüben. Somit werden die Lymphgefässe angeregt und die Lymphflüssigkeit aus dem geschwollenen Gebiet in die Lymphbahnen geleitet und abtransportiert.</p>
<p>&nbsp;</p>
<h3>Primäres Lymphödem</h3>
<p>Von dieser Form sprechen wir, wenn das Lymphgefässsystem anlagebedingt fehlentwickelt ist. Das kann angeboren oder irgendwann im Laufe des Lebens entstanden sein.</p>
<p>&nbsp;</p>
<h3>Sekundäres Lymphödem</h3>
<p>Verschiedene Schädigungen können zum sekundären Lymphödem führen:</p>
<ul>
<li>Insuffizienz des Lymphgefässsystems nach operativer oder strahlentherapeutischer Krebsbehandlung</li>
<li>Nach chirurgischen Eingriffen wie Gelenks-Operationen </li>
<li>Venöse Insuffizienz die zu offenen Beinen führen kann </li>
<li>Posttraumatisches Ödem nach Unfällen</li>
<li>Infektionen des Lymphgefässsystems</li>
<li>Chronisches Lymphödem bei Erkrankungen des rheumatologischen Formenkreises</li>
<li>Postinfektiöses Lymphödem </li>
<li>Morbus Sudeck</li>
</ul>","","../../media_martina/navi_003_40/_thumbs/th_roland_0155.jpg","j","b");
INSERT INTO cms_seiten VALUES ("15","15","1","Inkontinenztherapie",NULL,"2","0","<p>Inkontinenz ist die Bezeichnung für unfreiwilligen Harn- oder Stuhlabgang. Inkontinenz und Senkungen der Organe im kleinen Becken sind ein häufiges Problem und wirken sich gravierend auf die Lebensqualität und die Befindlichkeit aus. Unterschieden wird in Stress- und Dranginkontinenz</p>
<h2><br /></h2>
<h3>Stressinkontinenz</h3>
<p>Bei einer Stress- oder Belastungsinkontinenz löst der erhöhte Bauchinnendruck einen mehr oder weniger starken Harnverlust aus.</p>
<ol>
<li>Grad: Inkontinenz beim Husten, Niesen, Lachen, Joggen</li>
<li>Grad: Inkontinenz bei Bewegungen wie Aufstehen. Treppensteigen</li>
<li>Grad: Inkontinenz beim Liegen oder Bewegungen ohne Anstrengung</li>
</ol>
<h2><br /></h2>
<h3>Dranginkontinenz</h3>
<p>Der nicht unterdrückbare Harndrang führt zum Urinverlust bevor die Toilette erreicht ist. Die Ursachen für diese Form sind vielfältig.</p>
<p>Häufig treten die beiden Inkontinenzformen auch gemischt auf. </p>","","../../media_martina/navi_003_50/_thumbs/th_stefan_199.jpg","j","b");
INSERT INTO cms_seiten VALUES ("16","16","1","aktive Therapie",NULL,"3","1","",NULL,NULL,"j","n");
INSERT INTO cms_seiten VALUES ("17","17","1","passive Therapie",NULL,"3","1","",NULL,NULL,"j","n");
INSERT INTO cms_seiten VALUES ("18","18","1","manuelle Therapie",NULL,"3","1","",NULL,NULL,"j","n");
INSERT INTO cms_seiten VALUES ("19","19","1","sitemap",NULL,"2","3","","","../../media_martina/navi_019/_thumbs/th_dsc_0696.jpg","j","n");



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
INSERT INTO cms_spezial VALUES ("martina","CSS0","0","gelb","#EBCA30");
INSERT INTO cms_spezial VALUES ("martina","M1","640","213","val");
INSERT INTO cms_spezial VALUES ("martina","M2","135","90","val");
INSERT INTO cms_spezial VALUES ("martina","M3","280","280","val");
INSERT INTO cms_spezial VALUES ("martina","CSS1","2","gruen","#459360");
INSERT INTO cms_spezial VALUES ("martina","CSS2","3","blau","#4D7FDE");
INSERT INTO cms_spezial VALUES ("martina","CSS3","4","orange","#F2672A");
INSERT INTO cms_spezial VALUES ("martina","CSS4","5","rot","#CC3659");



# ----------------------------------------------------------
#
# Struktur von Tabelle 'cms_templates'
#
DROP TABLE IF EXISTS cms_templates;
CREATE TABLE cms_templates (
    id tinyint(3) NOT NULL auto_increment,
    template_id tinyint(3) unsigned NOT NULL,
    template_name varchar(40) DEFAULT "md_zweispaltig_480_400_tpl.html" NOT NULL,
    template_descr varchar(125),
    thumbsize char(10),
   PRIMARY KEY (id)
);

#
# Daten von Tabelle 'cms_templates'
#
INSERT INTO cms_templates VALUES ("1","1","md_zweispaltig_480_400_tpl.html","MD: zweispaltig_480_400 -  1.Spalte Text, 2. Spalte Bild","280x280");
INSERT INTO cms_templates VALUES ("2","2","md_zweispaltig_400_480_tpl.html","MD: zweispaltig_400_480 - 1. Spalte Bild, 2. Spalte Textbox","280x280");
INSERT INTO cms_templates VALUES ("4","4","md_einspaltig_640_tpl.html","MD: einspaltig_640_tpl - oben Bilder, unten Kontaktdaten","640x213");
INSERT INTO cms_templates VALUES ("3","3","md_zweispaltig_400_400_tpl.html","MD: zweispaltig_400_400_tpl - 1. Spalte Thumbnail, 2. Spalte Kurztext und Link","135x90");



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
INSERT INTO cms_users VALUES ("7","martina","7770f6e4ae7211149c8b0201ace046c0","NUBD");


