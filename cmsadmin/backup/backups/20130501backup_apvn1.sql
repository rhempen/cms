#----------------------------------------------
# Backup der Datenbank cms_apvn
# Erstellt am 01.05.2013 07:35
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
INSERT INTO cms_config VALUES ("1","general","THEME","apvn1",NULL,NULL);
INSERT INTO cms_config VALUES ("2","general","COPYRIGHT","Association pour la Préservation du Vallon du Nozon",NULL,NULL);
INSERT INTO cms_config VALUES ("3","general","MAX_THUMBS","4",NULL,NULL);
INSERT INTO cms_config VALUES ("4","general","MAX_LIST_ITEMS","60",NULL,NULL);
INSERT INTO cms_config VALUES ("5","general","LANGUAGE","FR",NULL,NULL);
INSERT INTO cms_config VALUES ("10","menu","HMENU_RICHTUNG","left","right",NULL);
INSERT INTO cms_config VALUES ("11","menu","HMENU_SUBMENU","submenu","dropdown",NULL);
INSERT INTO cms_config VALUES ("20","pictures","THUMB_PAGE_MAX_WIDTH","120",NULL,NULL);
INSERT INTO cms_config VALUES ("21","pictures","THUMB_PAGE_MAX_HEIGHT","120",NULL,NULL);
INSERT INTO cms_config VALUES ("22","pictures","THUMB_NAVI_MAX_WIDTH","300",NULL,NULL);
INSERT INTO cms_config VALUES ("23","pictures","THUMB_NAVI_MAX_HEIGHT","300",NULL,NULL);
INSERT INTO cms_config VALUES ("24","pictures","IMAGE_MAX_WIDTH","640",NULL,NULL);
INSERT INTO cms_config VALUES ("25","pictures","IMAGE_MAX_HEIGHT","640",NULL,NULL);
INSERT INTO cms_config VALUES ("14","menu","SMURL","ja","nein",NULL);
INSERT INTO cms_config VALUES ("13","menu","SUBNAV_SOFORT","ja","nein",NULL);
INSERT INTO cms_config VALUES ("15","menu","SMURL_REFRESH","ausf&uuml;hren","",NULL);
INSERT INTO cms_config VALUES ("12","menu","SUBMENU_DIR","horizontal","vertikal",NULL);
INSERT INTO cms_config VALUES ("7","general","EMAIL_RECEIVER","info@hempenweb.ch",NULL,NULL);
INSERT INTO cms_config VALUES ("32","meta-tags","KEYWORDS","",NULL,"webdesign, webdesign zürich, php, html, xhtml, javascript, Zürich, Hempen, Roland Hempen, hempenweb");
INSERT INTO cms_config VALUES ("33","meta-tags","DESCRIPTION","",NULL,"hempenWeb ist eine kleine feine Internetagentur, die es sich zur Aufgabe macht, Ihren Internetauftritt individuell und einmalig zu gestalten");
INSERT INTO cms_config VALUES ("34","meta-tags","PAGE_TOPIC","",NULL,"Webdesign, WebProgrammer, Php, Internetagentur, Zürich");
INSERT INTO cms_config VALUES ("35","meta-tags","PUBLISHER","",NULL,"Roland Hempen, WebPublisher, WebProgrammer Php, Marianne Mathys, Grafik, Design, Zürich");
INSERT INTO cms_config VALUES ("26","pictures","DISK_DB_ADJUSTMENT","ausf&uuml;hren",NULL,NULL);
INSERT INTO cms_config VALUES ("31","meta-tags","AUTHOR","Roland Hempen",NULL,"");
INSERT INTO cms_config VALUES ("8","general","GOOGLE_ANALYTICS","UA-9751963-1",NULL,NULL);
INSERT INTO cms_config VALUES ("36","meta-tags","GOOGLE_VERIFY","","","ttwBxblG2LButvHtEG8AmiCgf6RqivXOIwkS5k3hOXA");
INSERT INTO cms_config VALUES ("9","general","TEMPLATE_DIR","frontend/themes/apvn1/tpl",NULL,NULL);
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
   UNIQUE name (name, frag_id)
);

