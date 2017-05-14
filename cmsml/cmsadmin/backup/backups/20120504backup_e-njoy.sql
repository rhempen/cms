#----------------------------------------------
# Backup der Datenbank cms_e-njoy_ml
# Erstellt am 04.05.2012 15:48
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
INSERT INTO cms_config VALUES ("1","general","THEME","e-njoy",NULL,NULL);
INSERT INTO cms_config VALUES ("2","general","COPYRIGHT","Brain at Work SA 2012",NULL,NULL);
INSERT INTO cms_config VALUES ("3","general","MAX_THUMBS","4",NULL,NULL);
INSERT INTO cms_config VALUES ("4","general","MAX_LIST_ITEMS","1",NULL,NULL);
INSERT INTO cms_config VALUES ("5","general","LANGUAGE","DE",NULL,NULL);
INSERT INTO cms_config VALUES ("10","menu","HMENU_RICHTUNG","left","right",NULL);
INSERT INTO cms_config VALUES ("11","menu","HMENU_SUBMENU","submenu","dropdown",NULL);
INSERT INTO cms_config VALUES ("20","pictures","THUMB_PAGE_MAX_WIDTH","100",NULL,NULL);
INSERT INTO cms_config VALUES ("21","pictures","THUMB_PAGE_MAX_HEIGHT","100",NULL,NULL);
INSERT INTO cms_config VALUES ("22","pictures","THUMB_NAVI_MAX_WIDTH","400",NULL,NULL);
INSERT INTO cms_config VALUES ("23","pictures","THUMB_NAVI_MAX_HEIGHT","400",NULL,NULL);
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
INSERT INTO cms_config VALUES ("9","general","TEMPLATE_DIR","frontend/themes/e-njoy/tpl",NULL,NULL);
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
INSERT INTO cms_fragmente VALUES ("1","teaser1","2","<p><iframe src=\"http://www.youtube.com/embed/lb_7l-gK6vE\" frameborder=\"0\" width=\"400\" height=\"300\"></iframe></p>");
INSERT INTO cms_fragmente VALUES ("2","teaser2","1","<div class=\"teasertext\">
<h2 class=\"teasertitle\">Teaser 2: Das ist Teaser 2</h2>
<p class=\"teasertext\">Zur Zeit läuft im Fernsehen die Sendung ECO&nbsp;�?? Eine hochinteressante Sendung über Wirtschaft, Geld und Macht! Moderiert wird die Sendung von Reto Lipp</p>
<p class=\"teasertext\">Zur Zeit läuft im Fernsehen die Sendung ECO&nbsp;�?? Eine hochinteressante Sendung über Wirtschaft, Geld und Macht! Moderiert wird die Sendung von Reto Lipp<br /><br /></p>
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
INSERT INTO cms_galerien VALUES ("2","7","1","N","../../media_e-njoy/navi_6/_images/nullprozent.png","");
INSERT INTO cms_galerien VALUES ("4","2","1","P","../../media_e-njoy/navi_40002/_images/att00038.png","");
INSERT INTO cms_galerien VALUES ("6","13","1","N","../../media_e-njoy/navi_4_10/_images/att00069.png","red tobacco");
INSERT INTO cms_galerien VALUES ("7","13","2","N","../../media_e-njoy/navi_4_10/_images/att00044.png","Menthol Taste");
INSERT INTO cms_galerien VALUES ("8","13","3","N","../../media_e-njoy/navi_4_10/_images/att00062.png","Tobacca Taste");
INSERT INTO cms_galerien VALUES ("9","13","4","N","../../media_e-njoy/navi_4_10/_images/att00065.png","Vanilla Taste");
INSERT INTO cms_galerien VALUES ("10","13","5","N","../../media_e-njoy/navi_4_10/_images/att00068.png","yellow Tobacco");
INSERT INTO cms_galerien VALUES ("11","10","1","N","../../media_e-njoy/navi_1_10/_images/nullprozent.png","");
INSERT INTO cms_galerien VALUES ("12","11","1","N","../../media_e-njoy/navi_1_20/_images/att00023.png","");
INSERT INTO cms_galerien VALUES ("13","3","1","N","../../media_e-njoy/navi_3/_images/att00070.png","");
INSERT INTO cms_galerien VALUES ("18","2","2","P","../../media_e-njoy/navi_40002/_images/nullprozent.png","");
INSERT INTO cms_galerien VALUES ("17","12","1","N","../../media_e-njoy/navi_1_30/_images/att00038.png","");
INSERT INTO cms_galerien VALUES ("40","17","4","N","../../media_e-njoy/navi_2_20/_images/martina winzeler.jpg","");
INSERT INTO cms_galerien VALUES ("39","17","3","N","../../media_e-njoy/navi_2_20/_images/sebastian winzeler.jpg","");
INSERT INTO cms_galerien VALUES ("38","17","2","N","../../media_e-njoy/navi_2_20/_images/julian winzeler.jpg","");
INSERT INTO cms_galerien VALUES ("37","17","1","N","../../media_e-njoy/navi_2_20/_images/albin winzeler.jpg","");
INSERT INTO cms_galerien VALUES ("41","1","1","N","../../media_e-njoy/navi_1/_images/bgheader.png","");
INSERT INTO cms_galerien VALUES ("42","1","2","N","../../media_e-njoy/navi_1/_images/logo-enjoy-transp.png","");
INSERT INTO cms_galerien VALUES ("43","31","1","P","../../media_e-njoy/navi_20001/_images/marion hempen.jpg","");
INSERT INTO cms_galerien VALUES ("45","1","1","","../../media_e-njoy/navi_40001/_images/julian winzeler.jpg","");



# ----------------------------------------------------------
#
# Struktur von Tabelle 'cms_markers2'
#
DROP TABLE IF EXISTS cms_markers2;
CREATE TABLE cms_markers2 (
    mid int(11) NOT NULL auto_increment,
    nam varchar(60) NOT NULL,
    adr varchar(80) NOT NULL,
    ort varchar(80) NOT NULL,
    lat float NOT NULL,
    lng float NOT NULL,
    typ varchar(30) NOT NULL,
    act set('aktiv','inaktiv') DEFAULT "aktiv" NOT NULL,
   PRIMARY KEY (mid)
);

#
# Daten von Tabelle 'cms_markers2'
#
INSERT INTO cms_markers2 VALUES ("275","Wellness Apotheke GmbH","Kantonsstrasse 96"," 6048 Horw/LU","47.0198","8.31083","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("257","St. Jakob Apotheke AG","St. Jakob-Strasse 38"," 9000 St. Gallen","47.4299","9.3797","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("258","StadtApotheke","Centralstrasse 14"," 2540 Grenchen","47.1935","7.39567","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("259","Stadt-Apotheke","Hauptstrasse 45"," 8280 Kreuzlingen","47.6498","9.17484","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("260","Stadttor Drogerie ","Spitalgasse 1"," 4800 Zofingen","47.2918","7.94295","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("261","Sun Store Apotheke ","Bleichestrasse 15"," 8280 Kreuzlingen","47.6412","9.196","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("262","Swidro Drogerie Heidegger","Hauptstrasse 63"," 8280 Kreuzlingen","47.648","9.17551","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("263","Swidro Drogerie Sulgen ","Center Passerelle"," 8583 Sulgen","47.5382","9.18564","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("264","Tödi-Apotheke","Tödistrasse 46 /Eing. Bleicherweg"," 8002 Zürich","47.3673","8.53398","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("265","Topharm Egg Apotheke Vitalis","Zürcherstr. 23"," 5630 Muri","47.2762","8.34481","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("266","Topharm St. Peter Apotheke","Untere Bahnhofstr. 16"," 9500 Wil","47.4625","9.04456","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("267","Toppharm Center Apotheke","Badweg 2 im Migros Markt"," 4460 Gelterkinden","47.4661","7.85776","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("268","toppharm Hirschen Apotheke ","Hirschenweg 1"," 4312 Magden","47.5273","7.81379","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("269","Toppharm Kranich Apotheke GmbH","Bahnhofwiese 18"," 8712 Stäfa","47.241","8.7225","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("270","TopPharma Apotheke Gmünder","Grüngenstr.1"," 4416 Bubendorf","47.4571","7.74259","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("271","Topppharm Apotheke","Aarauerstr. 10"," 5712 Beinwil am See","47.2669","8.20281","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("272","Tuina-an-Mo Therapiepraxis ","Neugasse 10"," 9220 Bischofszell","47.4937","9.24225","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("273","UrsDrogerie GmbH","Blickensdorferstrasse 4"," 6312 Steinhausen","47.1971","8.48585","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("274","Vinzenz Apotheke AG","Rössliweg 13"," 5074 Eiken","47.5326","7.98777","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("192","Pharmacie Cina","Rue du Bourg 15"," 3960 Sierre","46.2932","7.53332","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("193","Pharmacie Clarenzia","Rue du Lac 64"," 1815 Clarens","46.4403","6.89552","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("194","Pharmacie COOP Vitality ","Rue des Fossés 4"," 1110 Morges","46.5102","6.49786","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("195","Pharmacie Coop Vitality ","Rue Pierre-à-Mazel 10"," 2000 Neuchâtel","46.9955","6.94303","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("196","Pharmacie COOP Vitality SA Crissier","Ch. de Saugy 1"," 1023 Crissier","46.5447","6.57043","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("197","Pharmacie COOP Vitality","Av. Max-Huber 7"," 3960 Sierre","46.2938","7.53454","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("198","Renens Centre, Place du Marché 1","Av. Max-Huber 7"," 1020 Renens ","46.5386","6.5813","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("199","Pharmacie de Charnot",""," 1926 Fully","46.1416","7.12357","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("200","Pharmacie de Cossonay S.A.","Rue du Temple 1"," 1304 Cossonay","46.614","6.50835","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("201","Pharmacie de Cugy","Rue de Lausanne 3"," 1053 Cugy","46.5845","6.63992","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("202","Pharmacie de la Blécherette","Route des Plaines-du-Loup 74"," 1018 Lausanne","46.5407","6.62058","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("203","Pharmacie de la Clergère","chemin du Pré-de-la-Tour 10"," 1009 Pully","46.5111","6.66097","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("204","Pharmacie de la Gare","Place de la Gare 1"," 2002 Neuchâtel","46.9966","6.93596","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("205","Pharmacie de la Gare","Avenue de la Gare 46"," 1920 Martigny","46.1045","7.07736","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("206","Pharmacie de la Piscine ","Avenue du Silo 24"," 1020 Renens ","46.5318","6.58559","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("207","Pharmacie de la Plaine","16 Av. du Mail"," 1205 Genève","46.1986","6.13914","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("208","Pharmacie de la Terrassière","rue de la Terrassière 13"," 1207 Genève","46.2009","6.15735","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("209","Pharmacie de l\\\'Avenir","Magro City"," 1950 Sion","46.227","7.35333","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("210","Pharmacie de Port Valais SA","Rte Cantonale 42"," 1897 Bouveret","46.3847","6.85333","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("211","Pharmacie de Prangins","Au Village"," 1197 Prangins","46.373","6.20101","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("212","Pharmacie de St-Sulpice ","Rue du Centre 68"," 1025 St-Sulpice","46.5106","6.55751","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("213","Pharmacie de Valency","Route de Prilly 3"," 1004 Lausanne","46.5312","6.61136","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("214","Pharmacie de Vernier Sàrl","route de Vernier 184"," 1214 Vernier","46.2171","6.08708","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("215","Pharmacie de Vieusseux","32 Av. Ernest-Pictet"," 1203 Genève ","46.213","6.12422","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("216","Pharmacie de Villeneuve","Grand Rue 32"," 1844 Villeneuve","46.397","6.92519","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("217","Pharmacie de Vouvry","avenue du Valais 2"," 1896 Vouvry/VS","46.3362","6.8906","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("218","Pharmacie des Alpes","Av. de la Gare 8"," 3963 Crans-Montana ","46.3124","7.48342","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("219","Pharmacie des Bergières","avenue Bergières 42"," 1004 Lausanne","46.5308","6.61964","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("220","Pharmacie du Boulevard","boulevard de Grancy 35"," 1006 Lausanne","46.5159","6.62702","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("221","Pharmacie du Bourg","Grand Rue 53"," 1844 Villeneuve","46.3961","6.92416","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("222","Pharmacie du Capitole Matran","Route du Bois 1"," 1753 Matran","46.7806","7.08746","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("223","Pharmacie du Midi ","Place du Midi 20"," 1950 Sion","46.231","7.3606","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("224","Pharmacie du Pont-des-Sauges Sàrl.","Av. du Grey 58"," 1018 Lausanne","46.5362","6.62003","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("225","Pharmacie du Soleil","34 rue de Montchoisi"," 1207 Genève ","46.205","6.16225","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("226","Pharmacie Gambetta Dr Sarraf","Rue des Vergers 11"," 1815 Clarens","46.4407","6.89583","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("227","Pharmacie Hadid Sarl","Av. de Chailly 44"," 1012 Lausanne","46.5233","6.65476","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("228","Pharmacie Internationale","Avenue de Chillon 74"," 1820 Territet","46.4248","6.92441","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("229","Pharmacie les Crêtes SA","Route d&quot;Ayent 19"," 1971 Grimisuat","37.0188","-88.3335","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("230","Pharmacie Luc Geny","rue du Petit-Chêne 9bis"," 1003 Lausanne","46.5188","6.6316","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("231","Pharmacie Magnin","avenue de la Gare 20"," 1951 Sion","46.23","7.35851","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("232","Pharmacie Dunant‎","13, rue de Livron"," 1217 Meyrin ","46.2303","6.08107","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("233","Pharmacie Miserez SA","rue de la Gare 4"," 1030 Bussigny-près-Lausanne/VD","46.548","6.55292","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("234","Pharmacie Populaire 2","Boulevard de Grancy 4"," 1006 Lausanne","46.5151","6.63167","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("235","Pharmacie SABA","C. Commercial St-Antoine"," 1800 Vevey","46.4633","6.84785","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("236","Pharmacie Schoen","Av. Paul-Ceresole 11"," 1800 Vevey","46.4616","6.84201","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("237","pharmacieplus de châtelaine","av. de châtelaine 74"," 1219 Châtelaine","46.2114","6.11286","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("238","Pharmacieplus du Mortier d\\\'Or ","rue de Coutance 12"," 1201 Genève","46.2063","6.14273","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("239","Pharmacieplus Lauber","Av. de la Gare 7"," 1920 Martigny","46.1024","7.07421","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("240","pharmacieplus Salzmann","place de la Gare 3 "," 2735 Malleray","47.2383","7.27616","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("241","Pilger Apotheke AG","Missionsstrasse 57"," 4055 Basel","47.5609","7.5753","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("242","Pill Apotheke Fröhlichstrasse","Seefeldstrasse 171"," 8008 Zürich","47.3553","8.55698","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("243","Pill Apotheke Oberdorf","Oberdorfstrasse 23"," 8820 Wädenswil","47.2285","8.66848","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("244","Pill Apotheke Sihltal","Bahnhofplatz 4"," 8134 Adliswil","47.3126","8.52469","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("245","Rathaus Apotheke","Zürcherstr. 153"," 8500 Frauenfeld","47.5558","8.89696","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("246","Reuss-Apotheke ","Zufikerstrasse 2"," 5620 Bremgarten/AG","47.3527","8.34962","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("247","Rike Apotheke AG","Rikonerstrasse 14"," 8307 Effretikon","47.4289","8.68701","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("248","Rosen Apotheke","Niederdorfstrasse 11"," 8001 Zürich","47.3733","8.5436","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("249","Rosengarten - Apotheke AG","Poststrasse 1"," 8303 Bassersdorf","47.4431","8.63115","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("250","Rotbuch Apotheke ","Röschibachstrasse 72"," 8037 Zürich ","47.3931","8.52843","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("251","Rothaus Apotheke","Dorfstrasse 70"," 8706 Meilen","47.2699","8.64194","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("252","Schloss Apotheke ","Rathausplatz 3"," 8500 Frauenfeld","47.5556","8.89773","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("253","Schwanen Apotheke Dr. Th Strasky","Weite Gasse 21"," 5402 Baden","47.4724","8.30753","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("254","See-Apotheke ","St. Gallerstr. 5"," 9320 Arbon","47.5121","9.43238","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("255","Seefeld Apotheke","Seefeldstrasse 81"," 8008 Zürich","47.3603","8.55241","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("256","St. Georg Apotheke","Grünaustrasse"," 9470 Buchs","47.1659","9.47542","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("189","Pharmacie Capitole Yverdon Sud","Rte de Lausanne 10"," 1400 Yverdon-les-Bains","46.7666","6.65048","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("190","Pharmacie Centrale","Place Centrale 4"," 1920 Martigny","46.1017","7.07298","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("191","Pharmacie Charles-Henri Pilloud ","Rue Francillon 15"," 2010 St-Imier","47.1527","6.99793","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("129","Löwen-Apotheke Dr. Max Ruckstuhl AG","Zentralstrasse 17"," 8953 Dietikon","47.4051","8.40179","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("130","Löwen-Apotheke","Bahnhofstrasse 58"," 8001 Zürich","47.3733","8.53845","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("131","MaPharmacie de Chalais SA","Rue de la Forge 15"," 3966 Chalais ","46.2654","7.5084","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("132","Hofmattcenter","Luzernerstrasse 30"," 6010 Kriens","47.034","8.28271","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("133","Metalli Apotheke AG","Industriestrasse 13b"," 6300 Zug","47.1725","8.51741","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("134","Metalli Parfumerie Drogerie","Baarerstr. 22"," 6300 Zug","47.1724","8.51674","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("135","Murifeld-Apotheke","Mülinenstr. 24"," 3006 Bern 7","46.9375","7.47306","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("136","Neumarkt Apotheke Drogerie Pireva AG","Altstetterstrasse 145"," 8048 Zürich","47.3884","8.48685","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("137","Nord - Apotheke ","Wehntalerstr. 537"," 8046 Zürich","47.4187","8.50705","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("138","Oberi Apotheke Topwell Apotheken AG","Römerstrasse 234"," 8404 Winterthur","47.51","8.75924","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("139","Olympia Apotheke am Stauffacher ","Badenerstrasse 6"," 8004 Zürich ","47.3737","8.53103","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("140","Paracelsus Apotheke","Landstrasse 118"," 5420 Wettingen","47.4644","8.32949","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("141","Paracelsus Apotheke","Langstrasse 122"," 8004 Zürich","47.3793","8.52761","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("142","Pharmacie 24 SA","Avenue de Montchoisi 3"," 1006 Lausanne","46.5142","6.63335","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("143","Pharmacie Amavita Bagnoud","Route de Rawyl 32"," 3963 Crans-Montana ","46.3095","7.47317","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("144","Pharmacie Amavita Courtepin GaleniCare SA","Le Centre 2"," 1718 Courtepin","46.865","7.1244","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("145","Pharmacie Amavita d\\\'Herborence Sàrl","rue O.-Huguenin 23"," 2017 Boudry","46.9488","6.80586","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("146","Pharmacie Amavita Domdidier","Rue Centrale"," 1564 Domdidier","46.8669","7.01277","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("147","Pharmacie Amavita du Pommier","rue Sonnex 14"," 1218 Le Grand-Saconnex","46.2291","6.12005","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("148","Pharmacie Amavita Florissant GaleniCare SA","Rte de Florissant 70"," 1206 Genève","46.1929","6.1627","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("149","Pharmacie Amavita GaleniCare SA","Place de Gare 4"," 1020 Renens ","46.5366","6.57871","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("150","Pharmacie Amavita Gare","Place de la Gare 2"," 1003 Lausanne","46.5175","6.62996","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("151","Pharmacie Amavita Saint-François GaleniCare SA","place Saint-François 1"," 1003 Lausanne","46.5199","6.63223","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("152","Pharmacie Amavita Théatre","Av. Georgette 4"," 1003 Lausanne","46.5176","6.63777","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("153","Pharmacie Bichsel","Rte de Tavannes 1"," 2732 Reconvilier","47.2336","7.22221","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("154","Pharmacie Capitol Gare CFF","Pl. de la Gare 1"," 1700 Fribourg","46.8043","7.15198","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("155","Pharmacie Capitol Jenni ","Grand-Rue 21"," 2114 Fleurier","46.9022","6.58129","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("156","Pharmacie Capitole Bel-Air","Pl. Bel-Air 2"," 1400 Yverdon-les-Bains","46.7804","6.63708","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("157","Pharmacie Capitole Biopôle","Rte de la Corniche 2"," 1066 Epalinges","46.543","6.66155","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("158","Pharmacie Capitole Bloch","Rue du Lac 40"," 1400 Yverdon-les-Bains","46.7799","6.63894","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("159","Pharmacie Capitole Bonvin Sierre","Av. Général Guisan 30"," 3960 Sierre","46.2924","7.52971","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("160","Pharmacie Capitole Bornard","rue Saint-Maurice 2 /rue du Concert"," 2000 Neuchâtel","46.9918","6.93035","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("161","Pharmacie Capitole Centrale-Marché","rue de Romont 2"," 1700 Fribourg","46.8048","7.15516","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("162","Pharmacie Capitole Centre ","Av. de la Gare 10"," 1701 Fribourg","46.8029","7.15195","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("163","Pharmacie Capitole Chateauneuf Conthey","rue des Rottes 50"," 1984 Conthey","46.2233","7.30707","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("164","Pharmacie Capitole Chênes ","route du Manège 26"," 1950 Sion","46.2284","7.37894","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("165","Pharmacie Capitole Closelet","Ch. du Closelet 1"," 1006 Lausanne","46.5148","6.6325","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("166","Pharmacie Capitole Cugy","Rte de Bottens 1"," 1053 Cugy","46.5854","6.64021","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("167","Pharmacie Capitole Etoile","av. de la Sallaz 51 "," 1010 Lausanne","46.5328","6.64682","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("168","Pharmacie Capitole Etraz","rue Etraz 12 "," 1003 Lausanne","46.5192","6.63883","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("169","Pharmacie Capitole Gamma","Place de la Riponne 10"," 1005 Lausanne","46.5246","6.63308","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("170","Pharmacie Capitole Gland","Rue du Borgeaud 3A"," 1196 Gland","46.4238","6.2618","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("171","Pharmacie Capitole Grand-Chêne","rue du Grand-Chêne 1 "," 1003 Lausanne","46.5196","6.6319","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("172","Pharmacie Capitole Lutry","Grand-Rue 26"," 1095 Lutry","46.5023","6.68498","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("173","route des Pralettes 1, Centre Migros","Grand-Rue 26"," 1723 Marly/FR","46.7789","7.15407","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("174","Pharmacie Capitole Orbe","Grand Rue 3"," 1350 Orbe","46.7245","6.53199","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("175","Pharmacie Capitole Ouchy","Av. de la Rhodanie 2"," 1007 Lausanne","46.508","6.62477","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("176","Pharmacie capitole Pérolles","Bd de Pérolles 23/21A"," 1700 Fribourg","46.7997","7.15248","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("177","Pharmacie Capitole Place-Neuve","Pl. de la Gare 1"," 1009 Pully","46.5107","6.65943","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("178","Pharmacie Capitole Pontaise","rue du Valentin 68"," 1004 Lausanne","46.5283","6.63091","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("179","Pharmacie Capitole Poste","Rue de la Poste 3"," 1920 Martigny","46.1035","7.07709","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("180","Pharmacie Capitole Pralong","Av. Ritz 31"," 1950 Sion 2","46.2357","7.35982","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("181","Pharmacie Capitole Schönberg","rte Mont-Repos 5c"," 1700 Fribourg","47.1796","7.35943","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("182","Pharmacie Capitole Serpent","Grand-Rue 3"," 1630 Bulle","46.6179","7.05704","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("183","Pharmacie Capitole Ste-Croix","rue Neuve 8A"," 1450 Ste-Croix/VD","46.8227","6.50126","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("184","Pharmacie Capitole Ste-Thérèse","rte Ste-Thérèse 2A"," 1700 Fribourg","46.8107","7.14771","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("185","Pharmacie Capitole St-Paul","Av. d\'Echallens 64"," 1004 Lausanne","46.5278","6.61769","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("186","Pharmacie Capitole Tavil-Chatton","Grand Rue 11"," 1110 Morges","46.5102","6.49966","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("187","Pharmacie Capitole Tour-de-Peilz","Av. des Alpes 66"," 1814 La Tour-de-Peilz","46.4576","6.85724","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("188","Pharmacie Capitole Verbier ","Case postale 275"," 1936 Verbier","46.0961","7.21909","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("111","Farmacia delle Semine SA","Via Rodari 3"," 6500 Bellinzona","46.1872","9.01511","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("112","Fontana-Apotheke","Sihlfeldstrasse 150"," 8004 Zürich","47.38","8.51605","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("113","Freudenberg - Apotheke","Giacomettistr. 15"," 3006 Bern","46.9454","7.47276","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("114","Friedens-Apotheke","Pestalozzistr. 26 "," 3007 Bern","46.9409","7.42437","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("115","Glattal-Apotheke","Schaffhauserstrasse 124"," 8152 Glattbrugg","47.4345","8.567","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("116","Gotthard Apotheke Parfumerie","Bahnhofstrasse 17"," 6340 Baar","47.1946","8.52345","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("117","Helvetiaplatz-Apotheke","Langstrasse 39"," 8004 Zürich","47.3761","8.52534","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("118","Heuried Apotheke Topwell-Apotheken AG","Birmensdorferstrasse 379"," 8055 Zürich","47.369","8.50489","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("119","Hofstetter Drogerie Parfumerie ","Zentrum Goethestrasse "," 8712 Stäfa","47.2417","8.72334","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("120","Impuls Peterer Drogerie","Bahnhofstr. 5"," 9230 Flawil","47.4137","9.1873","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("121","Impuls Peterer Drogerie","COOP-Center"," 9240 Uzwil","47.4304","9.15127","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("122","Impuls Peterer Drogerie","Migros-Center"," 9220 Bischofszell","47.4964","9.24146","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("123","Impuls Sonnen Drogerie","St. Gallerstr. 22"," 9200 Gossau","47.4154","9.24797","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("124","IndustrieApotheke","Limmatstrasse 180"," 8005 Zürich","47.3865","8.53006","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("125","Kräuterhaus-Drogerie Zeller AG","Hauptgasse 23"," 4500 Solothurn","47.2072","7.53602","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("126","Kressig Drogerie AG","Bahnhofstrasse 5"," 7310 Bad Ragaz","47.004","9.50141","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("127","Kronbühl-Apotheke","St. Gallerstrasse 10a"," 9300 Wittenbach","47.4576","9.39644","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("128","Linden-Apotheke Peter + Brinkmann GmbH","Kempttalstrasse 79"," 8320 Fehraltorf","47.3874","8.75351","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("54","Bahnhof-Apotheke","Bahnhofplatz "," 8640 Rapperswil","47.2255","8.81663","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("55","Bahnhofapotheke","Bahnhofplatz 2"," 8304 Wallisellen","47.4129","8.5925","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("56","Bahnhofdrogerie P.Geisselhardt","Bahnhofstrasse 34"," 8580 Amriswil","47.5491","9.30319","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("57","Bären Apotheke ","Bim Zytglogge 1"," 3000 Bern 7","46.9479","7.44767","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("58","Bären-Drogerie","Postgach 22"," 6354 Vitznau","47.0216","8.49119","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("59","Batterie Apotheke, B-Pharma AG","Gundelingerrain 191"," 4059 Basel","47.5328","7.59499","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("60","Bernina-Apotheke","Schaffhauserstrasse 241 / Berninaplatz"," 8057 Zürich","47.4034","8.54791","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("61","Bifang-Apotheke","Aarauerstrasse 73"," 4600 Olten","47.3489","7.91169","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("62","Capitole Tour-de-Trême","route de Pra Riond 2"," 1635 La Tour-de-Trême/FR","46.6004","7.07567","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("63","Center-Drogerie D. Weidmann","Bülacherstr. 17"," 8424 Embrach","47.5103","8.59125","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("64","Central Apotheke Amriswil","Bahnhofstr. 14"," 8580 Amriswil","47.5469","9.30142","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("65","Central Apotheke","Baslerstr. 72"," 4600 Olten","47.353","7.90266","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("66","COOP Vitality Apotheke","Bahnhofstr. 81"," 8001 Zürich","47.3759","8.53899","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("67","COOP Vitality Apotheke","Birmensdorferstr. 200"," 8003 Zürich","47.3706","8.51579","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("68","COOP Vitality Apotheke","Breitenstrasse 4"," 9532 Rickenbach b. Wil","47.4745","9.10151","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("69","COOP Vitality Apotheke","Coop Center Grabenstrasse 4"," 8184 Bachenbülach","47.5059","8.54122","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("70","COOP Vitality Apotheke","Einkaufszentrum Mellingen"," 5507 Mellingen ","47.4187","8.27327","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("71","EKZ Letzipartk, Baslerstr. 50","Einkaufszentrum Mellingen"," 8048 Zürich","47.3864","8.49877","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("72","COOP Vitality Apotheke","Europecenter"," 4058 Basel","47.5656","7.61177","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("73","COOP Vitality Apotheke","Industriestrasse 28"," 8305 Dietlikon/ZH","47.4129","8.61858","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("74","COOP Vitality Apotheke","Perry Center"," 4665 Oftringen","47.3112","7.91367","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("75","COOP Vitality Apotheke","Salzhausstrasse 31"," 2508 Biel","47.1302","7.24375","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("76","COOP Vitality Apotheke","Sihlcity 15"," 8045 Zürich","47.3583","8.52212","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("77","COOP Vitality Apotheke","St. Gallerstr. 75"," 9200 Gossau","47.4167","9.2515","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("78","COOP Vitality Apotheke","Tägi-Park"," 5430 Wettingen","47.4642","8.32646","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("79","COOP Vitality Apotheke","Volkiland "," 8804 Volketswil","47.3908","8.68534","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("80","COOP Vitality Apotheke","Zentrum 2"," 5443 Niederrohrdorf","47.4239","8.30507","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("81","COOP Vitality Apotheke","Zürcherst. 138"," 8500 Frauenfeld","47.5573","8.89941","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("82","Coop Vitality Pharmacie ","les entilles centre"," 2300 La Chaux-de-Fonds","47.1177","6.84057","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("83","DorfApotheke","Hauptstrasse 62"," 4528 Zuchwil/SO","47.2036","7.5603","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("84","Dorf-Drogerie Hafen","Klotenerstrasse 8"," 8303 Bassersdorf","47.4437","8.62799","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("85","Dorfplatz-Apotheke ","Baslerstrasse 29"," 4123 Allschwil","47.5517","7.53773","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("86","Dr. Güntert","Bahnhofstrasse 4"," 9630 Wattwil ","47.3013","9.08589","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("87","Drogerie Bohl","Bahnhofstrasse 16"," 9230 Flawil","47.4143","9.18828","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("88","Drogerie Hermann","Zentrum Chilematt"," 6314 Unterägeri","47.1279","8.59244","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("89","Drogerie Imlig ","Herrengasse 21"," 6430 Schwyz","47.0219","8.65146","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("90","Drogerie Krähenbühl AG","Oltnerstr. 11"," 5012 Schönenwerd","47.3709","8.00263","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("91","Drogerie Mellingen","Hauptgasse 3"," 5507 Mellingen ","47.4186","8.27346","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("92","Drogerie Parfumerie Artho AG","Rosengartenstrasse 10"," 8706 Meilen","47.2683","8.6454","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("93","Drogerie Stucki","Kalchackerstrasse 9"," 3047 Bremgarten b. Bern","46.9756","7.43755","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("94","Drogerie Th. Kunz-Berger","Hauptstrasse 49"," 4450 Sissach","47.4634","7.81311","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("95","Drogerie Vögele","Pestalozzistr. 8"," 8570 Weinfelden","47.5675","9.10844","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("96","Drogerie W. Aeschbacher","Bahnhofstrasse 2"," 8854 Siebnen","47.1749","8.8986","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("97","Drogerie Zumsteg","Bahnhofstr. 7"," 5300 Turgi","47.4935","8.2527","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("98","Drogerie-Parfümerie Wyss","Zürcherst. 149"," 8500 Frauenfeld","47.5573","8.89941","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("99","Drogissa Drogerie","Kirchenstr. 9"," 8590 Amriswil","47.5466","9.29572","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("100","Droguerie du Portail Sàrl","grand Rue 64"," 1530 Payerne","46.8212","6.93666","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("101","Dropa Betriebs AG Fil. Unterentfelden","Binzmattweg 8"," 5035 Unterentfelden","47.362","8.04562","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("102","Dropa Betriebs AG Fil. Zürich-Affoltern","in Böden 174"," 8046 Zürich ","47.4199","8.50808","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("103","Dropa Betriebs AG","Bahnhofstrasse 54a"," 8590 Romanshorn","47.5646","9.36749","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("104","Dropa Drogerie Filiale Cham","Zugerstrasse 17"," 6330 Cham","47.1817","8.46204","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("105","Dropa Drogerie Käch","Bellvuestr. 6"," 6280 Hochdorf","47.1688","8.28866","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("106","Dropa Drogerie Roth ","Im Gäupark"," 4622 Egerkingen","47.3182","7.80082","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("107","Dropa Drogerie Tschumi","Dornacherhof 11"," 4500 Solothurn","47.2087","7.53795","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("108","Dropa Drogerie Widnau","Bahnhofstrasse 4"," 9443 Widnau","47.4076","9.62957","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("109","Dropa Drogerie Wyss","Solothurnerstrasse 3"," 4600 Olten","47.3499","7.90038","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("110","Egghölzli Apotheke","Egghölzlistrasse 20"," 3006 Bern ","46.9365","7.4753","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("1","Amavita Apotheke Galenicare AG","Stadthausgasse 10"," 4051 Basel","47.5588","7.58687","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("2","Amavita Apotheke Galenicare AG","Shoppingcenter Schönbühl"," 6005 Luzern","47.0385","8.33004","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("3","Amavita Apotheke Corviglia ","Via Maistra 11"," 7500 St. Moritz","46.498","9.83915","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("4","Amavita Apotheke Bahnhof","Bahnhofstr. 5"," 8820 Wädenswil","47.2288","8.6752","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("5","Christoffelunterführung, RailCity","Bahnhofstr. 5"," 3011 Bern","46.9492","7.44391","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("6","Amavita Apotheke & Drogerie Stadelhofen","Stadelhoferstr. 9"," 8001 Zürich","47.3666","8.5484","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("7","Alte Suidtersche Apotheke","Bahnhofstrasse 21"," 6003 Luzern","47.0503","8.30306","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("8","Amavita Apotheke Horw GaleniCare AG","Gemeindehausplatz 17"," 6048 Horw/LU","47.0192","8.30942","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("9","Amavita Apotheke Kongress ","Promenade 49"," 7270 Davos Platz","46.7949","9.82104","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("10","Amavita Apotheke Rümlang","Oberdorfstrasse 24"," 8153 Rümlang","47.4508","8.53002","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("11","Amavita Apotheke Schwamendingen","Winterthurerstrasse 529"," 8051 Zürich ","47.404","8.5726","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("12","Amavita Apotheke Sunnemärt","Albisstrasse 10"," 8134 Adliswil","47.3116","8.5254","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("13","Amavita Apotheke Uzwil","Neudorfstr. 2"," 9240 Uzwil","47.438","9.13271","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("14","Amavita Apotheke Vispach","Centerpark"," 3930 Visp","46.2945","7.88521","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("15","Amavita Apotheke ","Zentrum"," 8105 Regensdorf ","47.4313","8.46739","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("16","Amavita Apotheke Zug","Bundesplatz 10"," 6300 Zug","47.1718","8.5153","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("17","Amavita Apotheke Zumikon","Dorfplatz 4"," 8126 Zumikon","47.3319","8.62388","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("18","Amavita Apotheke","Badenerstr. 15"," 8953 Dietikon","47.4057","8.39817","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("19","Amavita Apotheke","Einkaufszentrum Glatt "," 8301 Glatt","47.4112","8.5961","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("20","LöwenCenter, Zürichstrasse 5","Einkaufszentrum Glatt "," 6004 Luzern","47.0564","8.31017","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("21","Amavita Apotheke","Zugerstrasse 2"," 8820 Wädenswil","47.2299","8.67332","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("22","Ameisen Apotheke AG","Magdenauerstrasse 10"," 9230 Flawil","47.4128","9.18631","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("23","Apnex - Schlafmedizinische Produkte","H.U. Kuratli Kasernenstrasse 15"," 8005 Zürich","47.3741","8.53193","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("24","Apollo-Apotheke","Badusstrasse 10"," 7000 Chur","46.8551","9.52441","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("25","Apotheke 11 Topwell-Apotheken AG","Querstrasse 15/17"," 8050 Zürich","47.4097","8.54463","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("26","Apotheke 12","Winterthurerstrasse 524"," 8051 Zürich","47.4039","8.57265","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("27","Apotheke am Postplatz ","Postplatz 2"," FL-9494 Schaan","47.1806","9.52202","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("28","Apotheke Bad Ragaz","Kronenplatz 3"," 7310 Bad Ragaz","47.0016","9.50087","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("29","Apotheke Dr. Stoffel","AlbuVille"," 8640 Rapperswil","47.2289","8.82111","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("30","Apotheke Drogerie Aemisegger AG","Im Bernerhaus"," 8570 Weinfelden","47.5659","9.11018","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("31","Apotheke Drogerie Schilliger","Luzernerstr. 5"," 6343 Rotkreuz","47.1404","8.4272","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("32","Apotheke Drogerie","Brunau Park AG"," 8045 Zürich","47.3518","8.5086","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("33","Apotheke Falknis GmbH","Bahnhofstrasse 54"," 7302 Landquart","46.968","9.5619","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("34","Apotheke Frey AG","Poststrasse 22"," 9410 Heiden","47.4443","9.53416","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("35","Apotheke Gelterkinden Handschin AG","Poststrasse 9"," 4460 Gelterkinden","47.4655","7.85158","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("36","Apotheke Hemmann","Stauffacherstrasse 1"," 3014 Bern 7","46.9591","7.45469","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("37","Apotheke in Gossau","St. Gallerstr. 90"," 9200 Gossau","47.4167","9.25365","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("38","Apotheke Jona R. Michel AG","Molkereistrasse 10"," 8645 Jona","47.231","8.83758","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("39","Apotheke Lilie Zentrum","Uitikonerstrasse 9"," 8952 Schlieren","47.3968","8.44877","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("40","Apotheke Maienfeld","Aeuli 12"," 7304 Maienfeld","47.0053","9.53019","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("41","Apotheke Parkside","Ringstrasse 1-3"," 8952 Schlieren","47.3981","8.44752","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("42","Apotheke Ritzer","Kernstr. 8"," 8004 Zürich","47.3752","8.52376","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("43","Apotheke Sälipark","Louis Giroud-Str. 26"," 4600 Olten","47.3463","7.90962","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("44","Apotheke Schafroth AG","Badenerstr. 673"," 8048 Zürich","47.3879","8.48639","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("45","Apotheke Sins Dr. P. Frey","Luzernerstrasse 2a"," 5643 Sins","47.1913","8.39555","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("46","Apotheke Spillmann","Bahnhofstr. 11"," 6301 Zug","47.1689","8.51568","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("47","Apotheke Sunne-maert","Sonnengutstrasse 2-4"," 5620 Bremgarten/AG","47.3517","8.34858","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("48","Apotheke Utogrund","Albisriederstrasse 232"," 8047 Zürich ","47.3791","0","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("49","Apotheke zur Waage AG","Inselstrasse 51"," 4057 Basel","47.5775","7.58957","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("50","Apotheke-Drogerie am Marktplatz","Hauptgasse 6"," 3294 Büren a.A.","47.1396","7.37185","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("51","Apotheke-Drogerie Bahnhof Enge Topwell-Apotheken AG","Tessinerplatz 12"," 8002 Zürich","47.3639","8.53105","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("52","Autogrill Schweiz AG Raststätte Pratteln","Götzisbodenweg 22"," 4133 Pratteln","47.5211","7.69167","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("53","Bachmätteli-Apotheke","Bümplizstrasse 128"," 3018 Bern-Bümpliz","46.9404","7.3902","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("276","Werd-Apotheke","Birmensdorferstrasse 51"," 8004 Zürich","47.3716","8.52557","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("277","Wildbach-Apotheke AG","Dorfstrasse 111"," 8424 Embrach","47.5087","8.59379","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("279","Zehntenhaus-Apotheke ","Zehntenhausstrasse 2"," 8046 Zürich ","47.4195","8.5067","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("280","Zentral Apotheke AG","Bahnhofstr. 2"," 9435 Heerbrugg","47.4108","9.62535","lager","aktiv");
INSERT INTO cms_markers2 VALUES ("281","Zentrum-Drogerie HAAG","Schulhausstrasse 2"," 4528 Zuchwil/SO","47.2038","7.55765","onlineshop","aktiv");
INSERT INTO cms_markers2 VALUES ("299","Hempen","Gutstrasse 150","8003 Zürich","47.374","8.50401","lager","inaktiv");
INSERT INTO cms_markers2 VALUES ("300","Roland","Gutstrasse 150","8055","47.374","8.50401","lager","inaktiv");



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
INSERT INTO cms_modules VALUES ("6","SITEMAP","Sitemap");
INSERT INTO cms_modules VALUES ("7","GOOGLEMAPS","Filialsuche mit Googlemaps");



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
    bezeich_de varchar(40) NOT NULL,
    bezeich_en varchar(40) NOT NULL,
    bezeich_fr varchar(40) NOT NULL,
    bezeich_it varchar(40) NOT NULL,
    kuerzel_de varchar(20) NOT NULL,
    kuerzel_en varchar(20) NOT NULL,
    kuerzel_fr varchar(20) NOT NULL,
    kuerzel_it varchar(20) NOT NULL,
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
INSERT INTO cms_navigation VALUES ("1","navi_1","2","0","Produkte","products","produits","prodotti","Produkte","products","produits","prodotti","navi_1","j","n","H");
INSERT INTO cms_navigation VALUES ("2","navi_2","3","0","Partner","partners","partenaires","partner","Partner","partners","","partner","navi_2","j","n","H");
INSERT INTO cms_navigation VALUES ("3","navi_3","4","0","Publikationen","publications","publications","pubblicazioni","Publikationen","publications","publications","pubblicazioni","navi_3","j","n","H");
INSERT INTO cms_navigation VALUES ("4","navi_4","1","10","News und Mehr","news and more","nouvelles","notizie","NewsundMehr","newsandmore","nouvelles","notizie","navi_4","j","n","H");
INSERT INTO cms_navigation VALUES ("5","navi_5","6","0","Members","members","sociétaires","membri","Members","","sociétaires","membri","navi_5","n","n","H");
INSERT INTO cms_navigation VALUES ("6","navi_6","5","0","Über uns","about us","sur nous","Chi siamo","Überuns","","","Chisiamo","navi_6","j","n","H");
INSERT INTO cms_navigation VALUES ("7","navi_6","7","0","Kontakt","contact","contact","contattare","Kontakt","","","contattare","navi_7","j","n","S");
INSERT INTO cms_navigation VALUES ("8","navi_6","8","0","Jobs","jobs","endroits","Offerte di lavoro","Jobs","","","Offertedilavoro","navi_8","j","n","S");
INSERT INTO cms_navigation VALUES ("10","navi_1","3","10","weshalb e-njoy wählen?","why choose e-njoy?","pourquoi choisir e-njoy?","perché scégliere e-njoy?","weshalbe-njoywählen","whychoosee-njoy?","pourquoichoisire-njo","perchéscéglieree-n","navi_1_10","j","n","H");
INSERT INTO cms_navigation VALUES ("11","navi_1","2","10","wie funktioniert e-njoy?","how works e-njoy?","comment fonctionne e-njoy?","come funziona e-njoy?","wiefunktionierte-njo","howworkse-njoy?","commentfonctionnee-n","comefunzionae-njoy?","navi_1_20","j","n","H");
INSERT INTO cms_navigation VALUES ("12","navi_1","2","20","was ist der Unterschied?","what\'s the difference?","ce qui est la différence?","qual é la differenza?","wasistderUnterschied","what\'sthedifference?","cequiestladifférenc","qualéladifferenza?","navi_1_30","j","n","H");
INSERT INTO cms_navigation VALUES ("13","navi_4","1","0","Neue Geschmacksrichtungen","new flavors","nouvelles saveurs","nuovi sapori","NeueGeschmacksrichtu","","","nuovisapori","navi_4_10","j","n","S");
INSERT INTO cms_navigation VALUES ("14","navi_4","1","20","noch mehr News","more news","plus de nouvelles","altre notizie","nochmehrNews","","","altrenotizie","navi_4_20","j","n","H");
INSERT INTO cms_navigation VALUES ("16","navi_2","3","10","Partner_10_de","Partner_10_en","Partner_10_fr","Partner_10_it","Partner_10_de","Partner_10_en","Partner_10_fr","Partner_10_it","navi_2_10","j","n","H");
INSERT INTO cms_navigation VALUES ("17","navi_2","3","20","Partner_20","Partner_20","Partner_20","Partner_20","partner_20","partner_20","partner_20","partner_20","navi_2_20","j","n","H");
INSERT INTO cms_navigation VALUES ("18","navi_4","1","30","Neue_Geschmacksrichtungen_30","Neue_Geschmacksrichtungen_30","Neue_Geschmacksrichtungen_30","Neue_Geschmacksrichtungen_30","neue_geschmacksricht","neue_geschmacksricht","neue_geschmacksricht","neue_geschmacksricht","navi_4_30","j","n","H");



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
    name_de varchar(125) NOT NULL,
    name_en varchar(125) NOT NULL,
    name_fr varchar(125) NOT NULL,
    name_it varchar(125) NOT NULL,
    fach_de char(20) NOT NULL,
    fach_en char(20) NOT NULL,
    fach_fr char(20) NOT NULL,
    fach_it char(20) NOT NULL,
    kurztext_de varchar(200),
    kurztext_en varchar(200),
    kurztext_fr varchar(200),
    kurztext_it varchar(200),
    inhalt1_de longtext,
    inhalt1_en longtext,
    inhalt1_fr longtext,
    inhalt1_it longtext,
    inhalt2_de longtext,
    inhalt2_en longtext,
    inhalt2_fr longtext,
    inhalt2_it longtext,
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
INSERT INTO cms_pages VALUES ("1","14","navi_4","navi_40001","2012-01-24 00:00:00","2012-08-31 00:00:00","e-njoy, die elektronische Zigarette","e-njoy the electronic cigarette","e-njoy la cigarette éléctronique","e-njoy la sigaretta eletronica","noch_mehr_News","more_news","plus_de_nouvelles","altre_notizie","In Deutschland darf nicht mehr vor der E-Zigarette gewarnt werden.","e-njoy the electronic cigarette","e-njoy la cigarette éléctronique","e-njoy la sigaretta eletronica","<p><strong>Oberverwaltungsgericht untersagt Gesundheitsministerin Warnungen vor E Zigaretten</strong></p>
<p><strong><br /></strong></p>
<p>Mit dem Urteil vom 23. April 2012 hat der Senat des Oberverwaltungsgerichts dem Budnesland Nordrhein-Westfalen (Beklagter) durch einstweilige Anordnung die in einer Pressemeldung vom 16. Dezember 2011 enthaltenen Warnungen vor E Zigaretten verboten.</p>
<p>&nbsp;</p>
<p>In dieser „Pressewarnung\" hatte das nordrheinwestfälische Gesundheitsministerin Steffens vor nikotinhaltigen elektrischen Zigaretten gewarnt, da diese als Arzneimittel anzusehen, aber nicht zugelassen seien . Am gleichen Tag informierte das Ministerium die Bezirksregierungen über die nach seiner Meinung bestehende, aber trügerische Rechtslage. Nikotin sei eine toxikologisch wirkende Substanz und nikotinhaltige E-Liquids unterlägen als Arzneimittel dem Arzneimittelrecht. Die E-Zigarette als Gegenstand unterliege dem Produktegesetz für Medizin. Der Erlass wurde auch allen Apotheken im Bereich der Apothekerkammer schriftlich mitgeteilt mit dem Zusatz „Bitte informieren Sie auch Ihre Mitarbeiter/innen\".</p>
<p>&nbsp;</p>
<p>Der Antragsteller beantragte beim Verwaltungsgericht Düsseldorf, der Ministerin Steffens diese Äußerungen im Wege einer einstweiliger Anordnung zu untersagen. Diesen Antrag lehnte das Verwaltungsgericht vorerst ab.</p>
<p>Auf die Beschwerde der Antragstellerin hat die nächste Instanz, das Oberverwaltungsgericht, mit dem eingangs erwähnten Beschluss die Entscheidung des Verwaltungsgerichts geändert und dem Antragsbegehren im Wesentlichen rechtgegeben.</p>","<p>e-njoy the electronic cigarette</p>","<p>e-njoy la cigarette éléctronique</p>","<p>e-njoy la sigaretta eletronica</p>","<p><br /><strong></strong></p>
<p><strong><br /></strong></p>
<p><strong><br /></strong></p>
<p><strong>Begründung</strong>: Mit Rücksicht auf die Berichterstattung in den Medien zur Legalität der E-Zigarette spreche Vieles dafür, dass die Äusserungen des Ministeriums wie ein Verbot wirkten. Deshalb sei die rechtliche Einschätzung der Ministerin nicht nur auf seine Vertretbarkeit zu überprüfen, vielmehr habe das Gericht eine eigene rechtliche Wertung am Massstab des Arzneimittelgesetzes vorzunehmen. Demnach seien die in der „Pressemeldung\" und in dem Erlass enthaltenen Aussagen rechtswidrig. Die E-Zigarette und ein Nikotinliquid unterfielen weder dem Arzneimittelgesetz noch dem Medizinproduktegesetz. Das Nikotin- Liquid erfülle nicht die gesetzlichen Voraussetzungen eines Arzneimittels.</p>","<p>e-njoy the electronic cigarette</p>","<p>e-njoy la cigarette éléctronique</p>","<p>e-njoy la sigaretta eletronica</p>","1","../../media_e-njoy/navi_40001/_thumbs/th_julian winzeler.jpg","","n","2","0","j","2");
INSERT INTO cms_pages VALUES ("2","14","navi_4","navi_40002","2012-02-29 00:00:00","2012-08-15 00:00:00","e-njoy, in der schwarzen Geschenkpackung","e-njoy in the black gift box","e-njoy dans la boîte cadeau noire","e-njoy in confezione regalo nera","noch_mehr_News","more_news","plus_de_nouvelles","altre_notizie","e-njoy, in der schwarzen Geschenkpackung. Producer\'s Tasting Notes. Aroma: Außergewöhnliche Balance und Tiefe. Mit 46% ist das Aroma ein verführerischer Mix von Toffee und schokoladiger Süße, Zim","e-njoy in the black gift box","e-njoy dans la boîte cadeau noire","e-njoy in confezione regalo nera","<p><strong>Charakteristik</strong>: Farbe: Wer noch Vergleichsmöglichkeiten hat, sieht im Vergleich zum alten TEN, daß der \"neue\" wesenlich heller ist.</p>
<p>Producer\'s Tasting Notes. Aroma: Außergewöhnliche Balance und Tiefe. Mit 46% ist das Aroma ein verführerischer Mix von Toffee und schokoladiger Süße, Zimtwürze und medizinischen Phenolen. Frische Citrus- und florale Noten von Weißwein sind deutlich, ebenso Melone, Birnendrops, allgemeine Sahnigkeit, ein fisches, phenolisches Aroma von Gischt, Jod und geräuchertem Fisch. Hickoryholz und Kaffee zeigen sich später, wenn die dominierenden Obernoten verklingen.<br />Geschmack: Eine anfänglich moderate und saubere Süße wird schnell abgelöst von einem Mundvoll von tiefen Torfnoten mit Tabakrauch und starkem Espresso. Diese weichen dann einer Sirupsüße und Lakritze. Das Mundgefühl ist zuerst leicht würzig und adstringierend, dann kernig, mundwässernd, voll und schließlich trocken.<br />Im Nachklang lange und rauchig. Eine rauchige Süße bleibt am Gaumen stehen, zusammen mit zerbröseltem Torf und Noten von süßem gemälzten Getreide.</p>
<p>&nbsp;</p>
<p><strong>Eine zweite Meinung</strong>: Aroma: Süßes Torf, Kohle, Karamell-Riegel, eine schwache blumig-seifige Note, Pfeffer und Chilli. Weckt Erwartungen und läßt Gutes ahnen. Geschmack: Sehr sanfter, weicher Beginn, dann kommen die Gewürze und das Torf mit einem großen Auftritt durch. Kraftvoll, aber mit balancierender Süße. Großartige Länge. Im Nachklang lange und wärmend, der Rauch und der Pfeffer halten am längsten an.</p>","<p>e-njoy in the black gift box</p>","<p>e-njoy dans la boîte cadeau noire</p>","<p>e-njoy in confezione regalo nera</p>","<p><strong>Ausbau</strong>: Offenbar vorwiegend Bourbon Casks</p>
<p><strong>Besonderheit</strong>: non chill-filtered, wahrscheinlich natural colour.</p>
<p><br /><strong>Bei der Einführung hatten wir geschrieben:</strong><br />Da ist er also, der erste neue Standard Ardbeg 10, non chill-filtered aus der Produktion von Glenmorangie. Auf den ersten Blick hat sich nicht viel geändert. Die Packung hat mehr keltische Elemente und die Rückseite ist völlig anders als bei der alten Packung. Das Vorderetikett der Flasche selbst ist verändert, das non chill-filtered nicht mehr in einem goldenen Feld sondern in Gold gedruckt. Die Kapsel schmückt das Ardbeg A und ein geschlungenes keltisches Band. In aller Bescheidenheit behauptet jede Flasche \"Ardbeg is considered by whisky connoisseurs to be not only the best of the Islay malt whiskies but the best whisky in the world\". Den Renaissance in cask strength soll es noch bis nächstes Jahr geben, dann läuft er aus. Ardbeg TEN gibt es von nun an nur noch aus der neuen Produktion. Da war er 1998 destilliert und kam 2008 in die Flasche.</p>
<p>In der Zwischenzeit ist die Ardbeg Distillery erweitert, die Kapazität erhöht worden und man kann davon ausgehen, daß er immer noch nur Ardbeg enthält, der genau 10 Jahre alt ist.</p>","<p>e-njoy in the black gift box</p>","","<p>e-njoy in confezione regalo nera</p>","2","","","n","1","0","j","1");
INSERT INTO cms_pages VALUES ("29","4","navi_4","navi_40005","0000-00-00 00:00:00","0000-00-00 00:00:00","so ein Quatsch","this is bullshit!","c\'est un quatsch!","questo est una furberia!","News_und_Mehr","news_and_more","nouvelles","notizie","","","","","","","","","","","","","1","","","n","0","0","n","2");
INSERT INTO cms_pages VALUES ("28","4","navi_4","navi_40004","0000-00-00 00:00:00","0000-00-00 00:00:00","Unterseite zu navi_4","","","","News_und_Mehr","","","","",NULL,NULL,NULL,"",NULL,NULL,NULL,"",NULL,NULL,NULL,"1","","","n","0","0","n","1");
INSERT INTO cms_pages VALUES ("30","14","navi_4","navi_40006","0000-00-00 00:00:00","0000-00-00 00:00:00","das ist eine weitere Unterseite","english Man!","ASDFADFA","ITALIANO","noch_mehr_News","more_news","plus_de_nouvelles","altre_notizie","adsf","","","","","","","","","","","","1","","","n","0","0","n","3");
INSERT INTO cms_pages VALUES ("31","16","navi_2","navi_20001","0000-00-00 00:00:00","0000-00-00 00:00:00","Unterseite zur Subnavigation von Partner","subwebsite of partners","souspages de partners","sottopagina di partner","Partner_10_de","Partner_10_en","Partner_10_fr","Partner_10_it","Unterseite zur Subnavigation von Partner,
Unterseite zur Subnavigation von Partner,
Unterseite zur Subnavigation von Partner",NULL,"",NULL,"<p>Unterseite zur Subnavigation von Partner,</p>
<p>Unterseite zur Subnavigation von Partner,</p>
<p>Unterseite zur Subnavigation von Partner</p>",NULL,"",NULL,"<p>Unterseite zur Subnavigation von Partner,</p>
<p>Unterseite zur Subnavigation von Partner,</p>
<p>Unterseite zur Subnavigation von Partner</p>
<p>&nbsp;</p>",NULL,"",NULL,"1","../../media_e-njoy/navi_20001/_thumbs/th_marion hempen.jpg","","n","2","0","j","1");



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
    kuerzel_de char(80) NOT NULL,
    kuerzel_en char(80) NOT NULL,
    kuerzel_fr char(80) NOT NULL,
    kuerzel_it char(80) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE pagid (navid, subid, pagid)
);

#
# Daten von Tabelle 'cms_redirect'
#
INSERT INTO cms_redirect VALUES ("1","13","0","0","neue_geschmacksrichtungen","new_flavors","nouvelles_saveurs","nuovi_sapori");
INSERT INTO cms_redirect VALUES ("2","13","4","0","news_und_mehr","news_and_more","nouvelles","notizie");
INSERT INTO cms_redirect VALUES ("3","13","14","0","noch_mehr_news","more_news","plus_de_nouvelles","altre_notizie");
INSERT INTO cms_redirect VALUES ("21","13","18","0","neue_geschmacksrichtungen_30","neue_geschmacksrichtungen_30","neue_geschmacksrichtungen_30","neue_geschmacksrichtungen_30");
INSERT INTO cms_redirect VALUES ("5","1","0","0","produkte","products","produits","prodotti");
INSERT INTO cms_redirect VALUES ("6","1","11","0","wie_funktioniert_enjoy","how_works_enjoy","comment_fonctionne_enjoy","come_funziona_enjoy");
INSERT INTO cms_redirect VALUES ("7","1","12","0","was_ist_der_unterschied","whats_the_difference","ce_qui_est_la_difference","qual_e_la_differenza");
INSERT INTO cms_redirect VALUES ("8","2","0","0","partner","partners","partenaires","partner");
INSERT INTO cms_redirect VALUES ("9","2","10","0","weshalb_enjoy_waehlen","why_choose_enjoy","pourquoi_choisir_enjoy","perche_scegliere_enjoy");
INSERT INTO cms_redirect VALUES ("10","2","16","0","partner_10_de","partner_10_en","partner_10_fr","partner_10_it");
INSERT INTO cms_redirect VALUES ("11","2","17","0","partner_20","partner_20","partner_20","partner_20");
INSERT INTO cms_redirect VALUES ("12","3","0","0","publikationen","publications","publications","pubblicazioni");
INSERT INTO cms_redirect VALUES ("13","6","0","0","ueber_uns","about_us","sur_nous","chi_siamo");
INSERT INTO cms_redirect VALUES ("14","5","0","0","members","members","societaires","membri");
INSERT INTO cms_redirect VALUES ("15","7","0","0","kontakt","contact","contact","contattare");
INSERT INTO cms_redirect VALUES ("16","8","0","0","jobs","jobs","endroits","offerte_di_lavoro");
INSERT INTO cms_redirect VALUES ("17","2","16","31","unterseite_zur_subnavigation_von_partner","subwebsite_of_partners","souspages_de_partners","sottopagina_di_partner");
INSERT INTO cms_redirect VALUES ("18","13","14","1","enjoy_die_elektronische_zigarette","enjoy_the_electronic_cigarette","enjoy_la_cigarette_electronique","enjoy_la_sigaretta_eletronica");
INSERT INTO cms_redirect VALUES ("19","13","14","2","enjoy_in_der_schwarzen_geschenkpackung","enjoy_in_the_black_gift_box","enjoy_dans_la_bote_cadeau_noire","enjoy_in_confezione_regalo_nera");



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
    kurztitel_de varchar(125) NOT NULL,
    kurztitel_en varchar(125) NOT NULL,
    kurztitel_fr varchar(125) NOT NULL,
    kurztitel_it varchar(125) NOT NULL,
    zusatz_de varchar(125),
    zusatz_en varchar(125),
    zusatz_fr varchar(125),
    zusatz_it varchar(125),
    inhalt1_de text NOT NULL,
    inhalt1_en text NOT NULL,
    inhalt1_fr text NOT NULL,
    inhalt1_it text NOT NULL,
    inhalt2_de text,
    inhalt2_en text,
    inhalt2_fr text,
    inhalt2_it text,
    bild1 varchar(125),
    galerie enum('n','a','b','c') DEFAULT "n" NOT NULL,
   PRIMARY KEY (seiten_id)
);

#
# Daten von Tabelle 'cms_seiten'
#
INSERT INTO cms_seiten VALUES ("1","1","1","1","0","Produkte","","Produits","Prodotti","Produkte und was es sonst noch so braucht!","","Produits et ce qu\'il est encore nécessaire","","<p>Und was ist, wenn ich hier auch noch Text eingebe?<br />Erscheint der oberhalb des Bildes?</p>
<p>und noch einen Text in Deutsch<br /> &nbsp;</p>","<p>what happens, if I write a text here</p>","<p>ici le texte français!</p>","<p>qui il testo italiano</p>","<p>Und was ist, wenn ich hier auch noch Text eingebe?<br />Erscheint der oberhalb des Bildes?</p>
<p>und noch einen Text in Deutsch</p>","<p>and what happens, if I write a text here!</p>
<p>&nbsp;</p>","<p>ici le texte français</p>
<p>dans le deuxième spalte</p>","<p>anche qui il testo italiano</p>","../../media_e-njoy/navi_1/_thumbs/th_logo-enjoy-transp.png","a");
INSERT INTO cms_seiten VALUES ("2","2","1","4","7","partner","partners","","","","","","","<p>Legende: <img src=\"http://labs.google.com/ridefinder/images/mm_20_blue.png\" alt=\"\" /> Partner mit e-njoy® an Lager, <img src=\"http://labs.google.com/ridefinder/images/mm_20_red.png\" alt=\"\" /> Partner mit Online-Shop</p>
<p>− Klicken Sie auf einen roten oder blauen Tropfen, um nähere Informationen zu erhalten.</p>
<p>− Schränken Sie das Resultat ein, indem Sie mittels Postleitzahl oder Ortsname suchen.</p>
<p>− Doppelklicken Sie auf die Karte, um den Kartenausschnitt heran zu zoomen.</p>
<p>&nbsp;</p>","<p>Legend: <img src=\"http://labs.google.com/ridefinder/images/mm_20_blue.png\" alt=\"\" /> Partner with e-njoy® on stock, <img src=\"http://labs.google.com/ridefinder/images/mm_20_red.png\" alt=\"\" /> Partner with online-shop</p>
<p>− Click on the red or blue blob to get more informations.</p>
<p>− <span id=\"result_box\" lang=\"en\"><span class=\"hps\">Limit</span> <span class=\"hps\">the result </span><span class=\"hps\">by searching</span> <span class=\"hps\">by</span> <span class=\"hps\">postcode or</span> place <span class=\"hps\">name</span></span></p>
<p>− Doubbleclick on the map to zoom in.</p>
<p>&nbsp;</p>","<p>Legend: <img src=\"http://labs.google.com/ridefinder/images/mm_20_blue.png\" alt=\"\" /> <span id=\"result_box\" lang=\"fr\"><span class=\"hps\">Partenaires</span> <span class=\"hps\">avec un stock</span></span>, <img src=\"http://labs.google.com/ridefinder/images/mm_20_red.png\" alt=\"\" /> Parteneraires <span id=\"result_box\" lang=\"fr\"><span class=\"hps\">avec</span> <span class=\"hps\">boutique en ligne</span></span></p>
<p>− <span id=\"result_box\" lang=\"fr\"><span class=\"hps\">Cliquez sur</span> <span class=\"hps\">quelques gouttes</span> <span class=\"hps\">rouges</span> <span class=\"hps\">ou bleu</span> <span class=\"hps\">afin d\'obtenir</span> <span class=\"hps\">des informations plus détaillées</span></span>.</p>
<p>− <span id=\"result_box\" lang=\"fr\"><span class=\"hps\">Limiter le résultat</span> <span class=\"hps\">en</span> <span class=\"hps\">effectuant une recherche par</span> <span class=\"hps\">code postal ou</span> <span class=\"hps\">nom de la ville</span></span>.</p>
<p>− <span id=\"result_box\" lang=\"fr\"><span class=\"hps\">Double-cliquez</span> <span class=\"hps\">sur la carte</span> <span class=\"hps\">pour zoomer sur</span> <span class=\"hps\">la carte</span> <span class=\"hps\">de l\'approche</span><span>.</span></span></p>
<p>&nbsp;</p>","<p>Legenda: <img src=\"http://labs.google.com/ridefinder/images/mm_20_blue.png\" alt=\"\" /><span id=\"result_box\" lang=\"it\"> <span class=\"hps\">Partners</span> <span class=\"hps\">con il brodo</span></span>, <img src=\"http://labs.google.com/ridefinder/images/mm_20_red.png\" alt=\"\" /> Partners <span id=\"result_box\" lang=\"it\"><span class=\"hps\">con il</span> <span class=\"hps\">negozio online</span></span></p>
<p>− <span id=\"result_box\" lang=\"it\"><span class=\"hps\">Clicca su</span> <span class=\"hps\">alcune gocce</span> <span class=\"hps\">rosse</span> <span class=\"hps\">o blu </span><span class=\"alt-edited\">per</span> <span class=\"hps\">ottenere informazioni più dettagliate</span></span>.</p>
<p>− <span id=\"result_box\" lang=\"it\"><span class=\"hps\">Limitare il risultato</span> e<span class=\"hps\">ffettuando la ricerca</span> <span class=\"hps\">per codice</span> <span class=\"hps\">postale o</span> <span class=\"hps\">il nome della città.</span></span></p>
<p>− <span id=\"result_box\" lang=\"it\"><span class=\"hps\">Doppio click</span> <span class=\"hps\">sulla mappa</span> <span class=\"hps\">per ingrandire</span> <span class=\"hps\">l\'approccio</span> <span class=\"hps\">mappa</span></span>.</p>
<p>&nbsp;</p>","<p>blablabla</p>","","","","","n");
INSERT INTO cms_seiten VALUES ("3","3","1","1","0","Publikationen","publications","publications","pubblicazioni","Interessante Links zum Thema","","","","<p><a href=\"http://www.welt.de/debatte/kommentare/article13838641/Verbot-der-E-Zigarette-Ein-unsinniges-Placebo.html\" target=\"_blank\">Verbot der E-Zigarette? - ein unsinniges Placebo!</a><a href=\"http://www.hsph.harvard.edu/centers-institutes/population-development/files/article.jphp.pdf\" target=\"_blank\"><br /></a></p>
<p><a href=\"http://www.hsph.harvard.edu/centers-institutes/population-development/files/article.jphp.pdf\" target=\"_blank\"><br /></a></p>
<p><a href=\"http://www.hsph.harvard.edu/centers-institutes/population-development/files/article.jphp.pdf\" target=\"_blank\">Electronic cigarettes as a harm reduction strategy for tobacco control: A step forward or a repeat of past mistakes? --&gt; PDF</a>&nbsp;</p>
<p>&nbsp;</p>
<h2>Bestandteile der E-Zigarette:</h2>
<p><a href=\"http://www.gelbe-liste.de/pharmindex/weiterer-bestandteil/propylenglycol/\" target=\"_blank\">Propylenglcol&nbsp;</a></p>
<p>&nbsp;</p>
<p><a href=\"http://www.gelbe-liste.de/pharmindex/weiterer-bestandteil/glycerol-85/24597/\" target=\"_blank\">Glycerol 85%</a></p>
<p><br />&nbsp;</p>","<p>Publications</p>","<p>Publications</p>","<p>pubblicazioni</p>","","<p>Publications</p>","<p>Publications</p>","<p>pubblicazioni</p>","../../media_e-njoy/navi_3/_thumbs/th_att00070.png","n");
INSERT INTO cms_seiten VALUES ("4","4","1","1","0","news and more","","","","",NULL,NULL,NULL,"","","","","",NULL,NULL,NULL,"","n");
INSERT INTO cms_seiten VALUES ("5","5","1","1","0","sociétaires","","","",NULL,NULL,NULL,NULL,"","","","",NULL,NULL,NULL,NULL,NULL,"n");
INSERT INTO cms_seiten VALUES ("6","6","1","1","0","Chi siamo","","","","",NULL,NULL,NULL,"","","","","",NULL,NULL,NULL,"../gifs/blank.gif","n");
INSERT INTO cms_seiten VALUES ("7","7","1","2","2","contattare","","","","Kontaktformular",NULL,NULL,NULL,"<p>Haben Sie uns etwas mitzuteilen?</p>
<p>Bitte füllen Sie das nebenstehende Formular aus.</p>
<p>Wir werden uns umgehend mit Ihnen in Verbindung setzen.</p>
<p>&nbsp;</p>
<p>Besten Dank für Ihre geschätze Meinung!</p>
<p>mit freundlichen Grüssen</p>
<p>Ihr e-njoy-Team</p>","","","","",NULL,NULL,NULL,"../../media_e-njoy/navi_6/_thumbs/th_nullprozent.png","n");
INSERT INTO cms_seiten VALUES ("8","8","1","1","0","Offerte di lavoro","","","","",NULL,NULL,NULL,"","","","","",NULL,NULL,NULL,"","n");
INSERT INTO cms_seiten VALUES ("10","10","1","1","0","warum e-njoy wählen?","why choose e-njoy?","pourquoi choisir e-njoy?","perché scégliere e-njoy?","",NULL,NULL,NULL,"<p><strong>e-njoy </strong>erzeugt keinen toxischen Rauch und somit auch keinen Passivrauch, sondern lediglich Wasserdampf.</p>
<p>&nbsp;</p>
<p><strong>e-njoy</strong> erfüllt die vom Bundesamt für Gesundheit (BAG) gestellten Anforderungen und wird kontinuierlich von unabhängigen, ISO-zertifizierten Labors geprüft.</p>
<p>&nbsp;</p>
<p><strong>e-njoy</strong> ist ein Produkt von hervorragender Qualität, welches, auf das Jahr gerechnet, wesentlich weniger kostet als herkömmliche Zigaretten.</p>
<p>&nbsp;</p>
<p><strong></strong>Wer sich für <strong>e-njoy </strong>entscheidet, braucht auch dort nicht auf seine Gewohnheiten zu verzichten, wo das Rauchen von Zigaretten normalierweise verboten ist.</p>
<p>&nbsp;</p>","","","","<p>%teaser1%</p>",NULL,NULL,NULL,"../gifs/blank.gif","n");
INSERT INTO cms_seiten VALUES ("11","11","1","2","0","come funziona e-njoy?","how works e-njoy?","","","",NULL,NULL,NULL,"<p>Eine Hochleistungs-Lithiumbatterie versorgt den Leuchtindikator sowie die elektronische Steuerung der Zigarette mit elektrischer Energie, welche ihrerseits verschiedene Befehle aussendet. In einem aus Nickel bestehenden Zerstäuber werden mikroskopisch kleine Aerosolpartikel erzeugt, aus denen schliesslich eine Qualmwolke entsteht.</p>
<p>&nbsp;</p>
<p>Wenn der Dampf nach einer gewissen Zeit nachlässt, muss der Filter ausgewechselt werden, Ein Filter entspricht dem Genuss von ca. 8-10 Zigaretten.</p>","","","","",NULL,NULL,NULL,"../../media_e-njoy/navi_1_20/_thumbs/th_att00023.png","n");
INSERT INTO cms_seiten VALUES ("12","12","1","1","0","what\'s the difference?","","","","",NULL,NULL,NULL,"<p><strong>e-njoy</strong> ist eine elektronische Zigarette, bestehende aus einem Akku, eine Zerstäuber und einem Filter <strong>ohne Nikotin</strong>, mit welcher das Rauchen von herkömmlichen Zigaretten simuliert werden kann, ohne eine Verbrennung zu erzeugen. Die <strong>e-njoy</strong> Ersatzfilter enthalten eine Flüssigkeit, die sich aus Glycerin, Propylenglykol (beides höufig verwendete Lebensmittelzusatzstoffe) und Aroma zusammensetzt. Es gibt sie in verschiedenen Geschmacksrichtungen.</p>
<p>&nbsp;</p>
<p>Mit <strong>e-njoy</strong> wird kein Tabak geraucht, dei die eigene Gesundheit oder die Gesundheit anderer schädigen könnte. Der Körper bleibt von Nikotin und Teer sowie rund 4000 weiteren chemischen Verbindungen einer herkömmlichen Zigaretten verschont. Dies ist zweifellos der wichtigste Aspekt, aufgrund dessen sich <strong>e-njoy</strong> als sinnvolle Alternative für Raucher anbietet, die nicht auf den Zigarettengenuss verzichten wollen.</p>","","","","",NULL,NULL,NULL,"../../media_e-njoy/navi_1_30/_thumbs/th_att00038.png","n");
INSERT INTO cms_seiten VALUES ("13","13","1","1","0","neue Geschmacksrichtungen","","","","",NULL,NULL,NULL,"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.</p>
<p>&nbsp;</p>
<p>Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus.</p>","","","","<p>neue Geschmacksrichtungen</p>",NULL,NULL,NULL,"../../media_e-njoy/navi_4_10/_thumbs/th_att00044.png","b");
INSERT INTO cms_seiten VALUES ("14","14","1","3","1","altre notizie","","","","",NULL,NULL,NULL,"<p>hallo</p>","","","","",NULL,NULL,NULL,"","n");
INSERT INTO cms_seiten VALUES ("16","16","1","3","1","Partner_10_de","Partner_10_en","Partner_10_fr","Partner_10_it","partner zusatztext deutsch","partner zusatztext englisch","partner zusatztext","partner zusatztext","<p>deutscher Text und deutscher Text</p>
<p>und nochmals deutscher Text</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>%teaser1%</p>","<p>english Text</p>","<p>text français c\'est la vie!</p>
<p>la vie en rose!</p>
<p>&nbsp;</p>
<p>%teaser1%</p>","<p>testo italiano</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>%teaser1%</p>","<p>deutscher Text 2</p>
<p>&nbsp;</p>
<p>hallo halli !</p>","<p>englisch Text 2</p>","<p>c\'est la vie!</p>","<p>testo italiano 2</p>","","n");
INSERT INTO cms_seiten VALUES ("17","17","1","4","7","Filialsuche","Partner_20","Partner_20","Partner_20","",NULL,"","","<p>DAs ist die Seite 2 der Partnerseiten</p>","","","","",NULL,"","","../../media_e-njoy/navi_2_20/_thumbs/th_martina winzeler.jpg","b");
INSERT INTO cms_seiten VALUES ("18","18","1","1","0","Neue_Geschmacksrichtungen_30","Neue_Geschmacksrichtungen_30","Neue_Geschmacksrichtungen_30","Neue_Geschmacksrichtungen_30",NULL,NULL,NULL,NULL,"","","","",NULL,NULL,NULL,NULL,NULL,"n");



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
INSERT INTO cms_spezial VALUES ("e-njoy","LANG1","DE","de","deutsch");
INSERT INTO cms_spezial VALUES ("e-njoy","LANG2","FR","fr","français");
INSERT INTO cms_spezial VALUES ("e-njoy","LANG3","IT","it","italiano");
INSERT INTO cms_spezial VALUES ("e-njoy","LANG4","EN","en","englisch");
INSERT INTO cms_spezial VALUES ("e-njoy","M1","120","120",NULL);
INSERT INTO cms_spezial VALUES ("e-njoy","M2","400","400",NULL);



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
INSERT INTO cms_templates VALUES ("4","1","zweispaltig_400b_400t_tpl.html","zweispaltig_400_400_tpl.html - 1. Spalte Bild, 2. Spalte Text","400x400");
INSERT INTO cms_templates VALUES ("7","3","einspaltig_760v_tpl.html","einspaltig_760v_tpl.html - 1. Spalte Text, 2. Spalte Thumbnails","100x100");
INSERT INTO cms_templates VALUES ("10","4","einspaltig_900_nur_text_tpl.html","einspaltig_900_nur_text_tpl.html - Einspaltig, nur Text, 900 Pixel breit","");
INSERT INTO cms_templates VALUES ("12","2","zweispaltig_400t_400b_tpl.html","zweispaltig_400_400_tpl.html - 1. Spalte Text, 2. Spalte Bild","400x400");



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
   KEY username (username),
   KEY username_2 (username)
);

#
# Daten von Tabelle 'cms_users'
#
INSERT INTO cms_users VALUES ("1","hempen","e9911456f39b5e6d738669ac8d438b20","NUFAMKLBD");
INSERT INTO cms_users VALUES ("2","webprog10","a3e6096dbe9169213e7880821129428e","NUBD");


