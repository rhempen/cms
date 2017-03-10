#----------------------------------------------
# Backup der Datenbank cms_feednsmile
# Erstellt am 10.11.2011 20:32
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
INSERT INTO cms_config VALUES ("1","general","THEME","feednsmile",NULL,NULL);
INSERT INTO cms_config VALUES ("2","general","COPYRIGHT","feednsmile.ch 2011",NULL,NULL);
INSERT INTO cms_config VALUES ("3","general","MAX_THUMBS","12",NULL,NULL);
INSERT INTO cms_config VALUES ("4","general","MAX_LIST_ITEMS","3",NULL,NULL);
INSERT INTO cms_config VALUES ("5","general","LANGUAGE","DE",NULL,NULL);
INSERT INTO cms_config VALUES ("10","menu","HMENU_RICHTUNG","right","left",NULL);
INSERT INTO cms_config VALUES ("11","menu","HMENU_SUBMENU","submenu","dropdown",NULL);
INSERT INTO cms_config VALUES ("20","pictures","THUMB_PAGE_MAX_WIDTH","130",NULL,NULL);
INSERT INTO cms_config VALUES ("21","pictures","THUMB_PAGE_MAX_HEIGHT","130",NULL,NULL);
INSERT INTO cms_config VALUES ("22","pictures","THUMB_NAVI_MAX_WIDTH","300",NULL,NULL);
INSERT INTO cms_config VALUES ("23","pictures","THUMB_NAVI_MAX_HEIGHT","300",NULL,NULL);
INSERT INTO cms_config VALUES ("24","pictures","IMAGE_MAX_WIDTH","640",NULL,NULL);
INSERT INTO cms_config VALUES ("25","pictures","IMAGE_MAX_HEIGHT","640",NULL,NULL);
INSERT INTO cms_config VALUES ("14","menu","SMURL","ja","nein",NULL);
INSERT INTO cms_config VALUES ("13","menu","SUBNAV_SOFORT","nein","ja",NULL);
INSERT INTO cms_config VALUES ("6","general","CMS_ROOT","/",NULL,NULL);
INSERT INTO cms_config VALUES ("15","menu","SMURL_REFRESH","ausf&uuml;hren","",NULL);
INSERT INTO cms_config VALUES ("12","menu","SUBMENU_DIR","vertikal","horizontal",NULL);
INSERT INTO cms_config VALUES ("8","general","EMAIL_RECEIVER","info@feednsmile.ch",NULL,NULL);
INSERT INTO cms_config VALUES ("32","meta-tags","KEYWORDS","",NULL,"Catering, Events, Kochen, Kochtipps, Rezepte, Suppen, Fleischgerichte, Winterthur");
INSERT INTO cms_config VALUES ("33","meta-tags","DESCRIPTION","",NULL,"feed \'n\' smile ist ein kleiner Cateringbetrieb, entstanden aus der Freude am Kochen einerseits und langjähriger Erfahrung in der Gastronomie andererseits.");
INSERT INTO cms_config VALUES ("34","meta-tags","PAGE_TOPIC","",NULL,"Catering, Events, Kochen, Kochtipps");
INSERT INTO cms_config VALUES ("35","meta-tags","PUBLISHER","",NULL,"www.hempenweb.ch");
INSERT INTO cms_config VALUES ("26","pictures","DISK_DB_ADJUSTMENT","ausf&uuml;hren",NULL,NULL);
INSERT INTO cms_config VALUES ("7","general","TEMPLATE_DIR","frontend/themes/feednsmile/tpl","",NULL);
INSERT INTO cms_config VALUES ("36","meta-tags","GOOGLE_VERIFY","val",NULL," ");
INSERT INTO cms_config VALUES ("31","meta-tags","AUTHOR","Suzanna Vis",NULL,NULL);
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
INSERT INTO cms_fragmente VALUES ("6","teaser1","1","<div class=\"teasertext\">
<h2 class=\"teasertitle\">Kochtipps </h2>
<p class=\"teasertext\">haben Sie Lust auf ein feines, selbstgekochtes Menu und wissen nicht, was es denn sein soll. Schauen Sie siche einfach mal in unserer Rubrik \"Rezepte\" um. Bestimmt ist etwas dabei, was Sie kochen möchten.</p>
<p class=\"teasertext\">&gt;&gt; <a title=\"Rezepte\" href=\"/rezepte\" target=\"_self\">Rezepte</a></p>
</div>");
INSERT INTO cms_fragmente VALUES ("7","teaser2","2","<div class=\"teasertext\">
<p><strong><span style=\"text-decoration: underline;\">Serviertipp:<br /></span></strong><br />diese Sauce eignet sich nicht<br />nur als Pastasauce, sondern<br />schmeckt auch mit Kartoffelwedges<br />aus dem Ofen gut.<br /><br /></p>
</div>");
INSERT INTO cms_fragmente VALUES ("9","teaser4","4","<div class=\"teasertext\">
<h2>Kochtipp:</h2>
<p>Die Suppe mit Süsskartoffeln statt Kürbis zubereiten.<br /><br /></p>
</div>");
INSERT INTO cms_fragmente VALUES ("8","teaser3","3","<p>
<div class=\"teasertext\"><br /><img src=\"/media_feednsmile/navi_0100001/_images/holl_erbsensuppe.jpg\" alt=\"Holländische Erbsensuppe\" width=\"259\" height=\"194\" /></div>
</p>");



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
INSERT INTO cms_galerien VALUES ("639","8","3","N","../../media_feednsmile/navi_008/_images/dsc08100.jpg","");
INSERT INTO cms_galerien VALUES ("638","8","1","N","../../media_feednsmile/navi_008/_images/dsc08083.jpg","Tomaten-Mozzarella-Stern");
INSERT INTO cms_galerien VALUES ("640","8","2","N","../../media_feednsmile/navi_008/_images/dsc08094.jpg","");
INSERT INTO cms_galerien VALUES ("641","8","4","N","../../media_feednsmile/navi_008/_images/dsc08102.jpg","");
INSERT INTO cms_galerien VALUES ("642","8","5","N","../../media_feednsmile/navi_008/_images/dsc08096.jpg","Datteln gefüllt mit Meerrettichfrischkäse und Zimt");
INSERT INTO cms_galerien VALUES ("643","8","6","N","../../media_feednsmile/navi_008/_images/dsc08108.jpg","");
INSERT INTO cms_galerien VALUES ("644","8","7","N","../../media_feednsmile/navi_008/_images/dsc08097.jpg","");
INSERT INTO cms_galerien VALUES ("645","8","8","N","../../media_feednsmile/navi_008/_images/dsc08114.jpg","");
INSERT INTO cms_galerien VALUES ("646","8","9","N","../../media_feednsmile/navi_008/_images/dsc08098.jpg","");
INSERT INTO cms_galerien VALUES ("675","1","1","N","../../media_feednsmile/navi_001/_images/rueeblisuppe.jpg","Rüeblisuppe");
INSERT INTO cms_galerien VALUES ("648","8","11","N","../../media_feednsmile/navi_008/_images/dsc08126.jpg","gefüllte Käsescheiben auf Sprossensalat");
INSERT INTO cms_galerien VALUES ("649","8","10","N","../../media_feednsmile/navi_008/_images/dsc08128.jpg","gefüllte Mostbrökli auf Sprossensalat");
INSERT INTO cms_galerien VALUES ("662","8","13","N","../../media_feednsmile/navi_008/_images/image002.jpg","Meterbaguette assortiert");
INSERT INTO cms_galerien VALUES ("661","8","12","N","../../media_feednsmile/navi_008/_images/image001.jpg","gemischte Apéroplatte");
INSERT INTO cms_galerien VALUES ("660","140","2","P","../../media_feednsmile/navi_0090001/_images/image001.jpg","");
INSERT INTO cms_galerien VALUES ("659","140","1","P","../../media_feednsmile/navi_0090001/_images/stars.jpg","");
INSERT INTO cms_galerien VALUES ("663","8","14","N","../../media_feednsmile/navi_008/_images/image003.jpg","Meterbaguette assortiert");
INSERT INTO cms_galerien VALUES ("664","8","15","N","../../media_feednsmile/navi_008/_images/image004.jpg","Aprikosen Tiramisu");
INSERT INTO cms_galerien VALUES ("667","8","16","N","../../media_feednsmile/navi_008/_images/image010.jpg","mit Meerrettichschaum gefüllte Medjoldatteln");
INSERT INTO cms_galerien VALUES ("665","3","2","N","../../media_feednsmile/navi_003/_images/guetzli_k.jpg","öäü");
INSERT INTO cms_galerien VALUES ("666","3","3","N","../../media_feednsmile/navi_003/_images/erbsensuppe.jpg","");
INSERT INTO cms_galerien VALUES ("668","8","17","N","../../media_feednsmile/navi_008/_images/image015.jpg","garnierte Fleischplatte");
INSERT INTO cms_galerien VALUES ("669","8","18","N","../../media_feednsmile/navi_008/_images/image005.jpg","mit Frischkäse und Rucola gefüllte Mostbröckli");
INSERT INTO cms_galerien VALUES ("670","8","19","N","../../media_feednsmile/navi_008/_images/image009.jpg","Pumpernickel mit Frischkäse und Forellenfilet");
INSERT INTO cms_galerien VALUES ("671","8","20","N","../../media_feednsmile/navi_008/_images/image020.jpg","Lachsmousse auf blanchierten Zucchettischeiben");
INSERT INTO cms_galerien VALUES ("672","11","1","N","../../media_feednsmile/navi_010_10/_images/erbsensuppe.jpg","");
INSERT INTO cms_galerien VALUES ("673","3","4","N","../../media_feednsmile/navi_003/_images/image035.jpg","");
INSERT INTO cms_galerien VALUES ("684","142","1","P","../../media_feednsmile/navi_0100001/_images/holl_erbsensuppe.jpg","");
INSERT INTO cms_galerien VALUES ("685","144","1","P","../../media_feednsmile/navi_0100003/_images/baerlauch_2.jpg","");
INSERT INTO cms_galerien VALUES ("686","144","2","P","../../media_feednsmile/navi_0100003/_images/baerlauch_1.jpg","");
INSERT INTO cms_galerien VALUES ("689","148","1","P","../../media_feednsmile/navi_0100004/_images/image003.jpg","");
INSERT INTO cms_galerien VALUES ("690","150","1","P","../../media_feednsmile/navi_0100006/_images/image001.jpg","");
INSERT INTO cms_galerien VALUES ("691","1","2","N","../../media_feednsmile/navi_001/_images/vivane&michael-hochzeit-210.jpg","");
INSERT INTO cms_galerien VALUES ("692","3","5","N","../../media_feednsmile/navi_003/_images/erbsensuppe_300_300.jpg","");
INSERT INTO cms_galerien VALUES ("693","3","6","N","../../media_feednsmile/navi_003/_images/suzannavis.jpg","");
INSERT INTO cms_galerien VALUES ("694","3","7","N","../../media_feednsmile/navi_003/_images/suzannavis_300_300.jpg","");



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
INSERT INTO cms_modules VALUES ("3","READ_TOP_NEWS","Auflisten aktuellste News");
INSERT INTO cms_modules VALUES ("2","KONTAKTFORMULAR","Kontaktformular");
INSERT INTO cms_modules VALUES ("1","PAGES_OVERVIEW","Unterseiten zur aktuellen Menuposition auflisten");
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
INSERT INTO cms_navigation VALUES ("1","navi_001","1","0","Home","Home","navi_001","j","n","H");
INSERT INTO cms_navigation VALUES ("2","navi_002","2","0","Angebot","Angebot","navi_002","j","n","V");
INSERT INTO cms_navigation VALUES ("3","navi_003","4","0","über uns","überuns","navi_003","j","n","H");
INSERT INTO cms_navigation VALUES ("4","navi_004","5","0","Impressum","Impressum","navi_004","j","n","H");
INSERT INTO cms_navigation VALUES ("5","navi_005","6","0","AGB","AGB","navi_005","j","n","H");
INSERT INTO cms_navigation VALUES ("6","navi_006","3","0","Preisliste","Preisliste","navi_006","j","n","V");
INSERT INTO cms_navigation VALUES ("7","navi_007","7","0","Vorlage","Vorlage","navi_007","n","n","H");
INSERT INTO cms_navigation VALUES ("11","navi_010","10","10","im Winter","imWinter","navi_010_10","j","n","");
INSERT INTO cms_navigation VALUES ("8","navi_008","8","0","Bilder","Bilder","navi_008","j","n","V");
INSERT INTO cms_navigation VALUES ("9","navi_009","9","0","News","News","navi_009","n","n","V");
INSERT INTO cms_navigation VALUES ("10","navi_010","10","0","Rezepte","Rezepte","navi_010","j","n","V");
INSERT INTO cms_navigation VALUES ("13","navi_010","10","30","im Sommer","imSommer","navi_010_30","j","n","");
INSERT INTO cms_navigation VALUES ("12","navi_010","10","20","im Frühling","imFrühling","navi_010_20","j","n","");
INSERT INTO cms_navigation VALUES ("14","navi_010","10","40","im Herbst","imHerbst","navi_010_40","n","n","");
INSERT INTO cms_navigation VALUES ("15","navi_010","10","50","Rezepte_50","rezepte_50","navi_010_50","n","n","");



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
INSERT INTO cms_pages VALUES ("140","9","navi_009","navi_0090001","happy new year","News","2010-12-11 00:00:00","2011-01-15 00:00:00","das feed \'n\' smile Team wünscht allen eine schöne Weihnachtszeit und viel Glück im neuen Jahr!!","","","1","../../media_feednsmile/navi_0090001/_thumbs/th_image001.jpg","../../media_feednsmile/navi_0090001/_thumbs/th_stars.jpg","b","0","0","n","1");
INSERT INTO cms_pages VALUES ("141","7","navi_007","navi_0070001","Vorlage Unterseite","Vorlage","2011-01-21 00:00:00","9999-12-31 00:00:00","Vorlage für eine Unterseite","","","1","","","n","0","0","n","1");
INSERT INTO cms_pages VALUES ("142","11","navi_010","navi_0100001","Holländische Erbsensuppe","im_Winter","0000-00-00 00:00:00","0000-00-00 00:00:00","Im Winter ist eine Erbsenuppe einfach etwas Gutes!","<p>Zutaten:<br />500 g getrocknete Erbsen<br />500 g Schweinskoteletten<br />250 g Speckwürfel<br />1 Zwiebel<br />1 Stange Lauch<br />1 kleine Knollensellerie<br />1 grosse Karotte<br />1 grosse Kartoffel<br />3 Liter Bouillon<br />Salz, Pfeffer, weitere Gewürze nach Bedarf<br /><br />Zubereitung:<br />Die Erbsen mit Bouillon, Koteletten, Speckwürfeln aufkochen, <br />ca. 45 Minuten köcheln lassen.<br />Das Gemüse in kleine Stücke schneiden (Kartoffeln, Sellerie, Zwiebeln&nbsp;und Karotten schälen)<br />und zufügen. Nochmals 45 Minuten köcheln lassen.<br />Die&nbsp;Koteletten herausnehmen, das Fleisch in kleine Stücke schneiden und wieder beifügen.<br />Die Suppe mit Salz, Pfeffer und weiteren Gewürzen abschmecken. <br />Evtl. mit gehacktem Peterli oder Koriander bestreuen.<br />Nach Bedarf Würstchen in die Suppe geben.<br /><br />Servieren mit dunklem Brot</p>","","2","../../media_feednsmile/navi_0100001/_thumbs/th_holl_erbsensuppe.jpg","","n","0","0","j","1");
INSERT INTO cms_pages VALUES ("144","12","navi_010","navi_0100003","Bärlauchsauce mit getrockneten Tomaten und Frischkäse","im_Frühling","0000-00-00 00:00:00","0000-00-00 00:00:00","Frühling ist auch Bärlauchzeit!","<p>Zutaten:<br />150 g Bärlauch (frisch gepflückt)<br />100 g getrocknete Tomaten<br />250 g Kräuterfrischkäse<br />250 ml&nbsp; Halbrahm<br />Zitronenpfeffer, Salz, Thymian, Muskatnuss<br />Olivenöl<br /><br />Zubereitung:<br />Die Bärlauchblätter gut waschen, trocken schleudern<br />und in Streifen schneiden.<br />Die Tomaten in schmale Streifen schneiden.<br />Wenig Olivenöl erhitzen, Bärlauch, Tomaten und&nbsp;<br />einen halben TL Thymianblättchen&nbsp;zugeben, <br />kurz dünsten. Halbrahm dazu giessen.<br />Die Kräuterfrischkäse beigeben und langsam schmelzen. <br />(nicht kochen)<br />Mit Zitronenpfeffer, Salz und Muskatnuss abschmecken.<br /><br /><br /></p>","<p>%teaser2%</p>","2","../../media_feednsmile/navi_0100003/_thumbs/th_baerlauch_1.jpg","","n","0","0","j","1");
INSERT INTO cms_pages VALUES ("149","12","navi_010","navi_0100005","aaa","im_Frühling","0000-00-00 00:00:00","0000-00-00 00:00:00","bbbb","","","1","","","n","0","0","n","2");
INSERT INTO cms_pages VALUES ("148","13","navi_010","navi_0100004","Kartoffelwedges hausgemacht","im_Sommer","2011-06-27 00:00:00","2020-01-01 00:00:00","Kartoffelwedges sind die schnell gemachte Beilage zu Fleisch vom Grill oder zu einem feinen Sommer-Mischsalat.","<p>Zutaten:<br />eine beliebige Menge Kartoffeln (festkochend)<br />Olivenöl<br />Kräuter<br />Gewürze<br />Salz<br /><br />Zubereitung:<br />Die Kartoffeln waschen (nicht schälen!) und in \"wedges\" (wie dicke Apfelschnitze) schneiden.<br />Sofort mit Olivenöl (sparsam), Salz und Kräutern/Gewürzen (nach Wunsch; zB. Rosmarin, Paprika, Curry, Gewürzmischungen) mischen. Am besten geht das in einem Plastiksack. Die Kartoffelschnitze im zugeknüptem Sack solange \"herumwirbeln\" bis sie mit �?l und Gewürze überzogen sind.<br />Nun das Ganze auf einem Backblech geben und im vorgeheizten Ofen bei 200°, 30-40 Minuten backen.</p>","","2","../../media_feednsmile/navi_0100004/_thumbs/th_image003.jpg","","n","0","0","j","1");
INSERT INTO cms_pages VALUES ("150","11","navi_010","navi_0100006","Asiatische Kürbissuppe","im_Winter","0000-00-00 00:00:00","0000-00-00 00:00:00","Die vielseitige Kürbissuppe raffiniert gewürzt: mit Currypaste und Kokosmilch.","<p>Zutaten:<br />500 g Kürbisfleisch (Muskat)<br />1 kleine Zwiebel<br />1 mittelgrosse Kartoffel (mehlig kochend)<br />ca 4cm Ingwer<br />400 ml Kokosmilch<br />2 TL rote Currypaste<br />400 ml Bouillon<br />2 EL Kürbiskernen, gehackt<br />Kokosrahm<br /><br />Zubereitung:<br />Kürbis schälen, entkernen und würfeln.<br />Kartoffel schälen und würfeln.<br />Zwiebel und Ingwer schälen und fein hacken.<br />Von der Kokosmilch etwas dicken Rahm abnehmen und beiseite stellen.<br />Zwiebel, Ingwer und Currypaste in wenig �?l dünsten, Kartoffel und Kürbis beigeben und mitdünsten.<br />Kokosmilch und Bouillon dazu geben, ca. 20 Minuten köcheln lassen.<br />Anschliessend pürieren und abschmecken.<br />Zum servieren die Suppe mit Kokosrahm und Kürbiskernen garnieren.</p>","<p>%teaser4%</p>","2","../../media_feednsmile/navi_0100006/_thumbs/th_image001.jpg","","n","0","0","j","2");
INSERT INTO cms_pages VALUES ("151","13","navi_010","navi_0100007","Sommer Wrap","im_Sommer","0000-00-00 00:00:00","0000-00-00 00:00:00","Für den kleinen Hunger: eine Weizentortilla gefüllt nach Lust und Laune.","<p>Zutaten:<br />Weizentortillas<br />1 reife Avocado<br />1 Tomate<br />1 kleine Zwiebel<br />1 Knoblauchzehe<br />1EL gehackte Koriander<br />1 TL süsse Chilisauce<br />Salz<br /><br />Nach Bedarf: <br />Käsewürfel, fein geschnittenes Gemüse, gebratenes Fleisch,<br />Schinken- oder Tofuwürfel<br /><br />Zubereitung:<br />Avocados halbieren, Fruchtfleisch herauslösen, mit einer Gabel zerdrücken.<br />Tomate, Zwiebel und Knoblauch fein würfeln, mit dem Koriander untermischen. Mit Chilisauce<br />und Salz abschmecken.<br /><br />Eine Tortilla mit Avocadopüree bestreichen und mit weiteren Zutaten nach Wunsch bedecken.<br />Die Tortilla auf einer Seite einschlagen und quer zusammenrollen.<br />Kalt oder lauwarm servieren.</p>","","2","","","n","0","0","j","2");



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
INSERT INTO cms_redirect VALUES ("1","1","0","0","home");
INSERT INTO cms_redirect VALUES ("2","2","0","0","angebot");
INSERT INTO cms_redirect VALUES ("3","6","0","0","preisliste");
INSERT INTO cms_redirect VALUES ("4","3","0","0","ueber_uns");
INSERT INTO cms_redirect VALUES ("5","4","0","0","impressum");
INSERT INTO cms_redirect VALUES ("6","5","0","0","agb");
INSERT INTO cms_redirect VALUES ("7","7","0","0","vorlage");
INSERT INTO cms_redirect VALUES ("8","8","0","0","bilder");
INSERT INTO cms_redirect VALUES ("9","9","0","0","news");
INSERT INTO cms_redirect VALUES ("10","10","0","0","rezepte");
INSERT INTO cms_redirect VALUES ("11","10","11","0","im_winter");
INSERT INTO cms_redirect VALUES ("12","10","12","0","im_fruehling");
INSERT INTO cms_redirect VALUES ("13","10","13","0","im_sommer");
INSERT INTO cms_redirect VALUES ("14","10","14","0","im_herbst");
INSERT INTO cms_redirect VALUES ("15","10","11","142","hollaendische_erbsensuppe");
INSERT INTO cms_redirect VALUES ("16","10","12","144","baerlauchsauce_mit_getrockneten_tomaten_und_frischkaese");
INSERT INTO cms_redirect VALUES ("17","10","13","148","kartoffelwedges_hausgemacht");
INSERT INTO cms_redirect VALUES ("18","10","11","150","asiatische_kuerbissuppe");
INSERT INTO cms_redirect VALUES ("19","10","13","151","sommer_wrap");
INSERT INTO cms_redirect VALUES ("20","10","15","0","rezepte_50");



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
    inhalt2 text,
    bild1 varchar(125),
    galerie enum('n','a','b','c') DEFAULT "a" NOT NULL,
   PRIMARY KEY (seiten_id)
);

#
# Daten von Tabelle 'cms_seiten'
#
INSERT INTO cms_seiten VALUES ("1","1","1","Home","","2","0","<p class=\"intro\">Willkommen beim Internetauftritt von \"feed \'n\' smile catering\"</p>
<p class=\"intro\">Wir freuen uns über Ihren Besuch!</p>
<p>&nbsp;</p>
<p>Wenn Sie Interesse an unserem Catering-Angebot haben, <br />melden Sie sich bitte über Email-Adresse <a title=\"Mail an Feed \'n\' Smile\" href=\"mailto:info@feednsmile.ch\">info@feednsmile.ch</a> </p>
<p>&nbsp;</p>
<p class=\"intro\">Ihr feed \'n\' smile - Team</p>","","../gifs/blank.gif","n");
INSERT INTO cms_seiten VALUES ("2","2","1","Angebot","","2","0","<p>Einfache Snacks oder exotisches Buffet</p>
<p>&nbsp;</p>
<p>Käse/Fleischplatten, Suppe oder Fingerfood</p>
<p>Salatbuffet oder feine Dessertauswahl</p>
<p>&nbsp;</p>
<p>In unserer Preisliste finden Sie einige Vorschläge.</p>
<p>Lassen Sie sich inspirieren und nehmen Sie Kontakt mit uns auf.</p>
<p>&nbsp;</p>
<p>Gerne stellen wir ein individuelles Angebot für Sie zusammen.<br /><br />Wollen Sie ihr Fest in vollen Zügen geniessen, übernehmen wir auch die Buffetbetreuung vor Ort.<br /><br />Gekocht und angerichtet wird in den Räumen des Jugendkafis <a title=\"Webseite von stadtmuur\" href=\"http://www.stadtmuur.ch\" target=\"_blank\">stadtmuur</a> in der Altstadt von Winterthur.<br /><br /></p>","","../gifs/blank.gif","n");
INSERT INTO cms_seiten VALUES ("3","3","1","über uns","","2","0","<p><strong>feed \'n\' smile</strong> ist ein kleiner Cateringbetrieb, entstanden aus der Freude am Kochen einerseits und langjähriger Erfahrung in der Gastronomie andererseits.<br /><br /><strong>feed</strong>&nbsp;&nbsp; = Nahrung zu sich nehmen<br /><strong>smile</strong>&nbsp;= Lächeln <br /><br />das heisst: wir möchten, dass unsere Häppchen, Gerichte und Getränke bei Ihnen zum Lächeln führen.<br /><br /><strong>Kochen</strong> ist etwas <strong>Schönes</strong><br /><strong>Essen</strong> ist etwas <strong>Schönes</strong><br />Menschen damit eine <strong>Freude bereiten</strong> ist etwas <strong>Schönes</strong><br /><br />Essen und geniessen Sie mit einem Catering von <strong>feed \'n\' smile</strong> <br />Kontakt: <a href=\"mailto:info@feednsmile.ch?subject=Anfrage\">info@feednsmile.ch</a><br /><br /></p>","","../../media_feednsmile/navi_003/_thumbs/th_suzannavis.jpg","n");
INSERT INTO cms_seiten VALUES ("4","4","1","Impressum","","4","0","<h3><strong>Betreiberin der Website</strong></h3>
<p>feednsmile.ch Catering, Winterthur<br />Suzan Vis</p>
<p><a href=\"mailto:info@feednsmile.ch\">info@feednsmile.ch</a></p>
<p>&nbsp;</p>
<h3><strong>Haftungsausschluss</strong></h3>
<p>Der Inhalt dieser Webseiten wird mit grösstmöglicher Sorgfalt gepflegt. Trotzdem wird für den Inhalt keine Haftung übernommen. Druckfehler, Irrtümer und �?nderungen vorbehalten. Der Inhalt ist urheberrechtlich geschützt.&nbsp;Das gilt sowohl für die Texte, als auch für die Bilder, welche allesamt selber hergestellt wurden.<br />Für die Inhalte externer Links übernehmen wir keine Haftung. Für den Inhalt der verlinkten Seiten sind ausschliesslich deren Betreiber verantwortlich.</p>
<p>&nbsp;</p>
<h3><strong>WebDesign &amp; Programmierung</strong></h3>
<p>Roland Hempen, Zürich <br /><a title=\"hempenweb - die kleine feine Internetagentur\" href=\"http://www.hempenweb.ch/\" target=\"_blank\">www.hempenweb.ch</a></p>","","","n");
INSERT INTO cms_seiten VALUES ("6","6","1","Preisliste","","6","0","<table style=\"width: 560px;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">
<tbody>
<tr class=\"even\">
<td width=\"60%\" valign=\"top\">
<p>Fleischplatte garniert (80 g Fleisch pro Person)</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>Pro Person</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">&nbsp;&nbsp; 11.-</p>
</td>
</tr>
<tr class=\"odd\">
<td width=\"60%\" valign=\"top\">
<p>Käseplatte garniert (80 g Käse pro Person)</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>Pro Person</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">11.-</p>
</td>
</tr>
<tr class=\"even\">
<td width=\"60%\" valign=\"top\">
<p>Fischplatte (80 g Fisch pro Person)</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>Pro&nbsp;Person</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">13.-</p>
</td>
</tr>
<tr class=\"odd\">
<td width=\"60%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">&nbsp;</p>
</td>
</tr>
<tr class=\"even\">
<td width=\"60%\" valign=\"top\">
<p>Brot</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>Kg</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">7.-</p>
</td>
</tr>
<tr class=\"odd\">
<td width=\"60%\" valign=\"top\">
<p>Brot Spezial</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>Kg</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">10.-</p>
</td>
</tr>
<tr class=\"even\">
<td width=\"60%\" valign=\"top\">
<p>Brötchen</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>Kg</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">15.-</p>
</td>
</tr>
<tr class=\"odd\">
<td width=\"60%\" valign=\"top\">
<p>Focaccia</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>ca 1.5 kg</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">20.-</p>
</td>
</tr>
<tr class=\"even\">
<td width=\"60%\" valign=\"top\">
<p>Focaccia gefüllt</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>Kg (ca.30 Würfel)</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">40.-</p>
</td>
</tr>
<tr class=\"odd\">
<td width=\"60%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">&nbsp;</p>
</td>
</tr>
<tr class=\"even\">
<td width=\"60%\" valign=\"top\">
<p>Gemüse mit Dip</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>kg + 300g</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">38.-</p>
</td>
</tr>
<tr class=\"odd\">
<td width=\"60%\" valign=\"top\">
<p>Gemüsespiessli</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">2.-</p>
</td>
</tr>
<tr class=\"even\">
<td width=\"60%\" valign=\"top\">
<p>Gemüse-Igel (30 Spiessli klein gesteckt)&nbsp; </p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">35.-</p>
</td>
</tr>
<tr class=\"odd\">
<td width=\"60%\" valign=\"top\">
<p>Gurkenschiffli</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>Portion (3 Stk)</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">1.50</p>
</td>
</tr>
<tr class=\"even\">
<td width=\"60%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">&nbsp;</p>
</td>
</tr>
<tr class=\"odd\">
<td width=\"60%\" valign=\"top\">
<p>Fleischbällchen mit Sauce</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>Portion (3 Stk)</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">4.50</p>
</td>
</tr>
<tr class=\"even\">
<td width=\"60%\" valign=\"top\">
<p>Bündnerfleischröllchen (mit Ruccola, Mango) </p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">2.50</p>
</td>
</tr>
<tr class=\"odd\">
<td width=\"60%\" valign=\"top\">
<p>Früchtewürfel mit Rohschinken (Melone, Ananas)</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">2.50</p>
</td>
</tr>
<tr class=\"even\">
<td width=\"60%\" valign=\"top\">
<p>Teigtaschen Fleisch/Vegi </p>
</td>
<td width=\"30%\" valign=\"top\">
<p>mini&nbsp;/ maxi&nbsp;&nbsp; </p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">1.50 / 2.50</p>
</td>
</tr>
<tr class=\"odd\">
<td width=\"60%\" valign=\"top\">
<p>Speckstängel (mit Blätterteig)</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">1.50</p>
</td>
</tr>
<tr class=\"even\">
<td width=\"60%\" valign=\"top\">
<p>Käseschnecken</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">1.50</p>
</td>
</tr>
<tr class=\"odd\">
<td width=\"60%\" valign=\"top\">
<p>pikante Minimuffins</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">1.50</p>
</td>
</tr>
<tr class=\"even\">
<td width=\"60%\" valign=\"top\">
<p>Knusperoliven</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">1.-</p>
</td>
</tr>
<tr class=\"odd\">
<td width=\"60%\" valign=\"top\">
<p>Dattel-Käse-Knusperli</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">1.-</p>
</td>
</tr>
<tr class=\"even\">
<td width=\"60%\" valign=\"top\">
<p>Käse/Fleisch Plätzchen (Quark-Mürbteit garniert)</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">2.-</p>
</td>
</tr>
<tr class=\"odd\">
<td width=\"60%\" valign=\"top\">
<p>Hefe-Schnäggli (Pizza, Thai, Gemüse)</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">2.-</p>
</td>
</tr>
<tr class=\"even\">
<td width=\"60%\" valign=\"top\">
<p>pikante Prussiens (mit Pesto)</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">1.50</p>
</td>
</tr>
<tr class=\"odd\">
<td width=\"60%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">&nbsp;</p>
</td>
</tr>
<tr class=\"even\">
<td width=\"60%\" valign=\"top\">
<p>Käse-Igel (30 Spiessli klein gesteckt)</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">35.-</p>
</td>
</tr>
<tr class=\"odd\">
<td width=\"60%\" valign=\"top\">
<p>Käsespiessli (mit Oliven, Tomaten, Gurken, Silberzwiebel, Kapernapfel)</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">1.25</p>
</td>
</tr>
<tr class=\"even\">
<td width=\"60%\" valign=\"top\">
<p>Toma-Mozza-Spiessli</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">2.-</p>
</td>
</tr>
<tr class=\"odd\">
<td width=\"60%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">&nbsp;</p>
</td>
</tr>
<tr class=\"even\">
<td width=\"60%\" valign=\"top\">
<p>Apéroplatten:</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">&nbsp;</p>
</td>
</tr>
<tr class=\"odd\">
<td width=\"60%\" valign=\"top\">
<p>A: Minimuffins (1), Gurkenschiffli (2), Käsespiessli (2), Toma-Mozza-Spiessli (2), Speckstängel (2), Gemüsestängel (50g)</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>Pro Person</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">11.-</p>
</td>
</tr>
<tr class=\"even\">
<td width=\"60%\" valign=\"top\">
<p>B: Speckstängel (2), Käsestängel (2), Knusperoliven (1), Mürbteigtaler (1), Käse- Oliven-Spiessli (2), Toma-Mozza-Spiessli (2)</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>Pro Person</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">13.-</p>
</td>
</tr>
<tr class=\"odd\">
<td width=\"60%\" valign=\"top\">
<p>C: Blätterteig-, Mürbteiggebäck gemischt (Blätterteigstängel, Käseschnecken, Schinkenröllchen, Toma-Mozza-Kissen, Chiliplätzchen, Knusperoliven, Käsetaler)</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>pro kg / Person 80-120g</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">65.-</p>
</td>
</tr>
<tr class=\"even\">
<td width=\"60%\" valign=\"top\">
<p>D: Apéroplatten �??Spezial�??; individuell zusammengestellt (zB nach Thema, Länder, Jahreszeit)</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>Auf Anfrage</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">&nbsp;</p>
</td>
</tr>
<tr class=\"odd\">
<td width=\"60%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">&nbsp;</p>
</td>
</tr>
<tr class=\"even\">
<td width=\"60%\" valign=\"top\">
<p><strong>Süsses:</strong></p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">&nbsp;</p>
</td>
</tr>
<tr class=\"odd\">
<td width=\"60%\" valign=\"top\">
<p>verschiedene Blechkuchenwürfel</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>mini/maxi</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">1.50/3.-</p>
</td>
</tr>
<tr class=\"even\">
<td width=\"60%\" valign=\"top\">
<p>Fruchtspiessli</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">2.-</p>
</td>
</tr>
<tr class=\"odd\">
<td width=\"60%\" valign=\"top\">
<p>Frucht-Igel (30 Spiessli klein gesteckt)</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">40.-</p>
</td>
</tr>
<tr class=\"even\">
<td width=\"60%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p>&nbsp;</p>
</td>
</tr>
<tr class=\"odd\">
<td width=\"60%\" valign=\"top\">
<p>verschiedene Cremen/Mousses</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>pro Liter&nbsp;&nbsp;<br />(20 Portionen klein, 12 Portionen mittel) &nbsp;angerichtet</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">30.-<br />2.-/3.-</p>
</td>
</tr>
<tr class=\"even\">
<td width=\"60%\" valign=\"top\">
<p>Prussiens</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>mini/maxi&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">1.-/2.-</p>
</td>
</tr>
<tr class=\"odd\">
<td width=\"60%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">&nbsp;</p>
</td>
</tr>
<tr class=\"even\">
<td width=\"60%\" valign=\"top\">
<p><strong>Sandwiches:</strong></p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">&nbsp;</p>
</td>
</tr>
<tr class=\"odd\">
<td width=\"60%\" valign=\"top\">
<p>Standard</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">5.-</p>
</td>
</tr>
<tr class=\"even\">
<td width=\"60%\" valign=\"top\">
<p>Sandwiches klein</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">3.50</p>
</td>
</tr>
<tr class=\"odd\">
<td width=\"60%\" valign=\"top\">
<p>Baguette Sandwich (12 Teile) / (offen = 24 Teile)</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">42.-</p>
</td>
</tr>
<tr class=\"even\">
<td width=\"60%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">&nbsp;</p>
</td>
</tr>
<tr class=\"odd\">
<td width=\"60%\" valign=\"top\">
<p>verschiedene Salate</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>auf Anfrage</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">&nbsp;</p>
</td>
</tr>
<tr class=\"even\">
<td width=\"60%\" valign=\"top\">
<p>Salatbuffet (Mindestmenge 4 Salate; 10 Personen)</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>Pro Person / Salat</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">2.50</p>
</td>
</tr>
<tr class=\"odd\">
<td width=\"60%\" valign=\"top\">
<p>verschiedene Hauptspeisen und feed �??n�?? smile Specials</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>auf Anfrage</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">&nbsp;</p>
</td>
</tr>
<tr class=\"even\">
<td width=\"60%\" valign=\"top\">
<p>Lieferdienst (Winterthur)</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>&nbsp;</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">50.-</p>
</td>
</tr>
<tr class=\"odd\">
<td width=\"60%\" valign=\"top\">
<p>Buffetservice am Anlass</p>
</td>
<td width=\"30%\" valign=\"top\">
<p>Pro Std. / Person</p>
</td>
<td width=\"10%\" valign=\"top\">
<p style=\"text-align: right;\">45.-</p>
</td>
</tr>
</tbody>
</table>
<p>Stand November 2010<br /><a title=\"Preisliste Stand Nov. 2010\" href=\"/media/navi_006/preisliste_nov_2010.pdf\" target=\"_blank\">Preisliste als PDF downloaden</a></p>","","","n");
INSERT INTO cms_seiten VALUES ("5","5","1","AGB","","2","0","<p><span style=\"text-decoration: underline;\">Preisliste:</span></p>
<p>Die Preise verstehen sich bei Abholung.</p>
<p>Für eine Pauschale von Fr. 50.- liefern wir im Raum Winterthur.</p>
<p>(Ausserhalb Winterthur nach Aufwand)</p>
<p>&nbsp;</p>
<p><span style=\"text-decoration: underline;\">Annulation:</span></p>
<p>Nach Bestätigung der Offerte wird bei Annulation eine Kostenbeteiligung von 20% verrechnet.</p>
<p>&nbsp;</p>
<p><span style=\"text-decoration: underline;\">Personenzahl:</span></p>
<p>Nach Bestätigung der Offerte, kann die Personenzahl, falls keine weitere Abmachungen vorliegen, bis zu einer Woche vor dem Anlass +/- 10% angepasst werden.</p>
<p>&nbsp;</p>
<p><span style=\"text-decoration: underline;\">Marktangebot:</span></p>
<p>Wir behalten uns vor, innerhalb des Angebots gleichwertige �?nderungen vorzunehmen, falls einzelne Produkte nicht erhältlich sind.</p>
<p>Saisonal können Preisabweichungen vorkommen.</p>
<p>&nbsp;</p>","","","n");
INSERT INTO cms_seiten VALUES ("7","7","1","Vorlage","","6","0","<div class=\"links\">
<p class=\"teasertext\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi bibendum odio non augue auctor elementum rhoncus purus posuere. Praesent consequat urna ut odio dignissim eu porttitor felis congue. Suspendisse at ornare lectus. Vivamus ut odio eu ipsum porta egestas. Sed tincidunt tellus vitae quam sodales ac malesuada urna tempus. Suspendisse vel sapien justo, vitae hendrerit quam. Vestibulum quis enim enim. Sed rutrum lacinia augue, ac tristique odio rhoncus a. In quis erat nibh, sed rutrum magna. Nulla interdum, nisi at viverra molestie, nulla ligula fermentum lacus, ac volutpat quam lacus consequat erat. Integer nec ipsum aliquet lorem vestibulum hendrerit. </p>
<p>&nbsp;</p>
%teaser2%
<p>&nbsp;</p>
</div>
<div class=\"rechts\">%teaser1% </div>","","","n");
INSERT INTO cms_seiten VALUES ("8","8","1","Bilder","","4","0","","","../../media_feednsmile/navi_008/_thumbs/th_dsc08094.jpg","n");
INSERT INTO cms_seiten VALUES ("9","9","1","News","Neu im Angebot: Brunch, nach Wunsch zusammengestellt","5","1","","","","n");
INSERT INTO cms_seiten VALUES ("10","10","1","Rezepte","","2","0","<p>Die Rezepte in dieser Rubrik sind einfach; Sie können sie nachkochen, erweitern, abändern, verfeinern oder ganz neu erfinden. <br /><br /><strong>cook \'n\' smile!!</strong></p>","","","n");
INSERT INTO cms_seiten VALUES ("11","11","1","im Winter","","5","1","<p><span style=\"text-decoration: underline;\"><strong>Holländische Erbsensuppe</strong></span><br /><br />Zutaten:<br />500 g getrocknete Erbsen<br />500 g Schweinskoteletten<br />250 g Speckwürfel<br />1 Zwiebel<br />1 Stange Lauch<br />1 kleine Knollensellerie<br />1 grosse Karotte<br />1 grosse Kartoffel<br />3 Liter Bouillon<br />Salz, Pfeffer, weitere Gewürze nach Bedarf<br /><br />Zubereitung:<br />Die Erbsen mit Bouillon, Koteletten, Speckwürfeln aufkochen, <br />ca. 45 Minuten köcheln lassen.<br />Das Gemüse in kleine Stücke schneiden (Kartoffeln, Sellerie, Zwiebeln&nbsp;und Karotten schälen)<br />und zufügen. Nochmals 45 Minuten köcheln lassen.<br />Die&nbsp;Koteletten herausnehmen, das Fleisch in kleine Stücke schneiden und wieder beifügen.<br />Die Suppe mit Salz, Pfeffer und weiteren Gewürzen abschmecken. <br />Evtl. mit gehacktem Peterli oder Koriander bestreuen.<br />Nach Bedarf Würstchen in die Suppe geben.<br /><br />Servieren mit dunklem Brot</p>","","../../media_feednsmile_feednsmile_feednsmile_feednsmile_feednsmile_feednsmile_feednsmile_feednsmile_feednsmile_feednsmile_fee","a");
INSERT INTO cms_seiten VALUES ("12","12","1","im Frühling","","5","1","","","","n");
INSERT INTO cms_seiten VALUES ("13","13","1","im Sommer","","5","1","<html />","<html />","","n");
INSERT INTO cms_seiten VALUES ("14","14","1","im Herbst",NULL,"1","0","","","","n");
INSERT INTO cms_seiten VALUES ("15","15","1","Rezepte_50",NULL,"1","0","",NULL,NULL,"n");



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
INSERT INTO cms_spezial VALUES ("feednsmile","M1","300","300","val");
INSERT INTO cms_spezial VALUES ("feednsmile","domain","navi_009","3","val");



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
INSERT INTO cms_templates VALUES ("8","4","einspaltig_760h_tpl.html","einspaltig_760h_tpl.html - obere Spalte Thumbnails, untere Spalte Text","130x130");
INSERT INTO cms_templates VALUES ("9","5","einspaltig_760v_tpl.html","einspaltig_760v_tpl.html - 1. Spalte Text, 2. Spalte Thumbnails","130x130");
INSERT INTO cms_templates VALUES ("10","6","einspaltig_760_nur_text_tpl.html","einspaltig_760_nur_text_tpl.html - Nur Textspalte 760 Pixel breit","720x720");



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
   KEY username (username)
);

#
# Daten von Tabelle 'cms_users'
#
INSERT INTO cms_users VALUES ("3","hempen","e9911456f39b5e6d738669ac8d438b20","NUFMKLBD");
INSERT INTO cms_users VALUES ("4","webprog10","a3e6096dbe9169213e7880821129428e","NUBD");
INSERT INTO cms_users VALUES ("7","suzan","07ab242311dbad887fb03e4a25092781","BDFNU");