#
# Daten von Tabelle 'cms_fragmente'
#
INSERT INTO cms_fragmente VALUES ("1","teaser1","1","<p><iframe src=\"http://www.youtube.com/embed/lb_7l-gK6vE\" frameborder=\"0\" width=\"400\" height=\"300\"></iframe></p>");
INSERT INTO cms_fragmente VALUES ("2","teaser2","2","<div class=\"teasertext\">
<h2 class=\"teasertitle\">Member Login</h2>
<p class=\"teasertext\"><iframe src=\"/beta/cmsml/frontend/_controllers/kontakt.inc.php\" frameborder=\"0\" width=\"400\" height=\"300\"></iframe></p>
</div>");
INSERT INTO cms_fragmente VALUES ("3","teaser3","3","<h2>Teaser 3</h2>
<p>Das ist der Teaser Nummer 3</p>");
INSERT INTO cms_fragmente VALUES ("4","teaser4","4","<h2>Angebot</h2>
<table style=\"border: 1px solid #dedede; width: 100%;\" border=\"0\" cellspacing=\"5\" cellpadding=\"5\">
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
<p>&nbsp;</p>");
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
<li><a href=\"/media_hempenweb/home\">Home</a></li>
<li><a href=\"/media_hempenweb/kontakt\">Kontakt</a></li>
<li><a href=\"/media_hempenweb/sitemap\">Sitemap</a></li>
</ul>
</div>
<div id=\"reflinks\">
<ul>
<li class=\"title\">Portfolio</li>
<li><a onmouseover=\"showRefPic(1);\" onmouseout=\"$(\'refpics\').hide();\" href=\"http://www.feednsmile.ch\" target=\"_blank\">feednsmile.ch</a></li>
<li><a onmouseover=\"showRefPic(2);\" onmouseout=\"$(\'refpics\').hide();\" href=\"http://www.physio-allschwil.ch\" target=\"_blank\">phyio-allschwil.ch</a></li>
<li><a onmouseover=\"showRefPic(3);\" onmouseout=\"$(\'refpics\').hide();\" href=\"http://www.birchler-architektur.ch\" target=\"_blank\">birchler-architektur.ch</a></li>
<li><a onmouseover=\"showRefPic(4);\" onmouseout=\"$(\'refpics\').hide();\" href=\"http://www.gigijacquier.ch\" target=\"_blank\">gigijacquier.ch</a></li>
<li><a onmouseover=\"showRefPic(5);\" onmouseout=\"$(\'refpics\').hide();\" href=\"http://www.art4art.ch\" target=\"_blank\">art4art.ch</a></li>
<li><a onmouseover=\"showRefPic(6);\" onmouseout=\"$(\'refpics\').hide();\" href=\"http://www.orasch.ch\" target=\"_blank\">orasch.ch</a></li>
<li><a onmouseover=\"showRefPic(7);\" onmouseout=\"$(\'refpics\').hide();\" href=\"http://www.physio-steiner.ch\" target=\"_blank\">phyio-steiner.ch</a></li>
<li><a onmouseover=\"showRefPic(8);\" onmouseout=\"$(\'refpics\').hide();\" href=\"http://www.raku.ch\" target=\"_blank\">raku.ch</a></li>
</ul>
</div>
<div id=\"refpics\" style=\"display: none;\"><img id=\"refpic\" src=\"/beta/cms/media_hempenweb/footer/th_feednsmile.png\" alt=\"\" width=\"180\" height=\"120\" /> </div>");



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
INSERT INTO cms_galerien VALUES ("70","15","1","N","../../media_apvn/navi_8_10/_images/vaulion.png","Paysage de Vaulion");
INSERT INTO cms_galerien VALUES ("71","7","1","N","../../media_apvn/navi_7/_images/jeudelumiereeglise.jpg","");
INSERT INTO cms_galerien VALUES ("72","7","2","N","../../media_apvn/navi_7/_images/foiredulivre.jpg","");
INSERT INTO cms_galerien VALUES ("73","21","1","N","../../media_apvn/navi_9_10/_images/chuttedudard.png","");
INSERT INTO cms_galerien VALUES ("74","13","1","N","../../media_apvn/navi_13/_images/penguins.jpg","");
INSERT INTO cms_galerien VALUES ("75","15","2","N","../../media_apvn/navi_8_10/_images/college.png","Collège de Bofflens");
INSERT INTO cms_galerien VALUES ("79","32","1","P","../../media_apvn/navi_80001/_images/college.png","");
INSERT INTO cms_galerien VALUES ("77","15","3","N","../../media_apvn/navi_8_10/_images/ferme.jpg","");
INSERT INTO cms_galerien VALUES ("78","15","4","N","../../media_apvn/navi_8_10/_images/vue_sur_le_village.jpg","");
INSERT INTO cms_galerien VALUES ("80","33","1","P","../../media_apvn/navi_80002/_images/chrysanthemum.jpg","");
INSERT INTO cms_galerien VALUES ("81","34","1","P","../../media_apvn/navi_80003/_images/hydrangeas.jpg","");
INSERT INTO cms_galerien VALUES ("82","17","1","N","../../media_apvn/navi_8_20/_images/chrysanthemum.png","");



# ----------------------------------------------------------
#
# Struktur von Tabelle 'cms_members'
#
DROP TABLE IF EXISTS cms_members;
CREATE TABLE cms_members (
    id tinyint(4) NOT NULL auto_increment,
    username varchar(125) NOT NULL,
    password varchar(32) NOT NULL,
    created datetime NOT NULL,
    lastlogin datetime NOT NULL,
   PRIMARY KEY (id),
   KEY username (username)
);

#
# Daten von Tabelle 'cms_members'
#
INSERT INTO cms_members VALUES ("7","hempen@bluewin.ch","429ba59278e5aef557c7e8e1b2115399","2012-06-11 20:21:37","2012-06-11 22:47:51");
INSERT INTO cms_members VALUES ("2","webprog10","a3e6096dbe9169213e7880821129428e","0000-00-00 00:00:00","0000-00-00 00:00:00");
INSERT INTO cms_members VALUES ("9","info@hempenweb.ch","e9911456f39b5e6d738669ac8d438b20","2012-06-16 11:06:47","2012-07-10 22:54:44");
INSERT INTO cms_members VALUES ("8","scivolino@bluewin.ch","e10adc3949ba59abbe56e057f20f883e","2012-06-11 22:48:26","2012-06-11 22:50:45");



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
INSERT INTO cms_modules VALUES ("6","SITEMAP","Sitemap");
INSERT INTO cms_modules VALUES ("7","GOOGLEMAPS","Filialsuche mit Googlemaps");
INSERT INTO cms_modules VALUES ("8","MEMBER_LOGIN","Member-Login ");



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
    start enum('j','n') DEFAULT "n" NOT NULL,
    nav_type set('','S','H','V') DEFAULT "H",
   PRIMARY KEY (nav_id),
   KEY domain (domain)
);

#
# Daten von Tabelle 'cms_navigation'
#
INSERT INTO cms_navigation VALUES ("10","navi_10","3","0","Découverte","Découverte","navi_10","j","n","H");
INSERT INTO cms_navigation VALUES ("8","navi_8","1","0","Accueil","Accueil","navi_8","j","n","H");
INSERT INTO cms_navigation VALUES ("9","navi_9","2","0","Nature et Paysage","NatureetPaysage","navi_9","j","n","H");
INSERT INTO cms_navigation VALUES ("7","navi_6","5","0","Contact","Contact","navi_7","j","n","H");
INSERT INTO cms_navigation VALUES ("13","navi_13","6","0","Plan du site","Plandusite","navi_13","j","n","S");
INSERT INTO cms_navigation VALUES ("14","navi_14","7","0","Empreinte","Empreinte","navi_14","j","n","S");
INSERT INTO cms_navigation VALUES ("15","navi_8","1","10","Territoire","Territoire","navi_8_10","j","n","H");
INSERT INTO cms_navigation VALUES ("18","navi_8","1","30","Objectifs","Objectifs","navi_8_30","j","n","H");
INSERT INTO cms_navigation VALUES ("17","navi_8","1","20","Accès au Vallon","AccèsauVallon","navi_8_20","j","n","H");
INSERT INTO cms_navigation VALUES ("11","navi_11","4","0","Boutique","Boutique","navi_11","n","n","H");
INSERT INTO cms_navigation VALUES ("12","navi_12","8","0","Liens","Liens","navi_12","j","n","S");
INSERT INTO cms_navigation VALUES ("19","navi_8","1","40","Historique","Historique","navi_8_40","j","n","H");
INSERT INTO cms_navigation VALUES ("20","navi_8","1","50","Bases Legales","BasesLegales","navi_8_50","j","n","H");
INSERT INTO cms_navigation VALUES ("26","navi_10","3","10","Itinéraires","Itinéraires","navi_10_10","j","n","H");
INSERT INTO cms_navigation VALUES ("21","navi_9","2","10","Géologie","Géologie","navi_9_10","j","n","H");
INSERT INTO cms_navigation VALUES ("22","navi_9","2","20","Flore","Flore","navi_9_20","j","n","H");
INSERT INTO cms_navigation VALUES ("23","navi_9","2","30","Végétation","Végétation","navi_9_30","j","n","H");
INSERT INTO cms_navigation VALUES ("24","navi_9","2","40","Faune","Faune","navi_9_40","j","n","H");
INSERT INTO cms_navigation VALUES ("25","navi_9","2","50","Recherche scientifique","Recherchescientifiqu","navi_9_50","j","n","H");
INSERT INTO cms_navigation VALUES ("27","navi_10","3","20","Hébérgement","Hébérgement","navi_10_20","j","n","H");
INSERT INTO cms_navigation VALUES ("28","navi_28","9","0","Membre","Membre","navi_28","n","n","H");



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
    datum_von datetime,
    datum_bis datetime,
    name varchar(125) NOT NULL,
    fach char(20) NOT NULL,
    kurztext varchar(200),
    langtext longtext,
    inhalt2 longtext,
    template tinyint(3) unsigned,
    bild1 varchar(125),
    bild2 varchar(125),
    galerie enum('n','a','b','c') NOT NULL,
    linkid1 smallint(6) unsigned,
    linkid2 smallint(6) unsigned,
    aktiv enum('j','n'),
    sort_id smallint(3) unsigned NOT NULL,
   PRIMARY KEY (page_id),
   KEY navid (nav_id),
   KEY domain (domain)
);

