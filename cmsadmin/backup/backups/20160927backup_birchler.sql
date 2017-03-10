#----------------------------------------------
# Backup der Datenbank cms_birchler
# Erstellt am 27.09.2016 05:40
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
INSERT INTO cms_config VALUES ("2","general","COPYRIGHT","Birchler Architektur AG",NULL,NULL);
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
INSERT INTO cms_config VALUES ("6","general","CMS_ROOT","/",NULL,NULL);
INSERT INTO cms_config VALUES ("15","menu","SMURL_REFRESH","ausf&uuml;hren","",NULL);
INSERT INTO cms_config VALUES ("12","menu","SUBMENU_DIR","vertikal","horizontal",NULL);
INSERT INTO cms_config VALUES ("7","general","EMAIL_RECEIVER","info@birchler-architektur.ch",NULL,NULL);
INSERT INTO cms_config VALUES ("32","meta-tags","KEYWORDS","webdesign, php, html, xhtml, javascript, Zürich, Hempen, Roland Hempen, hempenweb",NULL,"Birchler, Architekt, Architektur, Einsiedeln");
INSERT INTO cms_config VALUES ("33","meta-tags","DESCRIPTION","hempenWeb ist eine kleine feine Internetagentur, die es sich zur Aufgabe macht, Ihren Internetauftritt individuell und einmal",NULL,"Ruedi Birchler Architekt ETH/SIA, Allmeindstrasse 17, 8840 Einsiedeln");
INSERT INTO cms_config VALUES ("34","meta-tags","PAGE_TOPIC","Webdesign, WebProgrammer, Php, Internetagentur, Zürich",NULL,"Architektur, Bauten, Lincoln, Brüel, Linsi, Energieberatung, ");
INSERT INTO cms_config VALUES ("35","meta-tags","PUBLISHER","Roland Hempen, WebPublisher, WebProgrammer Php, www.hempenweb.ch, Marianne Mathys, Grafik, Design, Zürich",NULL,"Roland Hempen, WebPublisher, WebProgrammer Php, hempenweb, Marianne Mathys, Grafik, Design, Zürich");
INSERT INTO cms_config VALUES ("26","pictures","DISK_DB_ADJUSTMENT","ausf&uuml;hren",NULL,NULL);
INSERT INTO cms_config VALUES ("8","general","GOOGLE_ANALYTICS","UA-10022482-1",NULL,NULL);
INSERT INTO cms_config VALUES ("36","general","TEMPLATE_DIR","frontend/themes/birchler/tpl",NULL,NULL);



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
INSERT INTO cms_galerien VALUES ("551","140","1","P","../../media/navi_110001/_images/bauten_2.png",NULL);
INSERT INTO cms_galerien VALUES ("645","80","3","N","../../media/navi_11_220/_images/brüel-2-1.jpg","Saal");
INSERT INTO cms_galerien VALUES ("646","80","5","N","../../media/navi_11_220/_images/brüel-3-1.jpg","Schulzimmer 1");
INSERT INTO cms_galerien VALUES ("520","56","1","N","../../media/navi_056/_images/home_2.png",NULL);
INSERT INTO cms_galerien VALUES ("648","80","1","N","../../media/navi_11_220/_images/brüel-6-1.jpg","Aussenansicht");
INSERT INTO cms_galerien VALUES ("472","51","2","N","../../media/navi_12/_images/home_1.png","Siedlung Lincoln in Einsiedeln beim Friedhof");
INSERT INTO cms_galerien VALUES ("497","51","1","N","../../media/navi_12/_images/home_2.png","Diverse Ansichten auf Bauten in Einsiedeln");
INSERT INTO cms_galerien VALUES ("566","57","2","N","../../media/navi_11_20/_images/unbenannt-1.jpg","Ansicht SÃ¼d-Ost");
INSERT INTO cms_galerien VALUES ("567","57","4","N","../../media/navi_11_20/_images/unbenannt-2.jpg","Saal");
INSERT INTO cms_galerien VALUES ("647","80","4","N","../../media/navi_11_220/_images/brüel-5-1.jpg","Korridor");
INSERT INTO cms_galerien VALUES ("539","58","1","N","../../media/navi_11_30/_images/linsi_aussenansicht.jpg","Garten");
INSERT INTO cms_galerien VALUES ("540","58","2","N","../../media/navi_11_30/_images/linsi_treppe.jpg","Treppenhaus");
INSERT INTO cms_galerien VALUES ("548","142","2","P","../../media/navi_110003/_images/bauten_3.png",NULL);
INSERT INTO cms_galerien VALUES ("644","80","2","N","../../media/navi_11_220/_images/brüel-1-1.jpg","Eingangshalle");
INSERT INTO cms_galerien VALUES ("510","52","1","N","../../media/navi_14/_images/impressum_1.png",NULL);
INSERT INTO cms_galerien VALUES ("550","141","1","P","../../media/navi_110002/_images/bauten_1.png",NULL);
INSERT INTO cms_galerien VALUES ("654","55","1","N","../../media/navi_11_10/_images/lincoln01.jpg","Zwischenraum");
INSERT INTO cms_galerien VALUES ("656","55","2","N","../../media/navi_11_10/_images/lincoln03.jpg","Ansicht SÃ¼d");
INSERT INTO cms_galerien VALUES ("657","55","3","N","../../media/navi_11_10/_images/lincoln04.jpg","GÃ¤rten");
INSERT INTO cms_galerien VALUES ("658","55","4","N","../../media/navi_11_10/_images/lincoln05.jpg","Ansicht Nord");
INSERT INTO cms_galerien VALUES ("661","51","3","N","../../media/navi_12/_images/home_3.png","Diverse Ansichten auf Bauten in Einsiedeln");
INSERT INTO cms_galerien VALUES ("547","54","1","N","../../media/navi_13/_images/plan_birchler.png","Lageplan");
INSERT INTO cms_galerien VALUES ("552","142","3","P","../../media/navi_110003/_images/lincoln_gaerten.jpg",NULL);
INSERT INTO cms_galerien VALUES ("553","142","1","P","../../media/navi_110003/_images/lincoln_zwischenraum.jpg",NULL);
INSERT INTO cms_galerien VALUES ("554","142","4","P","../../media/navi_110003/_images/lincoln_ansicht_no.jpg",NULL);
INSERT INTO cms_galerien VALUES ("570","67","2","N","../../media/navi_11_120/_images/4155-02.jpg","Ansicht Nord-West - Foto: Christian Richter");
INSERT INTO cms_galerien VALUES ("571","67","1","N","../../media/navi_11_120/_images/4155-19.jpg","Ansicht Nord - Foto: Christian Richter");
INSERT INTO cms_galerien VALUES ("568","57","3","N","../../media/navi_11_20/_images/unbenannt-3.jpg","Innenhof");
INSERT INTO cms_galerien VALUES ("569","57","1","N","../../media/navi_11_20/_images/unbenannt-4.jpg","Ansicht Ost");
INSERT INTO cms_galerien VALUES ("572","67","3","N","../../media/navi_11_120/_images/4155-28.jpg","Musiksaal - Foto: Christian Richter");
INSERT INTO cms_galerien VALUES ("573","67","4","N","../../media/navi_11_120/_images/luftbild_bösch.jpg","Luftaufnahme Kloster Einsiedeln - Foto: Werner BÃ¶sch");
INSERT INTO cms_galerien VALUES ("574","69","1","N","../../media/navi_11_140/_images/ag-674_1_b.jpg","Ansicht West");
INSERT INTO cms_galerien VALUES ("576","66","3","N","../../media/navi_11_110/_images/69570012.jpg","Holzschalung");
INSERT INTO cms_galerien VALUES ("577","66","2","N","../../media/navi_11_110/_images/69570016.jpg","BrÃ¼cke und Wald");
INSERT INTO cms_galerien VALUES ("578","66","1","N","../../media/navi_11_110/_images/69570020.jpg","Ansicht Ost");
INSERT INTO cms_galerien VALUES ("579","70","1","N","../../media/navi_11_150/_images/ag-674_6_b.jpg","Ansicht Nord");
INSERT INTO cms_galerien VALUES ("580","70","2","N","../../media/navi_11_150/_images/ag-685_8.jpg","Ansicht SÃ¼d");
INSERT INTO cms_galerien VALUES ("581","70","3","N","../../media/navi_11_150/_images/dsc00001.jpg","Ansicht Nord-West");
INSERT INTO cms_galerien VALUES ("582","64","1","N","../../media/navi_11_90/_images/dsc_0192.jpg","Ansicht SÃ¼d");
INSERT INTO cms_galerien VALUES ("583","64","2","N","../../media/navi_11_90/_images/dsc_0202.jpg","Stimmungsbild");
INSERT INTO cms_galerien VALUES ("584","62","4","N","../../media/navi_11_70/_images/dsc00033.jpg","Ansicht Nord-Ost");
INSERT INTO cms_galerien VALUES ("585","62","1","N","../../media/navi_11_70/_images/dsc00035.jpg","Ansicht SÃ¼d-West 1");
INSERT INTO cms_galerien VALUES ("586","62","2","N","../../media/navi_11_70/_images/dsc00037.jpg","Ansicht SÃ¼d-West 2");
INSERT INTO cms_galerien VALUES ("587","62","3","N","../../media/navi_11_70/_images/dsc00038.jpg","Ansicht SÃ¼d-West 3");
INSERT INTO cms_galerien VALUES ("588","62","5","N","../../media/navi_11_70/_images/dsc00039.jpg","Ansicht Ost");
INSERT INTO cms_galerien VALUES ("591","61","1","N","../../media/navi_11_60/_images/nord-west.jpg","Ansicht West");
INSERT INTO cms_galerien VALUES ("592","61","4","N","../../media/navi_11_60/_images/pict0055.jpg","Innenraum");
INSERT INTO cms_galerien VALUES ("593","61","3","N","../../media/navi_11_60/_images/süd-ost.jpg","Ansicht Ost");
INSERT INTO cms_galerien VALUES ("594","61","2","N","../../media/navi_11_60/_images/west.jpg","Ansicht SÃ¼d");
INSERT INTO cms_galerien VALUES ("595","63","2","N","../../media/navi_11_80/_images/01.09.26-1.jpg","Ansicht Nord-Ost");
INSERT INTO cms_galerien VALUES ("596","63","1","N","../../media/navi_11_80/_images/01.09.26-2.jpg","Ansicht SÃ¼d-Ost");
INSERT INTO cms_galerien VALUES ("597","63","3","N","../../media/navi_11_80/_images/dscn1408.jpg","Ansicht Nord");
INSERT INTO cms_galerien VALUES ("598","65","3","N","../../media/navi_11_100/_images/dsc00029.jpg","Wohnraum");
INSERT INTO cms_galerien VALUES ("599","65","1","N","../../media/navi_11_100/_images/dscn0276.jpg","Ansicht SÃ¼d-West");
INSERT INTO cms_galerien VALUES ("600","65","2","N","../../media/navi_11_100/_images/dscn0278.jpg","Ansicht SÃ¼d");
INSERT INTO cms_galerien VALUES ("601","68","4","N","../../media/navi_11_130/_images/ag-672_4_b.jpg","Wohnraum");
INSERT INTO cms_galerien VALUES ("602","68","3","N","../../media/navi_11_130/_images/ag-672_7.jpg","Ansicht SÃ¼d-Ost");
INSERT INTO cms_galerien VALUES ("603","68","1","N","../../media/navi_11_130/_images/ag-673_2_b.jpg","Ansicht West");
INSERT INTO cms_galerien VALUES ("604","68","2","N","../../media/navi_11_130/_images/ag-673_5_b.jpg","Ansicht Ost");
INSERT INTO cms_galerien VALUES ("605","71","2","N","../../media/navi_11_160/_images/ag-689_7_b.jpg","Ansicht Nord-West");
INSERT INTO cms_galerien VALUES ("606","71","1","N","../../media/navi_11_160/_images/ag-689_8_b.jpg","Ansicht SÃ¼d");
INSERT INTO cms_galerien VALUES ("607","71","3","N","../../media/navi_11_160/_images/ag-792_6_aussicht.jpg","Esszimmer");
INSERT INTO cms_galerien VALUES ("608","72","2","N","../../media/navi_11_170/_images/ag_690_roh3.jpg","Ansicht Nord-West");
INSERT INTO cms_galerien VALUES ("609","72","3","N","../../media/navi_11_170/_images/ag_700_roh2.jpg","Ansicht Nord-Ost");
INSERT INTO cms_galerien VALUES ("610","72","4","N","../../media/navi_11_170/_images/ag_700_roh3.jpg","Garten");
INSERT INTO cms_galerien VALUES ("611","72","1","N","../../media/navi_11_170/_images/ag-694_5.jpg","Ansicht SÃ¼d-West");
INSERT INTO cms_galerien VALUES ("622","74","2","N","../../media/navi_11_190/_images/ag-699_3_b.jpg",NULL);
INSERT INTO cms_galerien VALUES ("621","74","5","N","../../media/navi_11_190/_images/img_0074.jpg","Stimmungsbild");
INSERT INTO cms_galerien VALUES ("619","73","2","N","../../media/navi_11_180/_images/img_0011.jpg","Bad");
INSERT INTO cms_galerien VALUES ("620","74","1","N","../../media/navi_11_190/_images/ag-694_7_b.jpg","Garten");
INSERT INTO cms_galerien VALUES ("618","73","1","N","../../media/navi_11_180/_images/img_0006.jpg","Wohnzimmer");
INSERT INTO cms_galerien VALUES ("623","74","6","N","../../media/navi_11_190/_images/img_0008.jpg","Stimmungsbild");
INSERT INTO cms_galerien VALUES ("624","74","3","N","../../media/navi_11_190/_images/img_0020.jpg","Garten");
INSERT INTO cms_galerien VALUES ("625","74","4","N","../../media/navi_11_190/_images/img_0046.jpg","Stierkopf");
INSERT INTO cms_galerien VALUES ("629","76","2","N","../../media/navi_11_210/_images/00031.jpg","Ansicht Nord-West");
INSERT INTO cms_galerien VALUES ("628","76","1","N","../../media/navi_11_210/_images/00029.jpg","Ansicht West");
INSERT INTO cms_galerien VALUES ("653","79","3","N","../../media/navi_11_220/_images/dsc00040.jpg","Ansicht West");
INSERT INTO cms_galerien VALUES ("652","79","2","N","../../media/navi_11_220/_images/dsc00025.jpg","Ansicht Ost");
INSERT INTO cms_galerien VALUES ("651","79","1","N","../../media/navi_11_220/_images/dsc00024.jpg","Ansicht SÃ¼d");
INSERT INTO cms_galerien VALUES ("650","79","4","N","../../media/navi_11_220/_images/dsc00004.jpg","Dachstock");
INSERT INTO cms_galerien VALUES ("649","80","6","N","../../media/navi_11_220/_images/brüel-4-1.jpg","Schulzimmer 2");
INSERT INTO cms_galerien VALUES ("662","51","4","N","../../media_birchler/navi_12/_images/home_1.png","");
INSERT INTO cms_galerien VALUES ("663","51","5","N","../../media_birchler/navi_12/_images/home_2.png","");
INSERT INTO cms_galerien VALUES ("664","51","6","N","../../media_birchler/navi_12/_images/home_3.png","");
INSERT INTO cms_galerien VALUES ("760","41","1","N","../../media_birchler/navi_07/_images/birchlerteaminternet01.jpg","");
INSERT INTO cms_galerien VALUES ("666","78","1","N","../../media_birchler/navi_11_210/_images/00029.jpg","");
INSERT INTO cms_galerien VALUES ("667","78","2","N","../../media_birchler/navi_11_210/_images/00031.jpg","");
INSERT INTO cms_galerien VALUES ("668","73","3","N","../../media_birchler/navi_11_180/_images/img_0006.jpg","");
INSERT INTO cms_galerien VALUES ("669","73","4","N","../../media_birchler/navi_11_180/_images/img_0011.jpg","");
INSERT INTO cms_galerien VALUES ("670","72","5","N","../../media_birchler/navi_11_170/_images/ag-694_5.jpg","");
INSERT INTO cms_galerien VALUES ("671","72","6","N","../../media_birchler/navi_11_170/_images/ag_690_roh3.jpg","");
INSERT INTO cms_galerien VALUES ("672","72","7","N","../../media_birchler/navi_11_170/_images/ag_700_roh2.jpg","");
INSERT INTO cms_galerien VALUES ("673","72","8","N","../../media_birchler/navi_11_170/_images/ag_700_roh3.jpg","");
INSERT INTO cms_galerien VALUES ("674","79","5","N","../../media_birchler/navi_11_220/_images/brüel-1-1.jpg","");
INSERT INTO cms_galerien VALUES ("675","79","6","N","../../media_birchler/navi_11_220/_images/brüel-2-1.jpg","");
INSERT INTO cms_galerien VALUES ("676","79","7","N","../../media_birchler/navi_11_220/_images/brüel-3-1.jpg","");
INSERT INTO cms_galerien VALUES ("677","79","8","N","../../media_birchler/navi_11_220/_images/brüel-4-1.jpg","");
INSERT INTO cms_galerien VALUES ("678","79","9","N","../../media_birchler/navi_11_220/_images/brüel-5-1.jpg","");
INSERT INTO cms_galerien VALUES ("679","79","10","N","../../media_birchler/navi_11_220/_images/brüel-6-1.jpg","");
INSERT INTO cms_galerien VALUES ("680","79","11","N","../../media_birchler/navi_11_220/_images/dsc00004.jpg","");
INSERT INTO cms_galerien VALUES ("681","79","12","N","../../media_birchler/navi_11_220/_images/dsc00024.jpg","");
INSERT INTO cms_galerien VALUES ("682","79","13","N","../../media_birchler/navi_11_220/_images/dsc00025.jpg","");
INSERT INTO cms_galerien VALUES ("683","79","14","N","../../media_birchler/navi_11_220/_images/dsc00040.jpg","");
INSERT INTO cms_galerien VALUES ("684","71","4","N","../../media_birchler/navi_11_160/_images/ag-689_7_b.jpg","");
INSERT INTO cms_galerien VALUES ("685","71","5","N","../../media_birchler/navi_11_160/_images/ag-689_8_b.jpg","");
INSERT INTO cms_galerien VALUES ("686","71","6","N","../../media_birchler/navi_11_160/_images/ag-792_6_aussicht.jpg","");
INSERT INTO cms_galerien VALUES ("687","70","4","N","../../media_birchler/navi_11_150/_images/ag-674_6_b.jpg","");
INSERT INTO cms_galerien VALUES ("688","70","5","N","../../media_birchler/navi_11_150/_images/ag-685_8.jpg","");
INSERT INTO cms_galerien VALUES ("689","70","6","N","../../media_birchler/navi_11_150/_images/dsc00001.jpg","");
INSERT INTO cms_galerien VALUES ("690","69","2","N","../../media_birchler/navi_11_140/_images/ag-674_1_b.jpg","");
INSERT INTO cms_galerien VALUES ("691","74","7","N","../../media_birchler/navi_11_190/_images/ag-694_7_b.jpg","");
INSERT INTO cms_galerien VALUES ("692","74","8","N","../../media_birchler/navi_11_190/_images/ag-699_3_b.jpg","");
INSERT INTO cms_galerien VALUES ("693","74","9","N","../../media_birchler/navi_11_190/_images/img_0008.jpg","");
INSERT INTO cms_galerien VALUES ("694","74","10","N","../../media_birchler/navi_11_190/_images/img_0020.jpg","");
INSERT INTO cms_galerien VALUES ("695","74","11","N","../../media_birchler/navi_11_190/_images/img_0046.jpg","");
INSERT INTO cms_galerien VALUES ("696","74","12","N","../../media_birchler/navi_11_190/_images/img_0074.jpg","");
INSERT INTO cms_galerien VALUES ("697","68","5","N","../../media_birchler/navi_11_130/_images/ag-672_4_b.jpg","");
INSERT INTO cms_galerien VALUES ("698","68","6","N","../../media_birchler/navi_11_130/_images/ag-672_7.jpg","");
INSERT INTO cms_galerien VALUES ("699","68","7","N","../../media_birchler/navi_11_130/_images/ag-673_2_b.jpg","");
INSERT INTO cms_galerien VALUES ("700","68","8","N","../../media_birchler/navi_11_130/_images/ag-673_5_b.jpg","");
INSERT INTO cms_galerien VALUES ("701","80","7","N","../../media_birchler/navi_11_220/_images/brüel-1-1.jpg","");
INSERT INTO cms_galerien VALUES ("702","80","8","N","../../media_birchler/navi_11_220/_images/brüel-2-1.jpg","");
INSERT INTO cms_galerien VALUES ("703","80","9","N","../../media_birchler/navi_11_220/_images/brüel-3-1.jpg","");
INSERT INTO cms_galerien VALUES ("704","80","10","N","../../media_birchler/navi_11_220/_images/brüel-4-1.jpg","");
INSERT INTO cms_galerien VALUES ("705","80","11","N","../../media_birchler/navi_11_220/_images/brüel-5-1.jpg","");
INSERT INTO cms_galerien VALUES ("706","80","12","N","../../media_birchler/navi_11_220/_images/brüel-6-1.jpg","");
INSERT INTO cms_galerien VALUES ("707","80","13","N","../../media_birchler/navi_11_220/_images/dsc00004.jpg","");
INSERT INTO cms_galerien VALUES ("708","80","14","N","../../media_birchler/navi_11_220/_images/dsc00024.jpg","");
INSERT INTO cms_galerien VALUES ("709","80","15","N","../../media_birchler/navi_11_220/_images/dsc00025.jpg","");
INSERT INTO cms_galerien VALUES ("710","80","16","N","../../media_birchler/navi_11_220/_images/dsc00040.jpg","");
INSERT INTO cms_galerien VALUES ("711","67","5","N","../../media_birchler/navi_11_120/_images/4155-02.jpg","");
INSERT INTO cms_galerien VALUES ("712","67","6","N","../../media_birchler/navi_11_120/_images/4155-19.jpg","");
INSERT INTO cms_galerien VALUES ("713","67","7","N","../../media_birchler/navi_11_120/_images/4155-28.jpg","");
INSERT INTO cms_galerien VALUES ("714","67","8","N","../../media_birchler/navi_11_120/_images/luftbild_bösch.jpg","");
INSERT INTO cms_galerien VALUES ("715","57","5","N","../../media_birchler/navi_11_20/_images/unbenannt-1.jpg","");
INSERT INTO cms_galerien VALUES ("716","57","6","N","../../media_birchler/navi_11_20/_images/unbenannt-2.jpg","");
INSERT INTO cms_galerien VALUES ("717","57","7","N","../../media_birchler/navi_11_20/_images/unbenannt-3.jpg","");
INSERT INTO cms_galerien VALUES ("718","57","8","N","../../media_birchler/navi_11_20/_images/unbenannt-4.jpg","");
INSERT INTO cms_galerien VALUES ("719","55","5","N","../../media_birchler/navi_11_10/_images/lincoln01.jpg","");
INSERT INTO cms_galerien VALUES ("720","55","6","N","../../media_birchler/navi_11_10/_images/lincoln03.jpg","");
INSERT INTO cms_galerien VALUES ("721","55","7","N","../../media_birchler/navi_11_10/_images/lincoln04.jpg","");
INSERT INTO cms_galerien VALUES ("722","55","8","N","../../media_birchler/navi_11_10/_images/lincoln05.jpg","");
INSERT INTO cms_galerien VALUES ("723","58","3","N","../../media_birchler/navi_11_30/_images/linsi_aussenansicht.jpg","");
INSERT INTO cms_galerien VALUES ("724","58","4","N","../../media_birchler/navi_11_30/_images/linsi_treppe.jpg","");
INSERT INTO cms_galerien VALUES ("725","66","4","N","../../media_birchler/navi_11_110/_images/69570012.jpg","");
INSERT INTO cms_galerien VALUES ("726","66","5","N","../../media_birchler/navi_11_110/_images/69570016.jpg","");
INSERT INTO cms_galerien VALUES ("727","66","6","N","../../media_birchler/navi_11_110/_images/69570020.jpg","");
INSERT INTO cms_galerien VALUES ("728","65","4","N","../../media_birchler/navi_11_100/_images/dsc00029.jpg","");
INSERT INTO cms_galerien VALUES ("729","65","5","N","../../media_birchler/navi_11_100/_images/dscn0276.jpg","");
INSERT INTO cms_galerien VALUES ("730","65","6","N","../../media_birchler/navi_11_100/_images/dscn0278.jpg","");
INSERT INTO cms_galerien VALUES ("731","64","3","N","../../media_birchler/navi_11_90/_images/dsc_0192.jpg","");
INSERT INTO cms_galerien VALUES ("732","64","4","N","../../media_birchler/navi_11_90/_images/dsc_0202.jpg","");
INSERT INTO cms_galerien VALUES ("733","63","4","N","../../media_birchler/navi_11_80/_images/01.09.26-1.jpg","");
INSERT INTO cms_galerien VALUES ("734","63","5","N","../../media_birchler/navi_11_80/_images/01.09.26-2.jpg","");
INSERT INTO cms_galerien VALUES ("735","63","6","N","../../media_birchler/navi_11_80/_images/dscn1408.jpg","");
INSERT INTO cms_galerien VALUES ("736","61","5","N","../../media_birchler/navi_11_60/_images/nord-west.jpg","");
INSERT INTO cms_galerien VALUES ("737","61","6","N","../../media_birchler/navi_11_60/_images/pict0055.jpg","");
INSERT INTO cms_galerien VALUES ("738","61","7","N","../../media_birchler/navi_11_60/_images/süd-ost.jpg","");
INSERT INTO cms_galerien VALUES ("739","61","8","N","../../media_birchler/navi_11_60/_images/west.jpg","");
INSERT INTO cms_galerien VALUES ("740","76","3","N","../../media_birchler/navi_11_210/_images/00029.jpg","");
INSERT INTO cms_galerien VALUES ("741","76","4","N","../../media_birchler/navi_11_210/_images/00031.jpg","");
INSERT INTO cms_galerien VALUES ("742","62","6","N","../../media_birchler/navi_11_70/_images/dsc00033.jpg","");
INSERT INTO cms_galerien VALUES ("743","62","7","N","../../media_birchler/navi_11_70/_images/dsc00035.jpg","");
INSERT INTO cms_galerien VALUES ("744","62","8","N","../../media_birchler/navi_11_70/_images/dsc00037.jpg","");
INSERT INTO cms_galerien VALUES ("745","62","9","N","../../media_birchler/navi_11_70/_images/dsc00038.jpg","");
INSERT INTO cms_galerien VALUES ("746","62","10","N","../../media_birchler/navi_11_70/_images/dsc00039.jpg","");
INSERT INTO cms_galerien VALUES ("747","54","2","N","../../media_birchler/navi_13/_images/plan_birchler.png","");
INSERT INTO cms_galerien VALUES ("748","56","2","N","../../media_birchler/navi_056/_images/home_2.png","");
INSERT INTO cms_galerien VALUES ("749","52","2","N","../../media_birchler/navi_14/_images/impressum_1.png","");
INSERT INTO cms_galerien VALUES ("761","41","2","N","../../media_birchler/navi_07/_images/teambirchler02.jpg","");
INSERT INTO cms_galerien VALUES ("762","41","3","N","../../media_birchler/navi_07/_images/teambirchler03.jpg","");



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
INSERT INTO cms_navigation VALUES ("55","navi_11","3","140","Siedlung Lincoln","SiedlungLincoln","navi_11_10","j","n","");
INSERT INTO cms_navigation VALUES ("44","navi_10","4","0","Energieberatung","Energieberatung","navi_10","n","n","H");
INSERT INTO cms_navigation VALUES ("52","navi_11","7","0","Impressum","Impressum","navi_14","j","n","H");
INSERT INTO cms_navigation VALUES ("51","navi_12","1","0","Home","Home","navi_12","j","j","H");
INSERT INTO cms_navigation VALUES ("56","navi_056","6","0","Links","Links","navi_056","j","n","H");
INSERT INTO cms_navigation VALUES ("57","navi_11","3","130","Kirchgemeindehaus","Kirchgemeindehaus","navi_11_20","n","n","");
INSERT INTO cms_navigation VALUES ("58","navi_11","3","150","MFH Linsi Thalwil","MFHLinsiThalwil","navi_11_30","j","n","");
INSERT INTO cms_navigation VALUES ("61","navi_11","3","200","ZFH Reckholdern","ZFHReckholdern","navi_11_60","n","n","");
INSERT INTO cms_navigation VALUES ("62","navi_11","3","220","MFH Hirschi Schwyz","MFHHirschiSchwyz","navi_11_70","n","n","");
INSERT INTO cms_navigation VALUES ("63","navi_11","3","190","ZFH Ruhstaller","ZFHRuhstaller","navi_11_80","n","n","");
INSERT INTO cms_navigation VALUES ("64","navi_11","3","180","ZFH Laschkolnig Clark","ZFHLaschkolnigClark","navi_11_90","n","n","");
INSERT INTO cms_navigation VALUES ("65","navi_11","3","170","ZFH Zentner","ZFHZentner","navi_11_100","n","n","");
INSERT INTO cms_navigation VALUES ("66","navi_11","3","160","Selgis Brücke Muotathal","SelgisBrückeMuotath","navi_11_110","n","n","");
INSERT INTO cms_navigation VALUES ("67","navi_11","3","120","Musikhaus Kloster Einsiedeln","MusikhausKlosterEins","navi_11_120","n","n","");
INSERT INTO cms_navigation VALUES ("68","navi_11","3","100","EFH Egli","EFHEgli","navi_11_130","n","n","");
INSERT INTO cms_navigation VALUES ("69","navi_11","3","80","Friedhof Einsiedeln","FriedhofEinsiedeln","navi_11_140","n","n","");
INSERT INTO cms_navigation VALUES ("70","navi_11","3","70","MFH Genossame Dorf Binzen","MFHGenossameDorfBinz","navi_11_150","n","n","");
INSERT INTO cms_navigation VALUES ("71","navi_11","3","60","EFH Schuler","EFHSchuler","navi_11_160","n","n","");
INSERT INTO cms_navigation VALUES ("72","navi_11","3","40","EFH und Praxis Bühler","EFHundPraxisBühler","navi_11_170","n","n","");
INSERT INTO cms_navigation VALUES ("73","navi_11","3","20","Wohnung Baumann","WohnungBaumann","navi_11_180","n","n","");
INSERT INTO cms_navigation VALUES ("74","navi_11","3","90","Garten Staub","GartenStaub","navi_11_190","n","n","");
INSERT INTO cms_navigation VALUES ("76","navi_11","3","210","ZFH Luegeten","ZFHLuegeten","navi_11_210","n","n","");
INSERT INTO cms_navigation VALUES ("77","navi_11","3","30","Dachwohnung Zürcher","DachwohnungZürcher","navi_11_200","n","n","");
INSERT INTO cms_navigation VALUES ("78","navi_11","3","10","Anbau MFH BG Mythen","AnbauMFHBGMythen","navi_11_210","n","n","");
INSERT INTO cms_navigation VALUES ("79","navi_11","3","50","Aufstockung ZFH Kälin","AufstockungZFHKälin","navi_11_220","n","n","");
INSERT INTO cms_navigation VALUES ("80","navi_11","3","110","Schulhaus Brüel Einsiedeln","SchulhausBrüelEinsi","navi_11_220","j","n","");



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
    inhalt2 longtext NOT NULL,
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
INSERT INTO cms_pages VALUES ("140","53","navi_11","navi_110001","Brücke über die Sihl","Bauten","2009-01-31 00:00:00","2010-10-10 00:00:00","Überdachte Holzbrücke über die Sihl in der Nähe von Einsiedeln","<p>Adipiscing Donec at eros malesuada lorem non Duis id In eu. Suscipit augue In semper euismod Curabitur ut pede turpis Curabitur risus. Nec fermentum nulla Vestibulum at ipsum sem tempor velit nisl Pellentesque. Elit ultrices dis tempor nec amet lacus ullamcorper pede auctor pellentesque. Quisque Nulla nunc Quisque risus augue eu nec laoreet ante auctor. Massa convallis tellus sed congue nibh Curabitur purus.<br /><br />Adipiscing Donec at eros malesuada lorem non Duis id In eu. Suscipit augue In semper euismod Curabitur ut pede turpis Curabitur risus. Nec fermentum nulla Vestibulum at ipsum sem tempor velit nisl Pellentesque. Elit ultrices dis tempor nec amet lacus ullamcorper pede auctor pellentesque. Quisque Nulla nunc Quisque risus augue eu nec laoreet ante auctor. Massa convallis tellus sed congue nibh Curabitur purus.<br /><br />Adipiscing Donec at eros malesuada lorem non Duis id In eu. Suscipit augue In semper euismod Curabitur ut pede turpis Curabitur risus. Nec fermentum nulla Vestibulum at ipsum sem tempor velit nisl Pellentesque. Elit ultrices dis tempor nec amet lacus ullamcorper pede auctor pellentesque. Quisque Nulla nunc Quisque risus augue eu nec laoreet ante auctor. Massa convallis tellus sed congue nibh Curabitur purus.</p>","","11","../../media/navi_110001/_thumbs/th_bauten_2.png",NULL,"n","0","0","n","3");
INSERT INTO cms_pages VALUES ("141","53","navi_11","navi_110002","Einfamilienhaus","Bauten","2009-07-01 00:00:00","2011-12-31 00:00:00","Einfamilienhaus,Einsiedeln, nach dem Minergiestandard erbaut","<p>Die Vermietung der Wohnungen wurde schwieriger und gelang nur mit dem Versprechen, eine Küche zu sanieren. Daraus ergab sich der Ersatz aller Küchen und Bäder und eine energetische Sanierung im Minergie-Standard. Mit gezielten Eingriffen wurden Verbesserungen angebracht, ohne die Grundrisse mit dem idealen Wohnungsmix zu verändern. Das enge und dunkle Treppenhaus wurde bis auf die Fassadenflucht mit verglasten Podesten erweitert und mit grossen Fenstern geöffnet. Den giebelseitigen Wohnungen wurde ein Estrichraum zugeschlagen. In der strassenseitigen 4-1/2-Zimmer-Wohnung in Form eines zusätzlichen Zimmers, in der seeseitigen 5-1/2-Zimmer mit einer Galerie. Die Küchen der grossen Wohnungen wurden zum Korridor hin geöffnet und mit einer breiten Schiebetür versehen, was beiden Räumen Weite und Tageslicht bringt. Generell sollte die äussere Erscheinung etwa gleich bleiben, um zusammen mit zwei gleichzeitig erbauten</p>","","12","../../media_birchler/navi_110002/_thumbs/th_bauten_1.png","","n","0","0","n","1");
INSERT INTO cms_pages VALUES ("142","53","navi_11","navi_110003","Mehrfamilienhaus","Bauten","2009-01-31 00:00:00","2011-10-10 00:00:00","Die Siedlung Lincoln liegt nordöstlich vom Ortskern Einsiedeln in einer lockeren Baustruktur...","<p style=\"text-align: left;\">Die Siedlung Lincoln liegt nordöstlich vom Ortskern Einsiedeln in einer lockeren Baustruktur. Die Erschliessung vom Lincolnweg in die Tiefe des Grundstückes gleicht der bestehenden Ordnung, ebenso das Höhenniveau der neuen Gebäude. Die Siedlung vereint 6 Reiheneinfamilienhäuser und ein Mehrfamilienhaus mit 7 Wohnungen. In der grossen Gesamtform finden 13 verschieden grosse und massgeschneiderte Wohnungen Platz. Die verdichtete Bauweise erlaubt eine Differenzierung des Aussenraums in kleinere private und grosszügige halböffentliche Freiflächen. Die Gebäudestruktur richtet sich in einer NO/SW Lage aus. Die Gebäude werden über die Nordostseite erschlossen, was eine Anordnung der privaten Gärten auf der Südwestseite erlaubt, mit Blick auf das Kloster, den Ort Einsiedeln und in das Alpthal. Die Häuser wurden in Massivbauweise errichtet und mit einer Holzschalung bekleidet. Raumhohe Fensteröffnungen gestalten die Fassade.</p>","","13","../../media/navi_110003/_thumbs/th_lincoln_zwischenraum.jpg","../../media/navi_110003/_thumbs/th_lincoln_ansicht_no.jpg","b","141","140","n","2");



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
INSERT INTO cms_redirect VALUES ("4","53","78","0","anbau_mfh_bg_mythen");
INSERT INTO cms_redirect VALUES ("5","53","73","0","wohnung_baumann");
INSERT INTO cms_redirect VALUES ("6","53","77","0","dachwohnung_zuercher");
INSERT INTO cms_redirect VALUES ("7","53","72","0","efh_und_praxis_buehl");
INSERT INTO cms_redirect VALUES ("8","53","79","0","aufstockung_zfh_kael");
INSERT INTO cms_redirect VALUES ("9","53","71","0","efh_schuler");
INSERT INTO cms_redirect VALUES ("10","53","70","0","mfh_genossame_dorf_b");
INSERT INTO cms_redirect VALUES ("11","53","69","0","friedhof_einsiedeln");
INSERT INTO cms_redirect VALUES ("12","53","74","0","garten_staub");
INSERT INTO cms_redirect VALUES ("13","53","68","0","efh_egli");
INSERT INTO cms_redirect VALUES ("14","53","80","0","schulhaus_brueel_ein");
INSERT INTO cms_redirect VALUES ("15","53","67","0","musikhaus_kloster_ei");
INSERT INTO cms_redirect VALUES ("16","53","57","0","kirchgemeindehaus");
INSERT INTO cms_redirect VALUES ("17","53","55","0","siedlung_lincoln");
INSERT INTO cms_redirect VALUES ("18","53","58","0","mfh_linsi_thalwil");
INSERT INTO cms_redirect VALUES ("19","53","66","0","selgis_bruecke_muota");
INSERT INTO cms_redirect VALUES ("20","53","65","0","zfh_zentner");
INSERT INTO cms_redirect VALUES ("21","53","64","0","zfh_laschkolnig_clar");
INSERT INTO cms_redirect VALUES ("22","53","63","0","zfh_ruhstaller");
INSERT INTO cms_redirect VALUES ("23","53","61","0","zfh_reckholdern");
INSERT INTO cms_redirect VALUES ("24","53","76","0","zfh_luegeten");
INSERT INTO cms_redirect VALUES ("25","53","62","0","mfh_hirschi_schwyz");
INSERT INTO cms_redirect VALUES ("26","44","0","0","energieberatung");
INSERT INTO cms_redirect VALUES ("27","54","0","0","kontakt");
INSERT INTO cms_redirect VALUES ("28","56","0","0","links");
INSERT INTO cms_redirect VALUES ("29","52","0","0","impressum");



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
INSERT INTO cms_seiten VALUES ("56","56","1","Links","","12","0","<ul>
<li><a title=\"hempenweb die kleine feine Internetagentur\" href=\"http://www.hempenweb.ch\" target=\"_blank\">hempenweb die kleine feine Internetagentur</a></li>
</ul>","","../../media_birchler/navi_056/_thumbs/th_home_2.png","n");
INSERT INTO cms_seiten VALUES ("53","53","1","Bauten",NULL,"12","0","","",NULL,"n");
INSERT INTO cms_seiten VALUES ("55","55","1","Siedlung Lincoln, Einsiedeln Neubau 2007","","11","0","<p style=\"text-align: left;\">Die Siedlung Lincoln liegt nordöstlich vom Ortskern Einsiedeln in einer lockeren Baustruktur. Die Erschliessung vom Lincolnweg in die Tiefe des Grundstückes gleicht der bestehenden Ordnung, ebenso das Höhenniveau der neuen Gebäude. Die Siedlung vereint 6 Reiheneinfamilienhäuser und ein Mehrfamilienhaus mit 7 Wohnungen. In der grossen Gesamtform finden 13 verschieden grosse und massgeschneiderte Wohnungen Platz. Die verdichtete Bauweise erlaubt eine Differenzierung des Aussenraums in kleinere private und grosszügige halböffentliche Freiflächen. Die Gebäudestruktur richtet sich in einer NO/SW Lage aus. Die Gebäude werden über die Nordostseite erschlossen, was eine Anordnung der privaten Gärten auf der Südwestseite erlaubt, mit Blick auf das Kloster, den Ort Einsiedeln und in das Alpthal. Die Häuser wurden in Massivbauweise errichtet und mit einer Holzschalung bekleidet. Raumhohe Fensteröffnungen gestalten die Fassade.</p>","","../../media_birchler/navi_11_10/_thumbs/th_lincoln03.jpg","b");
INSERT INTO cms_seiten VALUES ("73","73","1","Wohnung Baumann",NULL,"11","0","","","../../media/navi_11_180/_thumbs/th_img_0006.jpg","b");
INSERT INTO cms_seiten VALUES ("74","74","1","Garten Staub",NULL,"11","0","","","../../media/navi_11_190/_thumbs/th_ag-694_7_b.jpg","b");
INSERT INTO cms_seiten VALUES ("51","51","1","Home","","14","0","<p>Birchler Architektur AG<br /> Allmeindstrasse 17<br />8840 Einsiedeln<br />Telefon: 055 412 77 17<br /><br /><a href=\"mailto:info@birchler-architektur.ch\">info@birchler-architektur.ch</a></p>","","../../media_birchler/navi_12/_thumbs/th_home_3.png","n");
INSERT INTO cms_seiten VALUES ("52","52","1","Impressum","","12","0","<p><strong>Betreiber &amp; Inhalt </strong><br />Birchler Architektur AG, Einsiedeln<br /><a href=\"mailto:info@birchler-architektur.ch\">info@birchler-architektur.ch</a></p>
<p><a title=\"Homepage Birchler Architektur\" href=\"http://www.birchler-architektur.ch\" target=\"_blank\">www.birchler-architektur.ch<br /></a></p>
<p>&nbsp;</p>
<p><strong>Schwarz-weiss Fotos<br /></strong>Martin Linsi, Einsiedeln</p>
<p><strong><br /></strong></p>
<p><strong>Gestaltung &amp; Design<br /></strong>Marianne Mathys, Balterswil<br /><a href=\"mailto:marianne.mathys@leunet.ch\">marianne.mathys@leunet.ch</a></p>
<p><br /><strong>Programmierung<br /></strong>Roland Hempen, Zürich <br /><a title=\"hempenweb - die kleine feine Internetagentur\" href=\"http://www.hempenweb.ch\" target=\"_blank\">www.hempenweb.ch</a></p>
<p style=\"text-align: left;\"><br /><strong>Haftungsausschluss</strong><br />Der Inhalt dieser Webseiten wird mit grösstmöglicher Sorgfalt gepflegt. Trotzdem wird für den Inhalt keine Haftung übernommen. Druckfehler, Irrtümer und Änderungen vorbehalten. Der Inhalt ist urheberrechtlich geschützt. Das gilt sowohl für die Texte, als auch für die Bilder.<br />Für die Inhalte externer Links übernehmen wir keine Haftung. Für den Inhalt der verlinkten Seiten sind ausschliesslich deren Betreiber verantwortlich.</p>
<p>&nbsp;</p>
<p>&nbsp;</p>","","../../media_birchler/navi_14/_thumbs/th_impressum_1.png","n");
INSERT INTO cms_seiten VALUES ("54","54","1","Kontakt","","11","0","<p>Wir freuen uns über Ihre Kontaktaufnahme und werden uns so schnell als möglich mit Ihnen in Verbindung setzen. Senden Sie uns Ihre Anfrage mittels untenstehendem Link.<br />Vielen Dank, Ihr Birchler-Architektur-Team</p>
<p>&nbsp;</p>
<p><span class=\"detailname\">Birchler Architektur AG</span><br /> Allmeindstrasse 17<br /> 8840 Einsiedeln</p>
<p><strong>Telefon:&nbsp; 055 412 77 17</strong></p>
<p class=\"detail_inline\"><strong>Fax:&nbsp; 055 412 54 03</strong></p>
<p>&nbsp;</p>
<p class=\"info_url\"><a title=\"Main an Birchler-Architektur\" href=\"mailto:info@birchler-architektur.ch\">info@birchler-architektur.ch</a></p>
<p><a href=\"http://www.birchler-architektur.ch\" target=\"_self\">www.birchler-architektur.ch</a></p>","","../../media_birchler/navi_13/_thumbs/th_plan_birchler.png","b");
INSERT INTO cms_seiten VALUES ("41","41","1","Über uns","","12","0","<ul>
<li></li>
<li></li>
<li></li>
<li></li>
<li><a title=\"Mail an Benjamin Müller senden\" href=\"mailto:b.mueller@birchler-architektur.ch\">Benjamin Müller</a>, Bachelor of Arts ZFH in Architektur</li>
<li><a title=\"Mail an Jörg Reding senden\" href=\"mailto:j.reding@birchler-architektur.ch\">Jörg Reding</a>, Hochbauzeichner, Bauleiter</li>
<li><a title=\"Mail an Yannick Bellmont senden\" href=\"mailto:y.bellmont@birchler-architektur.ch\">Yannick Bellmont</a>, Lernender Zeichner EFZ Fachrichtung Architektur</li>
<li><a title=\"Mail an Marion Vetsch senden\" href=\"mailto:buero@birchler-architektur.ch\">Marion Vetsch</a>, dipl. Technikerin HF Hochbau</li>
<li><a title=\"Mail an Philipp Kläui senden\" href=\"mailto:p.klaeui@birchler-architektur.ch\">Philipp Kläui</a>, Zeichner EFZ Fachrichtung Architektur</li>
<li><a title=\"Mail an Ruedi Birchler senden\" href=\"mailto:r.birchler@birchler-architektur.ch\">Ruedi Birchler</a>, dipl. Architekt ETH/SIA</li>
<li><a title=\"Mail an Simon Birchler senden\" href=\"mailto:buero@birchler-architektur.ch\">Simon Birchler</a>, Praktikant</li>
<li></li>
</ul>","","../../media_birchler/navi_07/_thumbs/th_teambirchler03.jpg","n");
INSERT INTO cms_seiten VALUES ("44","44","1","Energieberatung",NULL,"12","0","","",NULL,"n");
INSERT INTO cms_seiten VALUES ("57","57","1","Kirchgemeindehaus",NULL,"11","0","<p>Die evangelisch-reformierte Kirchgemeinde Einsiedeln ist eine Diasporagemeinde und eine der wenigen Kirchgemeinden, deren Mitgliederzahl kontinuierlich wächst. Dies führt zu weiterem Raumbedarf. Aus Kostengründen musste der Bau eines neuen Kirchgemeindezentrums mit grosszügigem Saal aufgegeben werden. Mit dem Anbau eines Kirchgemeindehauses an die Kirche, wurden deren Nutzungs-Möglichkeiten optimiert und für die Jugend und den Unterricht zusätzliche Räume geschaffen. Die Anordnung der Küche auf dem Niveau des Festplatzes und der Kirche, eine Erweiterungsmöglichkeit der Kirche und eine vollständige Behinderten-<br />Gängigkeit waren von Priorität. Die Kirche steht unter Denkmalschutz und konnte in ihrer Substanz erhalten werden. Zusammen mit dem Pfarrhaus und dem Neubau bildet sie um einen attraktiven Innenhof ein Ensemble. Auf drei unterschiedlichen Niveaus befinden sich der Vorplatz, der Pfarrgarten und der Festplatz der Kirche. Die in der Mitte gelegene Kirche behält ihre dominierende Stellung und wird mit dem neuen Zugang vom Schlüsselmattweg aufgewertet.<br />Im ersten Geschoss des Neubaus sind die Jugendräume angeordnet. Im zweiten befinden sich die Unterrichtsräume in verschiedenen Grössen. Der grösste Raum dient als Cafeteria, Kirchgemeindesaal und Erweiterung der Kirche.</p>","","../../media/navi_11_20/_thumbs/th_unbenannt-4.jpg","b");
INSERT INTO cms_seiten VALUES ("76","76","1","ZFH Luegeten",NULL,"11","0","","","../../media/navi_11_210/_thumbs/th_00031.jpg","b");
INSERT INTO cms_seiten VALUES ("58","58","1","MFH Linsi Thalwil","","11","0","<p>Die Vermietung der Wohnungen wurde schwieriger und gelang nur mit dem Versprechen, eine Küche zu sanieren. Daraus ergab sich der Ersatz aller Küchen und Bäder und eine energetische Sanierung im Minergie-Standard. Mit gezielten Eingriffen wurden Verbesserungen angebracht, ohne die Grundrisse mit dem idealen Wohnungsmix zu verändern. Das enge und dunkle Treppenhaus wurde bis auf die Fassadenflucht mit verglasten Podesten erweitert und mit grossen Fenstern geöffnet. Den giebelseitigen Wohnungen wurde ein Estrichraum zugeschlagen. In der strassenseitigen 4-1/2-Zimmer-Wohnung in Form eines zusätzlichen Zimmers, in der seeseitigen 5-1/2-Zimmer mit einer Galerie. Die Küchen der grossen Wohnungen wurden zum Korridor hin geöffnet und mit einer breiten Schiebetür versehen, was beiden Räumen Weite und Tageslicht bringt. Generell sollte die äussere Erscheinung etwa gleich bleiben, um zusammen mit zwei gleichzeitig erbauten Nachbargebäuden weiterhin ein Ensemble zu bilden, ohne jedoch die Modernisierung zu verstecken. Das in seiner Grundsubstanz solide und gut erhaltene Gebäude wurde mit einer 18cm dicken verputzten Mineralwolldämmung versehen. Die schmalen und auskragenden Balkone wurden abgefräst und auf der Südseite mit neuen, grösseren ersetzt. Es wurden neue Monobloc-Fenster eingesetzt, welche bei optimaler Dämmung von Leibung und Rahmen keinen Glaslichtverlust bringen. <br />Zum Minergie-Standard gehört auch die Komfortlüftung, die an der Zürcherstrasse auch aus Schallschutzgründen sinnvoll ist. Das Lüftungsgerät ist im Estrich platziert, die Abluft wird über teils alte, teils neue Kanäle aus den Nasszellen geführt. Die Zuluft wird über die Fassade in die Schlaf- und Wohnräume geblasen. Das Gebäude wurde im Betrieb, das heisst ohne Umzug der Bewohner saniert.</p>","","../../media_birchler/navi_11_30/_thumbs/th_linsi_aussenansicht.jpg","b");
INSERT INTO cms_seiten VALUES ("61","61","1","ZFH Reckholdern",NULL,"11","0","","","../../media/navi_11_60/_thumbs/th_nord-west.jpg","b");
INSERT INTO cms_seiten VALUES ("62","62","1","MFH Hirschi Schwyz",NULL,"11","0","<p>xfht</p>","","../../media/navi_11_70/_thumbs/th_dsc00038.jpg","b");
INSERT INTO cms_seiten VALUES ("80","80","1","Schulhaus Brüel Einsiedeln","","11","0","<p>Das Schulhaus Brüel ist das grosszügigste profane Gebäude in der Umgebung von Einsiedeln. Es dokumentiert eindrücklich die Bedeutung der Volksschule im ausgehenden 19. Jahrhundert. Aufgrund der grosszügigen räumlichen Konzeption und der, in seiner Grundstruktur sehr guten Bausubstanz kann dieses Haus der Schule durchaus weitere 100 Jahre dienen. 34 Jahre nach der letzten Gesamtsanierung wurde das Haus sanft renoviert und in Bezug auf die schulischen Einrichtungen modernisiert. Dach, Fassade, Treppenhaus und Aula wurden in enger Zusammenarbeit mit der Denkmalpflege nahe der historischen Fassung restauriert. Die Schulzimmer wurden gemäss den Bedürfnissen der Schule erneuert, d.h. mit Akustikdecken und zeitgemässen Einrichtungen versehen. Die grossen Korridore wurden mit einer Glaswand vom Treppenhaus abgetrennt und dienen nun nicht nur als Garderobe, sondern auch als Gruppenraum für die zwei dahinter liegenden Schulzimmer. Die Gruppenräume bilden den Übergang vom historischen Treppenhaus zu den modernen Schulzimmern. Mit dem Einbau eines Liftes wurde das gesamte Schulhaus rollstuhlgängig.</p>","","../../media_birchler/navi_11_220/_thumbs/th_brüel-6-1.jpg","b");
INSERT INTO cms_seiten VALUES ("63","63","1","ZFH Ruhstaller",NULL,"11","0","","","../../media/navi_11_80/_thumbs/th_dscn1408.jpg","b");
INSERT INTO cms_seiten VALUES ("64","64","1","ZFH Laschkolnig Clark",NULL,"11","0","","","../../media/navi_11_90/_thumbs/th_dsc_0192.jpg","b");
INSERT INTO cms_seiten VALUES ("65","65","1","ZFH Zentner",NULL,"11","0","","","../../media/navi_11_100/_thumbs/th_dscn0276.jpg","b");
INSERT INTO cms_seiten VALUES ("66","66","1","Selgis Brücke Muotathal",NULL,"11","0","","","../../media/navi_11_110/_thumbs/th_69570020.jpg","b");
INSERT INTO cms_seiten VALUES ("67","67","1","Musikhaus Kloster Einsiedeln",NULL,"11","0","","","../../media/navi_11_120/_thumbs/th_4155-19.jpg","b");
INSERT INTO cms_seiten VALUES ("68","68","1","EFH Egli",NULL,"11","0","","","../../media/navi_11_130/_thumbs/th_ag-673_2_b.jpg","b");
INSERT INTO cms_seiten VALUES ("69","69","1","Friedhof Einsiedeln",NULL,"11","0","","","../../media/navi_11_140/_thumbs/th_ag-674_1_b.jpg","b");
INSERT INTO cms_seiten VALUES ("70","70","1","MFH Genossame Dorf Binzen",NULL,"11","0","","","../../media/navi_11_150/_thumbs/th_ag-674_6_b.jpg","b");
INSERT INTO cms_seiten VALUES ("71","71","1","EFH Schuler",NULL,"11","0","","","../../media/navi_11_160/_thumbs/th_ag-689_8_b.jpg","b");
INSERT INTO cms_seiten VALUES ("72","72","1","EFH und Praxis Bühler",NULL,"11","0","","","../../media/navi_11_170/_thumbs/th_ag-694_5.jpg","b");
INSERT INTO cms_seiten VALUES ("77","77","1","Dachwohnung Zürcher",NULL,"1","0","","",NULL,"n");
INSERT INTO cms_seiten VALUES ("78","78","1","Anbau MFH BG Mythen",NULL,"1","0","","",NULL,"n");
INSERT INTO cms_seiten VALUES ("79","79","1","Aufstockung ZFH Kälin",NULL,"11","0","","","../../media/navi_11_220/_thumbs/th_dsc00024.jpg","b");



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
   KEY username (username)
);

#
# Daten von Tabelle 'cms_users'
#
INSERT INTO cms_users VALUES ("3","hempen","e9911456f39b5e6d738669ac8d438b20","NUMKLBD");
INSERT INTO cms_users VALUES ("4","webprog10","a3e6096dbe9169213e7880821129428e","NUBD");
INSERT INTO cms_users VALUES ("6","birchler","4c2506eaf029fef2c569ff52c0d93d1a","NUBD");