#
# Daten von Tabelle 'cms_pages'
#
INSERT INTO cms_pages VALUES ("32","15","navi_8","navi_80001","0000-00-00 00:00:00","0000-00-00 00:00:00","Souspage 1","Territoire","L’Association pour la Préservation du Vallon du Nozon est née au moment 
ou un projet de carrière menaçait tout particulièrement le village de 
Croy et sa source d’eau potable, un paysage c","<p>L’Association pour la Préservation du Vallon du Nozon est née au moment ou un projet de carrière menaçait tout particulièrement le village de Croy et sa source d’eau potable, un paysage classé, des couloirs à faune, et la qualité de vie des habitants.</p>
<p>&nbsp;</p>
<p>Le désir des fondateurs était de sauvegarder l’environnement&nbsp; particulièrement beau et paisible du Vallon du Nozon dont cette commune fait partie.</p>
<p>&nbsp;</p>
<p>Sauvegarder, mais non mettre sous cloche ce vallon qui, s’il attire de nombreux promeneurs, n’en est pas moins un lieu de vie avec des besoins divers, logements, travail, services, école, culture etc.</p>
<p>&nbsp;</p>
<p>Un projet qui va dans le sens des besoins actuels&nbsp;: protection de la biodiversité, du paysage, d’un mode de vie sain et équilibré à l’échelle humaine</p>
<p>&nbsp;</p>
<p>C’est un défi passionnant pour qui aime ce vallon et désire que perdure sa beauté et son calme, sa culture aussi, car n’oublions pas le joyau qu’est l’abbatiale de Romainmôtier, ce site clunisien remarquable dans son écrin de verdure.</p>","<p>Le désir des fondateurs était de sauvegarder l’environnement&nbsp; particulièrement beau et paisible du Vallon du Nozon dont cette commune fait partie.</p>
<p>&nbsp;</p>
<p>Sauvegarder, mais non mettre sous cloche ce vallon qui, s’il attire de nombreux promeneurs, n’en est pas moins un lieu de vie avec des besoins divers, logements, travail, services, école, culture etc.</p>
<p>&nbsp;</p>
<p>Un projet qui va dans le sens des besoins actuels&nbsp;: protection de la biodiversité, du paysage, d’un mode de vie sain et équilibré à l’échelle humaine</p>
<p>&nbsp;</p>","1","../../media_apvn/navi_80001/_thumbs/th_college.png","","a","33","34","j","1");
INSERT INTO cms_pages VALUES ("33","15","navi_8","navi_80002","0000-00-00 00:00:00","0000-00-00 00:00:00","Souspage 2","Territoire","Souspage 2","<p>Souspage 2</p>","","1","../../media_apvn/navi_80002/_thumbs/th_chrysanthemum.jpg","","n","33","34","j","2");
INSERT INTO cms_pages VALUES ("34","15","navi_8","navi_80003","0000-00-00 00:00:00","0000-00-00 00:00:00","Souspage 3","Territoire","Souspage 3","","","1","../../media_apvn/navi_80003/_thumbs/th_hydrangeas.jpg","","n","33","32","j","3");



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
    kuerzel char(80) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE pagid (navid, subid, pagid)
);

#
# Daten von Tabelle 'cms_redirect'
#
INSERT INTO cms_redirect VALUES ("1","8","0","0","accueil");
INSERT INTO cms_redirect VALUES ("2","8","15","0","territoire");
INSERT INTO cms_redirect VALUES ("3","8","17","0","acces_au_vallon");
INSERT INTO cms_redirect VALUES ("4","8","18","0","objectifs");
INSERT INTO cms_redirect VALUES ("5","8","19","0","historique");
INSERT INTO cms_redirect VALUES ("6","8","20","0","bases_legales");
INSERT INTO cms_redirect VALUES ("7","9","0","0","nature_et_paysage");
INSERT INTO cms_redirect VALUES ("8","9","21","0","geologie");
INSERT INTO cms_redirect VALUES ("9","9","22","0","flore");
INSERT INTO cms_redirect VALUES ("10","9","23","0","vegetation");
INSERT INTO cms_redirect VALUES ("11","9","24","0","faune");
INSERT INTO cms_redirect VALUES ("12","9","25","0","recherche_scientifique");
INSERT INTO cms_redirect VALUES ("13","10","0","0","decouverte");
INSERT INTO cms_redirect VALUES ("14","10","26","0","itineraires");
INSERT INTO cms_redirect VALUES ("15","10","27","0","hebergement");
INSERT INTO cms_redirect VALUES ("16","11","0","0","boutique");
INSERT INTO cms_redirect VALUES ("17","7","0","0","contact");
INSERT INTO cms_redirect VALUES ("18","13","0","0","plan_du_site");
INSERT INTO cms_redirect VALUES ("19","14","0","0","empreinte");
INSERT INTO cms_redirect VALUES ("20","12","0","0","liens");
INSERT INTO cms_redirect VALUES ("21","28","0","0","membre");
INSERT INTO cms_redirect VALUES ("22","8","15","32","souspage_1");
INSERT INTO cms_redirect VALUES ("23","8","15","33","souspage_2");
INSERT INTO cms_redirect VALUES ("24","8","15","34","souspage_3");



# ----------------------------------------------------------
#
# Struktur von Tabelle 'cms_seiten'
#
DROP TABLE IF EXISTS cms_seiten;
CREATE TABLE cms_seiten (
    seiten_id smallint(6) NOT NULL auto_increment,
    nav_id smallint(6) DEFAULT "0" NOT NULL,
    nummer tinyint(4) DEFAULT "0" NOT NULL,
    template tinyint(3) DEFAULT "1" NOT NULL,
    modul tinyint(3) unsigned DEFAULT "0" NOT NULL,
    memberlogin set('X','') NOT NULL,
    kurztitel varchar(125) NOT NULL,
    zusatztext varchar(125),
    inhalt1 text NOT NULL,
    inhalt2 text,
    bild1 varchar(125),
    galerie enum('n','a','b','c') DEFAULT "n" NOT NULL,
   PRIMARY KEY (seiten_id)
);

#
# Daten von Tabelle 'cms_seiten'
#
INSERT INTO cms_seiten VALUES ("7","7","1","1","2","","Kontakt","","","","../../media_apvn/navi_7/_thumbs/th_foiredulivre.jpg","n");
INSERT INTO cms_seiten VALUES ("8","8","1","1","0","","Accueil",NULL,"",NULL,NULL,"n");
INSERT INTO cms_seiten VALUES ("9","9","1","1","0","","Nature et Paysage",NULL,"",NULL,NULL,"n");
INSERT INTO cms_seiten VALUES ("10","10","1","1","0","","Découverte",NULL,"",NULL,NULL,"n");
INSERT INTO cms_seiten VALUES ("11","11","1","1","0","","Boutique",NULL,"",NULL,NULL,"n");
INSERT INTO cms_seiten VALUES ("12","12","1","1","0","","Liens","","<p><a href=\"http://www.pierreseche.com\" target=\"_blank\">La passerelle vers l\'architecture de pierre sèche</a><br /><a href=\"http://www.pierreseche.net\" target=\"_blank\">Le portail del construction en pierre sèche</a>&nbsp;&nbsp;</p>","","","n");
INSERT INTO cms_seiten VALUES ("13","13","1","1","6","X","Plan du Site","","","","../../media_apvn/navi_13/_thumbs/th_penguins.jpg","a");
INSERT INTO cms_seiten VALUES ("14","14","1","1","0","","Empreinte","","<h2>Conception, Design et Programmation</h2>
<p><a href=\"http://www.hempenweb.ch\" target=\"_blank\">hempenweb</a>, die kleine feine Internetagentur, <br />Roland Hempen, Gutstrasse 150, 8055 Zürich&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;</p>","","","n");
INSERT INTO cms_seiten VALUES ("15","15","1","3","1","","Territoire","","<p align=\"left\">Le périmètre de notre association couvre une superficie de 54,93 km2.&nbsp; Cette superficie s’étend sur tout le <strong>Vallon du Nozon</strong> soit un ensemble de huit communes de Suisse, dans le canton de Vaud (district du Jura-Nord vaudois), situées sur le cours du <a title=\"Nozon\" href=\"http://fr.wikipedia.org/wiki/Nozon\" target=\"_blank\">Nozon</a>.</p>","","../../media_apvn/navi_8_10/_thumbs/th_vaulion.png","b");
INSERT INTO cms_seiten VALUES ("17","17","1","1","0","","Accès au Vallon","","<p>Le périmètre de notre association couvre aujourd\'hui … km2 et regroupe 8 communes…</p>
<p><br /> Départ: Romainmôtier, Croy ou Pompaples</p>
<p>Arrivée: Pompaples, Croy ou Romainmôtier<br /><br />&nbsp; <br /><br /></p>
<p><br /> .</p>","<p>Inhalt 2</p>
<p>&nbsp;</p>
<p>Le périmètre de notre association couvre aujourd\'hui … km2 et regroupe 8 communes…</p>
<p><br /> Départ: Romainmôtier, Croy ou Pompaples</p>
<p>Arrivée: Pompaples, Croy ou Romainmôtier</p>","../../media_apvn/navi_8_20/_thumbs/th_chrysanthemum.png","n");
INSERT INTO cms_seiten VALUES ("18","18","1","1","0","","Objectifs","","<p>Les objectifs du Association pour la protection du Vallon du sont:</p>
<h3>1. Préservation et mise en valeur de la qualité de la nature et du paysage</h3>
<p style=\"padding-left: 30px;\">Valoriser, entretenir et restaurer divers éléments spécifiques du paysage<br />Valoriser, entretenir et conserver les milieux naturels, les réseaux entre les écosystèmes et leurs espèces cible.</p>
<h3>2. Renforcement des activités économiques axées sur le développement durable</h3>
<p style=\"padding-left: 30px;\">Promouvoir l’agriculture locale</p>
<p style=\"padding-left: 30px;\">Valoriser les forêts et renforcer la filière régionale du bois</p>
<p style=\"padding-left: 30px;\">Développer et promouvoir les produits spécifiques du Parc</p>
<p style=\"padding-left: 30px;\">Promouvoir la diversification et le renforcement de l’offre touristique durable</p>
<p style=\"padding-left: 30px;\">Promouvoir une politique énergétique locale durable</p>
<p style=\"padding-left: 30px;\">Promouvoir la mobilité durable</p>
<h3>3. Sensibilisation du public et éducation �  l’environnement</h3>
<p style=\"padding-left: 30px;\">Sensibiliser le public (en particulier les écolières et écoliers) au développement durable, �  la qualité et aux valeurs des patrimoines naturels et culturels de notre région&nbsp;</p>","","","n");
INSERT INTO cms_seiten VALUES ("19","19","1","1","0","","Historique","","<p>Historiquement, l’APVN …</p>","<p>et blablabla</p>","","n");
INSERT INTO cms_seiten VALUES ("20","20","1","4","0","","Bases Legales","","<p>Tous les membres s’entendent sur le fait que notre association doit perdurer malgré le fait que nous ayons eu gain de cause contre la carrière et qu’elle continue à exister dans le cadre du Vallon du Nozon. Nous agirons en conformité avec nos statuts, dans le respect des activités des sociétés locales existantes.</p>
<h3>1. Opposition aux carrières (carrière = nom générique incluant les gravières)</h3>
<p>Tous les membres du comité sont d’accord de continuer à s’opposer à l’implantation de carrières dans le vallon du Nozon. Vérification faite après de l’état, il n’y a pas lieu de modifier les statuts puisque «&nbsp;carrière&nbsp;» est le nom générique pour toute exploitation de matériaux pierreux (voir texte de la loi fédérale annexé).</p>
<h3>2. Qualité de Vie</h3>
<p>Accord pour maintenir la qualité de vie selon nos statuts qui sont très clairs. Avoir toujours en vue la promotion du développement durable. Agir au cas par cas, selon les circonstances et dans la mesure de nos forces. Il n’est pas indispensable d’intervenir à chaque occasion, mais nous pouvons accorder un soutien à une démarche sans aller au-delà .</p>
<h3>3. Suivi des mises&nbsp;à l’enquête</h3>
<p>Indispensable mais avec grande prudence. Intervenir dans les cas graves uniquement. L’APVN peut rendre attentif, émettre une ou des réserves. Dans la généralité, veiller&nbsp;à agir individuellement sans s’immiscer dans les affaires du voisinage.</p>
<h3>4. Vente de cartes - Activité informative – Développement durable</h3>
<p>L’APVN continuera&nbsp;à vendre des cartes dont le sujet ne sera plus limité au Chaney.</p>
<p>L’APVN aura une activité d’information en lien avec le vallon du Nozon, son passé, présent et futur. Elle informera les membres lors de l’AG annuelle.</p>
<p>Il est clair que l’APVN n’abordera pas de problèmes politiques.</p>
<p>Le mot «&nbsp;culturel&nbsp;» fait peur&nbsp;à certains membres du comité. Il n’est pas indispensable ou nécessaire que tout le comité participe&nbsp;à l’élaboration d’un sujet, par exemple en ce qui concerne le développement durable, d’une recherche d’activité s’étant déroulée autrefois dans le vallon du Nozon ou ayant affaire avec ce dernier. Les personnes du comité et les membres de l’APVN s’intéressant&nbsp;à ce genre de thème (ou même des voisins) pourront se mettre ensemble pour réaliser ce travail qui sera effectué avec l’accord du comité et présenté sous forme de document, de conférence ou tout support adéquat (par ex. communication internet si nous avons un site un jour).</p>
<h3>5. Organisation de fêtes</h3>
<p>Tout le comité est d’accord que nous aurons besoin d’argent pour fonctionner.</p>
<p>Le comité de l’APVN organisera une fête par année (café-brocante, repas de soutien ou autre). Cet événement sera payant.</p>
<p>Sous l’égide de l’APVN, on pourra, au gré des circonstances, organiser une&nbsp;à deux soirées d’information annuelles sur un sujet particulier. Cette activité sera gratuite (avec chapeau s’il y a eu des frais encourus).</p>","","","n");
INSERT INTO cms_seiten VALUES ("21","21","1","1","0","","Géologie","","<p>Le paysage jurassien est caractérisé par de nombreuses combes, continues et parallèles, séparées par des croupes ou des crêtes boisées. Les formes géologiques typiques des régions karstiques trouvent dans le Parc jurassien vaudois leur expression spectaculaire.&nbsp;</p>
<p>&nbsp;</p>
<h3>Paysages jurassiens;</h3>
<p>Le paysage jurassien est caractérisé par de nombreuses combes, continues et parallèles, séparées par des croupes ou des crêtes boisées de même orientation. Ce relief s\'explique par la structure plissée des couches calcaires qui constituent la chaîne du Jura. Ainsi, dans le Parc jurassien vaudois, le chaînon du Marchairuz correspond&nbsp;à un pli en voûte, un anticlinal, tandis que la spacieuse combe des Amburnex qui lui succède épouse la forme d\'un pli en cuvette, un synclinal.</p>
<p>&nbsp;</p>
<h3>Les calcaires du Jura</h3>
<p>Mis&nbsp;à part les dépôts récents de la dernière période glacière (env. 20\'000 ans), toutes les roches du Parc jurassien vaudois sont des sédiments de l\'ère Secondaire (Jurassique supérieur et Crétacé inférieur). Ils se sont déposés dans une mer chaude et peu profonde, il y a 154 à 113 millions d\'années. Ce sont principalement des calcaires, roches assez dures formées surtout du minéral calcite, et des marnes, plus tendres, constituées d\'argiles et de calcite. Entre 12 et 5 millions d\'années, ces couches furent plissées sous l\'effet de la formation de la chaîne alpine et ensuite érodées par les glaciers et les eaux de ruissellement qui dissolvent les calcaires. Les calcaires du Crétacé inférieur sont reconnaissables&nbsp;à leur teinte jaunâtre, tandis que les calcaires plus clairs appartiennent au Jurassique supérieur.<br /><br /><br /></p>","","../../media_apvn/navi_9_10/_thumbs/th_chuttedudard.png","n");
INSERT INTO cms_seiten VALUES ("22","22","1","1","0","","Flore","","<p>Le paysage jurassien est caractérisé par de nombreuses combes, continues et parallèles, séparées par des croupes ou des crêtes boisées. Les formes géologiques typiques des régions karstiques trouvent dans le Parc jurassien vaudois leur expression spectaculaire.<br /> &nbsp;</p>
<p>Magnifiques forêts montagnardes et subalpines: hêtraies&nbsp;à sapins, hêtraies&nbsp;à érables et épicéas, forêts d\'épicéas dans les régions les plus fraîches, en particulier dans les zones&nbsp;à gros blocs couverts de mousses et de myrtilles. En juin, le jaune des cytises illumine les endroits bien exposés. En automne, sur les sols rocheux, la forêt mixte prend des allures féeriques: l\'or des érables et la couleur sang des sorbiers se détachent sur le fond sombre des épicéas.</p>","","","n");
INSERT INTO cms_seiten VALUES ("23","23","1","1","0","","Végétation","","<p>Le paysage jurassien est caractérisé par de nombreuses combes, continues et parallèles, séparées par des croupes ou des crêtes boisées. Les formes géologiques typiques des régions karstiques trouvent dans le Parc jurassien vaudois leur expression spectaculaire.<br /> &nbsp;</p>
<p>Magnifiques forêts montagnardes et subalpines: hêtraies&nbsp;à sapins, hêtraies&nbsp;à érables et épicéas, forêts d\'épicéas dans les régions les plus fraîches, en particulier dans les zones&nbsp;à gros blocs couverts de mousses et de myrtilles. En juin, le jaune des cytises illumine les endroits bien exposés. En automne, sur les sols rocheux, la forêt mixte prend des allures féeriques: l\'or des érables et la couleur sang des sorbiers se détachent sur le fond sombre des épicéas.</p>","","","n");
INSERT INTO cms_seiten VALUES ("24","24","1","1","0","","Faune","","<p>Le paysage jurassien est caractérisé par de nombreuses combes, continues et parallèles, séparées par des croupes ou des crêtes boisées. Les formes géologiques typiques des régions karstiques trouvent dans le Parc jurassien vaudois leur expression spectaculaire.<br /> &nbsp;</p>
<p>Magnifiques forêts montagnardes et subalpines: hêtraies à sapins, hêtraies à érables et épicéas, forêts d\'épicéas dans les régions les plus fraîches, en particulier dans les zones&nbsp;à gros blocs couverts de mousses et de myrtilles. En juin, le jaune des cytises illumine les endroits bien exposés. En automne, sur les sols rocheux, la forêt mixte prend des allures féeriques: l\'or des érables et la couleur sang des sorbiers se détachent sur le fond sombre des épicéas.</p>","","","n");
INSERT INTO cms_seiten VALUES ("25","25","1","1","0","","Recherche scientifique","","<p>Le paysage jurassien est caractérisé par de nombreuses combes, continues et parallèles, séparées par des croupes ou des crêtes boisées. Les formes géologiques typiques des régions karstiques trouvent dans le Parc jurassien vaudois leur expression spectaculaire.<br /> &nbsp;</p>
<p>Magnifiques forêts montagnardes et subalpines: hêtraies&nbsp;à sapins, hêtraies&nbsp;à érables et épicéas, forêts d\'épicéas dans les régions les plus fraîches, en particulier dans les zones à gros blocs couverts de mousses et de myrtilles. En juin, le jaune des cytises illumine les endroits bien exposés. En automne, sur les sols rocheux, la forêt mixte prend des allures féeriques: l\'or des érables et la couleur sang des sorbiers se détachent sur le fond sombre des épicéas</p>","","","n");
INSERT INTO cms_seiten VALUES ("26","26","1","1","0","","Itinéraires",NULL,"",NULL,"","n");
INSERT INTO cms_seiten VALUES ("27","27","1","1","0","","Hébérgement","","<p>Maison rurale - Ariane Laubscher&nbsp;Rue des Fontaines 15 Tél. 024 453 16 2 Fax 024 453 17 93&nbsp;<a href=\"mailto:arlaubscher@bluewin.ch\">arlaubscher@bluewin.ch</a>&nbsp;ou <a href=\"http://www.romainmotier.ch/\" target=\"_blank\">http://www.romainmotier.ch/</a> Chambre tout confort au 1er étage chambres&nbsp;à : 1&nbsp;à 2 lits et 1&nbsp;à 3 lits. Cuisine&nbsp;à disposition non fumeur</p>
<p>Prix : Frs. 40.-- par personne petit déjeuner inclus&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<p>&nbsp;</p>
<p>Villa \"La Butineuse\" - Lucette Rochat&nbsp;Pont de l\'Etang 7 Tél. 024 453 16 38&nbsp;<a href=\"mailto:lucetterochat@hotmail.com\">lucetterochat@hotmail.com</a>&nbsp;2 chambres avec bains-douche et WC au rez-de-chaussée pour 4 personnes, terrasse, séjour&nbsp;à disposition&nbsp;non fumeur dans les chambres Prix : Frs. 40.-- par personne petit déjeuner inclus single : Frs. 50.-- petit déjeuner inclus&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<p>&nbsp;</p>
<p>Maison villageoise&nbsp;- Erika Baudois&nbsp;Ch. de la Foule 6 Tél. 024 453 13 62&nbsp;2 chambres avec salle de bains3 personnes Prix : Frs. 35.-- par personne petit déjeuner inclus single Frs. 50.-- petit déjeuner inclus</p>","","","n");
INSERT INTO cms_seiten VALUES ("28","28","1","4","8","","Membre",NULL,"",NULL,"","n");



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
    aktiv set('j','n') DEFAULT "j",
   PRIMARY KEY (thema, name, wert1)
);

#
# Daten von Tabelle 'cms_spezial'
#



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
    thumbsize char(10) NOT NULL,
   PRIMARY KEY (id)
);

#
# Daten von Tabelle 'cms_templates'
#
INSERT INTO cms_templates VALUES ("4","1","zweispaltig_300b_500t_tpl.html","zweispaltig_300_500_tpl.html - 1. Spalte Bild, 2. Spalte Text","300x300");
INSERT INTO cms_templates VALUES ("7","3","einspaltig_760v_tpl.html","einspaltig_760v_tpl.html - 1. Spalte Text, 2. Spalte Thumbnails","100x100");
INSERT INTO cms_templates VALUES ("10","4","einspaltig_900_nur_text_tpl.html","einspaltig_900_nur_text_tpl.html - Einspaltig, nur Text, 900 Pixel breit","");



# ----------------------------------------------------------
#
# Struktur von Tabelle 'cms_users'
#
DROP TABLE IF EXISTS cms_users;
CREATE TABLE cms_users (
    id tinyint(4) NOT NULL auto_increment,
    username varchar(32) NOT NULL,
    password varchar(32) NOT NULL,
    menu char(10) DEFAULT "NUBD" NOT NULL,
   PRIMARY KEY (id),
   KEY username (username)
);

#
# Daten von Tabelle 'cms_users'
#
INSERT INTO cms_users VALUES ("1","hempen","e9911456f39b5e6d738669ac8d438b20","NUFAMKLBD");
INSERT INTO cms_users VALUES ("2","webprog10","a3e6096dbe9169213e7880821129428e","NUBD");
INSERT INTO cms_users VALUES ("3","apvn","8f99e14f5499e3c8115852cb953853a1","NUBD");


