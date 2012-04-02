#----------------------------------------------
# Backup der Datenbank cms_art4art
# Erstellt am 15.11.2011 16:59
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
INSERT INTO cms_config VALUES ("1","general","THEME","art4art",NULL,NULL);
INSERT INTO cms_config VALUES ("2","general","COPYRIGHT","art4art 2011",NULL,NULL);
INSERT INTO cms_config VALUES ("3","general","MAX_THUMBS","12",NULL,NULL);
INSERT INTO cms_config VALUES ("4","general","MAX_LIST_ITEMS","3",NULL,NULL);
INSERT INTO cms_config VALUES ("5","general","LANGUAGE","DE",NULL,NULL);
INSERT INTO cms_config VALUES ("10","menu","HMENU_RICHTUNG","right","left",NULL);
INSERT INTO cms_config VALUES ("11","menu","HMENU_SUBMENU","submenu","dropdown",NULL);
INSERT INTO cms_config VALUES ("20","pictures","THUMB_PAGE_MAX_WIDTH","98",NULL,NULL);
INSERT INTO cms_config VALUES ("21","pictures","THUMB_PAGE_MAX_HEIGHT","98",NULL,NULL);
INSERT INTO cms_config VALUES ("22","pictures","THUMB_NAVI_MAX_WIDTH","300",NULL,NULL);
INSERT INTO cms_config VALUES ("23","pictures","THUMB_NAVI_MAX_HEIGHT","300",NULL,NULL);
INSERT INTO cms_config VALUES ("24","pictures","IMAGE_MAX_WIDTH","640",NULL,NULL);
INSERT INTO cms_config VALUES ("25","pictures","IMAGE_MAX_HEIGHT","640",NULL,NULL);
INSERT INTO cms_config VALUES ("14","menu","SMURL","nein","ja",NULL);
INSERT INTO cms_config VALUES ("13","menu","SUBNAV_SOFORT","ja","nein",NULL);
INSERT INTO cms_config VALUES ("6","general","CMS_ROOT","/",NULL,NULL);
INSERT INTO cms_config VALUES ("15","menu","SMURL_REFRESH","ausf&uuml;hren","",NULL);
INSERT INTO cms_config VALUES ("12","menu","SUBMENU_DIR","vertikal","horizontal",NULL);
INSERT INTO cms_config VALUES ("8","general","EMAIL_RECEIVER","info@art4art.ch",NULL,NULL);
INSERT INTO cms_config VALUES ("32","meta-tags","KEYWORDS","",NULL,"Catering, Events, Kochen, Kochtipps, Rezepte, Suppen, Fleischgerichte, Winterthur");
INSERT INTO cms_config VALUES ("33","meta-tags","DESCRIPTION","",NULL,"feed \'n\' smile ist ein kleiner Cateringbetrieb, entstanden aus der Freude am Kochen einerseits und langjÃƒÂ¤hriger Erfahrung in der Gastronomie andererseits.");
INSERT INTO cms_config VALUES ("34","meta-tags","PAGE_TOPIC","",NULL,"Catering, Events, Kochen, Kochtipps");
INSERT INTO cms_config VALUES ("35","meta-tags","PUBLISHER","",NULL,"www.hempenweb.ch");
INSERT INTO cms_config VALUES ("26","pictures","DISK_DB_ADJUSTMENT","ausf&uuml;hren",NULL,NULL);
INSERT INTO cms_config VALUES ("7","general","TEMPLATE_DIR","frontend/themes/art4art/tpl","",NULL);
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
<p class=\"teasertext\">haben Sie Lust auf ein feines, selbstgekochtes Menu und wissen nicht, was es denn sein soll. Schauen Sie siche einfach mal in unserer Rubrik \"Rezepte\" um. Bestimmt ist etwas dabei, was Sie kochen mÃƒÂ¶chten.</p>
<p class=\"teasertext\">&gt;&gt; <a title=\"Rezepte\" href=\"/rezepte\" target=\"_self\">Rezepte</a></p>
</div>");
INSERT INTO cms_fragmente VALUES ("7","teaser2","2","<div class=\"teasertext\">
<p><strong><span style=\"text-decoration: underline;\">Serviertipp:<br /></span></strong><br />diese Sauce eignet sich nicht<br />nur als Pastasauce, sondern<br />schmeckt auch mit Kartoffelwedges<br />aus dem Ofen gut.<br /><br /></p>
</div>");
INSERT INTO cms_fragmente VALUES ("9","teaser4","4","<div class=\"teasertext\">
<h2>Kochtipp:</h2>
<p>Die Suppe mit SÃƒÂ¼sskartoffeln statt KÃƒÂ¼rbis zubereiten.<br /><br /></p>
</div>");
INSERT INTO cms_fragmente VALUES ("8","teaser3","3","<p>
<div class=\"teasertext\"><br /><img src=\"/media_feednsmile/navi_0100001/_images/holl_erbsensuppe.jpg\" alt=\"HollÃƒÂ¤ndische Erbsensuppe\" width=\"259\" height=\"194\" /></div>
</p>");



# ----------------------------------------------------------
#
# Struktur von Tabelle 'cms_galerien'
#
DROP TABLE IF EXISTS cms_galerien;
CREATE TABLE cms_galerien (
    id smallint(6) unsigned NOT NULL auto_increment,
    ref_id smallint(6) unsigned DEFAULT "0" NOT NULL,
    sortkey tinyint(3) unsigned DEFAULT "0" NOT NULL,
    type char(1),
    bildpfad varchar(125) NOT NULL,
    kommentar tinytext,
   PRIMARY KEY (id),
   KEY refid (ref_id)
);

#
# Daten von Tabelle 'cms_galerien'
#
INSERT INTO cms_galerien VALUES ("566","35","8","N","../../media_art4art/navi_11/_images/dsc50205.jpg",NULL);
INSERT INTO cms_galerien VALUES ("554","46","19","P","../../media_art4art/art0013/_images/atelier 25 canvas 97x130cm 2.jpg",NULL);
INSERT INTO cms_galerien VALUES ("555","47","1","P","../../media_art4art/eve0005/_images/atelier 26 canvas 100x100cm web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("704","16","10","P","../../media_art4art/art0001/_images/dscn28331--heureuse-famille.jpg",NULL);
INSERT INTO cms_galerien VALUES ("702","16","12","P","../../media_art4art/art0001/_images/dscn2921.jpg",NULL);
INSERT INTO cms_galerien VALUES ("686","26","8","P","../../media_art4art/art0006/_images/bild-700.jpg",NULL);
INSERT INTO cms_galerien VALUES ("685","26","7","P","../../media_art4art/art0006/_images/bild-688b.jpg",NULL);
INSERT INTO cms_galerien VALUES ("570","35","12","N","../../media_art4art/navi_11/_images/kandinskycollier2_300dpi.jpg",NULL);
INSERT INTO cms_galerien VALUES ("569","35","11","N","../../media_art4art/navi_11/_images/objekt_u_web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("568","35","10","N","../../media_art4art/navi_11/_images/hippos_300dpi.jpg",NULL);
INSERT INTO cms_galerien VALUES ("561","35","3","N","../../media_art4art/navi_11/_images/carte1.jpg",NULL);
INSERT INTO cms_galerien VALUES ("562","35","4","N","../../media_art4art/navi_11/_images/jadeanhaenger_300dpi.jpg",NULL);
INSERT INTO cms_galerien VALUES ("563","35","5","N","../../media_art4art/navi_11/_images/carte2.jpg",NULL);
INSERT INTO cms_galerien VALUES ("564","35","6","N","../../media_art4art/navi_11/_images/dsc2597.jpg",NULL);
INSERT INTO cms_galerien VALUES ("565","35","7","N","../../media_art4art/navi_11/_images/larissa-fun-schwarz.jpg",NULL);
INSERT INTO cms_galerien VALUES ("552","46","17","P","../../media_art4art/art0013/_images/p7292911 canvas 100  x 100 cm.jpg",NULL);
INSERT INTO cms_galerien VALUES ("553","46","18","P","../../media_art4art/art0013/_images/atelier 24 paper 70x70cm 11.jpg",NULL);
INSERT INTO cms_galerien VALUES ("551","46","16","P","../../media_art4art/art0013/_images/atelier 24 paper 70x70cm 10.jpg",NULL);
INSERT INTO cms_galerien VALUES ("550","46","15","P","../../media_art4art/art0013/_images/atelier 25 canvas 100x100cm 18.jpg",NULL);
INSERT INTO cms_galerien VALUES ("549","46","14","P","../../media_art4art/art0013/_images/atelier 25 canvas 97x130cm 6.jpg",NULL);
INSERT INTO cms_galerien VALUES ("547","46","12","P","../../media_art4art/art0013/_images/atelier 24 paper 70x70cm 1.jpg",NULL);
INSERT INTO cms_galerien VALUES ("548","46","13","P","../../media_art4art/art0013/_images/atelier 24 paper 70x70cm 8.jpg",NULL);
INSERT INTO cms_galerien VALUES ("567","35","9","N","../../media_art4art/navi_11/_images/o0019.jpg",NULL);
INSERT INTO cms_galerien VALUES ("559","50","3","P","../../media_art4art/exp0010/_images/bild-917b.jpg","Belvedere: Acryl auf Holz, 110 cm x 100 cm, 2008");
INSERT INTO cms_galerien VALUES ("560","50","4","P","../../media_art4art/exp0010/_images/objekte-geschichtet1.jpg","Jakob: Raku-Gef");
INSERT INTO cms_galerien VALUES ("530","30","2","P","../../media_art4art/art0010/_images/skulptur2.jpg",NULL);
INSERT INTO cms_galerien VALUES ("531","30","3","P","../../media_art4art/art0010/_images/skuptur3.jpg",NULL);
INSERT INTO cms_galerien VALUES ("754","31","2","P","../../media_art4art/art0011/_images/brueh_arve.jpg",NULL);
INSERT INTO cms_galerien VALUES ("755","31","4","P","../../media_art4art/art0011/_images/brueh_dscn0637.jpg",NULL);
INSERT INTO cms_galerien VALUES ("703","16","11","P","../../media_art4art/art0001/_images/dscn2965sc.jpg",NULL);
INSERT INTO cms_galerien VALUES ("536","45","1","P","../../media_art4art/exp0009/_images/atelier-26-paper-27x180cm-web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("537","45","2","P","../../media_art4art/exp0009/_images/atelier 26 canvas 100x100cm web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("538","46","3","P","../../media_art4art/art0013/_images/2006canvas100x100cm misted media acrylic5web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("539","46","4","P","../../media_art4art/art0013/_images/atelier 23 canvas 100x100cm 5.jpg",NULL);
INSERT INTO cms_galerien VALUES ("540","46","5","P","../../media_art4art/art0013/_images/atelier 18 2006 canvas100x100cm 13.jpg",NULL);
INSERT INTO cms_galerien VALUES ("541","46","6","P","../../media_art4art/art0013/_images/atelier 23 canvas 100x100cm 7.jpg",NULL);
INSERT INTO cms_galerien VALUES ("542","46","7","P","../../media_art4art/art0013/_images/atelier 19 2006 canvas 97x130cm3.jpg",NULL);
INSERT INTO cms_galerien VALUES ("543","46","8","P","../../media_art4art/art0013/_images/atelier 24 canvas 97x130 cm 2.jpg",NULL);
INSERT INTO cms_galerien VALUES ("544","46","9","P","../../media_art4art/art0013/_images/atelier 19 2006 canvas 100x100cm11.jpg",NULL);
INSERT INTO cms_galerien VALUES ("545","46","10","P","../../media_art4art/art0013/_images/atelier 24 canvas 97x130 cm 3web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("546","46","11","P","../../media_art4art/art0013/_images/atelier 23 canvas 100x100cm 4.jpg",NULL);
INSERT INTO cms_galerien VALUES ("457","9","2","P","../../media_art4art/exp0003/_images/eb_ecriture2b.jpg",NULL);
INSERT INTO cms_galerien VALUES ("458","9","3","P","../../media_art4art/exp0003/_images/eb_med_oiseau1b.jpg",NULL);
INSERT INTO cms_galerien VALUES ("459","9","4","P","../../media_art4art/exp0003/_images/eb_nature1b45x80cm.jpg",NULL);
INSERT INTO cms_galerien VALUES ("460","9","5","P","../../media_art4art/exp0003/_images/eb_nature2b.jpg",NULL);
INSERT INTO cms_galerien VALUES ("461","23","1","P","../../media_art4art/exp0005/_images/kamm ausst 2006 102.jpg",NULL);
INSERT INTO cms_galerien VALUES ("462","23","2","P","../../media_art4art/exp0005/_images/kamm k509.jpg",NULL);
INSERT INTO cms_galerien VALUES ("463","25","1","P","../../media_art4art/exp0006/_images/bild4.jpg",NULL);
INSERT INTO cms_galerien VALUES ("464","25","2","P","../../media_art4art/exp0006/_images/bild5.jpg",NULL);
INSERT INTO cms_galerien VALUES ("465","32","1","P","../../media_art4art/exp0007/_images/ausstellung2.jpg",NULL);
INSERT INTO cms_galerien VALUES ("466","32","2","P","../../media_art4art/exp0007/_images/ausstellung4.jpg",NULL);
INSERT INTO cms_galerien VALUES ("467","32","3","P","../../media_art4art/exp0007/_images/blockey_bild.jpg",NULL);
INSERT INTO cms_galerien VALUES ("468","32","4","P","../../media_art4art/exp0007/_images/skulptur1.jpg",NULL);
INSERT INTO cms_galerien VALUES ("469","32","5","P","../../media_art4art/exp0007/_images/skuptur3.jpg",NULL);
INSERT INTO cms_galerien VALUES ("470","33","2","P","../../media_art4art/exp0008/_images/il_libro1.jpg",NULL);
INSERT INTO cms_galerien VALUES ("471","33","3","P","../../media_art4art/exp0008/_images/il_libro2.jpg",NULL);
INSERT INTO cms_galerien VALUES ("472","33","1","P","../../media_art4art/exp0008/_images/il_libro3.jpg",NULL);
INSERT INTO cms_galerien VALUES ("473","33","4","P","../../media_art4art/exp0008/_images/il_libro4.jpg",NULL);
INSERT INTO cms_galerien VALUES ("743","22","2","P","../../media_art4art/art0005/_images/fossiles_web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("744","22","3","P","../../media_art4art/art0005/_images/peauelephant_web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("745","22","4","P","../../media_art4art/art0005/_images/spinifex_web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("690","26","2","P","../../media_art4art/art0006/_images/bild-877b.jpg",NULL);
INSERT INTO cms_galerien VALUES ("746","22","5","P","../../media_art4art/art0005/_images/terre-rouge-web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("779","57","2","P","../../media_art4art/art0019/_images/kugelobjekt.jpg",NULL);
INSERT INTO cms_galerien VALUES ("719","2","2","N","../../media_art4art/navi_2/_images/dscn1538-web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("607","51","5","P","../../media_art4art/art0014/_images/dscn1033webmail.jpg",NULL);
INSERT INTO cms_galerien VALUES ("713","46","1","P","../../media_art4art/art0013/_images/atelier 26 canvas 100x100cm web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("706","16","3","P","../../media_art4art/art0001/_images/loiseau jaune.jpg",NULL);
INSERT INTO cms_galerien VALUES ("499","16","5","P","../../media_art4art/art0001/_images/berkoukbild5.jpg",NULL);
INSERT INTO cms_galerien VALUES ("501","34","3","P","../../media_art4art/art0012/_images/1.jpg",NULL);
INSERT INTO cms_galerien VALUES ("502","34","4","P","../../media_art4art/art0012/_images/6.jpg",NULL);
INSERT INTO cms_galerien VALUES ("503","34","5","P","../../media_art4art/art0012/_images/2.jpg",NULL);
INSERT INTO cms_galerien VALUES ("504","34","6","P","../../media_art4art/art0012/_images/7.jpg",NULL);
INSERT INTO cms_galerien VALUES ("505","34","7","P","../../media_art4art/art0012/_images/3.jpg",NULL);
INSERT INTO cms_galerien VALUES ("506","34","8","P","../../media_art4art/art0012/_images/4.jpg",NULL);
INSERT INTO cms_galerien VALUES ("507","34","9","P","../../media_art4art/art0012/_images/5.jpg",NULL);
INSERT INTO cms_galerien VALUES ("508","27","8","P","../../media_art4art/art0007/_images/bild1.jpg",NULL);
INSERT INTO cms_galerien VALUES ("749","52","16","P","../../media_art4art/art0015/_images/dscn0797web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("510","27","10","P","../../media_art4art/art0007/_images/bild2.jpg",NULL);
INSERT INTO cms_galerien VALUES ("512","27","12","P","../../media_art4art/art0007/_images/bild3.jpg",NULL);
INSERT INTO cms_galerien VALUES ("636","52","2","P","../../media_art4art/art0015/_images/objekt45web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("756","31","5","P","../../media_art4art/art0011/_images/brueh_dscn0644.jpg",NULL);
INSERT INTO cms_galerien VALUES ("635","52","1","P","../../media_art4art/art0015/_images/objekt64web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("659","54","2","P","../../media_art4art/art0017/_images/dsc01139[1]web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("657","53","6","P","../../media_art4art/art0016/_images/schiff-schale_web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("658","53","7","P","../../media_art4art/art0016/_images/vase_quadrat_web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("655","53","5","P","../../media_art4art/art0016/_images/schale2_web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("656","53","1","P","../../media_art4art/art0016/_images/schale_web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("653","53","3","P","../../media_art4art/art0016/_images/neues-objekt1_web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("654","53","4","P","../../media_art4art/art0016/_images/objekt_u_web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("652","53","2","P","../../media_art4art/art0016/_images/dscn0725web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("692","26","4","P","../../media_art4art/art0006/_images/bild-933b.jpg",NULL);
INSERT INTO cms_galerien VALUES ("691","26","1","P","../../media_art4art/art0006/_images/bild-917b.jpg",NULL);
INSERT INTO cms_galerien VALUES ("742","22","1","P","../../media_art4art/art0005/_images/eb_nature1b45x80cm_web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("693","26","12","P","../../media_art4art/art0006/_images/bild-6008.jpg",NULL);
INSERT INTO cms_galerien VALUES ("529","30","1","P","../../media_art4art/art0010/_images/skulptur1.jpg",NULL);
INSERT INTO cms_galerien VALUES ("456","9","1","P","../../media_art4art/exp0003/_images/eb_ecriture1b28x51.jpg",NULL);
INSERT INTO cms_galerien VALUES ("854","7","1","P","../../media_art4art/exp0001/_images/berkoukbild1.jpg",NULL);
INSERT INTO cms_galerien VALUES ("855","7","2","P","../../media_art4art/exp0001/_images/berkoukbild2.jpg",NULL);
INSERT INTO cms_galerien VALUES ("556","2","1","N","../../media_art4art/navi_2/_images/camilla_dsc_0033.jpg",NULL);
INSERT INTO cms_galerien VALUES ("720","2","3","N","../../media_art4art/navi_2/_images/dscn1542web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("445","14","1","P","../../media_art4art/eve0002/_images/il_libro1.jpg",NULL);
INSERT INTO cms_galerien VALUES ("446","14","2","P","../../media_art4art/eve0002/_images/il_libro2.jpg",NULL);
INSERT INTO cms_galerien VALUES ("856","7","3","P","../../media_art4art/exp0001/_images/berkoukbild3.jpg",NULL);
INSERT INTO cms_galerien VALUES ("449","35","2","P","../../media_art4art/eve0004/_images/ausstellung6.jpg","Susanne M&ouml;hring");
INSERT INTO cms_galerien VALUES ("450","35","1","P","../../media_art4art/eve0004/_images/cellistin.jpg","Stefania VeritÃ ");
INSERT INTO cms_galerien VALUES ("714","46","2","P","../../media_art4art/art0013/_images/atelier-26-paper-27x180cm-w.jpg",NULL);
INSERT INTO cms_galerien VALUES ("701","16","9","P","../../media_art4art/art0001/_images/dscn2916c.jpg",NULL);
INSERT INTO cms_galerien VALUES ("699","16","8","P","../../media_art4art/art0001/_images/dscn2834[8].jpg",NULL);
INSERT INTO cms_galerien VALUES ("727","26","14","P","../../media_art4art/art0006/_images/bild_nr62.jpg",NULL);
INSERT INTO cms_galerien VALUES ("696","16","4","P","../../media_art4art/art0001/_images/bild2.jpg",NULL);
INSERT INTO cms_galerien VALUES ("697","16","6","P","../../media_art4art/art0001/_images/bild3.jpg",NULL);
INSERT INTO cms_galerien VALUES ("698","16","7","P","../../media_art4art/art0001/_images/dscn0530.jpg",NULL);
INSERT INTO cms_galerien VALUES ("605","47","2","P","../../media_art4art/eve0005/_images/atelier-26-paper-27x180cm-w.jpg",NULL);
INSERT INTO cms_galerien VALUES ("608","51","4","P","../../media_art4art/art0014/_images/fb_p1000750_web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("609","51","6","P","../../media_art4art/art0014/_images/p1000932.jpg",NULL);
INSERT INTO cms_galerien VALUES ("610","51","3","P","../../media_art4art/art0014/_images/p1010047.jpg",NULL);
INSERT INTO cms_galerien VALUES ("611","51","7","P","../../media_art4art/art0014/_images/p1010078.jpg",NULL);
INSERT INTO cms_galerien VALUES ("612","51","2","P","../../media_art4art/art0014/_images/p1010151.jpg",NULL);
INSERT INTO cms_galerien VALUES ("613","51","1","P","../../media_art4art/art0014/_images/p1010162.jpg",NULL);
INSERT INTO cms_galerien VALUES ("614","51","9","P","../../media_art4art/art0014/_images/p1010165.jpg",NULL);
INSERT INTO cms_galerien VALUES ("615","51","8","P","../../media_art4art/art0014/_images/p1010167.jpg",NULL);
INSERT INTO cms_galerien VALUES ("677","28","1","P","../../media_art4art/art0008/_images/scannen02.jpg",NULL);
INSERT INTO cms_galerien VALUES ("678","28","2","P","../../media_art4art/art0008/_images/scannen05.jpg",NULL);
INSERT INTO cms_galerien VALUES ("679","28","3","P","../../media_art4art/art0008/_images/scannen04.jpg",NULL);
INSERT INTO cms_galerien VALUES ("680","28","4","P","../../media_art4art/art0008/_images/scannen06.jpg",NULL);
INSERT INTO cms_galerien VALUES ("681","28","5","P","../../media_art4art/art0008/_images/scannen01.jpg",NULL);
INSERT INTO cms_galerien VALUES ("682","28","6","P","../../media_art4art/art0008/_images/scannen03.jpg",NULL);
INSERT INTO cms_galerien VALUES ("683","28","7","P","../../media_art4art/art0008/_images/dscn0700.jpg",NULL);
INSERT INTO cms_galerien VALUES ("684","28","8","P","../../media_art4art/art0008/_images/dscn0701.jpg",NULL);
INSERT INTO cms_galerien VALUES ("688","26","10","P","../../media_art4art/art0006/_images/bild-746_web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("687","26","9","P","../../media_art4art/art0006/_images/bild-713.jpg",NULL);
INSERT INTO cms_galerien VALUES ("748","52","15","P","../../media_art4art/art0015/_images/dscn0801web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("689","26","11","P","../../media_art4art/art0006/_images/bild-766b.jpg",NULL);
INSERT INTO cms_galerien VALUES ("753","52","20","P","../../media_art4art/art0015/_images/objekt19web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("751","52","18","P","../../media_art4art/art0015/_images/kamm himself.jpg",NULL);
INSERT INTO cms_galerien VALUES ("644","52","10","P","../../media_art4art/art0015/_images/dscn0749_web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("645","52","7","P","../../media_art4art/art0015/_images/dscn0792web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("752","52","19","P","../../media_art4art/art0015/_images/kamm-buch_web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("750","52","17","P","../../media_art4art/art0015/_images/objekt71web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("660","54","3","P","../../media_art4art/art0017/_images/dsc04627_1web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("661","54","4","P","../../media_art4art/art0017/_images/grobet3web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("662","54","5","P","../../media_art4art/art0017/_images/grobet_triadesweb.jpg",NULL);
INSERT INTO cms_galerien VALUES ("663","54","1","P","../../media_art4art/art0017/_images/mouvence7_web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("664","54","6","P","../../media_art4art/art0017/_images/pic_oe_b_01.jpg",NULL);
INSERT INTO cms_galerien VALUES ("665","54","7","P","../../media_art4art/art0017/_images/pic_oe_c_01.jpg",NULL);
INSERT INTO cms_galerien VALUES ("666","54","8","P","../../media_art4art/art0017/_images/pic_at_a_01.jpg",NULL);
INSERT INTO cms_galerien VALUES ("667","54","9","P","../../media_art4art/art0017/_images/pic_cv_01.jpg",NULL);
INSERT INTO cms_galerien VALUES ("668","55","1","P","../../media_art4art/art0018/_images/africaoracolo_web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("669","55","3","P","../../media_art4art/art0018/_images/bravi-0607-027--v_web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("670","55","4","P","../../media_art4art/art0018/_images/bravi-0607-041_web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("671","55","5","P","../../media_art4art/art0018/_images/bravi-neu-0607-014.jpg",NULL);
INSERT INTO cms_galerien VALUES ("672","55","2","P","../../media_art4art/art0018/_images/bravi-neu-0607-016.jpg",NULL);
INSERT INTO cms_galerien VALUES ("673","55","6","P","../../media_art4art/art0018/_images/bravi-neu-0607-022.jpg",NULL);
INSERT INTO cms_galerien VALUES ("674","55","7","P","../../media_art4art/art0018/_images/bravi-neu-0607-029--v.jpg",NULL);
INSERT INTO cms_galerien VALUES ("675","55","8","P","../../media_art4art/art0018/_images/bravi-neu-0607-031.jpg",NULL);
INSERT INTO cms_galerien VALUES ("694","26","13","P","../../media_art4art/art0006/_images/dscn2422.jpg",NULL);
INSERT INTO cms_galerien VALUES ("721","2","4","N","../../media_art4art/navi_2/_images/dscn0977webmail.jpg",NULL);
INSERT INTO cms_galerien VALUES ("802","58","1","P","../../media_art4art/eve0009/_images/paar.jpg",NULL);
INSERT INTO cms_galerien VALUES ("726","36","4","N","../../media_art4art/navi_3_10/_images/_images/ausstellung3.jpg",NULL);
INSERT INTO cms_galerien VALUES ("725","36","3","N","../../media_art4art/navi_3_10/_images/ausstellung1.jpg",NULL);
INSERT INTO cms_galerien VALUES ("730","48","1","P","../../media_art4art/eve0006/_images/merkle.jpg",NULL);
INSERT INTO cms_galerien VALUES ("731","48","2","P","../../media_art4art/eve0006/_images/atelier 26 canvas 100x100cm web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("732","27","11","P","../../media_art4art/art0007/_images/dscn1087.jpg",NULL);
INSERT INTO cms_galerien VALUES ("733","27","13","P","../../media_art4art/art0007/_images/dscn1098.jpg",NULL);
INSERT INTO cms_galerien VALUES ("734","27","9","P","../../media_art4art/art0007/_images/dscn1137.jpg",NULL);
INSERT INTO cms_galerien VALUES ("735","27","15","P","../../media_art4art/art0007/_images/dscn1157.jpg",NULL);
INSERT INTO cms_galerien VALUES ("736","27","14","P","../../media_art4art/art0007/_images/le voile du temps.jpg",NULL);
INSERT INTO cms_galerien VALUES ("737","27","3","P","../../media_art4art/art0007/_images/sarah.jpg",NULL);
INSERT INTO cms_galerien VALUES ("738","27","16","P","../../media_art4art/art0007/_images/scannen0013.jpg",NULL);
INSERT INTO cms_galerien VALUES ("739","27","17","P","../../media_art4art/art0007/_images/st ii.jpg",NULL);
INSERT INTO cms_galerien VALUES ("763","29","13","P","../../media_art4art/art0009/_images/placeswh-(2).jpg",NULL);
INSERT INTO cms_galerien VALUES ("764","29","14","P","../../media_art4art/art0009/_images/placeswh.jpg",NULL);
INSERT INTO cms_galerien VALUES ("747","52","14","P","../../media_art4art/art0015/_images/dscn0793web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("757","31","6","P","../../media_art4art/art0011/_images/skulptur2.jpg",NULL);
INSERT INTO cms_galerien VALUES ("758","29","9","P","../../media_art4art/art0009/_images/dscn1508.jpg",NULL);
INSERT INTO cms_galerien VALUES ("759","29","11","P","../../media_art4art/art0009/_images/dscn1510.jpg",NULL);
INSERT INTO cms_galerien VALUES ("760","29","10","P","../../media_art4art/art0009/_images/dscn1520.jpg",NULL);
INSERT INTO cms_galerien VALUES ("761","29","12","P","../../media_art4art/art0009/_images/placeswh-(1).jpg",NULL);
INSERT INTO cms_galerien VALUES ("765","29","15","P","../../media_art4art/art0009/_images/dscn2167web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("766","31","1","P","../../media_art4art/art0011/_images/dscn1338.jpg",NULL);
INSERT INTO cms_galerien VALUES ("767","31","3","P","../../media_art4art/art0011/_images/dscn1350.jpg",NULL);
INSERT INTO cms_galerien VALUES ("768","29","16","P","../../media_art4art/art0009/_images/rotweb.jpg",NULL);
INSERT INTO cms_galerien VALUES ("769","29","17","P","../../media_art4art/art0009/_images/dscn1177web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("770","27","4","P","../../media_art4art/art0007/_images/2008-mvc-090f.jpg",NULL);
INSERT INTO cms_galerien VALUES ("771","27","5","P","../../media_art4art/art0007/_images/2008-mvc-092f.jpg",NULL);
INSERT INTO cms_galerien VALUES ("772","27","6","P","../../media_art4art/art0007/_images/2008-mvc-093f.jpg",NULL);
INSERT INTO cms_galerien VALUES ("773","27","7","P","../../media_art4art/art0007/_images/2008-mvc-095f.jpg",NULL);
INSERT INTO cms_galerien VALUES ("774","27","18","P","../../media_art4art/art0007/_images/2008-mvc-096f.jpg",NULL);
INSERT INTO cms_galerien VALUES ("775","27","19","P","../../media_art4art/art0007/_images/2008-mvc-097f.jpg",NULL);
INSERT INTO cms_galerien VALUES ("776","27","20","P","../../media_art4art/art0007/_images/2008-mvc-098f.jpg",NULL);
INSERT INTO cms_galerien VALUES ("837","62","6","P","../../media_art4art/art0021/_images/garten mit 3 klein_xl.jpg",NULL);
INSERT INTO cms_galerien VALUES ("838","62","4","P","../../media_art4art/art0021/_images/f0806_xl.jpg",NULL);
INSERT INTO cms_galerien VALUES ("780","57","4","P","../../media_art4art/art0019/_images/objekt-banksia-struktur.jpg",NULL);
INSERT INTO cms_galerien VALUES ("781","57","1","P","../../media_art4art/art0019/_images/objekte-geschichtet1.jpg",NULL);
INSERT INTO cms_galerien VALUES ("782","57","3","P","../../media_art4art/art0019/_images/objekte-twisted1.jpg",NULL);
INSERT INTO cms_galerien VALUES ("786","26","3","P","../../media_art4art/art0006/_images/dscn1842_a4a.jpg",NULL);
INSERT INTO cms_galerien VALUES ("784","57","5","P","../../media_art4art/art0019/_images/paar.jpg",NULL);
INSERT INTO cms_galerien VALUES ("785","57","6","P","../../media_art4art/art0019/_images/taenzer2.jpg",NULL);
INSERT INTO cms_galerien VALUES ("794","26","6","P","../../media_art4art/art0006/_images/dscn1851.jpg",NULL);
INSERT INTO cms_galerien VALUES ("795","26","5","P","../../media_art4art/art0006/_images/dscn1843_a4a.jpg",NULL);
INSERT INTO cms_galerien VALUES ("836","62","1","P","../../media_art4art/art0021/_images/aussenbild gerade 296_xl.jpg",NULL);
INSERT INTO cms_galerien VALUES ("791","50","1","P","../../media_art4art/exp0010/_images/dscn1812.jpg",NULL);
INSERT INTO cms_galerien VALUES ("792","50","2","P","../../media_art4art/exp0010/_images/dscn1808.jpg",NULL);
INSERT INTO cms_galerien VALUES ("797","3","2","N","../../media_art4art/navi_4/_images/paar.jpg",NULL);
INSERT INTO cms_galerien VALUES ("801","39","1","N","../../media_art4art/navi_3_20/_images/paar.jpg",NULL);
INSERT INTO cms_galerien VALUES ("813","60","5","P","../../media_art4art/exp0011/_images/fri6195_xl.jpg",NULL);
INSERT INTO cms_galerien VALUES ("818","60","3","P","../../media_art4art/exp0011/_images/fri6144_xl.jpg",NULL);
INSERT INTO cms_galerien VALUES ("811","60","4","P","../../media_art4art/exp0011/_images/f0806_xl.jpg",NULL);
INSERT INTO cms_galerien VALUES ("812","60","2","P","../../media_art4art/exp0011/_images/fri6193_xl.jpg",NULL);
INSERT INTO cms_galerien VALUES ("819","61","1","P","../../media_art4art/art0020/_images/bild014_e.jpg",NULL);
INSERT INTO cms_galerien VALUES ("814","60","6","P","../../media_art4art/exp0011/_images/garten mit 3 klein_xl.jpg",NULL);
INSERT INTO cms_galerien VALUES ("815","60","7","P","../../media_art4art/exp0011/_images/hauptbild_xl.jpg",NULL);
INSERT INTO cms_galerien VALUES ("816","60","8","P","../../media_art4art/exp0011/_images/jardin magique_xl.jpg",NULL);
INSERT INTO cms_galerien VALUES ("817","60","1","P","../../media_art4art/exp0011/_images/aussenbild gerade 296_xl.jpg",NULL);
INSERT INTO cms_galerien VALUES ("861","68","1","P","../../media_art4art/art0022/_images/dsc_0081.jpg",NULL);
INSERT INTO cms_galerien VALUES ("821","61","4","P","../../media_art4art/art0020/_images/bild013_e.jpg",NULL);
INSERT INTO cms_galerien VALUES ("822","61","5","P","../../media_art4art/art0020/_images/bild017_e.jpg",NULL);
INSERT INTO cms_galerien VALUES ("823","61","6","P","../../media_art4art/art0020/_images/bild09_e.jpg",NULL);
INSERT INTO cms_galerien VALUES ("824","61","7","P","../../media_art4art/art0020/_images/bild0047_e.jpg",NULL);
INSERT INTO cms_galerien VALUES ("825","61","2","P","../../media_art4art/art0020/_images/bild003_e.jpg",NULL);
INSERT INTO cms_galerien VALUES ("826","61","8","P","../../media_art4art/art0020/_images/bild009_e.jpg",NULL);
INSERT INTO cms_galerien VALUES ("827","61","3","P","../../media_art4art/art0020/_images/bild037_e.jpg",NULL);
INSERT INTO cms_galerien VALUES ("857","7","4","P","../../media_art4art/exp0001/_images/berkoukbild5.jpg",NULL);
INSERT INTO cms_galerien VALUES ("862","68","2","P","../../media_art4art/art0022/_images/afrika-2009.jpg",NULL);
INSERT INTO cms_galerien VALUES ("872","69","2","P","../../media_art4art/exp0013/_images/souffle-1aa-copym.jpg",NULL);
INSERT INTO cms_galerien VALUES ("850","65","2","P","../../media_art4art/exp0012/_images/2.jpg",NULL);
INSERT INTO cms_galerien VALUES ("851","65","3","P","../../media_art4art/exp0012/_images/41090367_karte-4.jpg",NULL);
INSERT INTO cms_galerien VALUES ("884","71","20","P","../../media_art4art/exp0014/_images/3 ringe.jpg",NULL);
INSERT INTO cms_galerien VALUES ("839","62","7","P","../../media_art4art/art0021/_images/hauptbild_xl.jpg",NULL);
INSERT INTO cms_galerien VALUES ("840","62","3","P","../../media_art4art/art0021/_images/fri6144_xl.jpg",NULL);
INSERT INTO cms_galerien VALUES ("841","62","8","P","../../media_art4art/art0021/_images/jardin magique_xl.jpg",NULL);
INSERT INTO cms_galerien VALUES ("842","62","2","P","../../media_art4art/art0021/_images/fri6193_xl.jpg",NULL);
INSERT INTO cms_galerien VALUES ("843","62","5","P","../../media_art4art/art0021/_images/fri6195_xl.jpg",NULL);
INSERT INTO cms_galerien VALUES ("844","63","1","P","../../media_art4art/eve0011/_images/hauptbild_xl.jpg",NULL);
INSERT INTO cms_galerien VALUES ("845","63","2","P","../../media_art4art/eve0011/_images/jardin-magique-ii_2.jpg",NULL);
INSERT INTO cms_galerien VALUES ("846","65","1","P","../../media_art4art/exp0012/_images/kamelberkouk_ausstellungsbild1.jpg",NULL);
INSERT INTO cms_galerien VALUES ("860","67","1","P","../../media_art4art/eve0014/_images/a4a_brasil.jpg",NULL);
INSERT INTO cms_galerien VALUES ("863","68","3","P","../../media_art4art/art0022/_images/18_2.jpg",NULL);
INSERT INTO cms_galerien VALUES ("869","69","1","P","../../media_art4art/exp0013/_images/dsc_0081.jpg",NULL);
INSERT INTO cms_galerien VALUES ("867","68","4","P","../../media_art4art/art0022/_images/ek-2009-056.jpg",NULL);
INSERT INTO cms_galerien VALUES ("885","71","8","P","../../media_art4art/exp0014/_images/airstream-c copy.jpg",NULL);
INSERT INTO cms_galerien VALUES ("878","70","4","P","../../media_art4art/eve0015/_images/web-p1010035.jpg",NULL);
INSERT INTO cms_galerien VALUES ("874","70","1","P","../../media_art4art/eve0015/_images/web-kraehen-dsc_6032b.jpg",NULL);
INSERT INTO cms_galerien VALUES ("875","70","2","P","../../media_art4art/eve0015/_images/web-kraehen-p1010022b.jpg",NULL);
INSERT INTO cms_galerien VALUES ("876","70","3","P","../../media_art4art/eve0015/_images/web-p1010001b.jpg",NULL);
INSERT INTO cms_galerien VALUES ("879","71","11","P","../../media_art4art/exp0014/_images/atelier 25 canvas 97x130cm 6.jpg",NULL);
INSERT INTO cms_galerien VALUES ("880","71","4","P","../../media_art4art/exp0014/_images/p1010225-rgb.jpg",NULL);
INSERT INTO cms_galerien VALUES ("932","77","1","P","../../media_art4art/exp0016/_images/landschaft-01.jpg",NULL);
INSERT INTO cms_galerien VALUES ("910","74","2","P","../../media_art4art/exp0015/_images/2010-03-kamm-p1010511.jpg",NULL);
INSERT INTO cms_galerien VALUES ("909","74","1","P","../../media_art4art/exp0015/_images/2010-03-11-p1010523.jpg",NULL);
INSERT INTO cms_galerien VALUES ("886","71","12","P","../../media_art4art/exp0014/_images/atelier 26 canvas 100x100cm web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("887","71","18","P","../../media_art4art/exp0014/_images/dsc01139[1]web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("888","71","16","P","../../media_art4art/exp0014/_images/dscn1338b.jpg",NULL);
INSERT INTO cms_galerien VALUES ("889","71","21","P","../../media_art4art/exp0014/_images/jardin magique.jpg",NULL);
INSERT INTO cms_galerien VALUES ("890","71","19","P","../../media_art4art/exp0014/_images/nk009---kopie-(2).jpg",NULL);
INSERT INTO cms_galerien VALUES ("892","71","5","P","../../media_art4art/exp0014/_images/p1000521.jpg",NULL);
INSERT INTO cms_galerien VALUES ("893","71","6","P","../../media_art4art/exp0014/_images/p1000688b.jpg",NULL);
INSERT INTO cms_galerien VALUES ("894","71","7","P","../../media_art4art/exp0014/_images/p1000520.jpg",NULL);
INSERT INTO cms_galerien VALUES ("895","71","13","P","../../media_art4art/exp0014/_images/p4205668.jpg",NULL);
INSERT INTO cms_galerien VALUES ("896","71","14","P","../../media_art4art/exp0014/_images/p7246422.jpg",NULL);
INSERT INTO cms_galerien VALUES ("897","71","15","P","../../media_art4art/exp0014/_images/p8124298.jpg",NULL);
INSERT INTO cms_galerien VALUES ("898","71","9","P","../../media_art4art/exp0014/_images/p1010036.jpg",NULL);
INSERT INTO cms_galerien VALUES ("899","71","10","P","../../media_art4art/exp0014/_images/p1010058.jpg",NULL);
INSERT INTO cms_galerien VALUES ("900","71","17","P","../../media_art4art/exp0014/_images/p1020955b.jpg",NULL);
INSERT INTO cms_galerien VALUES ("901","72","1","P","../../media_art4art/eve0016/_images/merkle.jpg",NULL);
INSERT INTO cms_galerien VALUES ("902","72","2","P","../../media_art4art/eve0016/_images/2010-01-l1020528.jpg",NULL);
INSERT INTO cms_galerien VALUES ("903","72","3","P","../../media_art4art/eve0016/_images/2010-01-l1020522.jpg",NULL);
INSERT INTO cms_galerien VALUES ("904","71","3","P","../../media_art4art/exp0014/_images/2008-mvc-096f.jpg",NULL);
INSERT INTO cms_galerien VALUES ("905","71","2","P","../../media_art4art/exp0014/_images/2010-01-l1020522.jpg",NULL);
INSERT INTO cms_galerien VALUES ("906","71","1","P","../../media_art4art/exp0014/_images/2010-01-l1020528.jpg",NULL);
INSERT INTO cms_galerien VALUES ("931","1","2","N","../../media_art4art/navi_1/_images/etienne-k.jpg",NULL);
INSERT INTO cms_galerien VALUES ("913","76","1","P","../../media_art4art/eve0018/_images/kamm-himself.jpg",NULL);
INSERT INTO cms_galerien VALUES ("914","76","2","P","../../media_art4art/eve0018/_images/p1010912web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("915","76","3","P","../../media_art4art/eve0018/_images/048web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("916","76","4","P","../../media_art4art/eve0018/_images/p1020060w.jpg",NULL);
INSERT INTO cms_galerien VALUES ("917","77","3","P","../../media_art4art/exp0016/_images/von_ballmoos1w.jpg",NULL);
INSERT INTO cms_galerien VALUES ("928","79","1","P","../../media_art4art/eve0019/_images/cm-058-(9)web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("922","78","1","P","../../media_art4art/exp0017/_images/cm 047.jpg",NULL);
INSERT INTO cms_galerien VALUES ("920","77","4","P","../../media_art4art/exp0016/_images/vb4w.jpg",NULL);
INSERT INTO cms_galerien VALUES ("926","78","2","P","../../media_art4art/exp0017/_images/dscn3617w.jpg",NULL);
INSERT INTO cms_galerien VALUES ("927","78","3","P","../../media_art4art/exp0017/_images/dscn3615w.jpg",NULL);
INSERT INTO cms_galerien VALUES ("929","79","2","P","../../media_art4art/eve0019/_images/cm 019.jpg",NULL);
INSERT INTO cms_galerien VALUES ("930","1","1","N","../../media_art4art/navi_1/_images/landschaft-01.jpg",NULL);
INSERT INTO cms_galerien VALUES ("933","77","2","P","../../media_art4art/exp0016/_images/etienne-k.jpg",NULL);
INSERT INTO cms_galerien VALUES ("935","80","2","P","../../media_art4art/art0023/_images/ballmoos02.jpg",NULL);
INSERT INTO cms_galerien VALUES ("936","80","3","P","../../media_art4art/art0023/_images/ballmoosk5.jpg",NULL);
INSERT INTO cms_galerien VALUES ("937","80","1","P","../../media_art4art/art0023/_images/landschaft-01.jpg",NULL);
INSERT INTO cms_galerien VALUES ("938","80","4","P","../../media_art4art/art0023/_images/vb4w.jpg",NULL);
INSERT INTO cms_galerien VALUES ("939","80","5","P","../../media_art4art/art0023/_images/von_ballmoos1w.jpg",NULL);
INSERT INTO cms_galerien VALUES ("941","80","6","P","../../media_art4art/art0023/_images/dsc_3223bw.jpg",NULL);
INSERT INTO cms_galerien VALUES ("942","81","1","P","../../media_art4art/eve0020/_images/alex-wilson.jpg","Alex Wilson, Piano");
INSERT INTO cms_galerien VALUES ("943","81","2","P","../../media_art4art/eve0020/_images/rodrigo-aravena.jpg","Rodrigo Aravena, Bass");
INSERT INTO cms_galerien VALUES ("944","82","1","P","../../media_art4art/eve0021/_images/etienne-k.jpg",NULL);
INSERT INTO cms_galerien VALUES ("945","82","2","P","../../media_art4art/eve0021/_images/temps-suspendu-miroir-2008-.jpg",NULL);
INSERT INTO cms_galerien VALUES ("946","81","3","P","../../media_art4art/eve0020/_images/dsc_3220-web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("947","81","4","P","../../media_art4art/eve0020/_images/dsc_3223bw.jpg",NULL);
INSERT INTO cms_galerien VALUES ("948","81","5","P","../../media_art4art/eve0020/_images/p1020463-web.jpg",NULL);
INSERT INTO cms_galerien VALUES ("949","82","3","P","../../media_art4art/eve0021/_images/dsc_3223bw.jpg",NULL);
INSERT INTO cms_galerien VALUES ("950","5","1","N","../../media_art4art/navi_6/_images/dscn2965sc.jpg","");
INSERT INTO cms_galerien VALUES ("951","1","3","N","../../media_art4art/navi_1/_images/paintings_0241w.jpg","");
INSERT INTO cms_galerien VALUES ("952","1","4","N","../../media_art4art/navi_1/_images/paintings_0312w.jpg","");
INSERT INTO cms_galerien VALUES ("953","6","1","N","../../media_art4art/navi_7/_images/berkoukbild5.jpg","");
INSERT INTO cms_galerien VALUES ("954","6","2","N","../../media_art4art/navi_7/_images/dscn28331--heureuse-famille.jpg","");
INSERT INTO cms_galerien VALUES ("955","6","3","N","../../media_art4art/navi_7/_images/dscn2834[8].jpg","");
INSERT INTO cms_galerien VALUES ("956","29","1","N","../../media_art4art/navi_10/_images/annabelle2.jpg","");
INSERT INTO cms_galerien VALUES ("957","29","2","N","../../media_art4art/navi_10/_images/vitrine.jpg","");
INSERT INTO cms_galerien VALUES ("958","27","21","P","../../media_art4art/art0007/_images/bild4.jpg","");
INSERT INTO cms_galerien VALUES ("959","27","22","P","../../media_art4art/art0007/_images/bild5.jpg","");
INSERT INTO cms_galerien VALUES ("960","27","23","P","../../media_art4art/art0007/_images/bild6.jpg","");
INSERT INTO cms_galerien VALUES ("961","27","24","P","../../media_art4art/art0007/_images/bild7.jpg","");
INSERT INTO cms_galerien VALUES ("962","27","25","P","../../media_art4art/art0007/_images/bild8.jpg","");
INSERT INTO cms_galerien VALUES ("963","28","9","P","../../media_art4art/art0008/_images/ausstellung1.jpg","");
INSERT INTO cms_galerien VALUES ("964","29","18","P","../../media_art4art/art0009/_images/a4a-2-w.jpg","");
INSERT INTO cms_galerien VALUES ("965","90","1","P","../../media_art4art/art0024/_images/da3.jpg","");
INSERT INTO cms_galerien VALUES ("966","90","2","P","../../media_art4art/art0024/_images/paintings_0241w.jpg","");
INSERT INTO cms_galerien VALUES ("967","90","3","P","../../media_art4art/art0024/_images/paintings_0253.jpg","");
INSERT INTO cms_galerien VALUES ("968","90","4","P","../../media_art4art/art0024/_images/paintings_0312w.jpg","");
INSERT INTO cms_galerien VALUES ("969","90","5","P","../../media_art4art/art0024/_images/sculptures_0226w.jpg","");
INSERT INTO cms_galerien VALUES ("970","84","1","P","../../media_art4art/eve0022/_images/2010-01-l1020522.jpg","");
INSERT INTO cms_galerien VALUES ("971","84","2","P","../../media_art4art/eve0022/_images/2010-03-11-p1010523.jpg","");
INSERT INTO cms_galerien VALUES ("972","84","3","P","../../media_art4art/eve0022/_images/atelier 25 canvas 97x130cm 6.jpg","");
INSERT INTO cms_galerien VALUES ("973","84","4","P","../../media_art4art/eve0022/_images/dscn2172_web.jpg","");
INSERT INTO cms_galerien VALUES ("974","87","1","P","../../media_art4art/eve0023/_images/2011-06-11-acc-bel-2523.jpg","");
INSERT INTO cms_galerien VALUES ("975","87","2","P","../../media_art4art/eve0023/_images/2011-06-21-acc-bou-p1030987.jpg","");
INSERT INTO cms_galerien VALUES ("976","87","3","P","../../media_art4art/eve0023/_images/2011-06-21-acc-kram-p104000.jpg","");
INSERT INTO cms_galerien VALUES ("977","87","4","P","../../media_art4art/eve0023/_images/2011-06-21-acc-munu-p103094.jpg","");
INSERT INTO cms_galerien VALUES ("978","87","5","P","../../media_art4art/eve0023/_images/2011-06-21-kamm-p1040011.jpg","");
INSERT INTO cms_galerien VALUES ("979","88","1","P","../../media_art4art/eve0024/_images/2011-06-21-acc-bou-p1030987.jpg","");
INSERT INTO cms_galerien VALUES ("980","88","2","P","../../media_art4art/eve0024/_images/earth-womb-coll-on-canv-web.jpg","");
INSERT INTO cms_galerien VALUES ("981","89","1","P","../../media_art4art/eve0025/_images/paintings_0241w.jpg","");
INSERT INTO cms_galerien VALUES ("982","89","2","P","../../media_art4art/eve0025/_images/sculptures_0226w.jpg","");
INSERT INTO cms_galerien VALUES ("983","83","1","P","../../media_art4art/exp0018/_images/p1020913aw.jpg","");
INSERT INTO cms_galerien VALUES ("984","83","2","P","../../media_art4art/exp0018/_images/p1020916w.jpg","");
INSERT INTO cms_galerien VALUES ("985","83","3","P","../../media_art4art/exp0018/_images/p1020919w.jpg","");
INSERT INTO cms_galerien VALUES ("986","85","1","P","../../media_art4art/exp0019/_images/2011-06-11-acc-bel-2523-ii.jpg","");
INSERT INTO cms_galerien VALUES ("987","85","2","P","../../media_art4art/exp0019/_images/2011-06-21-acc-bou-p1030987.jpg","");
INSERT INTO cms_galerien VALUES ("988","85","3","P","../../media_art4art/exp0019/_images/2011-06-21-acc-kram-p104000.jpg","");
INSERT INTO cms_galerien VALUES ("989","85","4","P","../../media_art4art/exp0019/_images/2011-06-21-acc-munu-p103094.jpg","");
INSERT INTO cms_galerien VALUES ("990","85","5","P","../../media_art4art/exp0019/_images/2011-06-21-kamm-p1040011.jpg","");
INSERT INTO cms_galerien VALUES ("991","85","6","P","../../media_art4art/exp0019/_images/phoca_thumb_l_dream sequence4.jpg","");
INSERT INTO cms_galerien VALUES ("992","86","1","P","../../media_art4art/exp0020/_images/phoca_thumb_l_brailoi4.jpg","");
INSERT INTO cms_galerien VALUES ("993","86","2","P","../../media_art4art/exp0020/_images/phoca_thumb_l_dream sequence4.jpg","");
INSERT INTO cms_galerien VALUES ("994","91","1","P","../../media_art4art/exp0021/_images/da3.jpg","");
INSERT INTO cms_galerien VALUES ("995","91","2","P","../../media_art4art/exp0021/_images/paintings_0241w.jpg","");
INSERT INTO cms_galerien VALUES ("996","91","3","P","../../media_art4art/exp0021/_images/paintings_0253.jpg","");
INSERT INTO cms_galerien VALUES ("997","91","4","P","../../media_art4art/exp0021/_images/paintings_0312w.jpg","");
INSERT INTO cms_galerien VALUES ("998","91","5","P","../../media_art4art/exp0021/_images/sculptures_0154b.jpg","");
INSERT INTO cms_galerien VALUES ("999","91","6","P","../../media_art4art/exp0021/_images/sculptures_0226w.jpg","");
INSERT INTO cms_galerien VALUES ("1008","92","4","P","../../media_art4art/navi_40026/_images/dscn0530.jpg","");
INSERT INTO cms_galerien VALUES ("1007","92","3","P","../../media_art4art/navi_40026/_images/bild3.jpg","");
INSERT INTO cms_galerien VALUES ("1006","92","2","P","../../media_art4art/navi_40026/_images/bild2.jpg","");
INSERT INTO cms_galerien VALUES ("1005","92","1","P","../../media_art4art/navi_40026/_images/berkoukbild5.jpg","");
INSERT INTO cms_galerien VALUES ("1009","92","5","P","../../media_art4art/navi_40026/_images/dscn28331--heureuse-famille.jpg","");
INSERT INTO cms_galerien VALUES ("1010","93","1","P","../../media_art4art/navi_110007/_images/berkoukbild5.jpg","");



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
INSERT INTO cms_modules VALUES ("1","PAGES_OVERVIEW","Auflisten aller Artisten");
INSERT INTO cms_modules VALUES ("2","LIST_EXPOS_EVENTS","Auflisten aller Expos oder Events");
INSERT INTO cms_modules VALUES ("3","READ_TOP_EXPO_EVENT","Auflisten aktuellste Event und Expo");
INSERT INTO cms_modules VALUES ("4","KONTAKTFORMULAR","Kontaktformular");
INSERT INTO cms_modules VALUES ("5","LIST_BOUTIQUE","Auflisten aller Boutiqueseiten");



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
    nav_type set('','S','X','L','K','V'),
   PRIMARY KEY (nav_id),
   KEY domain (domain)
);

#
# Daten von Tabelle 'cms_navigation'
#
INSERT INTO cms_navigation VALUES ("1",NULL,"1","0","home","home","navi_1","j","n","S");
INSERT INTO cms_navigation VALUES ("2",NULL,"2","0","&uuml;ber uns","&uuml;beruns","navi_2","j","n",NULL);
INSERT INTO cms_navigation VALUES ("3","navi_4","3","0","events","events","navi_4","j","n","X");
INSERT INTO cms_navigation VALUES ("4","navi_3","5","0","expos","expos","navi_3","j","n","X");
INSERT INTO cms_navigation VALUES ("5",NULL,"6","0","dienste","dienste","navi_6","j","n",NULL);
INSERT INTO cms_navigation VALUES ("6",NULL,"7","0","medien","medien","navi_7","j","n",NULL);
INSERT INTO cms_navigation VALUES ("11","navi_5","4","0","k&uuml;nstler","k&uuml;nstler","navi_5","j","n","X");
INSERT INTO cms_navigation VALUES ("20",NULL,"10","0","impressum","impressum","navi_9","j","n","S");
INSERT INTO cms_navigation VALUES ("42","navi_5","4","10","malerei","malerei","navi_5_10","j","n",NULL);
INSERT INTO cms_navigation VALUES ("43","navi_5","4","20","objektkunst","objektkunst","navi_5_20","j","n",NULL);
INSERT INTO cms_navigation VALUES ("28",NULL,"8","0","links","links","navi_8","j","n","S");
INSERT INTO cms_navigation VALUES ("29",NULL,"9","0","kontakt & zeiten","kontakt","navi_10","j","n","S");
INSERT INTO cms_navigation VALUES ("32","navi_4","3","10","laufend","laufend","navi_4_10","j","n","L");
INSERT INTO cms_navigation VALUES ("33","navi_4","3","20","kommend","kommend","navi_4_20","j","n","K");
INSERT INTO cms_navigation VALUES ("34","navi_4","3","30","vergangen","vergangen","navi_4_30","j","n","V");
INSERT INTO cms_navigation VALUES ("35","navi_11","12","0","la boutique","laboutique","navi_11","j","n","X");
INSERT INTO cms_navigation VALUES ("36","navi_3","5","10","laufend","laufend","navi_3_10","j","n","L");
INSERT INTO cms_navigation VALUES ("39","navi_3","5","20","kommend","kommend","navi_3_20","j","n","K");
INSERT INTO cms_navigation VALUES ("38","navi_12","11","0","news","news","navi_12","n","n","");
INSERT INTO cms_navigation VALUES ("40","navi_3","5","30","vergangen","vergangen","navi_3_30","j","n","V");
INSERT INTO cms_navigation VALUES ("41","navi_5","4","30","skulpturen","skulpturen","navi_5_30","j","n",NULL);



# ----------------------------------------------------------
#
# Struktur von Tabelle 'cms_pages'
#
DROP TABLE IF EXISTS cms_pages;
CREATE TABLE cms_pages (
    page_id smallint(6) unsigned NOT NULL auto_increment,
    nav_id smallint(6) unsigned DEFAULT "0" NOT NULL,
    domain varchar(10) NOT NULL,
    kennzeichen varchar(15) NOT NULL,
    name varchar(125) NOT NULL,
    fach varchar(20) NOT NULL,
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
INSERT INTO cms_pages VALUES ("7","34","navi_3","exp0001","Kamel Berkouk: L\'oiseau jaune","vergangen","2008-06-01 00:00:00","2008-06-25 00:00:00","Eröffnung der Ausstellung am Donnerstag, 31. Mai 2007, 18.30 — 21.00 Uhr, Einführung durch die Galeristin","&lt;p&gt;
Von der naiven Malerei herkommend, hat Berkouk einen sehr persönlichen Stil entwickelt: vordergründig einfache Tier- und Menschengestalten stehen im spielerischen Dialog miteinander. Die an der Grenze zwischen abstrakt und konkret stehenden Formen erzählen Geschichten, stellen Szenen und Beziehungen dar. 
&lt;/p&gt;
&lt;div align=&quot;left&quot;&gt;
Kamel Berkouk ist 1967 als neuntes Kind einer algerischen Familie in Mulhouse (F) geboren und hat ein Studium an der Kunstakademie begonnen, entwickelte sich jedoch autodidaktisch weiter.&lt;br /&gt;
&lt;/div&gt;
&lt;p&gt;
Heute ist er nicht nur in Frankreich anerkannt, wo beispielsweise das Mulhouse Fine Arts Museum seine Werke sammelt, sondern auch in Deutschland, Belgien, Holland, den USA und den Emiraten, wo er stark umworben wird. 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;Vernissage&lt;/h3&gt;
&lt;p&gt;
Eröffnung der Ausstellung am Donnerstag, 31. Mai 2007, 18:30 – 21:00 Uhr&lt;br /&gt;
Einführung durch die Galeristin 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;Apéro&lt;/h3&gt;
&lt;p&gt;
Sonntag, 16. Juni, 10.30 – 14.30 Uhr 
&lt;/p&gt;
&lt;p&gt;
Sommerpause&lt;br /&gt;
16. Juli – 4. August 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;Finissage&lt;/h3&gt;
&lt;p&gt;
Samstag, 25. August, 10.30 – 14.30 Uhr 
&lt;/p&gt;
&lt;p&gt;
Kamel Berkouk 
&lt;/p&gt;
","","1","../../media_art4art/exp0001/_thumbs/th_berkoukbild1.jpg","../../media_art4art/exp0001/_thumbs/th_berkoukbild2.jpg","n","0","0","j","1");
INSERT INTO cms_pages VALUES ("8","34","navi_3","exp0002","Giuseppe Bravi: Afrika","vergangen","2007-08-18 00:00:00","2008-05-15 00:00:00","Vernissage Donnerstag, 15. Mai, 18:30-21:00 Uhr
Einführung durch Dr. Barbara von Orelli-Messerli, Kunsthistorikerin","Gemäldeausstellung von Giuseppe Bravi und Giovanni Tomasoni.&lt;br /&gt;
Zwei grosse Künstler, Bravi und Tomasoni,wollten die Ausstellung\' Afrika\' zusammen gestalten.&lt;br /&gt;
&lt;br /&gt;
&lt;h3&gt;Giuseppe Bravi&lt;/h3&gt;folgt den Weg vom Formalismus zum Informellen mit einer gewagten, fast unkontrollierbaren Kühnheit. Der Maler aus Brescia scheint sich auf Strassen zu bewegen, die von einer geistigen, nicht automatischen Bewegung schliesslich in die Realität führen. Für Bravi muss das Leben ausgedrückt und überdacht werden in seiner ganzen Vollständigkeit. &lt;br /&gt;
Er lebt und arbeitet in Gavardo und Gardone Riviera und hat an zahlreichen Ausstellungen in Italien und im Ausland teilgenommen.&lt;br /&gt;
&lt;br /&gt;
&lt;h3&gt;Giovanni B. Tomasoni&lt;/h3&gt;ist eine Bote der höheren Ebenen mit seiner ruhigen, intelligenten Anwesenheit.Er bevorzugt schwarz als Farbe des Absoluten, schwarz, die Farbe, die nicht etwas Ewiges hat, sondern nur die Basis ist, auf der sich alle Dinge bewegen, um sich in höhere Ebenen zu begeben bis zum Licht. Tomasoni gebraucht abgelegtes,hässliches Material wie eine Erziehung zur harten und rohen Einfachheit. Seine Ausdrucksweise ist wie ein direkter, ungeschliffener Expressionismus, der mit verschiedenen Techniken die Gefühle der Wirklichkeit ausdrückt.Der Künstler wohnt und arbeitet in Brescia und hat an zahlreichen Ausstellungen in Italien und im Ausland teilgenommen. 
",NULL,"2",NULL,NULL,"n","0","0","j","21");
INSERT INTO cms_pages VALUES ("45","34","navi_3","exp0009","Jeanick Bouys: &quot;Spuren&quot; – &quot;traces&quot;","vergangen","2008-09-04 00:00:00","2008-10-25 00:00:00","Die Werke von Bouys erinnnern an Felder, weisen archaische, afrikanisch anmutende Zeichen und immer...","...wieder tritt eine merkwürdige Vogel-Gestalt als Silouhette in Erscheinung.&lt;br /&gt;
Brilliant geht er mit Farben und Formen um, dieser Künstler, der lange in einem Atelier in New York gearbeitet hat. Seine Werke findet man in Frankreich, in der Schweiz, in Japan und in den USA.&lt;br /&gt;
&lt;br /&gt;
Jeanick Bouys zeigt in dieser Ausstellung Bildschöpfungen von einer grossen Leuchtkraft,
welche die Fresco-Technik mit afrikanischen Mustern verknüpft. Es sind abstrakte Bilder, die aufgrund der vielschichtigen, transparenten Maltechnik Tiefenwirkung erhalten und
kraftvoll sind. Manchmal dominiert eine Farbe das Bildgeschehen, manchmal die Zeichen,
manchmal der bobo. Mit feinem Gespür für Harmonien innnerhalb eines Farbklangs wählt
und trägt der Künstler die vielen Farblasuren der Naturpigmente übereinander auf.
","","2","../../media_art4art/exp0009/_thumbs/th_atelier 26 canvas 100x100cm web.jpg","../../media_art4art/exp0009/_thumbs/th_atelier-26-paper-27x180cm-web.jpg","n","46","0","j","20");
INSERT INTO cms_pages VALUES ("40","35","navi_11","btq0005","Kunstkarten","la_boutique","0000-00-00 00:00:00","0000-00-00 00:00:00","Kunstkarten","","","2","","","n","0","0","j","6");
INSERT INTO cms_pages VALUES ("9","34","navi_3","exp0003","Elisabeth Beurret: Art du papier en musée d\'art","vergangen","2008-04-12 00:00:00","2008-08-14 00:00:00","Vernissage Donnerstag, 12. August, 18.30 – 21.00 Uhr","&lt;p&gt;
Schon die verschiedenen Bäume und Blätter haben ihre eigene Symbolik: die Ulme, Symbol des Edelmutes, die zu verschwinden droht oder der Ginkgo ein lebendes Fossil, unverändert seit der Zeit der Dinosaurier. Er ist ein Symbol von Langlebigkeit, das seit Menschengedenken in China und Japan verehrt wird. In ihrem Atelier werden diese Rohmaterialien mit sehr verschiedenen traditionellen und experimentellen Techniken zu Papier verarbeitet. 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;Vernissage&lt;/h3&gt;
&lt;p&gt;
Donnerstag, 12.8.2007, 18.30 – 21.00 Uhr 
&lt;/p&gt;
","","2","../../media_art4art/exp0003/_thumbs/th_eb_ecriture2b.jpg","../../media_art4art/exp0003/_thumbs/th_eb_nature1b45x80cm.jpg","n","22","0","j","19");
INSERT INTO cms_pages VALUES ("14","33","navi_4","eve0002","Lesung: &quot;Reise durch Zeit und Raum&quot;","kommend","0000-00-00 00:00:00","0000-00-00 00:00:00","9.9.2007 18.00 Uhr - Dalmazio Ambrosini liest Texte über das Werk von Pier Daniele La Rocca.","<p>
Reise durch die Zeit, Reise durch den Raum, physische Reise aber vor allem die Reise in das Innere. Auf dieser Wanderung begegnet er Zeugen und kulturellen Wahrzeichen, mal Gestalten, mal Texten, Gedanken, Philosophien, Werke und Zeichen, durch welche er unsere Auseinandersetzung mit der Gegenwart zu interpretieren sucht. 
</p>
<p>
Während dem sich La Rocca in den früheren Ausstellungen mit den alten Kulturen befasste, steht in dieser Ausstellung das Nomadentum im Vordergrund. Sein Werk ist durch eine \"expressionistische Symbolik\" charakterisiert und durch Interpretationen \"der grossen Themen von immer\". 
</p>","","5","../../media_art4art/eve0002/_thumbs/th_il_libro1.jpg","../../media_art4art/eve0002/_thumbs/th_il_libro2.jpg","n","34","16","j","1");
INSERT INTO cms_pages VALUES ("16","42","navi_5","art0001","Berkouk Kamel","malerei","0000-00-00 00:00:00","0000-00-00 00:00:00","Kamel Berkouk hat einen persönlichen Stil entwickelt: vordergründig einfache Tier-und Menschengestalten stehen im spielerischen Dialog zueinander","&lt;p&gt;
Von der naiven Malerei herkommend, hat Berkouk einen sehr persönlichen Stil entwickelt: vordergründig einfache Tier- und Menschengestalten stehen im spielerischen Dialog miteinander. Die an der Grenze zwischen abstrakt und konkret stehenden Formen erzählen Geschichten, stellen Szenen und Beziehungen dar. 
&lt;/p&gt;
&lt;p&gt;
Kamel Berkouk ist 1967 als neuntes Kind einer algerischen Familie in Mulhouse (F) geboren und hat ein Studium an der Kunstakademie begonnen, entwickelte sich jedoch autodidaktisch weiter.&lt;br /&gt;
Heute ist er nicht nur in Frankreich anerkannt, wo beispielsweise das Mulhouse Fine Arts Museum seine Werke sammelt, sondern auch in Deutschland, Belgien, Holland, den USA und den Emiraten, wo er stark umworben wird. 
&lt;/p&gt;
","","5","../../media_art4art/art0001/_thumbs/th_loiseau jaune.jpg","../../media_art4art/art0001/_thumbs/th_bild2.jpg","n","7","65","j","1");
INSERT INTO cms_pages VALUES ("22","42","navi_5","art0005","Beurret Elisabeth","malerei","0000-00-00 00:00:00","0000-00-00 00:00:00","Die Arbeit von Elisabeth Beurret beginnt in der Begenung mit der Natur, mit dem Sammeln von Blättern und planzlichen Materialien","&lt;p&gt;
Die Arbeit von Elisabeth Beurret beginnt in der Begenung mit der Natur, mit dem Sammeln von Blättern und planzlichen Materialien. Darin entdeckt sie die Themen und die Formen die später ihr Werk beeinflussen werden. Schon die verschiedenen Bäume und Blätter haben ihre eigene Symbolik: die Ulme, Symbol des Edelmutes, die zu verschwinden droht oder der Ginkgo ein lebendes Fossil, unverändert seit der Zeit der Dinosaurier. Er ist ein Symbol von Langlebigkeit, das seit Menschengedenken in China und Japan verehrt wird. In ihrem Atelier werden diese Rohmaterialien mit sehr verschiedenen traditionellen und experimentellen Techniken zu Papier verarbeitet.
&lt;/p&gt;
&lt;h3&gt;Die Basisstrukturen des Papiers&lt;/h3&gt;
&lt;p&gt;
tragen die grossen Naturgesetze und -Formen in sich. Die Papierbilder oder Papierobjekte von Elisabeth Beurret sind von diesen Spiralen, Meandren und Verzweigungen inspiriert. &quot;Weil wir seine inneren Gesetze kennen, sprengt das Objekt den einfachen Rahmen seiner Erscheinung&quot;, Paul Klee (Unendliche Naturgeschichte). In ihren Reisen durch Afrika, Marokko und anderen fernen Ländern sammelt Elisabeth Beurret den kunsthandwerklichen Ausdruck der Völker. Ihre Werke sind magische Reisen durch die Kulturen. 
&lt;/p&gt;
","","5","../../media_art4art/art0005/_thumbs/th_eb_nature1b45x80cm_web.jpg","../../media_art4art/art0005/_thumbs/th_terre-rouge-web.jpg","n","9","0","j","12");
INSERT INTO cms_pages VALUES ("23","34","navi_3","exp0005","Hanspeter Kamm","vergangen","2007-11-15 00:00:00","2007-12-31 00:00:00","Vernissage: Donnerstag, 15. November 2007, 18.30 – 21.00 Uhr","&lt;p&gt;
Hanspeter Kamm erzeugt heute filigrane Gebilde, verquere Vehikel und getarnte Liebesbriefe mit seltsamen Namen wie &quot;Gekühltes Mötchen&quot; oder &quot;Horizontales Gezwitscher&quot;: immer handwerklich einmalig, immer suggestiv, meistens zeitkritisch oder karikierend. Draht wird zur Luftlinie - Raum, Licht und Schatten spielen mit. 
&lt;/p&gt;
&lt;p&gt;
Hanspeter Kamm ist ein Querdenker und Eigenbrötler. Er pendelt zwischen Kunstbegriff und Gefallensurteil fröhlich hin und her - und pfeift dazu. 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;Vernissage&lt;/h3&gt;
&lt;p&gt;
Donnerstag, 15. November 2007, 18.30 – 21.00 Uhr 
&lt;/p&gt;
","","2","../../media_art4art/exp0005/_thumbs/th_kamm ausst 2006 102.jpg","","n","31","0","j","18");
INSERT INTO cms_pages VALUES ("26","42","navi_5","art0006","Belvedere Dominique","malerei","0000-00-00 00:00:00","0000-00-00 00:00:00","Die Welt der Bilder von Dominique Belvedere fasziniert und beeindruckt durch die Farbkraft, Dynamik und Ruhe, die sie gleichzeitig ausstrahlt.","Die Welt der Bilder von Dominique Belvedere fasziniert und beeindruckt durch die Farbkraft, Dynamik und Ruhe, die sie gleichzeitig ausstrahlt. Die Vielschichtigkeit der abstrakten Kompositionen führt den Betrachter zu Landschaften, deren Konturen sich nur andeutungsweise abzeichnen: eine Reise in unendliche Dimensionen pffnet sich. Kraft wird zur meditativen Stille, Stille zur Kraft. &lt;br /&gt;
&lt;br /&gt;
Auf differenzierte Weise entwickelt Dominique Belvedere subtile und kraftvolle Farbklänge, durchbrochen von eingravierten Elementen und Strichen. Vielschichtig, deckend oder lasierend baut die Malerin das Bildgeschehen auf Holztafeln auf. Durch die Gegensätzlichkeit und das Zusammenspiel von intuitiv erarbeiteten und geometrischen Bildflächen entsteht Spannung und zugleich Balance. Die Kompositionen der Malerin entstehen als Synthese aus Impressionen ihres vielfältigen und reichhaltigen Familien- und Berufslebens, aus der Wahrnehmung visueller Fragmente der Natur, des Erlebten und ihrer persönlichen Reflexion. &lt;br /&gt;
&lt;br /&gt;
1958 in Zürich geboren. Sportstudium an der ETH Zürich. Lehrtätigkeit an Zürcher Kantonsschule für Sport, Theater und musische Projekte. Schauspielausbildung in Zürich.&nbsp; Leiterin diverser Theater-Kurse und -Aufführungen an der Zürcher Kantonsschule, Bühnengestaltung, Regie.&lt;br /&gt;
&lt;br /&gt;
Seit 1991&nbsp;&nbsp; Intensivierung der malerischen Tätigkeit &lt;br /&gt;
&lt;br /&gt;
Ausstellungen (Auswahl):&lt;br /&gt;
2000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Volkswirtschaftsdirektion des Kantons Zug &lt;br /&gt;
2001&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Münchhof Galerie Wehrli, Kilchberg&lt;br /&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Galerie Siegristenkeller Bülach&lt;br /&gt;
2002&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Gruppenausstellung &quot;Ladies only&quot;, Galerie &quot;Art Selection&quot;, Zürich&lt;br /&gt;
2003&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Art Forum Montreux&lt;br /&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Galerie IAM, Lausanne&lt;br /&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Münchhof Galerie Wehrli, Kilchberg &lt;br /&gt;
2004&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; art4art, halle für kunst, Küsnacht &lt;br /&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Galerie Eule Art, Flims&lt;br /&gt;
2005&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Galerie Eule Art, Davos&lt;br /&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Galerie de Grancy, Lausanne&lt;br /&gt;
2006&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; art4art, Halle für Kunst, Küsnacht&lt;br /&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Münchhof Galerie Wehrli, Kilchberg/Zürich&lt;br /&gt;
2007&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Münchhof Galerie Wehrli, Kilchberg/Zürich&lt;br /&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Galerie de Grancy, Lausanne&lt;br /&gt;
&lt;br /&gt;
Auszeichnung:&lt;br /&gt;
2003&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1. Preis &quot;Grand Jury&quot;, Art Forum Montreux
","","5","../../media_art4art/art0006/_thumbs/th_bild-877b.jpg","../../media_art4art/art0006/_thumbs/th_bild-917b.jpg","n","0","0","j","11");
INSERT INTO cms_pages VALUES ("25","34","navi_3","exp0006","Tristan Rà: Images d\'Orient","vergangen","2005-11-10 00:00:00","2006-02-04 00:00:00","Die Kraft der Farbe und des Ausdruckes sowie die Vibration der Stimmung seiner Bilder berühren den Zuschauer","&lt;p&gt;
Tristan Rà ist Maler mit Leib und Seele. Er wuchs in Montluçon in Frankreich auf und begann Medizin zu studieren. Parallel dazu widmete er sich der Malerei, bis er sich ihr im Laufe der Zeit ganz verschrieb. über 30 Jahre lang bereiste er die Welt, weilte in Polynesien, durchquerte Südamerika zu Fuss, besuchte Nordindien und mehrmals Libyen, Tunesien, die Türkei und Aegypten. 
&lt;/p&gt;
&lt;p&gt;
Tristan Rà hat eine eigene Welt geschaffen, die mal an Javlensky, mal an Gauguin, mal an Chagall erinnert - und doch eigenständig ist. Die Kraft der Farbe und des Ausdruckes sowie die Vibration der Stimmung seiner Bilder berühren den Zuschauer; das Porträt zeugt von der Herzlichkeit einer Begegnung, das Stadtbild spricht von Sehnsucht, im Stillleben erweckt der Maler den einfachen Gegenstand, der den Menschen umgibt, zu neuem Leben. 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;Vernissage&lt;/h3&gt;
&lt;p&gt;
Donnerstag, 10. November, 18:30-21:00 Uhr&lt;br /&gt;
Einführung durch die Galeristin und den Künstler&lt;br /&gt;
Patronat: Französischer Generalkonsul in Zürich 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;Farbkatalog&lt;/h3&gt;
&lt;p&gt;
Der durch art4art herausgegebene Katalog zur Ausstellung wurde von Intras Versicherungen, Renault Nissan und Publicis Werbeagentur unterstützt.&lt;br /&gt;
Der Katalog ist bei art4art erhältlich. 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;Weihnachtsapéro&lt;/h3&gt;
&lt;p&gt;
Sonntag, 11. Dezember, 11.00 – 16.00 Uhr 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;Finissage&lt;/h3&gt;
&lt;p&gt;
Samstag, 04. Februar 2006, 14.00 – 17.00 Uhr 
&lt;/p&gt;
","","2","../../media_art4art/exp0006/_thumbs/th_bild4.jpg","../../media_art4art/exp0006/_thumbs/th_bild5.jpg","n","27","0","j","17");
INSERT INTO cms_pages VALUES ("39","35","navi_11","btq0004","Kleine Bilder","la_boutique","0000-00-00 00:00:00","0000-00-00 00:00:00","Kleine Bilder
Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis.","Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. &lt;br /&gt;
&lt;br /&gt;
Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. &lt;br /&gt;
&lt;br /&gt;
&lt;br /&gt;
Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. &lt;br /&gt;
&lt;br /&gt;
","","1","../../media_art4art/btq0004/_thumbs/th_bild_05.jpg","","n","0","0","j","1");
INSERT INTO cms_pages VALUES ("28","42","navi_5","art0008","Bauer Barbara","malerei","0000-00-00 00:00:00","0000-00-00 00:00:00","Die Werke von Barbara Bauer-Ruchti überraschen in ihrer Spontaneität und Farbdynamik. Da kommt einem unwillkürlich die unkonventionelle Kraft, von ein","<p>Das Werk von Barbara Bauer-Ruchti hat nach einem fast 40jährigen künstlerischen Schaffen, eine formelle Freiheit erreicht, welche Kreativität&nbsp; und Humor ausstrahlt. Aber ihre Bilder sind auch geprägt von einer grossen Lebensfreude und Kraft. Sind es die Jahre in Brasilien oder ist es ihr russischer Ursprung? <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
In der Arbeit von Barbara Bauer-Ruchti geht es um eine persönliche Geschichte, um die Zeichen des individuellen Ursprunges, die Zeichen eines nur teilweise bewusst erlebten kulturellen Umfeldes, einer kulturellen überlieferung. Und ähnlich wie bei den Zeichen der Menschheit, welche durch die Suche des Künstlers an die Oberfläche kommen, entstehen bei Barbara Bauer Zeichen, Formen und Bilder durch die zunehmende Befreiung, Abstreifung des Formellen in ihrem Schaffen, welche unverkennlich den russischen Ursprung der Künstlerin offenlegen; je weniger sich die Künstlerin an eine Absicht hält, umsomehr übernehmen\" die kulturtypischen Züge. Kein bewusstes Vorgehen, keine Anlehnung und doch eine grosse Verwandtschaft mit Kandinsky oder Malewitsch, was die Formen anbelangt. Auch kommen stellenweise spontan Szenen zustande, die an Chagall erinnern - Russisches Dorf. <br />
<br />
Die Werke von Barbara Bauer-Ruchti überraschen in ihrer Spontaneität und Farbdynamik. Da kommt einem unwillkürlich die unkonventionelle Kraft, von einem anderen russischen Künstlers im Sinne, der neue Wege ging: Stravinsky mit \"Le sacre du printemps\".<br />
<br />
Angaben zu Barbara Bauer-Ruchti:<br />
<br />
1921 in Sào Paulo, Brasilien geboren und dort aufgewachsen. Der Vater stammte aus Interlaken, die Mutter aus Moskau. Künstlerische Bildung und Prägung im Elternhaus, in internationalem Künstler- und Architektenmilieu. Graphische Ausbildung in Sào Paulo. 1957 Übersiedlung der Familie in die Schweiz. Seit 1960 freischaffende Malerin in Aquarell, Gouache, Ölkreide und Öl.<br />
<br />
Ausstellungen:<br />
<br />
Sal?o de Maio, Sào Paulo<br />
Burggarten-Keller, Bottmingen, BL<br />
Kulturzentrum Leimental, BL<br />
Galerie zur Krähe, Basel<br />
&nbsp; <br />
\"Ich lausche / dem Flügelschlag / des Sonnenvogels / aus der Dämmerung / zur Morgenröte / durch alle Zeiten / fliegt er / &nbsp;dem Goldregen / des Zeus / zu begegnen / der die Welten / &nbsp;befruchtet / dem Menschen / wandelnde Träume / entzündet / die Träume / die ich träume / seither!\"</p>","","3","../../media_art4art/art0008/_thumbs/th_scannen05.jpg","../../media_art4art/art0008/_thumbs/th_scannen02.jpg","n","0","0","j","10");
INSERT INTO cms_pages VALUES ("27","42","navi_5","art0007","Tristan Rà","malerei","0000-00-00 00:00:00","0000-00-00 00:00:00","Tristan Rà bereiste 30 Jahre lang die Welt, weilte in Polynesien, durchquerte Südamerika zu Fuss, besuchte Nordindien, Libyen, Tunesien, die Türkei...","&lt;table border=&quot;0&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot; style=&quot;border-width: 0px; width: 100%&quot;&gt;
	&lt;tbody&gt;
		&lt;tr&gt;
			&lt;td valign=&quot;top&quot; style=&quot;width: 100px&quot;&gt;
			&lt;p&gt;
			1945 
			&lt;/p&gt;
			&lt;/td&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			Geboren in Montluçon, Frankreich Medizinstudium und gleichzeitiges Studium der Malerei an der Académie Grande Chaumière. 
			&lt;/p&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			1969 
			&lt;/p&gt;
			&lt;/td&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			Abbruch des Studiums um sich voll der Malerei zu widmen. Arbeitet während 4 Jahren mit dem katalanischen Maler Belmonte. 
			&lt;/p&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			1972 
			&lt;/p&gt;
			&lt;/td&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			Einjähriger Aufenthalt in Zentralamerika und Fussmarsch quer durch Südamerika. 
			&lt;/p&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			1970-2000 
			&lt;/p&gt;
			&lt;/td&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			Verschiedene Studienreisen in Nordafrika, Aegypten, Lybien, Tunesien, Türkei, und Europa. 
			&lt;/p&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			1996-1998 
			&lt;/p&gt;
			&lt;/td&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			Studienaufenthalt in der Türkei. 
			&lt;/p&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			2000 
			&lt;/p&gt;
			&lt;/td&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			7-monatiger Aufenthalt in Polynesien und Marquise. 
			&lt;/p&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			2002 
			&lt;/p&gt;
			&lt;/td&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			Aufenthalt in Nordindien, Rajastan. 
			&lt;/p&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			2004 
			&lt;/p&gt;
			&lt;/td&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			Aufenthalt in Tunesien, Aegypten. 
			&lt;/p&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			1975-2004 
			&lt;/p&gt;
			&lt;/td&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			Regelmässige bedeutende Einzelausstellungen in Südfrankreich (Saint Tropez, Saint Paul de Vence, Gassin, Cannes, Grimaud), Genf, Strasbourg, Lyon, Brüssel, London, New York, Paris, Stuttgart, Hong Kong,Miami und Singapore. 
			&lt;/p&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td valign=&quot;top&quot;&gt;&nbsp;&lt;/td&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			Seine Werke befinden sich in öffentlichen und privaten Sammlungen in Belgien, Deutschland, Frankreich,Italien, Holland, USA, England, Schweden, Japan und der Türkei und Tunesien. 
			&lt;/p&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			2005 
			&lt;/p&gt;
			&lt;/td&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			Erstmals in Zürich &quot;art4art, halle für kunst, Küsnacht. 
			&lt;/p&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
	&lt;/tbody&gt;
&lt;/table&gt;
&lt;br /&gt;
&lt;p&gt;
Zur Ausstellung erschien ein farbiger, zweisprachiger Katalog, in deutscher und französischer Sprache. 
&lt;/p&gt;
&lt;p&gt;
Der Katalog illustriert das Werk des Künstlers, erzählt über die Entstehung und über den Zauber der Malerei von Tristan Rà. Preis: 30 CHF. - auf Anfrage erhältlich. 
&lt;/p&gt;
","","3","../../media_art4art/art0007/_thumbs/th_sarah.jpg","../../media_art4art/art0007/_thumbs/th_2008-mvc-093f.jpg","n","25","0","j","9");
INSERT INTO cms_pages VALUES ("32","34","navi_3","exp0007","André Bregnard: Eisenskulpturen, Charles Blockey: Bilder","vergangen","2005-09-01 00:00:00","2005-10-08 00:00:00","Vernissage: Donnerstag, 01. September, 18.30 – 21.00 Uhr, Einführung durch die Galeristin","&lt;p&gt;
Bregnard, ein in Kolumbien geborener Neuenburger, der seit Jahren in Südfrankreich lebt hat eine eindrucksvolle Geschichte. über Jahre bearbeitet er den Granitstein mit anthopomorphen Formen. Seine Stelen entwickeln sich zunehmend zum Dialog zwischen Volumen und Leere bis seine rechte Hand nicht mehr mitmacht. 
&lt;/p&gt;
&lt;p&gt;
In der Not ist auf der Suche nach neuen Möglichkeiten, Ungeahntes entstanden: Subtile Eisenskulpturen, welche mal durch Strenge und Meditation bestechen, mal durch Schwere und Leichtigkeit und oft an architektonische Kunstwerke erinnern.
&lt;/p&gt;
&lt;p&gt;
Ganz anders beim Schotten Blockey: &quot;das Überwinden der Zeitdimension und das Durchbrechen des physischen Raumes motivieren meine Malerei; Farbe für sich kann die Zeitlosigkeit schaffen, die Sprache der Formen und Linien neue Räume bilden.&quot; 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;Vernissage&lt;/h3&gt;
&lt;p&gt;
Donnerstag, 01. September, 18.30 – 21.00 Uhr&lt;br /&gt;
Einführung durch die Galeristin 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;Finissage&lt;/h3&gt;
&lt;p&gt;
Samstag, 08. Oktober, 14.00 – 17.00 Uhr 
&lt;/p&gt;
","","2","../../media_art4art/exp0007/_thumbs/th_skulptur1.jpg","../../media_art4art/exp0007/_thumbs/th_blockey_bild.jpg","n","30","29","j","16");
INSERT INTO cms_pages VALUES ("37","35","navi_11","btq0002","Schmuck","la_boutique","0000-00-00 00:00:00","0000-00-00 00:00:00","Schmuck",NULL,NULL,"5",NULL,NULL,"n","0","0","j","2");
INSERT INTO cms_pages VALUES ("29","42","navi_5","art0009","Blockey Charles","malerei","0000-00-00 00:00:00","0000-00-00 00:00:00","&quot;Das Überwinden der Zeitdimension und das Durchbrechen des physischen Raumes motivieren meine Malerei...&quot;","&lt;p&gt;
&quot;Das Überwinden der Zeitdimension und das Durchbrechen des physischen Raumes motivieren meine Malerei; Farbe für sich kann die Zeitlosigkeit schaffen, die Sprache der Formen und Linien neue Räume bilden.&quot; 
&lt;/p&gt;
&lt;table border=&quot;0&quot; class=&quot;table&quot; style=&quot;border-width: 0px&quot;&gt;
	&lt;tbody&gt;
		&lt;tr&gt;
			&lt;td style=&quot;width: 100px&quot;&gt;1960&lt;/td&gt;
			&lt;td&gt;Geboren in Edinburgh, Scottland&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1979 —1981&lt;/td&gt;
			&lt;td&gt;Edinburgh School of Art/Leeds School of Art &lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1982 — 1984&lt;/td&gt;
			&lt;td&gt;Studienreise Europa &lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1985 — 1989&lt;/td&gt;
			&lt;td&gt;Assenza Malschule Münchenstein BL, wo er seit &lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1989&lt;/td&gt;
			&lt;td&gt;als Dozent tätig ist.&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1989&lt;/td&gt;
			&lt;td&gt;Regelmässige Einzel und Gruppen-Ausstellungen in der Region Basel, Solothurn, Westschweiz und Frankreich&lt;br /&gt;
			Verschiedene Werke in öffentlichen Institutionen in Basel und Solothurn &lt;/td&gt;
		&lt;/tr&gt;
	&lt;/tbody&gt;
&lt;/table&gt;
","","5","../../media_art4art/art0009/_thumbs/th_dscn1520.jpg","../../media_art4art/art0009/_thumbs/th_a4a-2-w.jpg","n","0","0","j","8");
INSERT INTO cms_pages VALUES ("30","41","navi_5","art0010","Bregnard André","skulpturen","0000-00-00 00:00:00","0000-00-00 00:00:00","Subtile Eisenskulpturen, welche mal durch Strenge und Meditation bestechen, mal durch Schwere und Leichtigkeit und oft an architektonische Kunstwerke","&lt;p&gt;
Bregnard, ein in Kolumbien geborener Neuenburger, der seit Jahren in Südfrankreich lebt hat eine eindrucksvolle Geschichte. über Jahre bearbeitet er den Granitstein mit anthopomorphen Formen. Seine Stelen entwickeln sich zunehmend zum Dialog zwischen Volumen und Leere bis seine rechte Hand nicht mehr mitmacht. 
&lt;/p&gt;
&lt;p&gt;
In der Not ist auf der Suche nach neuen Möglichkeiten, Ungeahntes entstanden: Subtile Eisenskulpturen, welche mal durch Strenge und Meditation bestechen, mal durch Schwere und Leichtigkeit und oft an architektonische Kunstwerke erinnern. 
&lt;/p&gt;
&lt;br /&gt;
&lt;table border=&quot;0&quot; width=&quot;745&quot; height=&quot;180&quot;&gt;
	&lt;tbody&gt;
		&lt;tr&gt;
			&lt;td&gt;1944&nbsp;&nbsp;&nbsp; &lt;/td&gt;
			&lt;td&gt;Geboren in Kolumbien&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;&nbsp;&lt;/td&gt;
			&lt;td&gt;Ausbildung an der Schule für angewandte Kunst in La Chaux-de-Fonds&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1972 &lt;/td&gt;
			&lt;td&gt;lebt seither in Südfrankreich&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1975&lt;/td&gt;
			&lt;td&gt;Einzel- und Gruppenausstellungen in Südfrankreich, Genf, Neuenburg, Ascona, Vevey und Deutschland&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1976&lt;/td&gt;
			&lt;td&gt;1.Preis der Stadt La Chaux-de-Fonds&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1990 &lt;/td&gt;
			&lt;td&gt;1.Preis für Skulptur &quot;Forum des Arts&quot; Barjac&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1992&lt;/td&gt;
			&lt;td&gt;Auszeichnung und Vertreten der Schweiz in Dakar-Sénégale&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;&nbsp;&lt;/td&gt;
			&lt;td&gt;Verschiedene Akquisitionen durch die Städte La Chaux-de-Fonds, Neuenburg, Genf, Deutschland.&lt;/td&gt;
		&lt;/tr&gt;
	&lt;/tbody&gt;
&lt;/table&gt;
","","3","../../media_art4art/art0010/_thumbs/th_skulptur1.jpg","../../media_art4art/art0010/_thumbs/th_skuptur3.jpg","n","32","0","j","0");
INSERT INTO cms_pages VALUES ("31","41","navi_5","art0011","Brühwiler Herbert","skulpturen","0000-00-00 00:00:00","0000-00-00 00:00:00","Im Zentrum seines Schaffens stehen Haltungen. Haltung als Körperausdruck, sei es in Form von menschenähnlichen Gestalten oder als abstrakte Körper","&lt;p&gt;
Die Werke von Herbert Brühwiler sind sehr naturbezogen. In seiner Wasserinstallation in Horgen im Jahr 2001 setzt er feingeliederte Holzgestalten in die Wasserlandschaft und überlässt sie der Verwitterung und der Veränderung. 
&lt;/p&gt;
&lt;p&gt;
Im Zentrum seines Schaffens stehen Haltungen. Haltung als Körperausdruck, sei es in Form von menschenähnlichen Gestalten oder als abstrakte Körper. Der Künstler setzt sich mit der wahren Natur des Menschen auseinander. 
&lt;/p&gt;
&lt;br /&gt;
&lt;table border=&quot;0&quot;&gt;
	&lt;tbody&gt;
		&lt;tr&gt;
			&lt;td style=&quot;width: 70px&quot;&gt;1946&lt;/td&gt;
			&lt;td&gt;Geboren in Romanshorn, Thurgau &lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1976&lt;/td&gt;
			&lt;td&gt;Diplom in Angewandter Psychologie &lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1989&lt;/td&gt;
			&lt;td&gt;Beginn der Bildhauerei und Malerei&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1995&lt;/td&gt;
			&lt;td&gt;Beginn regelmässiger Ausstellungen&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1996 &lt;/td&gt;
			&lt;td&gt;Situationsklärungen, Buchillustration (Leske & Budrich) &lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1997 &lt;/td&gt;
			&lt;td&gt;Horizonte, Grenzen, Vögel, Ausstellung Aogis Insos &lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1998&lt;/td&gt;
			&lt;td&gt;Köpfe, Wanderausstellung in der Schweiz des Vereins Schweizerischer Holzbildhauer (VSHB) &lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;2000&lt;/td&gt;
			&lt;td&gt;Skulpturen und Aquarelle, Kunsthaus Richterswil&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;2001&lt;/td&gt;
			&lt;td&gt;Goldener Schlegel, Wanderausstellung in der Schweiz und Süddeutschland&lt;br /&gt;
			papier des VSHB, 12 schwimmende Skulpturen, Wasserinstallation auf dem Zürichsee, Horgen&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;2002&lt;/td&gt;
			&lt;td&gt;Gruppenausstellung Galerie Vista Nova, Zürich &lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;2003&lt;/td&gt;
			&lt;td&gt;Bank Leu, Zürich&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;2004&lt;/td&gt;
			&lt;td&gt;Gruppenausstellung Kulturfond Horgen; art4art, Küsnacht&lt;/td&gt;
		&lt;/tr&gt;
	&lt;/tbody&gt;
&lt;/table&gt;
","","5","../../media_art4art/art0011/_thumbs/th_dscn1338.jpg","../../media_art4art/art0011/_thumbs/th_dscn1350.jpg","n","0","0","j","0");
INSERT INTO cms_pages VALUES ("33","34","navi_3","exp0008","Pier Daniele La Rocca: Libro labirinto","vergangen","2005-03-03 00:00:00","2005-04-23 00:00:00","Die Installation mit den 21 Büchern ist faszinierend und misteriös; sie lässt die Geschichte eines jeden Buches nur erahnen","&lt;p&gt;
&quot;In der antiken Bibliothek Alexandriens habe ich mir den letzten kleinen und in Vergessenheit geratenen Raum vorgestellt. Dort habe ich eine Gruppe von Buch-Objekten hingestellt, ausgewählt aus dem unendlichen Fundus des Universal-Wissens. Es sind deren 21, die Zahl des Wissens in der alt-indischen Veda-Kultur. Diese Bücher erzählen von Fantasie und von reellen Themen des menschlichen Daseins und wurden nur einmal gelesen, bevor sie in Vergessenheit gerieten. Sie sind für immer zugeschlagen worden, wie um die Quelle der Inspiration zu verbergen- sie wurden zu &quot;geheimen Seiten.&quot; 
&lt;/p&gt;
&lt;p&gt;
Die Installation mit den 21 Büchern ist faszinierend und misterips; sie lässt die Geschichte eines jeden Buches, besetzt mit rätselhaften archaischen Zeichen und Formen, nur erahnen und der Titel lässt träumen: die Argonauten, Phanta Rhei, Urakami, Malabar.... 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;Vernissage&lt;/h3&gt;
&lt;p&gt;
Donnerstag, 03. März, 18.30 – 21.00 Uhr&lt;br /&gt;
Einführung durch die Galeristin 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;Farbkatalog&lt;/h3&gt;
&lt;p&gt;
Der durch art4art herausgegebene Katalog zur Ausstellung wurde von Aspecta Assurance International unterstützt.&lt;br /&gt;
Der Katalog ist bei art4art erhältlich. 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;Finissage&lt;/h3&gt;
&lt;p&gt;
Samstag, 23. April, 14.00 – 17.00 Uhr 
&lt;/p&gt;
","","2","../../media_art4art/exp0008/_thumbs/th_il_libro3.jpg","../../media_art4art/exp0008/_thumbs/th_il_libro4.jpg","n","34","0","j","15");
INSERT INTO cms_pages VALUES ("38","35","navi_11","btq0003","Accessoires","la_boutique","0000-00-00 00:00:00","0000-00-00 00:00:00","Accessoires
Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis.","Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.&lt;br /&gt;
&lt;br /&gt;
 
&lt;p&gt;
Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
&lt;/p&gt;
&lt;p&gt;
&nbsp;
&lt;/p&gt;
&lt;p&gt;
Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.
&lt;/p&gt;
&lt;p&gt;
&nbsp;
&lt;/p&gt;
&lt;p&gt;
Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.
&lt;/p&gt;
&lt;p&gt;
&nbsp;
&lt;/p&gt;
","","3","../../media_art4art/btq0003/_thumbs/th_access_01.jpg","","n","0","0","j","3");
INSERT INTO cms_pages VALUES ("34","42","navi_5","art0012","La Rocca Pier Daniele","malerei","0000-00-00 00:00:00","0000-00-00 00:00:00","&quot;In der antiken Bibliothek Alexandriens habe ich mir den letzten kleinen und in Vergessenheit geratenen Raum vorgestellt&quot;","&lt;table border=&quot;0&quot; class=&quot;table&quot; style=&quot;border-width: 0px&quot;&gt;
	&lt;tbody&gt;
		&lt;tr valign=&quot;top&quot;&gt;
			&lt;td valign=&quot;top&quot; style=&quot;width: 100px&quot;&gt;1945&lt;/td&gt;
			&lt;td&gt;Geboren am Lago di Garda, Italien &lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1970 — 1975 &lt;/td&gt;
			&lt;td&gt;Studium der Malerei, Musik und Photographie &lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1975 — 1977&lt;/td&gt;
			&lt;td&gt;Journalismus in Mailand&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1978 — 1981&lt;/td&gt;
			&lt;td&gt;Bühnengestaltung und Regie in Rom&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1982 — 1989&lt;/td&gt;
			&lt;td&gt;Längere Aufenthalte in Asien, Afrika und auf&lt;br /&gt;
			den Mittelmeerinseln &lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;Seit 1990 &lt;/td&gt;
			&lt;td&gt;Ausstellungen u.a. in Ascona, Bologna, Faenza, Imola, Köln, Locarno, Rom, Stresa, Turin, Venedig und Zürich &lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1999 — 2001&lt;/td&gt;
			&lt;td&gt;Forschung und Auseinandersetzung mit literarischen Texten und Dichtung der Antike. Es entstehen die Werkreihen Mul Apin, Rihla und Liber Mutus, die in Katalogen dokumentiert sind.&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;2002&lt;/td&gt;
			&lt;td&gt;Eröffnungsausstellung art4art, halle für kunst, Küsnacht&lt;br /&gt;
			Arte Fiera Bologna&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;2003 &lt;/td&gt;
			&lt;td&gt;Dimora di sapienti, Fondazione Cominelli, Cisano Torri del Benaco&lt;br /&gt;
			Kunstgarten Galerie, Aarwangen &lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;2004 &lt;/td&gt;
			&lt;td&gt;Libro labirinto, Arte moderna, Ammann, Locarno&lt;br /&gt;
			10. Internationale Messe für Gegenwartskunst, Zürich&lt;/td&gt;
		&lt;/tr&gt;
	&lt;/tbody&gt;
&lt;/table&gt;
","","5","../../media_art4art/art0012/_thumbs/th_2.jpg","../../media_art4art/art0012/_thumbs/th_6.jpg","n","0","0","j","7");
INSERT INTO cms_pages VALUES ("35","40","navi_4","eve0004","Farbtöne & Klangfarben","vergangen","2007-06-10 00:00:00","0000-00-00 00:00:00","Neujahrskonzert zur Finissage der Ausstellung von Dominique Belvedere, Samstag, den 20. Januar 2007 um 17.15 Uhr","&lt;p&gt;
Die Cellistin Stefania Verità und die Pianistin Susanne Möhring spielen Meisterwerke aus der Romantik, der Spätromantik und dem frühen 20. Jahrhundert und unterstreichen mit warmen und kraftvollen Klängen die Gemälde von Dominique Belvedere. 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;Stefania Verità&lt;/h3&gt;
&lt;p&gt;
Geboren in Italien. 1985 erhielt sie ihr Cello-Diplom am Conservatorio Antonio Vivaldi in Alessandria. Dank eines Stipendiums konnte sie ihre Studien an der Scuola di Alto Perfezionamento Musicale in Saluzzo bei Thomas Demenga und Rocco Filippini fortsetzen. 1999 Aufnahme in die Solistenklasse von Patrick Demenga an der Musikhochschule Bern (Schweiz), mit Abschluss des Solistendiploms 1991. Neben ihrer Mitwirkung in verschiedenen Orchestern unter anderem Tonhalle-Orchester Zürich und Camerata Zürich, ist sie seit 1993 Cellistin des Ensembles von Nina Corti und seit 1997 Mitglied des Ensembles Salon Passion. Zur solistischen und kammermusikalischen Tätigkeiten, auf modernem sowie barockem Cello, kommen immer wieder auch Auftritte im Grenzbereich zwischen Jazz und Experimenteller Musik. Lehrerin am Konservatorium Zürich. Aktiv als Soloflötistin, Orchestermusikerin und als Kammermusik-Partnerin. Konzerte im In- und Ausland. Umfangreiches klassisches und modernes Repertoire 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;Susanne Möhring&lt;/h3&gt;
&lt;p&gt;
Geboren in Köln als Tochter des Flötisten Hans Jürgen Möhring und der Sängerin Anne Schaad. Studium der Instrumentalpädagogik Klavier und Viola an der Musikhochschule Rheinland. Aufbaustudium in der Meisterklasse von Prof. Karl Engel am Konservatorium Bern. 1990 Konzertreife. Während des Studiums Weiterführung des Bratschenunterrichts bei Henri Crafoord. 1990 Rorary-Preis der Stadt La Chaux-de-Fonds. 1992 Liedpreis der Stadt Bozen. Konzerte solistisch, kammermusikalisch und als Liedbegleiterin im In- und Ausland. Lehrauftrag an der Musikschule der Stadt Zürich. Regelmässige Leitung von Kammermusikkursen auf dem Jolimont bei Erlach. 
&lt;/p&gt;
","","2","../../media_art4art/eve0004/_thumbs/th_cellistin.jpg","../../media_art4art/eve0004/_thumbs/th_ausstellung6.jpg","n","0","0","j","7");
INSERT INTO cms_pages VALUES ("36","35","navi_11","btq0001","Keramik","la_boutique","0000-00-00 00:00:00","0000-00-00 00:00:00","Geschenke aus Keramik
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquy","Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.&lt;br /&gt;
&lt;br /&gt;
 
&lt;p&gt;
Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
&lt;/p&gt;
&lt;p&gt;
&nbsp;
&lt;/p&gt;
&lt;p&gt;
Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.
&lt;/p&gt;
&lt;p&gt;
&nbsp;
&lt;/p&gt;
&lt;p&gt;
Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.
&lt;/p&gt;
&lt;p&gt;
&nbsp;
&lt;/p&gt;
&lt;p&gt;
Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis. 
&lt;/p&gt;
","","4","../../media_art4art/btq0001/_thumbs/th_pitfiringschalen.jpg","","n","0","0","j","4");
INSERT INTO cms_pages VALUES ("41","35","navi_11","btq0006","Objekte","la_boutique","0000-00-00 00:00:00","0000-00-00 00:00:00","Objekte
Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis.","Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.
&lt;p&gt;
&lt;br /&gt;
Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. 
&lt;/p&gt;
&lt;p&gt;
&lt;br /&gt;
Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. 
&lt;/p&gt;
&lt;p&gt;
&nbsp;
&lt;/p&gt;
","","2","../../media_art4art/btq0006/_thumbs/th_objekt_01.jpg","../../media_art4art/btq0006/_thumbs/th_objekt_02.jpg","n","0","0","j","5");
INSERT INTO cms_pages VALUES ("46","42","navi_5","art0013","Bouys Jeanick","malerei","0000-00-00 00:00:00","0000-00-00 00:00:00","Jeanick Bouys Bilder sind seit 1980 regelmässig in Museen, Galerien und
privaten Sammlungen in Frankreich, Japan, New York und in der Schweiz
zu sehen","Ein merkwürdiger Vogel, mit dieser dickbäuchigen Silhouette und dem langen Schnabel eines Ibis, der sich mit seinem &quot;hitchcockischen&quot; Profil in den farbigen Abschnitten der Bilder von Jeanick Bouys aufdrängt.&lt;br /&gt;
Dieses Fetisch-Tier trägt einen Namen. Es ist ein bobo&quot;, offiziell existieren die bobos. Irgendwo in Afrika. In Wahrheit manifestiert sich Afrika auf der Farbenskala des Künstlers in den Purpur- und Brauntönen. &lt;br /&gt;
Aber warum dieser Zwitter, halb Mensch, halb Vogel - ein Traum von Ikarus? Woher der Anschein, ein irdisches Damenbrett zu überfliegen, wie eine innere Landschaft einer Kindheit, die dahinfliegt?&lt;br /&gt;
Jean Rouand, Prix Goncourt&lt;br /&gt;
&lt;br /&gt;
Un drôle d\'oiseau, cette silhouette ventripotente au long bec d\'ibis, qui impose son profil hitchcockien dans les parcelles color?es des tableaux de Jeanick Bouys. Cet animal fétiche porte un nom. C\'est un bobo, officiellement les bobos existent. Quelque part en Afrique. D\'ailleurs, l\'Afrique est là, offrant au peintre sa gamme de pourpres et de bruns. Mais pourquoi cet hybride mi homme pour le bas, mi oiseau pour le haut? un rève d\'icare? D?o? cette impression de survoler un damier terrestre, comme le paysage intérieur d\'une enfance qui soi loigne? &lt;br /&gt;
Jean Rouand, Prix Goncourt&lt;br /&gt;
&lt;br /&gt;
","","5","../../media_art4art/art0013/_thumbs/th_atelier 26 canvas 100x100cm web.jpg","../../media_art4art/art0013/_thumbs/th_atelier-26-paper-27x180cm-w.jpg","n","45","0","j","6");
INSERT INTO cms_pages VALUES ("47","40","navi_4","eve0005","Jeanick Bouys: &quot;Spuren&quot; – &quot;traces&quot;","vergangen","2008-09-04 00:00:00","0000-00-00 00:00:00","Vernissage am Donnerstag, 4. September 2008, 18.30 – 21.00 Uhr","Begrüssung und Einführung durch die Galeristin&lt;br /&gt;
Der Künstler wird anwesend sein&lt;br /&gt;
&lt;br /&gt;
Jeanick Bouys Bilder sind seit 1980 regelmässig in Museen, Galerien und privaten Sammlungen in Frankreich, Japan, New York und in der Schweiz zu sehen.&lt;br /&gt;
&lt;br /&gt;
Während 10 Jahren arbeitete er in seinem Atelier in New York. J. Bouys hat diverse Preise und Stipendien in Frankreich und Italien gewonnen.&lt;br /&gt;
","","2","../../media_art4art/eve0005/_thumbs/th_atelier 26 canvas 100x100cm web.jpg","","n","0","0","j","8");
INSERT INTO cms_pages VALUES ("48","40","navi_4","eve0006","Susanna Merkle: Lesung","vergangen","2008-10-04 00:00:00","0000-00-00 00:00:00","Lesung der Lyrikerin Susanna Merkle mit anschliessendem Apéro
Samstag, 4. Oktober 2008, 17:00 – 18:00 Uhr - Eintritt CHF 15 pro Person","&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
Normal
0
21
false
false
false
MicrosoftInternetExplorer4
&lt;/xml&gt;&lt;![endif]--&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
&lt;/xml&gt;&lt;![endif]--&gt;
&lt;!--[if gte mso 10]&gt;
&lt;style&gt;
/* Style Definitions */
table.MsoNormalTable
{mso-style-name:&quot;Normale Tabelle&quot;;
mso-tstyle-rowband-size:0;
mso-tstyle-colband-size:0;
mso-style-noshow:yes;
mso-style-parent:&quot;&quot;;
mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
mso-para-margin:0cm;
mso-para-margin-bottom:.0001pt;
mso-pagination:widow-orphan;
font-size:10.0pt;
font-family:&quot;Times New Roman&quot;;
mso-ansi-language:#0400;
mso-fareast-language:#0400;
mso-bidi-language:#0400;}
&lt;/style&gt;
&lt;![endif]--&gt;
&lt;strong&gt;Einführung
durch die Pariser Kunsthistorikerin Françoise Albrecht&lt;/strong&gt;&lt;br /&gt;
&lt;br /&gt;
&lt;strong&gt;Die
Lesung ist auf französisch mit deutschen Erläuterungen&lt;/strong&gt;&lt;strong&gt; &lt;/strong&gt;&lt;br /&gt;
&lt;br /&gt;
Susanna
Merkle ist in der Türkei, später in Afrika(Kongo) aufgewachsen, wo der Vater -
ein Auslands-Schweizer - lange Jahre als Archäologe und Geologe beruflich tätig
war. Dadurch, sowie durch ihre ungarisch-jüdische Mutter, erlebte Susanna
Merkle ihre Kindheit und Jugend schon sehr früh in einem multikulturellen
Umfeld. Bald nach der Einschulung begann Susanna Merkle zu schreiben. Es waren
kurze Geschichten, Erzählungen und Aufsätze, die vielfach auch in
Schülerzeitungen abgedruckt wurden. Das Schreiben gehörte fortan zu ihrem
weiteren Leben und ist eigentlich eine Passion: Persönliche Tagebücher und seit
etwas 30 Jahren Gedichte in Französisch. Seit 1996 verfasst sie Lyrik ebenfalls
in deutscher Sprache. In den 80er Jahren des letzten Jahrhunderts gewann
Susanna Merkle Gedicht-Wettbewerbe in Genf und in Südfrankreich in 1998 sowie
207 erhielt sie in Ascona (Italien) beim „Concorso inernationale „Voci Nostre&quot;-
eines vom Europäischen Parlament unterstützten Wettbewerbes- jeweils einen
1.Preis für französische Lyrik. Susanne Merkle ist Mitglied des Schweizerischen
Autorinnen und Autoren Verbandes sowie des Netzwerk Schreibender Frauen.&lt;br /&gt;
&lt;br /&gt;
In den 80er Jahren des letzten
Jahrhunderts gewann Susanna Merkle Gedicht-Wettbewerbe in Genf und in
Südfrankreich. 1998 sowie 2007 erhielt sie in Ancona (Italien) beim „Concorso
Internationale Voci Nostre&quot; - eines vom Europäischen Parlament unterstützten
Wettbewerbes - jeweils einen 1. Preis für französische Lyrik.&lt;br /&gt;
&lt;br /&gt;
Susanna Merkle ist Mitglied des
Schweizerischen Autorinnen und Autoren Verbandes sowie des Netzwerk
Schreibender Frauen.&lt;br /&gt;
&lt;br /&gt;
Von der Autorin gibt es diverse
Publikationen sowie Veröffentlichungen in Zeitschriften und Anthologien.
Mehrere Gedichte wurden auf Englisch, Italienisch und Ungarisch übersetzt.&lt;br /&gt;
","","2","../../media_art4art/eve0006/_thumbs/th_merkle.jpg","../../media_art4art/eve0006/_thumbs/th_atelier 26 canvas 100x100cm web.jpg","n","0","0","j","9");
INSERT INTO cms_pages VALUES ("49","40","navi_4","eve0007","Jeanick Bouys","vergangen","2008-10-25 00:00:00","0000-00-00 00:00:00","Finissage: Samstag, 25. Oktober 2008, 11.00 – 15.00 Uhr","Finissage: Samstag, 25. Oktober 2008, 11.00 – 15.00 Uhr
",NULL,"2",NULL,NULL,"n","0","0","j","10");
INSERT INTO cms_pages VALUES ("50","34","navi_3","exp0010","Dominique Belvedere – Stefan Jakob","vergangen","2008-11-20 00:00:00","2009-01-31 00:00:00","Dominique Belvedere und Stefan Jakob, Vernissage am Donnerstag, 20. November 2008, 18:30–21:00 Uhr, Begrüssung durch die Galeristin und die Künstler","&lt;p&gt;
&nbsp;
&lt;/p&gt;
&lt;h3&gt;Dominique Belvedere – Neue Bilder&lt;br /&gt;
&lt;/h3&gt;
&lt;p&gt;
Dominique Belvedere ist 1958 in Zürich geboren und in Bülach aufgewachsen.
&lt;/p&gt;
&lt;p&gt;
Die Bilder von Belvedere sind schlichte Kompositionen, die durch die Vielschichtigkeit der übereinander aufgetragenen Farbflächen geprägt sind. Horizontale und vertikale Elemente dynamisieren das Bild und verleihen ihm grosse Spannung und Kraft. Verwischte Bildflächen, subtile Farbklänge, intuitiv gesetzte Striche und eingravierte Elemente geben dem Bild einen meditativen Charakter.
&lt;/p&gt;
&lt;p&gt;
&nbsp;
&lt;/p&gt;
&lt;p&gt;
Es entstehen tiefgründige Bildwelten mit unendlichem Horizont. &quot;Eine von Zeitspuren geprägte Mauer&quot; [Martin Kraft], oder Wüstenlandschaften, die Sehnsucht erwecken. Die Bilder erfüllen den Raum mit freudiger Stille und Harmonie.
&lt;/p&gt;
&lt;p&gt;
&nbsp;
&lt;/p&gt;
&lt;h3&gt;Stefan Jakob&lt;/h3&gt;Stefan Jakob ist 1961 in Winterthur geboren. Vor 25 Jahren sass er das erste Mal an einer Töpferscheibe. Seither beschäftigt ihn das Thema Keramik. Viele Impulse und Anregungen für sein Schaffen erhielt er in Kursen und Workshops bei national und international bekannten Künstlern.&lt;br /&gt;
&lt;br /&gt;
&lt;p&gt;
Während der Ausbildung an der Schule für Gestaltung in Zürich entdeckte er die Faszination für das Feuer, ursprüngliche Brenntechniken und den Bau von einfachen Keramikbrennöfen. Die Mitarbeit an den Ausstellungen &quot;Pfahlbauland Zürich&quot; und &quot;Urgeschichte Live&quot; im Landesmuseum gaben ihm einen vertieften Einblick in das Rekonstruieren von neolitischen Gefässen und das Brennen im offenen Feuer.
&lt;/p&gt;
","","2","../../media_art4art/exp0010/_thumbs/th_dscn1812.jpg","../../media_art4art/exp0010/_thumbs/th_dscn1808.jpg","n","26","57","j","14");
INSERT INTO cms_pages VALUES ("52","43","navi_5","art0015","Kamm Hanspeter","objektkunst","0000-00-00 00:00:00","0000-00-00 00:00:00","Eine phantasievolle Welt, die Freiheit atmet. Die Draht-Objekte
von Kamm verbinden Poesie, Humor, Leichtigkeit und technisch-künstlerische Virtuosit
","Auf die Frage was ihn am meisten zu seinem Schaffen antrieb, sagt Kamm: &quot; Ich wollte vor allem etwas gegen das banale, eintönige Leben tun, gegen die aufgezwungene Autorität, ich wollte die Freiheit bewahren - ich liebe Karikatur und Ironie...&quot; Er vereint Poesie, Leichtigkeit und &quot;art brut&quot;, er ist nicht Opfer, sondern macht sich auf feinste Art lustig - der Zuschauer kann nur schmunzeln und zustimmen.&lt;br /&gt;
&lt;br /&gt;
Der Schweizer Objektkünstler Hanspeter Kamm wurde am 24. April 1938 in Winterthur geboren. Er lernte Schaufensterdekorateur, später Grafiker und war Art Direktor einer bedeutenden Werbeagentur in Stuttgart. Hanspeter Kamm aber ist vor allem ein grosser Erfinder, der mit unermüdlichem Schaffensdrang, mit sprudelnder Fantasie und Experimentierfreude im Laufe der Zeit seinem vielfältigen Werk eine unverkennbare Handschrift aufsetzte. Seine künstlerischtechnische Virtuosität schenkte ihm Narrenfreiheit, die immer zu neuen Kreationen fährt; er ist ein Innovator in der Kunst.&lt;br /&gt;
&lt;br /&gt;
Sein wichtigster Werkstoff Draht, ist Strich und Schraffierung zugleich. Mit ihm verlässt er die Fläche, entwirft vielschichtige Räume. Seltsame Gestalten, Kobolde, Untiere auf Vehikeln bevölkern Drahtreliefs und Objekte. Serien von Kleinplastiken, ironische und interaktive Grossobjekte, strukturelle Arbeiten mit Einbezug der Licht- und Schattenwirkung, &quot;Zeichnungen im Raum&quot;, sind für das vielfältige Werk von Hanspeter Kamm charakteristisch. &quot;Dreidimensionale Zeichnungen&quot; nennt Hanspeter Kamm seine Drahtkunst. Ein Reich voller Leben, Lust und Bewegung.&lt;br /&gt;
&lt;br /&gt;
Hanspeter Kamm ist ein Querdenker und Eigenbrötler. Er pendelt zwischen Kunstbegriff und Gefallensurteil fröhlich hin und her - und pfeift dazu. Er ist ein Meister der &quot;verspinntisierten&quot; Heiterkeit und augenzwinkernden Ernsthaftigkeit. Die versteckten, humorvollen, ironischen, manchmal sarkastischen Botschaften im Draht führen uns an den Ursprung unserer eigenen Wahrnehmung. Seine Welt fasziniert, seine Werke lösen Staunen und spontane Begeisterung aus.&lt;br /&gt;
&lt;br /&gt;
Der Kreis der Kunstsammler und -liebhaber dieses namhaften Künstlers zieht sich von der Schweiz über Europa hin bis Amerika und Fernost. 
","","5","../../media_art4art/art0015/_thumbs/th_objekt64web.jpg","../../media_art4art/art0015/_thumbs/th_objekt45web.jpg","n","0","0","j","0");
INSERT INTO cms_pages VALUES ("51","42","navi_5","art0014","Buchwalder Fredy","malerei","0000-00-00 00:00:00","0000-00-00 00:00:00","Buchwalders Afrikaaufenthalt hat ihn in seiner Malerei wie in seinem Leben markiert. Motive tauchen immer noch auf und inspirieren sein Schaffen.","Buchwalders Afrikaaufenthalt hat ihn in seiner Malerei wie in seinem Leben markiert. Motive tauchen immer noch auf und inspirieren sein Schaffen. Buchwalder forscht weiter in seiner Maltechnik, die viele Schritte durchlaufen. So sind es Asphalt, Quarzsand und Arylbinder, die seinen sensiblen Malgrund bilden.&lt;br /&gt;
&lt;br /&gt;
In Norditalien, wo er jetzt lebt, sind es vorallem die Elementarkräfte, das Zusammenspiel von Granit, Wasser und dem besonderen Licht, die seine Malerei inspirieren. Das Neapelgelb des Winterlichtes oder das Goldgelb eines Herbsttages sind Qualitäten, in welche er eintaucht. &quot;Die Geburt des Bildes entsteht durch die Vereinigung von Materialität, den Farbtönen und der formgebenden, gravurhaften Linie. Die zeichenhafte Sprache der reliefhaften, eingekratzten Linie provoziert die Präsenz des Augenblickes, ein schöpfendes Erfinden im Nichtwissen.&quot;&lt;br /&gt;
&lt;br /&gt;
Angaben zu Fredy Buchwalder:&lt;br /&gt;
&lt;br /&gt;
Fredy Buchwalder, 1955 in Zwingen BL geboren und aufgewachsen. Seit 1972&lt;br /&gt;
intensive Beschäftigung mit der Malerei und Studium in den USA und Basel. Seit&lt;br /&gt;
1985 freischaffender Kunstmaler und Dozent an der Assenza-Malschule, Münchenstein. &nbsp;&lt;br /&gt;
&lt;br /&gt;
Seit 1999 regelmässig Ausstellungen in der Schweiz, darunter im 2000 &quot;Actionpainting&quot; in Zürich und München unter dem Motto &quot;Innovation und Kunst&quot; für Arthur D. Little International.&lt;br /&gt;
&lt;br /&gt;
2001 Atelieraufenthalt in Dakar, Senegal. 2002/03 Afrika-Ausstellung in der Galerie art4art. Seit einigen Jahren lebt und arbeitet er im Piemont/Norditalien. Bilder in öffentlichem und privatem Besitz in der Schweiz.&lt;br /&gt;
&lt;br /&gt;
&quot;Die Suche nach archaischer Ursprünglichkeit, die Elementarkräfte, das Zusammenspiel von Granit, Wasser und dem besonderen Licht in meiner neuen Wahlheimat in Norditalien inspirieren meine Malerei. Ein sensibler Malgrund erlaubt die Geburt des Bildes als Vereinigung von Materialität, den Farbtönen und der formgebenden, gravurhaften Linie.&quot;&lt;br /&gt;
","","5","../../media_art4art/art0014/_thumbs/th_fb_p1000750_web.jpg","../../media_art4art/art0014/_thumbs/th_p1010151.jpg","n","0","0","j","5");
INSERT INTO cms_pages VALUES ("53","43","navi_5","art0016","Munuera Lucia","objektkunst","0000-00-00 00:00:00","0000-00-00 00:00:00","Die Arbeiten von Lucia Munuera  knöpfen an eine uralte Tradition, bringt aber sehr moderne, bisweilen strenge Formen hervor ...","Die Arbeiten von Lucia Munuera&nbsp; knüpfen an eine uralte Tradition, bringt aber sehr moderne, bisweilen strenge Formen hervor, die alle im Handaufbau entstehen. Der langsame Entstehungsprozess lässt der Künstlerin Zeit, ihre intuitiven Ideen direkt einfliessen zu lassen. Eine besonders grosse Herausforderung sind grössere Objekte, die aus mehreren Teilen zusammengesetzt werden und somit im Raku an die Grenze des Machbaren gehen. Raku ist eine faszinierende Art Keramik zu brennen. &lt;br /&gt;
&lt;br /&gt;
Der Ursprung findet sich im 16. Jahrhundert, wo Trinkschalen für die Teezeremonien des Zen-Buddhismus in dieser Technik hergestellt wurden. Die Elemente Feuer, Wasser, Erde und Luft spielen eine bedeutende Rolle im Entstehungsprozess. Bei 1000 Grad Celsius werden die glühenden Objekte mit Eisenzangen aus dem&nbsp; Ofen gehoben, danach in Sägespänen reduziert und anschliessend in Wasser geschmaucht. &quot;Es ist jedes Mal wie ein Wunder, wenn das Stück die Strapazen überstanden hat&quot; sagt Munuera.&lt;br /&gt;
&lt;br /&gt;
Lucia Munuera-Blum, 1964 in Zürich geboren, lebt und arbeitet in Richterswil. Seit 1991 widmet sie sich dem Raku. Ihre fundierten Kenntnisse hat sie vorwiegend in Intensiv-Seminaren und auf autodidaktischem Weg erworben.&lt;br /&gt;
&lt;br /&gt;
&nbsp;&lt;br /&gt;
","","5","../../media_art4art/art0016/_thumbs/th_schale_web.jpg","../../media_art4art/art0016/_thumbs/th_dscn0725web.jpg","n","0","0","j","0");
INSERT INTO cms_pages VALUES ("54","43","navi_5","art0017","Grobet Daniel","objektkunst","0000-00-00 00:00:00","0000-00-00 00:00:00","Die Leidenschaft, die Grobet in seiner Arbeit antreibt, ist das Gleichgewicht. &quot;Es fasziniert mich und fordert mich heraus...","Die Leidenschaft, die Grobet in seiner Arbeit antreibt, ist das Gleichgewicht. &quot;Es fasziniert mich und fordert mich heraus. Ich versuche es bildnerisch umzusetzen, denn wir alle streben ein Leben lang körperlich und seelisch nach Gleichgewicht. Diese Suche beginnt mit dem ersten Schritt.&quot; Grobet\'s Vorliebe für das Eisen ist in der Einfachheit des Materials begründet. Man findet es überall, es wird kalt oder glühend bearbeitet, es rostet und nimmt die wunderschöne Farbe der Baumstämme an. &lt;br /&gt;
&lt;br /&gt;
In seinem Atelier erahnt er die Skulptur. Er bearbeitet das Eisen anders als ein Bildhauer; er biegt, dreht und schlägt es. Er bringt harmonische Linien auf verschiedenen Ebenen in Beziehung und Verbindung zueinander. Ist die fertige Skulptur entstanden, so bekommt sie ihre definitive &quot;Allure&quot; im Raum oder in der freien Natur. Das Werk Grobet\'s lebt im Dialog mit dem Wind oder mit der Neugier des Betrachters, der es nicht lassen kann, subtil mit dem Gleichgewicht zu spielen.&lt;br /&gt;
&lt;br /&gt;
Angaben zu Daniel Grobet &nbsp;&lt;br /&gt;
&lt;br /&gt;
&lt;table border=&quot;0&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot;&gt;
	&lt;tbody&gt;
		&lt;tr&gt;
			&lt;td width=&quot;95&quot; valign=&quot;top&quot;&gt;1936&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;503&quot; valign=&quot;top&quot;&gt;Geboren in St. Imier, Schweiz.&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;95&quot; valign=&quot;top&quot;&gt;1955 - 60&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;503&quot; valign=&quot;top&quot;&gt;Theologiestudium mit Staatsexamen in Paris.&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;95&quot; valign=&quot;top&quot;&gt;1960 - 74 &lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;503&quot; valign=&quot;top&quot;&gt;Als reformierter Pfarrer in Paris und Korsika tätig.&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;95&quot; valign=&quot;top&quot;&gt;1974&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;503&quot; valign=&quot;top&quot;&gt;Begegnung mit einem Werk Calders in der Fondation Maeght, Saint- Paul-de-Vence. Beeindruckt und fasziniert durch Gleichgewicht und Bewegung, beschliesst er, diese Dynamik in Eisenskulpturen umzusetzen.&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;95&quot; valign=&quot;top&quot;&gt;1974 - 96&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;503&quot; valign=&quot;top&quot;&gt;Autodidakt. Erste Werke.&lt;br /&gt;
			Entwickelt die Kollektion &quot;Attrape-Feux&quot;.&lt;br /&gt;
			Skulpturenausstellungen in der Schweiz und Deutschland.&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;95&quot; valign=&quot;top&quot;&gt;Seit 1996&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;503&quot; valign=&quot;top&quot;&gt;Lebt in Südfrankreich.&lt;br /&gt;
			Arbeitet thematisch an immer komplexeren Gleichgewichten. &lt;br /&gt;
			Ausstellungen in Frankreich, Deutschland und der Schweiz.&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
	&lt;/tbody&gt;
&lt;/table&gt;
&nbsp;&lt;br /&gt;
Werke von Daniel Grobet befinden sich in öffentlichen und privaten Sammlungen in der Schweiz und in Frankreich. Das Westschweizer Fernsehen TSR hat 1993 und 2002 zwei Filme über seine Arbeit gedreht.&lt;br /&gt;
&lt;br /&gt;
In der Berichterstattung des Jahres 2003 des Credit Suisse standen die Arbeiten von Daniel Grobet symbolhaft für das Verständnis der Credit Suisse Group von 360&nbsp; Finance. Durch sorgfältige Kombination statischer und dynamischer Elemente erreicht der Künstler in seinen handgefertigten Eisenskulpturen ein harmonisches Gleichgewicht.&quot; In diesem Jahr fand die erste Ausstellung bei art4art statt.&lt;br /&gt;
&lt;br /&gt;
Im Oktober 2006 war Daniel Grobet Ehrengast des &quot;XIIe parcours de l\'art&quot; in Avignon, eines der bedeutendsten Kunst-Events Südfrankreichs.
","","5","../../media_art4art/art0017/_thumbs/th_dsc01139[1]web.jpg","../../media_art4art/art0017/_thumbs/th_dsc04627_1web.jpg","n","0","0","j","0");
INSERT INTO cms_pages VALUES ("55","42","navi_5","art0018","Bravi Giuseppe","malerei","0000-00-00 00:00:00","0000-00-00 00:00:00","In den Grotten von Lascaux hat sich der Mensch zum ersten Mal in Zeichen ausgedrückt und damit die unendliche Dimension seines Strebens konkretisiert.","In den Grotten von Lascaux hat sich der Mensch zum ersten Mal in Zeichen ausgedrückt und damit die unendliche Dimension seines Strebens konkretisiert. Seit dreissig Jahren setzt sich Bravi mit der verführerischen und emotionalen Kraft der Zeichen auseinander.&lt;br /&gt;
&lt;br /&gt;
Sein Werk ist immer noch unverkennbar, mal an Klee erinnernd, mal an archäologische Recherchen im mediterranen Raum.&lt;br /&gt;
&lt;br /&gt;
&quot;Der Zufall kann sehr kreativ sein. Das Entscheidende ist, ihn zu erkennen.&quot; (Giuseppe Bravi)&nbsp; &quot;Giuseppe Bravi&nbsp; hat dann erkannt, dass man dem &quot;cogito ergo sum&quot; von Descartes eine Wahrnehmung der Welt, welche Intuition, Unerklärbares, Poesie der Worte, der Formen und der Farbe einbezieht, gegenüberstellen muss&quot;&nbsp; (Eric-Alain Kohler)&lt;br /&gt;
&lt;br /&gt;
Angaben zu Giuseppe Bravi &nbsp;&lt;br /&gt;
&lt;br /&gt;
&lt;table border=&quot;0&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot;&gt;
	&lt;tbody&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;1940 &lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Geboren in Mailand&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;seit 1949&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Lebt und arbeitet in Gardone Riviera, Brescia, Italien&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;seit 1966 &lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Regelmässige persönliche und Gruppenausstellungen in Italien, Österreich, Japan und in der Schweiz&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
	&lt;/tbody&gt;
&lt;/table&gt;
&nbsp; &lt;br /&gt;
Einzelausstellungen (Auszug seit 1982) &nbsp;&lt;br /&gt;
&lt;br /&gt;
&lt;table border=&quot;0&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot;&gt;
	&lt;tbody&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;1983 &lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Galerie Farel, Aigle, CH&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;1984&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Galerie C. Planque, Lausanne, CH&lt;br /&gt;
			Galerie Contemporaine, Genève, CH&lt;br /&gt;
			Studio Toni De Rossi, Verona, I&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;1985 &lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Galerie Farel, Aigle, CH&lt;br /&gt;
			Istituto italiano di&nbsp; Cultura, Vienna A&lt;br /&gt;
			Galerie & Atelier, Feldmeilen, CH&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;1988&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Galerie Contemporaine, Genève, CH&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;1989&nbsp;&nbsp;&nbsp;&nbsp; &lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Studio Toni De Rossi, Verona, I&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;1990&nbsp;&nbsp;&nbsp;&nbsp; &lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Galerie Contemporaine, Genève, CH&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;1991&nbsp;&nbsp;&nbsp;&nbsp; &lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Galerie Dougoud, Corcelettes - Grandson, CH&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;1992&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Centro di Cultura Einaudi, Mantova, I&lt;br /&gt;
			Studio Toni De Rossi, Verona, I&lt;br /&gt;
			Galerie Farel, Aigle, CH&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;1996&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Studio Toni De Rossi, Verona, I&lt;br /&gt;
			Galleria Cronos, Concesio, I&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;1997&nbsp;&nbsp;&nbsp;&nbsp; &lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Galerie Alexandre Mottier, Genève, CH&lt;br /&gt;
			Collegiata S. Maria, Lauro, I&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;1999&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Galerie Alexandre Mottier, Genève, CH&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;2000&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Galerie Alexandre Mottier, Genève, CH&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;2001&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Sala d\'arte Novaglio, Bovezzo, I&lt;br /&gt;
			Libreria II Labirinto, Alghero, I&lt;br /&gt;
			Africa, XII Settimana d\'arte di Cecina, I&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;2002&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Segni 2000/2002, Villa Usignolo, Sarezzo, I&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;2003&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Galerie Alexandre Mottier, Genève, CH&lt;br /&gt;
			art4art, Halle für Kunst, Küsnacht, CH&lt;br /&gt;
			Galerie Farel, Aigle, CH&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
	&lt;/tbody&gt;
&lt;/table&gt;
","","5","../../media_art4art/art0018/_thumbs/th_africaoracolo_web.jpg","../../media_art4art/art0018/_thumbs/th_bravi-neu-0607-016.jpg","n","0","0","j","4");
INSERT INTO cms_pages VALUES ("56","40","navi_4","eve0008","Vernissage Dominique Belvedere – Stefan Jakob","vergangen","2008-11-20 00:00:00","2008-11-20 00:00:00","Vernissage Dominique Belvedere – Stefan Jakob am 20.11.,18:30 Uhr. Die Künstler werden anwesend sein, Einführung durch die Galeristin",NULL,NULL,"2",NULL,NULL,"n","0","0","n","11");
INSERT INTO cms_pages VALUES ("57","43","navi_5","art0019","Jakob Stefan","objektkunst","0000-00-00 00:00:00","0000-00-00 00:00:00","„Das letzte Wort hat das Feuer“. Diese Aussage hat in der keramischen Arbeit von Stefan Jakob eine zentrale Bedeutung. Seine keramischen Objekte sind.","„Das letzte Wort hat das Feuer&quot;. Diese Aussage hat in der keramischen Arbeit von Stefan Jakob eine zentrale Bedeutung. Seine keramischen Objekte sind im wahrsten Sinne durch das Feuer gegangen. Die früheren Raku-Gefässe mit ihren schwarzen, aufgerissenen und rauen und Oberflächen-Strukturen erinnern an verbrannte Erde oder verwitterten Fels.&lt;br /&gt;
&lt;br /&gt;
Die glasierten, weissen mit schwarzen Rissen durchzogenen Flächen im Inneren der Gefässe, stehen im Gegensatz zur rauen Aussenseite.  Diese Gegensätze sind Teil der Spannung zwischen innen und aussen und betonen das Gefäss, dessen Gebrauchswert aber nicht im Vordergrund steht. Bei einigen Werken brechen die schwarzen Risse in der Glasur  völlig  auf und bilden eine geschundene, weisse Oberfläche, die stark an ausgetrocknete Salzseen erinnert.&lt;br /&gt;
&lt;br /&gt;
&lt;p align=&quot;left&quot;&gt;
Nach einem mehrmonatigen Auslandaufenthalt in diesem Jahr entstanden die neuen Arbeiten von Stefan Jakob. Das Arbeiten als Arist in Residence in einem Art Center in Canberra, führte zu einer intensiven Auseinandersetzung mit der unvergleichlichen Natur Australiens. In den ausgetrockneten Wüsten und Gebirgen fand er seine Strukturen wieder, mit denen er sich in seinen keramischen Werken schon seit längerer Zeit auseinandersetzt. Besonders die Millionen Jahre alten und stark verwitterten Schichtungen der Felsformationen in den Canyons inspirierten ihn sehr. Auch die schwarzen Stämme des Grasbaumes, der jedes Jahr nur wenige Millimeter wächst, führten zu neuen Arbeiten. Bis zu 80 cm hohe schlanke Gefässe sind entstanden. Die Aussenseite ist aufgebaut aus hunderten, Millimeter dicken, flach gepressten Wülsten, die eine einzigartige Oberflächenstruktur ergeben. Dazu kontrastiert die weisse Glasur mit den schwarzen Rissen im Innenraum.&nbsp;
&lt;/p&gt;
&lt;p align=&quot;left&quot;&gt;
&lt;br /&gt;
Die meisten dieser Raku-Objekte haben eine strenge, gespannte Form. Andere beginnen sich zu drehen, sind verspielt und erinnern an Tänzer.
&lt;/p&gt;
","","5","../../media_art4art/art0019/_thumbs/th_objekte-geschichtet1.jpg","../../media_art4art/art0019/_thumbs/th_kugelobjekt.jpg","n","0","0","j","0");
INSERT INTO cms_pages VALUES ("58","40","navi_4","eve0009","Stefan Jakob: Raku-Brennen vor der Galerie","vergangen","2008-12-14 00:00:00","0000-00-00 00:00:00","Weihnachtsapéro: Raku-Brennen vor der Galerie am Sonntag, 14.12.2008, 11.00 Uhr ","Zwischen 11.00 - 15.00 h werden die Besucher in das Geheimnis des
Raku-Brennens eingeführt. Kinder wie auch Erwachsene können eine
Tonschale glasieren und in einem kleinen holzbefeuerten Raku-Ofen
brennen. Der Künstler bietet Ihnen die Möglichkeit, ein ganz
persönliches Weihnachtsgeschenk zu gestalten.&lt;br /&gt;
&lt;br /&gt;
&lt;p&gt;
Mit langen Zangen werden die glühenden Schalen nach nur einer halben
Stunde aus dem 1000° C heissen Raku-Ofen genommen und dann zum
Auskühlen ins Sägemehl eingegraben. Hier erhalten sie auch das für
Raku-Objekte charakteristische Craquelée Muster und die in allen Farben
schillernde Glasuroberfläche. 
&lt;/p&gt;
","","2","../../media_art4art/eve0009/_thumbs/th_paar.jpg","","n","0","0","j","12");
INSERT INTO cms_pages VALUES ("59","40","navi_4","eve0010","Dominique Belvedere – Stefan Jakob","vergangen","2009-01-31 00:00:00","0000-00-00 00:00:00","Finissage: Samstag, 31. Januar 2009, 10.00 – 15.00 Uhr ",NULL,NULL,"5",NULL,NULL,"n","0","0","j","13");
INSERT INTO cms_pages VALUES ("60","34","navi_3","exp0011","Susi Kramer","vergangen","2009-03-05 00:00:00","2009-05-09 00:00:00","Susi Kramer, Vernissage am Donnerstag, 5. März 2009, 18:30–21:00 Uhr, Laudatio durch Nicole Scholl, Kunsthistorikerin","Susi Kramer, geboren 1947, lebt und arbeitet in Oberhof (AG) und Cannes (F).&lt;br /&gt;
&lt;br /&gt;
Die Ausstellung widerspiegelt ein spannendes Spektrum an vielseitigen Arbeiten der Künstlerin.&lt;br /&gt;
&lt;br /&gt;
Seit 1993 arbeitet die Malerin auch mit Acrylglass. Die einzigartigen Technik, die bemalten Acrylglassplatten im Ofen zu verschmelzen, ist eine grosse Herausforderung. Die Farben erhalten dadurch eine prägende Leuchtkraft und die Objekte eine faszinierende Dreidimensionalität und Transparenz.&lt;br /&gt;
&lt;br /&gt;
Ihre erste Ausstellung fand 1975 in Teheran statt und seither folgten Ausstellungen in der Schweiz, in Europa und Asien. Die Künstlerin hat verschiedene Kunst-am-Bau-Mandate gewonnen.
","","2","../../media_art4art/exp0011/_thumbs/th_aussenbild gerade 296_xl.jpg","../../media_art4art/exp0011/_thumbs/th_fri6193_xl.jpg","n","0","0","j","13");
INSERT INTO cms_pages VALUES ("61","42","navi_5","art0020","Nina K.","malerei","0000-00-00 00:00:00","0000-00-00 00:00:00","Nina K.’s Bilder sind eine Reise ins Innere des menschlichen Seins. Jedes Bild erzählt nicht nur seine Geschichte, sondern ist Zeuge einer tiefen ...","Nina K.’s Bilder sind eine Reise ins Innere des menschlichen Seins. Jedes Bild erzählt nicht nur seine Geschichte, sondern ist Zeuge einer tiefen Auseinandersetzung mit dem Selbst. Materialien mit hohem Symbolwert wie Pigmente, Erde, Lehm, zermalte Steine und vor allem Asche, appliziert Nina K. mit Farben, Schritt für Schritt, wie in einem Urritual. Wie Sedimente überlagern sich die Farbschichten. Archaische Symbole, werden ins Bild integriert. Symbole der menschlichen Vergangenheit.&lt;br /&gt;
&lt;br /&gt;
Nina K.’s Bilder erforschen Tiefen. Sie versinnbildlichen&nbsp; geheimnisvolle, verborgene Schätze, die man nicht nur mit offenen Augen entdecken kann. Sie sind das Resultat eines sensiblen, tiefen Abenteuers in der innigsten Freiheit des Selbst.&lt;br /&gt;
&lt;br /&gt;
Mehrjährige Kunstausbildung, diverse Fortbildungen und Studien, sowie Ausstellungen im In- und Ausland gehören zu Ihrem Lebenslauf.
","","5","../../media_art4art/art0020/_thumbs/th_bild014_e.jpg","../../media_art4art/art0020/_thumbs/th_bild0047_e.jpg","n","0","0","j","3");
INSERT INTO cms_pages VALUES ("62","43","navi_5","art0021","Susi Kramer","objektkunst","0000-00-00 00:00:00","0000-00-00 00:00:00","Susi Kramer, Vernissage am Donnerstag, 5. März 2009, 18:30–21:00 Uhr, Laudatio durch Nicole Scholl, Kunsthistorikerin","Susi Kramer, geboren 1947, lebt und arbeitet in Oberhof (AG) und Cannes (F).&lt;br /&gt;
&lt;br /&gt;
Die Ausstellung widerspiegelt ein spannendes Spektrum an vielseitigen Arbeiten der Künstlerin.&lt;br /&gt;
&lt;br /&gt;
Seit 1993 arbeitet die Malerin auch mit Acrylglass. Die einzigartigen
Technik, die bemalten Acrylglassplatten im Ofen zu verschmelzen, ist
eine grosse Herausforderung. Die Farben erhalten dadurch eine prägende
Leuchtkraft und die Objekte eine faszinierende Dreidimensionalität und
Transparenz.&lt;br /&gt;
&lt;br /&gt;
Ihre erste Ausstellung fand 1975 in Teheran statt und seither folgten
Ausstellungen in der Schweiz, in Europa und Asien. Die Künstlerin hat
verschiedene Kunst-am-Bau-Mandate gewonnen.
","","5","../../media_art4art/art0021/_thumbs/th_aussenbild gerade 296_xl.jpg","","n","0","0","j","0");
INSERT INTO cms_pages VALUES ("63","40","navi_4","eve0011","Susi Kramer - Sonntagsapéro","vergangen","2009-04-05 00:00:00","0000-00-00 00:00:00","Einladung zum Sonntagsapéro am 5. April 2009, 11:00 - 15:00 Uhr
","Einladung zum Sonntagsapéro am 5. April 2009, 11:00 - 15:00 Uhr&lt;br /&gt;
&lt;br /&gt;
Liebe Kunstfreunde&lt;br /&gt;
Ich freue mich, auch im Namen von Susi Kramer, Sie zu einem gemütlichen Rundgang durch diese erfrischende Ausstellung und zum Apéro einzuladen.&lt;br /&gt;
&nbsp;&lt;br /&gt;
Die Künstlerin wird anwesend sein.
","","2","../../media_art4art/eve0011/_thumbs/th_jardin-magique-ii_2.jpg","../../media_art4art/eve0011/_thumbs/th_hauptbild_xl.jpg","n","0","0","j","14");
INSERT INTO cms_pages VALUES ("64","40","navi_4","eve0012","Susi Kramer","vergangen","2009-05-09 00:00:00","0000-00-00 00:00:00","Finissage: Samstag, 9. Mai 2009, 11.00 – 15.00 Uhr
In Anwesenheit der Künstlerin","Finissage: Samstag, 9. Mai 2009, 11.00 – 15.00 Uhr&lt;br /&gt;
In Anwesenheit der Künstlerin
",NULL,"2",NULL,NULL,"n","0","0","j","15");
INSERT INTO cms_pages VALUES ("65","34","navi_3","exp0012","Kamel Berkouk: Neue Bilder und Holzskulpturen","vergangen","2009-05-28 00:00:00","2009-07-11 00:00:00","Vernissage: Donnerstag, 28. Mai 2009, 18.30 - 21.00 Uhr","Neue Bilder und Holzskulpturen&lt;br /&gt;
&lt;br /&gt;
Vernissage: Donnerstag, 28. Mai 2009, 18.30 - 21. O0 Uhr&lt;br /&gt;
Apéro Sonntag, 14. Juni 2009, 11.00 - 15.00 Uhr&lt;br /&gt;
Finissage: Samstag, 11. Juli 2009, 11.00 - 15.00 Uhr
","","2","../../media_art4art/exp0012/_thumbs/th_kamelberkouk_ausstellungsbild1.jpg","../../media_art4art/exp0012/_thumbs/th_41090367_karte-4.jpg","n","16","0","j","12");
INSERT INTO cms_pages VALUES ("66","40","navi_4","eve0013","Kamel Berkouk - Sonntagsapéro","vergangen","2009-06-14 00:00:00","0000-00-00 00:00:00","Apéro: Sonntag, 14. Juni 11.00 - 15.00 Uhr","Apéro: Sonntag, 14. Juni 11.00 - 15.00 Uhr
",NULL,"2",NULL,NULL,"n","0","0","j","6");
INSERT INTO cms_pages VALUES ("67","40","navi_4","eve0014","Kamel Berkouk - Konzert","vergangen","2009-07-03 00:00:00","0000-00-00 00:00:00","Konzert: Freitag, 3. Juli, 20.00 Uhr “brasilianische Musik”
         Edmauro de Oliveira, Gitarre/Stimme - Joâo dos Bastos, Flöte","F a r b e&nbsp; -&nbsp; K l a n g&nbsp; -&nbsp; R h y t m u s&nbsp; &lt;br /&gt;
&lt;br /&gt;
Brasilianische Musik gespielt vom Duo Brasilis: &lt;br /&gt;
Edmauro de Oliveira, Gitarre/Vocal&lt;br /&gt;
João dos Bastos, Flöte &lt;br /&gt;
&nbsp;&lt;br /&gt;
Freitag, den 3. Juli um 20.00 Uhr &lt;br /&gt;
&nbsp;&lt;br /&gt;
Musikalische Reise nach Brasilien, durch die klassische und traditionelle brasilianische Musik.&lt;br /&gt;
&lt;br /&gt;
Wir bitten um vorzeitige Reservation via e-Mail, da die Plätze&lt;br /&gt;
limitiert sind! Konzerteintritt inkl. Apéro CHF 40&lt;br /&gt;
","","2","../../media_art4art/eve0014/_thumbs/th_a4a_brasil.jpg","","n","0","0","j","5");
INSERT INTO cms_pages VALUES ("68","41","navi_5","art0022","Krähenbühl Etienne","skulpturen","0000-00-00 00:00:00","0000-00-00 00:00:00","&quot;Mon expression c’est la matière.&quot; Mit seinen Arbeiten schliesst Krähenbühl an die Reihe der seit den 50ger und 60ger Jahren mit grossem Erfolg...","&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
Normal
0
false
false
false
EN-US
X-NONE
X-NONE
MicrosoftInternetExplorer4
&lt;/xml&gt;&lt;![endif]--&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
&lt;/xml&gt;&lt;![endif]--&gt;
&lt;!--[if gte mso 10]&gt;
&lt;style&gt;
/* Style Definitions */
table.MsoNormalTable
{mso-style-name:&quot;Normale Tabelle&quot;;
mso-tstyle-rowband-size:0;
mso-tstyle-colband-size:0;
mso-style-noshow:yes;
mso-style-priority:99;
mso-style-qformat:yes;
mso-style-parent:&quot;&quot;;
mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
mso-para-margin:0cm;
mso-para-margin-bottom:.0001pt;
mso-pagination:widow-orphan;
font-size:11.0pt;
font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;
mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:&quot;Times New Roman&quot;;
mso-fareast-theme-font:minor-fareast;
mso-hansi-font-family:Calibri;
mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:&quot;Times New Roman&quot;;
mso-bidi-theme-font:minor-bidi;}
&lt;/style&gt;
&lt;![endif]--&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
Normal
0
false
false
false
EN-US
X-NONE
X-NONE
MicrosoftInternetExplorer4
&lt;/xml&gt;&lt;![endif]--&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
&lt;/xml&gt;&lt;![endif]--&gt;
&lt;!--[if gte mso 10]&gt;
&lt;style&gt;
/* Style Definitions */
table.MsoNormalTable
{mso-style-name:&quot;Normale Tabelle&quot;;
mso-tstyle-rowband-size:0;
mso-tstyle-colband-size:0;
mso-style-noshow:yes;
mso-style-priority:99;
mso-style-qformat:yes;
mso-style-parent:&quot;&quot;;
mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
mso-para-margin-top:0cm;
mso-para-margin-right:0cm;
mso-para-margin-bottom:10.0pt;
mso-para-margin-left:0cm;
line-height:115%;
mso-pagination:widow-orphan;
font-size:11.0pt;
font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;
mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:&quot;Times New Roman&quot;;
mso-fareast-theme-font:minor-fareast;
mso-hansi-font-family:Calibri;
mso-hansi-theme-font:minor-latin;}
&lt;/style&gt;
&lt;![endif]--&gt;
«&nbsp;Elle
est fondamentale pour moi, c\'est un ancrage, elle retient mes pensées, ma
recherche, par elle j\'ai rencontré l\'extérieur. Le métal s\'est imposé très tôt,
et ses particularités aussi. &lt;br /&gt;
&lt;br /&gt;
Depuis 1968,
je travaille fer, acier, inox, bronze, selon les périodes et les thématiques
qui me préoccupent. Ce sont des défis dans la création et dans l\'expression par
leurs voix, il y a sans cesse lutte, émerveillement et jeu.&nbsp;»&lt;br /&gt;
&lt;br /&gt;
Mit seinen
Arbeiten schliesst Krähenbühl an die Reihe der seit den fünfziger und sechziger
Jahren mit grossem Erfolg tätigen Schweizer Eisenplastiker an: Bernhard
Luginbühl, Jean Tinguely, Robert Müller - doch hat er durch seine
Experimentierfreude und seine Materialkenntnis, die ihn auch mit Physikern
intensiv zusammenarbeiten lassen, seinen eigenen Weg und seine eigene
Ausdrucksweise gefunden.&lt;br /&gt;
","","5","../../media_art4art/art0022/_thumbs/th_dsc_0081.jpg","../../media_art4art/art0022/_thumbs/th_afrika-2009.jpg","n","0","0","j","0");
INSERT INTO cms_pages VALUES ("69","40","navi_3","exp0013","Etienne Krähenbühl - Charles Blockey","vergangen","2009-09-03 00:00:00","2009-10-24 00:00:00","Jubiläumsausstellung: 7 Jahre art4art
Vernissage Donnerstag, 3. September, 18:30 Uhr","<!--[if gte mso 9]><xml>
Normal
0
false
false
false
EN-US
X-NONE
X-NONE
MicrosoftInternetExplorer4
</xml><![endif]--><!--[if gte mso 9]><xml>
</xml><![endif]-->
<!--[if gte mso 10]>
<mce:style><! 
/* Style Definitions */
table.MsoNormalTable
{mso-style-name:\"Normale Tabelle\";
mso-tstyle-rowband-size:0;
mso-tstyle-colband-size:0;
mso-style-noshow:yes;
mso-style-priority:99;
mso-style-qformat:yes;
mso-style-parent:\"\";
mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
mso-para-margin-top:0cm;
mso-para-margin-right:0cm;
mso-para-margin-bottom:10.0pt;
mso-para-margin-left:0cm;
line-height:115%;
mso-pagination:widow-orphan;
font-size:11.0pt;
font-family:\"Calibri\",\"sans-serif\";
mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:\"Times New Roman\";
mso-fareast-theme-font:minor-fareast;
mso-hansi-font-family:Calibri;
mso-hansi-theme-font:minor-latin;}
-->
<!--[endif] -->
<p>
<strong>Charles Blockey</strong>
- Paperworks on canvas<br />
<br />
Viele
Arbeiten Charles Blockeys erscheinen äusserst sensibel. Sie atmen « Luft,
Licht, Ton oder Etwas » und muten wie eine Poesie an, welche den Betrachter in
unbestimmte und freilassende Räume mitnimmt.<br />
<br />
«
Das Überwinden der Zeitdimension und das Durchbrechen des physischen Raumes
motivieren meine Malerei; Farbe für sich kann die Zeitlosigkeit schaffen, die
Sprache der Formen und Linien neue Räume bilden. »<br />
<br />
<br />
<strong>Etienne Krähenbühl</strong> - Sculptures mémobiles<br />
<br />
Mon expression c\'est la matière. <br />
<br />
Elle est
fondamentale pour moi, c\'est un ancrage, elle retient mes pensées, ma
recherche, par elle j\'ai rencontré l\'extérieur. Le métal s\'est imposé très tôt,
et ses particularités aussi. <br />
<br />
Depuis 1968, je travaille fer, acier, inox,
bronze, selon les périodes et les thématiques qui me préoccupent. Ce sont des
défis dans la création et dans l\'expression par leurs voix, il y a sans cesse lutte,
émerveillement et jeu.<br />
<br /></p>","","2","../../media_art4art/exp0013/_thumbs/th_dsc_0081.jpg","../../media_art4art/exp0013/_thumbs/th_souffle-1aa-copym.jpg","n","68","29","j","17");
INSERT INTO cms_pages VALUES ("92","32","navi_4","navi_40026","neues Event","laufend","2011-11-14 00:00:00","2011-11-17 00:00:00","Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat...","<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>","","1","../../media_art4art/navi_40026/_thumbs/th_bild2.jpg","../../media_art4art/navi_40026/_thumbs/th_dscn0530.jpg","a","0","0","j","1");
INSERT INTO cms_pages VALUES ("70","33","navi_4","eve0015","Sonntagsapéro 11:00-15:00 Uhr","kommend","2011-11-20 00:00:00","0000-00-00 00:00:00","Jubiläumsausstellung: Etienne Krähenbühl & Charles Blockey","<!--[if gte mso 9]><xml>
Normal
0
false
false
false
EN-US
X-NONE
X-NONE
MicrosoftInternetExplorer4
</xml><![endif]--><!--[if gte mso 9]><xml>
</xml><![endif]-->
<!--[if gte mso 10]>
<mce:style><! 
/* Style Definitions */
table.MsoNormalTable
{mso-style-name:\"Normale Tabelle\";
mso-tstyle-rowband-size:0;
mso-tstyle-colband-size:0;
mso-style-noshow:yes;
mso-style-priority:99;
mso-style-qformat:yes;
mso-style-parent:\"\";
mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
mso-para-margin:0cm;
mso-para-margin-bottom:.0001pt;
mso-pagination:widow-orphan;
font-size:11.0pt;
font-family:\"Calibri\",\"sans-serif\";
mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:\"Times New Roman\";
mso-fareast-theme-font:minor-fareast;
mso-hansi-font-family:Calibri;
mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:\"Times New Roman\";
mso-bidi-theme-font:minor-bidi;}
-->
<!--[endif] -->
<!--[if gte mso 9]><xml>
Normal
0
false
false
false
EN-US
X-NONE
X-NONE
MicrosoftInternetExplorer4
</xml><![endif]--><!--[if gte mso 9]><xml>
</xml><![endif]-->
<!--[if gte mso 10]>
<mce:style><! 
/* Style Definitions */
table.MsoNormalTable
{mso-style-name:\"Normale Tabelle\";
mso-tstyle-rowband-size:0;
mso-tstyle-colband-size:0;
mso-style-noshow:yes;
mso-style-priority:99;
mso-style-qformat:yes;
mso-style-parent:\"\";
mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
mso-para-margin:0cm;
mso-para-margin-bottom:.0001pt;
mso-pagination:widow-orphan;
font-size:11.0pt;
font-family:\"Calibri\",\"sans-serif\";
mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:\"Times New Roman\";
mso-fareast-theme-font:minor-fareast;
mso-hansi-font-family:Calibri;
mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:\"Times New Roman\";
mso-bidi-theme-font:minor-bidi;}
-->
<!--[endif] -->
<p>
<strong>Einladung zum Sonntagsapéro am 20. September
2009, 11:00 - 15:00 Uhr</strong><br />
<br />
Liebe Kunstfreunde<br />
<br />
Ich freue mich, auch im Namen der Künstler, Sie zu
einem gemütlichen 
Rundgang durch diese „klangvolle\" Ausstellung
einzuladen.<br />
&nbsp;
<br />
Mit
herzlichen Grüssen<br />
<br />
Camilla Jeannet<br />
<br /></p>","","5","../../media_art4art/eve0015/_thumbs/th_web-p1010035.jpg","../../media_art4art/eve0015/_thumbs/th_web-kraehen-dsc_6032b.jpg","n","0","0","j","2");
INSERT INTO cms_pages VALUES ("71","34","navi_3","exp0014","Accrochage und Sonderschau Tristan Rà","vergangen","2009-11-19 00:00:00","2010-01-30 00:00:00","Accrochage mit neuen Werken von Berkouk, Blockey, Bouys, Bravi, Brühwiler, Buchwalder, Grobet, Nina K. und Kramer.
","&lt;!--[if !mso]&gt;
&lt;style&gt;
v\\:* {behavior:url(#default#VML);}
o\\:* {behavior:url(#default#VML);}
w\\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
&lt;/style&gt;
&lt;![endif]--&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
&lt;/xml&gt;&lt;![endif]--&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
Normal
0
false
21
false
false
false
DE
X-NONE
X-NONE
&lt;/xml&gt;&lt;![endif]--&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
&lt;/xml&gt;&lt;![endif]--&gt;
&lt;!--[if gte mso 10]&gt;
&lt;style&gt;
/* Style Definitions */
table.MsoNormalTable
{mso-style-name:&quot;Normale Tabelle&quot;;
mso-tstyle-rowband-size:0;
mso-tstyle-colband-size:0;
mso-style-noshow:yes;
mso-style-priority:99;
mso-style-qformat:yes;
mso-style-parent:&quot;&quot;;
mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
mso-para-margin-top:0cm;
mso-para-margin-right:0cm;
mso-para-margin-bottom:10.0pt;
mso-para-margin-left:0cm;
mso-pagination:widow-orphan;
font-size:11.0pt;
font-family:&quot;Cambria&quot;,&quot;serif&quot;;
mso-ascii-font-family:Cambria;
mso-ascii-theme-font:minor-latin;
mso-hansi-font-family:Cambria;
mso-hansi-theme-font:minor-latin;
mso-fareast-language:EN-US;}
&lt;/style&gt;
&lt;![endif]--&gt;
Liebe Kunstfreunde, liebe Freunde der art4art&lt;br /&gt;
&lt;br /&gt;
Ich wünsche Ihnen frohe Weihnachten und die besten Wünsche für einen
schönen Jahresausklang!&lt;br /&gt;
&lt;br /&gt;
Ich kann mit Freude und Genugtuung auf ein schönes Ausstellungsjahr
zurückblicken und danke Ihnen für Ihren Besuch während dieses Jahres. Sie
haben dazu beigetragen, dass ich mit Begeisterung namhafte Ausstellungen,
Konzerte und Lesungen in der Galerie durchführen konnte. Mit Ihrer
Unterstützung ermuntern Sie mich, mich weiterhin für die Kunstszene zu
engagieren und Ihnen professionelle Künstler vorzustellen. Auch freue ich mich,
Sie persönlich zu Hause beraten und unterstützen zu dürfen, damit Sie sich mit guter
Kunst umgeben können. &lt;br /&gt;
&lt;br /&gt;
Bei dieser Gelegenheit mache ich Sie gerne auf die Sonderschau „Voyages
en Orient&quot; des bekannten französischen Künstlers „Tristan Rà&quot; während des
Monats Januar 2010 aufmerksam.&lt;br /&gt;
&lt;br /&gt;
Mit den allerbesten Neujahrswünschen &lt;br /&gt;
Herzlich, Camilla Jeannet&lt;br /&gt;
&lt;br /&gt;
Agenda:&lt;br /&gt;
&lt;br /&gt;
Accrochage mit neuen Werken von Berkouk, Blockey, Bouys, Bravi,
Brühwiler, Buchwalder, Grobet, Nina K. und Kramer.&lt;br /&gt;
&lt;br /&gt;
09.01.2010, 11:00-15:00 Eröffnung der Sonderschau Tristan Rà &lt;br /&gt;
","","2","../../media_art4art/exp0014/_thumbs/th_2010-01-l1020528.jpg","../../media_art4art/exp0014/_thumbs/th_2008-mvc-096f.jpg","n","0","0","j","11");
INSERT INTO cms_pages VALUES ("72","32","navi_4","eve0016","Lesung Susanna Merkle - Reise in den Orient","laufend","2011-10-23 00:00:00","2012-02-29 00:00:00","Einladung zu einer poetischen Orient-Reise - 
Lesung der Lyrikerin Susanne Merkle zur Sonderschau von Tristan Rà mit anschliessendem Apéro, 17:00 Uhr ","<!--[if gte mso 9]><xml>
Normal
0
21
false
false
false
DE
X-NONE
X-NONE
</xml><![endif]--><!--[if gte mso 9]><xml>
</xml><![endif]-->
<!--[if gte mso 10]>
<mce:style><! 
/* Style Definitions */
table.MsoNormalTable
{mso-style-name:\"Normale Tabelle\";
mso-tstyle-rowband-size:0;
mso-tstyle-colband-size:0;
mso-style-noshow:yes;
mso-style-priority:99;
mso-style-qformat:yes;
mso-style-parent:\"\";
mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
mso-para-margin:0cm;
mso-para-margin-bottom:.0001pt;
mso-pagination:widow-orphan;
font-size:11.0pt;
font-family:\"Calibri\",\"sans-serif\";
mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:\"Times New Roman\";
mso-fareast-theme-font:minor-fareast;
mso-hansi-font-family:Calibri;
mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:\"Times New Roman\";
mso-bidi-theme-font:minor-bidi;}
-->
<!--[endif] -->
<p>
23.01.2010, 17:00-18:00 Uhr<br />
Einführung durch die Pariser
Kunsthistorikerin Françoise Albrecht. Die Lesung ist auf Französisch mit
deutschen Erläuterungen.<br />
<br />
Ich freue mich sehr, Sie zu diesem
Anlass und zum anschliessenden Apéro zu begrüssen!<br />
<br />
<strong>Eintritt CHF 20.- pro Person. Anmeldung
erwünscht.</strong><br />
<br />
Mit herzlichen Grüssen<br />
Camilla Jeannet<br />
<br /></p>","","2","../../media_art4art/eve0016/_thumbs/th_merkle.jpg","../../media_art4art/eve0016/_thumbs/th_2010-01-l1020528.jpg","a","0","0","j","2");
INSERT INTO cms_pages VALUES ("74","34","navi_3","exp0015","Hanspeter Kamm - Flugjahr 2010","vergangen","2010-03-13 00:00:00","2010-05-29 00:00:00","Vernissage Samstag, 13. März 2010, 11:00-17:00 Uhr - 
Während der Frühlingsferien vom 26.4.-7.5. geschlossen","13.03.2010.-29.05.2010&lt;br /&gt;
Vernissage Samstag, 13. März 2010, 11:00-17:00 Uhr&lt;br /&gt;
&lt;br /&gt;
Als einen &quot;begeisterten Mythenbauer und -zerstörer&quot; bezeichnet sich Hanspeter Kamm und das &quot;gut&quot; gibt es für ihn nicht, denn massgebend ist für ihn die Ernsthaftigkeit und die Verbindlichkeit. Er webt verklärt an märchenhaften Geschichten und behauptet, er erforsche den Raum.&lt;br /&gt;
&lt;br /&gt;
Er arbeitet aus dem Bauch und studiert den &quot;Umsturz der Werte&quot;. Immer geht es ihm um Qualität, wenn er wochenlang stur und diszipliniert Drähte verbiegt, würgt und schweisst, und in allen denkbaren Linienkombinationen den Luftraum erforscht.&lt;br /&gt;
","","2","../../media_art4art/exp0015/_thumbs/th_2010-03-11-p1010523.jpg","../../media_art4art/exp0015/_thumbs/th_2010-03-kamm-p1010511.jpg","n","52","0","j","10");
INSERT INTO cms_pages VALUES ("75","34","navi_4","eve0017","Hanspeter Kamm - Neue Objekte","vergangen","2010-04-11 00:00:00","2010-04-11 00:00:00","Apéro in Anwesenheit des Künstlers, 11:00-15:00 Uhr","","","2","","","n","52","0","j","4");
INSERT INTO cms_pages VALUES ("76","34","navi_4","eve0018","Hanspeter Kamm - Finissage","vergangen","2010-05-29 00:00:00","2010-05-29 00:00:00","Finissage in Anwesenheit von Hanspeter Kamm am Samstag, den 29. Mai 2010 von 11:00 - 15:00 Uhr. Video über das Schaffen des Künstlers.","<p>Finissage der Ausstellung in Anwesenheit von Hanspeter Kamm am Samstag, den 29. Mai von 11:00 - 15:00 Uhr. Video über das Schaffen des Künstlers.</p>","","2","../../media_art4art/eve0018/_thumbs/th_kamm-himself.jpg","../../media_art4art/eve0018/_thumbs/th_p1010912web.jpg","n","52","0","j","5");
INSERT INTO cms_pages VALUES ("77","34","navi_3","exp0016","von Ballmoos Kurt - Landschaften & Etienne Krähenbühl - Sculptures mémobiles","vergangen","2010-11-18 00:00:00","2011-01-29 00:00:00","Vernissage in Anwesenheit der Künstler: Donnerstag 18. November 18:30 - 21:00 Uhr ","&lt;strong&gt;Vernissage, Donnerstag 18. November, 18:30-21:00 Uhr&lt;/strong&gt;&lt;br /&gt;
&lt;strong&gt;&lt;br /&gt;
Advents-Apéro, Samstag, 11. Dezember, 11:00-15:00 Uhr&lt;/strong&gt;&lt;br /&gt;
&lt;strong&gt;&lt;br /&gt;
Neujahrs-Jazzkonzert, Samstag, 15. Januar 2011,
18:00-19:00 Uhr&lt;/strong&gt;&lt;br /&gt;
Alex Wilson, Piano & Rodrigo Aravena, Bass&lt;br /&gt;
&lt;strong&gt;&lt;br /&gt;
Finissage, Samstag, 29. Januar 2011, 11:00-15:00 Uhr&lt;/strong&gt;&lt;br /&gt;
&lt;br /&gt;
&lt;br /&gt;
&lt;strong&gt;Kurt von Ballmoos &lt;/strong&gt;wurde 1934 in der
Schweiz geboren. Nach einer Lehre als
Fotolithograf, Weiterbildung in Bern in den Bereichen Malerei, Farbe und Lithografie.
Seit 1956 arbeitet er im eigenen Atelier und gehört seid 1963 der
schweizerischen Vereinigung der Maler, Bildhauer und Architekten an. Er ist
Mitbegründer der Gruppe « impact » Lausanne. Sein Werk umfasst Wandmalerei,
Bühnenbilder, sowie Illustrationen und humoristische Zeichnungen.&lt;br /&gt;
Seit 1959
stellt er regelmässig in der Schweiz, Deutschland, Kanada und den USA
aus. Bilder von Kurt von Ballmoos sind in den Musées des Beaux-Arts in
Lausanne, Vevey und Pully zu sehen.&lt;br /&gt;
&lt;br /&gt;
&lt;strong&gt;Etienne Krähenbühl &lt;/strong&gt;hat eine höchst
eigenständige skulpturale Sprache entwickelt.
Er setzt den Akzent einerseits auf den fragilen und flexiblen Charakter der Materie
und anderseits auf die Bewegung, den Klang und auf die Solidarität
in der Interaktion unter den Elementen. Er verwendet neben « hightech&quot;- Legierungen
(Titan, Nickel) allerlei Materialien, wie verrostete Metalle, Gesammeltes, Holz und
Papier...&lt;br /&gt;
","","2","../../media_art4art/exp0016/_thumbs/th_landschaft-01.jpg","../../media_art4art/exp0016/_thumbs/th_etienne-k.jpg","n","80","68","j","9");
INSERT INTO cms_pages VALUES ("78","34","navi_3","exp0017","Accrochage","vergangen","2010-06-17 00:00:00","2010-10-09 00:00:00","Neue Bilder und Objekte der Künstler der Galerie.
Neu: Catherine Marchadour, Frankreich. 
Galerie während der Sommerferien geschlossen.","Neue Bilder der Künstler der Galerie: Berkouk, Blockey, Buchwalder, Bravi, Brühwiler, Grobet, Kamm, Kramer, Krähenbühl, Nina.K, Tristan Rà&lt;br /&gt;
Neu: Catherine Marchadour, Frankreich&lt;br /&gt;
&lt;br /&gt;
Galerie während der Sommerferien geschlossen.&lt;br /&gt;
","","2","../../media_art4art/exp0017/_thumbs/th_cm 047.jpg","../../media_art4art/exp0017/_thumbs/th_dscn3615w.jpg","n","0","0","j","8");
INSERT INTO cms_pages VALUES ("79","34","navi_4","eve0019","Welcome-Back-Apéro","vergangen","2010-08-28 00:00:00","2010-08-28 00:00:00","Bilder, Acrylobjekte, Drahtobjekte, Holzskulpturen, Mobiles von 
Berkouk, Blockey, Buchwalder, Bravi, Brühwiler, Grobet, Kamm, Krähenbühl, Marchadour","<!--[if gte mso 9]><xml>
Normal
0
21
false
false
false
DE
X-NONE
X-NONE
MicrosoftInternetExplorer4
</xml><![endif]--><!--[if gte mso 9]><xml>
</xml><![endif]-->
<!--[if gte mso 10]>
<mce:style><! 
/* Style Definitions */
table.MsoNormalTable
{mso-style-name:\"Normale Tabelle\";
mso-tstyle-rowband-size:0;
mso-tstyle-colband-size:0;
mso-style-noshow:yes;
mso-style-priority:99;
mso-style-qformat:yes;
mso-style-parent:\"\";
mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
mso-para-margin:0cm;
mso-para-margin-bottom:.0001pt;
mso-pagination:widow-orphan;
font-size:11.0pt;
font-family:\"Calibri\",\"sans-serif\";
mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:\"Times New Roman\";
mso-fareast-theme-font:minor-fareast;
mso-hansi-font-family:Calibri;
mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:\"Times New Roman\";
mso-bidi-theme-font:minor-bidi;}
-->
<!--[endif] -->
<p><strong>Samstag, 28. August 2010 11.00 -
15.00 Uhr<br />
</strong></p>
<!--[if gte mso 9]><xml>
Normal
0
21
false
false
false
DE
X-NONE
X-NONE
MicrosoftInternetExplorer4
</xml><![endif]--><!--[if gte mso 9]><xml>
</xml><![endif]-->
<!--[if gte mso 10]>
<mce:style><! 
/* Style Definitions */
table.MsoNormalTable
{mso-style-name:\"Normale Tabelle\";
mso-tstyle-rowband-size:0;
mso-tstyle-colband-size:0;
mso-style-noshow:yes;
mso-style-priority:99;
mso-style-qformat:yes;
mso-style-parent:\"\";
mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
mso-para-margin:0cm;
mso-para-margin-bottom:.0001pt;
mso-pagination:widow-orphan;
font-size:11.0pt;
font-family:\"Calibri\",\"sans-serif\";
mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:\"Times New Roman\";
mso-fareast-theme-font:minor-fareast;
mso-hansi-font-family:Calibri;
mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:\"Times New Roman\";
mso-bidi-theme-font:minor-bidi;}
-->
<!--[endif] -->
<p><strong><br />
Bilder,
Acrylglasobjekte, Drahtobjekte, Holzskulpturen, mobile Eisenskulpturen<br />
<br />
</strong>Berkouk, Blockey,
Bouys, Buchwalder, Bravi, Brühwiler, Grobet, Kamm, Krähenbühl, Nina K. , Kramer, Tristan Rà <br />
<br />
<strong>Neu: Catherine
Marchadour, Frankreich </strong><br />
<br />
<strong>Finissage: 30. Oktober
2010 </strong><br />
<br />
Ähnlich einer
Installation, wird sich bis Ende Oktober 2010 die Ausstellung in einem Rhythmus
von ca. 3 Wochen laufend erneuern. <br />
<br />
<br />
<strong>
<br />
</strong></p>","","4","../../media_art4art/eve0019/_thumbs/th_cm 019.jpg","../../media_art4art/eve0019/_thumbs/th_cm-058-(9)web.jpg","n","0","0","j","2");
INSERT INTO cms_pages VALUES ("80","42","navi_5","art0023","von Ballmoos Kurt","malerei","0000-00-00 00:00:00","0000-00-00 00:00:00","Kurt von Ballmoos wurde 1934 in der Schweiz geboren. Nach einer Lehre
als Fotolithograf ...
","<p><strong>Kurt von Ballmoos </strong>wurde 1934 in der
Schweiz geboren. Nach einer Lehre als
Fotolithograf, Weiterbildung in Bern in den Bereichen Malerei, Farbe und Lithografie.
Seit 1956 arbeitet er im eigenen Atelier und gehört seit 1963 der
schweizerischen Vereinigung der Maler, Bildhauer und Architekten an.<br />
<br />
Er ist
Mitbegründer der Gruppe « impact » Lausanne. Sein Werk umfasst Wandmalerei,
Bühnenbilder, sowie Illustrationen und humoristische Zeichnungen.<br />
<br />
Seit 1959
stellt er regelmässig in der Schweiz, Deutschland, Kanada und den USA
aus. Bilder von Kurt von Ballmoos sind in den Musées des Beaux-Arts in
Lausanne, Vevey und Pully zu sehen.<br />
<br /></p>","","5","../../media_art4art/art0023/_thumbs/th_landschaft-01.jpg","../../media_art4art/art0023/_thumbs/th_dsc_3223bw.jpg","a","0","0","j","2");
INSERT INTO cms_pages VALUES ("81","34","navi_4","eve0020","15.01.2011: Neujahrs-Jazzkonzert mit Alex Wilson und Rodrigo","vergangen","2011-01-15 00:00:00","2011-01-15 00:00:00","Alex Wilson, UK, Piano & Rodrigo Aravena, Chile, Bass - 
Samstag, 15. Januar 18.00-19:00 Uhr","<p><strong><br />
Alex Wilson&nbsp;: </strong><a href=\"http://www.alexwilson.ch/art4art\" target=\"_blank\"><strong>www.alexwilson.ch/art4art</strong></a><br />
<strong>Rodrigo Aravena: <a href=\"http://www.themuscats.com\" target=\"_blank\">www.themuscats.com</a><br />
</strong><br />
<strong>Türöffnung und Kasse ab 17:00 Uhr<br />
Konzert von 18:00-19:30 Uhr, inkl. Pause<br />
<br />
Eintritt: CHF 35, inkl. Apéro</strong><br />
<br />
<strong>Platzzahl beschränkt, Reservationen nach Eingang per Mail oder Telefon</strong><br />
<br />
Das Konzert findet im Rahmen der Ausstellung von Kurt von Ballmoos und Etienne Krähenbühl statt.</p>","","2","../../media_art4art/eve0020/_thumbs/th_alex-wilson.jpg","../../media_art4art/eve0020/_thumbs/th_rodrigo-aravena.jpg","n","0","0","j","3");
INSERT INTO cms_pages VALUES ("83","34","navi_3","exp0018","Kamel Berkouk - Bilder, Skulpturen und Zeichnungen","vergangen","2011-03-12 00:00:00","2011-05-28 00:00:00","Vernissage in Anwesenheit des Künstlers: Samstag, 12. März 2011, 11.00 - 15.00 Uhr","Vernissage in Anwesenheit des Künstlers: Samstag, 12. März 2011, 11.00 - 15.00 Uhr&lt;br /&gt;
&lt;br /&gt;
Apéro: Samstag, 9. April 2011, 11:00 - 15:00 Uhr&lt;br /&gt;
&lt;br /&gt;
Finissage: Samstag, 28. Mai 2011, 11:00 - 15:00 Uhr&lt;br /&gt;
","","2","../../media_art4art/exp0018/_thumbs/th_p1020913aw.jpg","../../media_art4art/exp0018/_thumbs/th_p1020919w.jpg","n","16","0","j","7");
INSERT INTO cms_pages VALUES ("84","40","navi_4","eve0022","Accorchage","vergangen","2011-01-31 00:00:00","2011-03-11 00:00:00","Zwischen den Ausstellungen findet jeweils eine Accrochage mit den Künstlern der Galerie statt.

Öffnungszeiten unter kontakt & zeiten.","&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
Normal
0
21
false
false
false
DE-CH
X-NONE
X-NONE
MicrosoftInternetExplorer4
&lt;/xml&gt;&lt;![endif]--&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
&lt;/xml&gt;&lt;![endif]--&gt;&lt;!--[if gte mso 10]&gt;
&lt;style&gt;
/* Style Definitions */
table.MsoNormalTable
{mso-style-name:&quot;Normale Tabelle&quot;;
mso-tstyle-rowband-size:0;
mso-tstyle-colband-size:0;
mso-style-noshow:yes;
mso-style-priority:99;
mso-style-qformat:yes;
mso-style-parent:&quot;&quot;;
mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
mso-para-margin-top:0cm;
mso-para-margin-right:0cm;
mso-para-margin-bottom:10.0pt;
mso-para-margin-left:0cm;
line-height:115%;
mso-pagination:widow-orphan;
font-size:11.0pt;
font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;
mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:&quot;Times New Roman&quot;;
mso-fareast-theme-font:minor-fareast;
mso-hansi-font-family:Calibri;
mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:&quot;Times New Roman&quot;;
mso-bidi-theme-font:minor-bidi;}
&lt;/style&gt;
&lt;![endif]--&gt;
Zwischen den Ausstellungen findet
jeweils eine Accrochage mit den Künstlern der Galerie statt.&lt;br /&gt;
&lt;br /&gt;
Werke von Kamel Berkouk, Charles
Blockey, Jeanick Bouys, Guiseppe Bravi, Herbert Brühwiler, Fredy Buchwalder, Daniel
Grobet, Nina K., Hanspeter Kamm, Etienne Krähenbühl, Susi Kramer, Tristan Rà&lt;br /&gt;
&lt;br /&gt;
Individuelle Kunstberatung&lt;br /&gt;
&lt;br /&gt;
Öffnungszeiten unter Kontakt & Zeiten.&lt;br /&gt;
&lt;br /&gt;
","","2","../../media_art4art/eve0022/_thumbs/th_atelier 25 canvas 97x130cm 6.jpg","../../media_art4art/eve0022/_thumbs/th_dscn2172_web.jpg","n","0","0","j","1");
INSERT INTO cms_pages VALUES ("82","40","navi_4","eve0021","11.12.2010 Adventsapéro 11:00-15:00 Uhr","vergangen","2010-12-11 00:00:00","2010-12-11 00:00:00","Landschaften von Kurt von Ballmoos
Eisenplastiken und Objekte von Etienne Krähenbühl","&lt;!--[if !mso]&gt;
&lt;style&gt;
v\\:* {behavior:url(#default#VML);}
o\\:* {behavior:url(#default#VML);}
w\\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
&lt;/style&gt;
&lt;![endif]--&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
Normal
0
false
21
false
false
false
DE-CH
X-NONE
X-NONE
&lt;/xml&gt;&lt;![endif]--&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
&lt;/xml&gt;&lt;![endif]--&gt;&lt;!--[if gte mso 10]&gt;
&lt;style&gt;
/* Style Definitions */
table.MsoNormalTable
{mso-style-name:&quot;Normale Tabelle&quot;;
mso-tstyle-rowband-size:0;
mso-tstyle-colband-size:0;
mso-style-noshow:yes;
mso-style-priority:99;
mso-style-qformat:yes;
mso-style-parent:&quot;&quot;;
mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
mso-para-margin-top:0cm;
mso-para-margin-right:0cm;
mso-para-margin-bottom:10.0pt;
mso-para-margin-left:0cm;
line-height:115%;
mso-pagination:widow-orphan;
font-size:11.0pt;
font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;
mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:&quot;Times New Roman&quot;;
mso-fareast-theme-font:minor-fareast;
mso-hansi-font-family:Calibri;
mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:&quot;Times New Roman&quot;;
mso-bidi-theme-font:minor-bidi;}
&lt;/style&gt;
&lt;![endif]--&gt;
&lt;strong&gt;&lt;br /&gt;
Landschaften von Kurt von Ballmoos&lt;/strong&gt;&lt;br /&gt;
&lt;br /&gt;
&lt;strong&gt;Eisenplastiken
und Objekte von Etienne Krähenbühl&lt;/strong&gt;&lt;br /&gt;
&lt;br /&gt;
&lt;strong&gt;Herzlich
Willkommen&lt;/strong&gt; &lt;strong&gt;zum Adventsapéro und zum Besuch dieser zwei
kontrastreichen Kunstwelten!&lt;/strong&gt;&lt;strong&gt;&lt;br /&gt;
&lt;/strong&gt;
&lt;br /&gt;
","","2","../../media_art4art/eve0021/_thumbs/th_temps-suspendu-miroir-2008-.jpg","../../media_art4art/eve0021/_thumbs/th_dsc_3223bw.jpg","n","0","0","j","2");
INSERT INTO cms_pages VALUES ("85","34","navi_3","exp0019","Sommer-Accrochage","vergangen","2011-06-23 00:00:00","2011-07-16 00:00:00","Sommer-Accrochage:

Neue Bilder und Objekte der Künstler der Galerie","Neue Bilder und Objekte der Künstler der Galerie: Dominique Belvedere, Kamel Berkouk, Janick Bouys, Herbert Brühwiler, Daniel Grobet, Hanspeter Kamm, Nina K., Susi Kramner, Catherine Marchadour und Lucia Munuera.
&lt;p&gt;
&nbsp;
&lt;/p&gt;
&lt;p&gt;
Eröffnung Donnerstag, 23. Juni 2011, 15.00 - 18.30 Uhr&lt;br /&gt;
Samstagsapéro, 25. Juni 2011, 11.00 - 15.00 Uhr&lt;br /&gt;
Finissage, 16. Juli 2011, 11.00 - 15.00 Uhr
&lt;/p&gt;
","","2","../../media_art4art/exp0019/_thumbs/th_2011-06-21-acc-bou-p1030987.jpg","../../media_art4art/exp0019/_thumbs/th_2011-06-21-acc-munu-p103094.jpg","n","46","53","j","6");
INSERT INTO cms_pages VALUES ("86","34","navi_3","exp0020","Charles Blockey","vergangen","2011-09-10 00:00:00","2011-10-29 00:00:00","Apéro: Samstag 01. Oktober 2011, 11:00-15:00 Uhr. 
Der Künstler wird anwesend sein.","&quot;art4art, Camilla Jeannet&quot; zeigt die neueste Schaffensperiode des schottisch-schweizerischen Künstlers Charles Blockey in einer One-man-show mit „paperwork on canvas&quot;, Druckgrafiken und Glasobjekten.&lt;br /&gt;
&lt;br /&gt;
Die Glasobjekte sind ein weiteres Feld von Blockey\'s Forschungsprozessen und bringen die Farbflächen und die Formsprache mit dem Räumlichen in Verbindung. Verschiedene einzelne Glaselemente bilden Lichtsäulen, die schwebend übereinander von einem Eisenrahmen gehalten werden. &lt;br /&gt;
&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
&lt;/xml&gt;&lt;![endif]--&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
Normal
0
21
false
false
false
DE-CH
X-NONE
X-NONE
&lt;/xml&gt;&lt;![endif]--&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
&lt;/xml&gt;&lt;![endif]--&gt;&lt;!--[if gte mso 10]&gt;
&lt;style&gt;
/* Style Definitions */
table.MsoNormalTable
{mso-style-name:&quot;Normale Tabelle&quot;;
mso-tstyle-rowband-size:0;
mso-tstyle-colband-size:0;
mso-style-noshow:yes;
mso-style-priority:99;
mso-style-qformat:yes;
mso-style-parent:&quot;&quot;;
mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
mso-para-margin-top:0cm;
mso-para-margin-right:0cm;
mso-para-margin-bottom:10.0pt;
mso-para-margin-left:0cm;
mso-pagination:widow-orphan;
font-size:11.0pt;
font-family:&quot;Cambria&quot;,&quot;serif&quot;;
mso-ascii-font-family:Cambria;
mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:&quot;Times New Roman&quot;;
mso-fareast-theme-font:minor-fareast;
mso-hansi-font-family:Cambria;
mso-hansi-theme-font:minor-latin;}
&lt;/style&gt;
&lt;![endif]--&gt;
","","2","../../media_art4art/exp0020/_thumbs/th_phoca_thumb_l_brailoi4.jpg","../../media_art4art/exp0020/_thumbs/th_phoca_thumb_l_dream sequence4.jpg","n","29","0","j","22");
INSERT INTO cms_pages VALUES ("87","40","navi_4","eve0023","Sommer-Accrochage: Finissage","vergangen","2011-07-16 00:00:00","2011-07-16 00:00:00","Sommer-Accrochage: Finissage 11:00-15:00 Uhr","Sommer-Accrochage: Finissage 11:00 - 15:00 Uhr
","","2","../../media_art4art/eve0023/_thumbs/th_2011-06-21-acc-kram-p104000.jpg","../../media_art4art/eve0023/_thumbs/th_2011-06-11-acc-bel-2523.jpg","n","62","26","j","3");
INSERT INTO cms_pages VALUES ("88","40","navi_4","eve0024","Accrochage","vergangen","2011-08-20 00:00:00","2011-09-09 00:00:00","Sommerferien: 18.08.-19.08.2011  -  

Zwischen den Ausstellungen Accrochage mit den Künstlern der Galerie.

Öffnungszeiten: siehe &quot;kontakt & zeiten&quot;","&lt;br /&gt;
&lt;br /&gt;
Zwischen den Ausstellungen findet jeweils eine Accrochage mit den 
Künstlern der Galerie statt.&lt;br /&gt;
&lt;br /&gt;
Öffnungszeiten unter kontakt & zeiten.
","","2","../../media_art4art/eve0024/_thumbs/th_earth-womb-coll-on-canv-web.jpg","../../media_art4art/eve0024/_thumbs/th_2011-06-21-acc-bou-p1030987.jpg","n","0","0","j","4");
INSERT INTO cms_pages VALUES ("89","40","navi_4","eve0025","Vernissage Daniel Airam","vergangen","2011-11-10 00:00:00","0000-00-00 00:00:00","Vernissage: Donnerstag, 10. Nov. 11, 18:30 - 21:00 Uhr / Erste Ausstellung in der Schweiz des in Nizza lebenden Künstlers: Malerei, Radierung, Collage","&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
Normal
0
21
false
false
false
DE-CH
X-NONE
X-NONE
MicrosoftInternetExplorer4
&lt;/xml&gt;&lt;![endif]--&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
&lt;/xml&gt;&lt;![endif]--&gt;&lt;!--[if gte mso 10]&gt;
&lt;style&gt;
/* Style Definitions */
table.MsoNormalTable
{mso-style-name:&quot;Normale Tabelle&quot;;
mso-tstyle-rowband-size:0;
mso-tstyle-colband-size:0;
mso-style-noshow:yes;
mso-style-priority:99;
mso-style-qformat:yes;
mso-style-parent:&quot;&quot;;
mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
mso-para-margin:0cm;
mso-para-margin-bottom:.0001pt;
mso-pagination:widow-orphan;
font-size:11.0pt;
font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;
mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:&quot;Times New Roman&quot;;
mso-fareast-theme-font:minor-fareast;
mso-hansi-font-family:Calibri;
mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:&quot;Times New Roman&quot;;
mso-bidi-theme-font:minor-bidi;}
&lt;/style&gt;
&lt;![endif]--&gt;Vernissage: Donnerstag, 10. Nov. 2011, 18:30 - 21:00 Uhr&lt;br /&gt;
Konzert: Samstag, 10. Dezember 2011, 18:00 Uhr&lt;br /&gt;
Finissage: Samstag, 07. Januar 2012, 11:00 - 15:00 Uhr&lt;br /&gt;
&lt;br /&gt;
Erste Ausstellung in der Schweiz des in Nizza lebenden Künstlers: Malereien, Radierungen, Collagen, Skulpturen. &lt;br /&gt;
&lt;br /&gt;
Rätselhaft, entblösst sind die imaginären, poetischen Silhouetten von
Daniel Airams Figuren. &lt;br /&gt;
&lt;br /&gt;
Der Maler, Grafiker und Bildhauer macht sie zu einem Lobgesang an die
Schönheit... an die Vertikale. Weil alles Lebendige sich zum Himmel hebt. 
","","2","../../media_art4art/eve0025/_thumbs/th_paintings_0241w.jpg","../../media_art4art/eve0025/_thumbs/th_sculptures_0226w.jpg","n","90","0","j","16");
INSERT INTO cms_pages VALUES ("90","42","navi_5","art0024","Airam Daniel","malerei","0000-00-00 00:00:00","0000-00-00 00:00:00","Rätselhaft, entblösst sind die imaginären, poetischen Silhouetten von Daniel Airams Figuren. ","<p>Erste Ausstellung in der Schweiz des in Nizza lebenden Künstlers: Malereien, Radierungen, Collagen, Skulpturen. 
</p>
<p>
Rätselhaft, entblösst sind die imaginären, poetischen Silhouetten von Daniel Airams Figuren. 
</p>
<p>
Der Maler, Grafiker und Bildhauer macht sie zu einem Lobgesang an die Schönheit... an die Vertikale. Weil alles Lebendige sich zum Himmel hebt. 
</p>
<p>&nbsp;</p>
<!--[if gte mso 9]><xml>
Normal
0
21
false
false
false
DE-CH
X-NONE
X-NONE
MicrosoftInternetExplorer4
</xml><![endif]--><!--[if gte mso 9]><xml>
</xml><![endif]--><!--[if gte mso 10]>
<mce:style><! 
/* Style Definitions */
table.MsoNormalTable
{mso-style-name:\"Normale Tabelle\";
mso-tstyle-rowband-size:0;
mso-tstyle-colband-size:0;
mso-style-noshow:yes;
mso-style-priority:99;
mso-style-qformat:yes;
mso-style-parent:\"\";
mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
mso-para-margin:0cm;
mso-para-margin-bottom:.0001pt;
mso-pagination:widow-orphan;
font-size:11.0pt;
font-family:\"Calibri\",\"sans-serif\";
mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:\"Times New Roman\";
mso-fareast-theme-font:minor-fareast;
mso-hansi-font-family:Calibri;
mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:\"Times New Roman\";
mso-bidi-theme-font:minor-bidi;}
-->
<!--[endif] -->
<p>
Born on
November 30, 1958 in Lyon, France.<br />
Studies at
the Grafic Art.<br />
Worked in
printing from 1975 to 1982.<br />
Since then
Airam dedicates himself to painting, etching
and sculpture.<br />
Personal
exhibitions excerpt : Paris, Lyon, Côte d\'Azur, Venice, Saarbrucken.<br />
Participated
in group exhibitions in France and abroad.<br />
<br />
Lives and
works in Nice, France.<br />
<br /></p>","","3","../../media_art4art/art0024/_thumbs/th_paintings_0241w.jpg","../../media_art4art/art0024/_thumbs/th_paintings_0312w.jpg","n","0","0","j","13");
INSERT INTO cms_pages VALUES ("91","40","navi_3","exp0021","Daniel Airam","vergangen","2010-11-10 00:00:00","2011-01-07 00:00:00","Erste Ausstellung in der Schweiz des in Nizza lebenden Künstlers: Malereien, Radierungen, Collagen, Skulpturen. Rätselhaft die poetischen Silhouetten!","","","2","../../media_art4art/exp0021/_thumbs/th_paintings_0241w.jpg","../../media_art4art/exp0021/_thumbs/th_paintings_0253.jpg","n","0","90","j","18");
INSERT INTO cms_pages VALUES ("93","35","navi_11","navi_110007","neue Boutiqueseite","la_boutique","2011-11-15 00:00:00","9999-12-31 00:00:00","neue Boutique-Seite","<p>neue Boutique-Seite</p>","","1","../../media_art4art/navi_110007/_thumbs/th_berkoukbild5.jpg","","n","0","0","j","7");



# ----------------------------------------------------------
#
# Struktur von Tabelle 'cms_pages_save'
#
DROP TABLE IF EXISTS cms_pages_save;
CREATE TABLE cms_pages_save (
    page_id smallint(6) unsigned NOT NULL auto_increment,
    nav_id smallint(6) unsigned DEFAULT "0" NOT NULL,
    domain varchar(10) NOT NULL,
    kennzeichen varchar(15) NOT NULL,
    name varchar(125) NOT NULL,
    fach varchar(20) NOT NULL,
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
# Daten von Tabelle 'cms_pages_save'
#
INSERT INTO cms_pages_save VALUES ("7","40","navi_3","exp0001","Kamel Berkouk: L\'oiseau jaune","vergangen","2008-06-01 00:00:00","2008-06-25 00:00:00","Eröffnung der Ausstellung am Donnerstag, 31. Mai 2007, 18.30 bis 21.00 Uhr, Einführung durch die Galeristin","<p>
Von der naiven Malerei herkommend, hat Berkouk einen sehr persÃƒÂ¶nlichen Stil entwickelt: vordergrÃƒÂ¼ndig einfache Tier- und Menschengestalten stehen im spielerischen Dialog miteinander. Die an der Grenze zwischen abstrakt und konkret stehenden Formen erzÃƒÂ¤hlen Geschichten, stellen Szenen und Beziehungen dar. 
</p>
<div>
Kamel Berkouk ist 1967 als neuntes Kind einer algerischen Familie in Mulhouse (F) geboren und hat ein Studium an der Kunstakademie begonnen, entwickelte sich jedoch autodidaktisch weiter.</div>
<p>
Heute ist er nicht nur in Frankreich anerkannt, wo beispielsweise das Mulhouse Fine Arts Museum seine Werke sammelt, sondern auch in Deutschland, Belgien, Holland, den USA und den Emiraten, wo er stark umworben wird. 
</p>
<p>&nbsp;</p>
<h3>Vernissage</h3>
<p>
ErÃƒÂ¶ffnung der Ausstellung am Donnerstag, 31. Mai 2007, 18:30 Ã¢â‚¬â€œ 21:00 Uhr<br />
EinfÃƒÂ¼hrung durch die Galeristin 
</p>
<p>&nbsp;</p>
<h3>ApÃƒÂ©ro</h3>
<p>
Sonntag, 16. Juni, 10.30 Ã¢â‚¬â€œ 14.30 Uhr 
</p>
<p>
Sommerpause<br />
16. Juli Ã¢â‚¬â€œ 4. August 
</p>
<p>&nbsp;</p>
<h3>Finissage</h3>
<p>
Samstag, 25. August, 10.30 Ã¢â‚¬â€œ 14.30 Uhr 
</p>
<p>
Kamel Berkouk 
</p>","","1","../../media_art4art/exp0001/_thumbs/th_berkoukbild1.jpg","../../media_art4art/exp0001/_thumbs/th_berkoukbild2.jpg","n","0","0","j","2");
INSERT INTO cms_pages_save VALUES ("8","34","navi_3","exp0002","Giuseppe Bravi: Afrika","vergangen","2007-08-18 00:00:00","2008-05-15 00:00:00","Vernissage Donnerstag, 15. Mai, 18:30-21:00 Uhr
EinfÃƒÂ¼hrung durch Dr. Barbara von Orelli-Messerli, Kunsthistorikerin","GemÃƒÂ¤ldeausstellung von Giuseppe Bravi und Giovanni Tomasoni.&lt;br /&gt;
Zwei grosse KÃƒÂ¼nstler, Bravi und Tomasoni,wollten die Ausstellung\' Afrika\' zusammen gestalten.&lt;br /&gt;
&lt;br /&gt;
&lt;h3&gt;Giuseppe Bravi&lt;/h3&gt;folgt den Weg vom Formalismus zum Informellen mit einer gewagten, fast unkontrollierbaren KÃƒÂ¼hnheit. Der Maler aus Brescia scheint sich auf Strassen zu bewegen, die von einer geistigen, nicht automatischen Bewegung schliesslich in die RealitÃƒÂ¤t fÃƒÂ¼hren. FÃƒÂ¼r Bravi muss das Leben ausgedrÃƒÂ¼ckt und ÃƒÂ¼berdacht werden in seiner ganzen VollstÃƒÂ¤ndigkeit. &lt;br /&gt;
Er lebt und arbeitet in Gavardo und Gardone Riviera und hat an zahlreichen Ausstellungen in Italien und im Ausland teilgenommen.&lt;br /&gt;
&lt;br /&gt;
&lt;h3&gt;Giovanni B. Tomasoni&lt;/h3&gt;ist eine Bote der hÃƒÂ¶heren Ebenen mit seiner ruhigen, intelligenten Anwesenheit.Er bevorzugt schwarz als Farbe des Absoluten, schwarz, die Farbe, die nicht etwas Ewiges hat, sondern nur die Basis ist, auf der sich alle Dinge bewegen, um sich in hÃƒÂ¶here Ebenen zu begeben bis zum Licht. Tomasoni gebraucht abgelegtes,hÃƒÂ¤ssliches Material wie eine Erziehung zur harten und rohen Einfachheit. Seine Ausdrucksweise ist wie ein direkter, ungeschliffener Expressionismus, der mit verschiedenen Techniken die GefÃƒÂ¼hle der Wirklichkeit ausdrÃƒÂ¼ckt.Der KÃƒÂ¼nstler wohnt und arbeitet in Brescia und hat an zahlreichen Ausstellungen in Italien und im Ausland teilgenommen. 
",NULL,"2",NULL,NULL,"n","0","0","j","13");
INSERT INTO cms_pages_save VALUES ("45","34","navi_3","exp0009","Jeanick Bouys","vergangen","2008-09-04 00:00:00","2008-10-25 00:00:00","Die Werke von Bouys erinnnern an Felder, weisen archaische, afrikanisch anmutende Zeichen und immer...","...wieder tritt eine merkwÃƒÂ¼rdige Vogel-Gestalt als Silouhette in Erscheinung.&lt;br /&gt;
Brilliant geht er mit Farben und Formen um, dieser KÃƒÂ¼nstler, der lange in einem Atelier in New York gearbeitet hat. Seine Werke findet man in Frankreich, in der Schweiz, in Japan und in den USA.&lt;br /&gt;
&lt;br /&gt;
Jeanick Bouys zeigt in dieser Ausstellung BildschÃƒÂ¶pfungen von einer grossen Leuchtkraft,
welche die Fresco-Technik mit afrikanischen Mustern verknÃƒÂ¼pft. Es sind abstrakte Bilder, die aufgrund der vielschichtigen, transparenten Maltechnik Tiefenwirkung erhalten und
kraftvoll sind. Manchmal dominiert eine Farbe das Bildgeschehen, manchmal die Zeichen,
manchmal der bobo. Mit feinem GespÃƒÂ¼r fÃƒÂ¼r Harmonien innnerhalb eines Farbklangs wÃƒÂ¤hlt
und trÃƒÂ¤gt der KÃƒÂ¼nstler die vielen Farblasuren der Naturpigmente ÃƒÂ¼bereinander auf.
","","2","../../media_art4art/exp0009/_thumbs/th_atelier 26 canvas 100x100cm web.jpg","../../media_art4art/exp0009/_thumbs/th_atelier-26-paper-27x180cm-web.jpg","n","46","0","j","12");
INSERT INTO cms_pages_save VALUES ("40","35","btq","btq0005","Kunstkarten","la_boutique","0000-00-00 00:00:00","0000-00-00 00:00:00","Kunstkarten",NULL,NULL,"4",NULL,NULL,"n","0","0","n","0");
INSERT INTO cms_pages_save VALUES ("9","34","navi_3","exp0003","Elisabeth Beurret: Art du papier en musÃƒÂ©e d\'art","vergangen","2008-04-12 00:00:00","2008-08-14 00:00:00","Vernissage Donnerstag, 12. August, 18.30 Ã¢â‚¬â€œ 21.00 Uhr","&lt;p&gt;
Schon die verschiedenen BÃƒÂ¤ume und BlÃƒÂ¤tter haben ihre eigene Symbolik: die Ulme, Symbol des Edelmutes, die zu verschwinden droht oder der Ginkgo ein lebendes Fossil, unverÃƒÂ¤ndert seit der Zeit der Dinosaurier. Er ist ein Symbol von Langlebigkeit, das seit Menschengedenken in China und Japan verehrt wird. In ihrem Atelier werden diese Rohmaterialien mit sehr verschiedenen traditionellen und experimentellen Techniken zu Papier verarbeitet. 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;Vernissage&lt;/h3&gt;
&lt;p&gt;
Donnerstag, 12.8.2007, 18.30 Ã¢â‚¬â€œ 21.00 Uhr 
&lt;/p&gt;
","","2","../../media_art4art/exp0003/_thumbs/th_eb_ecriture2b.jpg","../../media_art4art/exp0003/_thumbs/th_eb_nature1b45x80cm.jpg","n","22","0","j","11");
INSERT INTO cms_pages_save VALUES ("14","40","navi_4","eve0002","Lesung: &quot;Reise durch Zeit und Raum&quot;","vergangen","2008-06-13 00:00:00","0000-00-00 00:00:00","9.9.2007 18.00 Uhr - Dalmazio Ambrosini liest Texte ÃƒÂ¼ber das Werk von Pier Daniele La Rocca.","&lt;p&gt;
Reise durch die Zeit, Reise durch den Raum, physische Reise aber vor allem die Reise in das Innere. Auf dieser Wanderung begegnet er Zeugen und kulturellen Wahrzeichen, mal Gestalten, mal Texten, Gedanken, Philosophien, Werke und Zeichen, durch welche er unsere Auseinandersetzung mit der Gegenwart zu interpretieren sucht. 
&lt;/p&gt;
&lt;p&gt;
WÃƒÂ¤hrend dem sich La Rocca in den frÃƒÂ¼heren Ausstellungen mit den alten Kulturen befasste, steht in dieser Ausstellung das Nomadentum im Vordergrund. Sein Werk ist durch eine &quot;expressionistische Symbolik&quot; charakterisiert und durch Interpretationen &quot;der grossen Themen von immer&quot;. 
&lt;/p&gt;
","","2","../../media_art4art/eve0002/_thumbs/th_il_libro1.jpg","../../media_art4art/eve0002/_thumbs/th_il_libro2.jpg","n","34","16","j","0");
INSERT INTO cms_pages_save VALUES ("16","42","navi_5","art0001","Berkouk Kamel","malerei","0000-00-00 00:00:00","0000-00-00 00:00:00","Kamel Berkouk hat einen persÃƒÂ¶nlichen Stil entwickelt: vordergrÃƒÂ¼ndig einfache Tier-und Menschengestalten stehen im spielerischen Dialog zueinander","&lt;p&gt;
Von der naiven Malerei herkommend, hat Berkouk einen sehr persÃƒÂ¶nlichen Stil entwickelt: vordergrÃƒÂ¼ndig einfache Tier- und Menschengestalten stehen im spielerischen Dialog miteinander. Die an der Grenze zwischen abstrakt und konkret stehenden Formen erzÃƒÂ¤hlen Geschichten, stellen Szenen und Beziehungen dar. 
&lt;/p&gt;
&lt;p&gt;
Kamel Berkouk ist 1967 als neuntes Kind einer algerischen Familie in Mulhouse (F) geboren und hat ein Studium an der Kunstakademie begonnen, entwickelte sich jedoch autodidaktisch weiter.&lt;br /&gt;
Heute ist er nicht nur in Frankreich anerkannt, wo beispielsweise das Mulhouse Fine Arts Museum seine Werke sammelt, sondern auch in Deutschland, Belgien, Holland, den USA und den Emiraten, wo er stark umworben wird. 
&lt;/p&gt;
","","5","../../media_art4art/art0001/_thumbs/th_loiseau jaune.jpg","../../media_art4art/art0001/_thumbs/th_bild2.jpg","n","7","65","j","0");
INSERT INTO cms_pages_save VALUES ("22","42","navi_5","art0005","Beurret Elisabeth","malerei","0000-00-00 00:00:00","0000-00-00 00:00:00","Die Arbeit von Elisabeth Beurret beginnt in der Begenung mit der Natur, mit dem Sammeln von BlÃƒÂ¤ttern und planzlichen Materialien","&lt;p&gt;
Die Arbeit von Elisabeth Beurret beginnt in der Begenung mit der Natur, mit dem Sammeln von BlÃƒÂ¤ttern und planzlichen Materialien. Darin entdeckt sie die Themen und die Formen die spÃƒÂ¤ter ihr Werk beeinflussen werden. Schon die verschiedenen BÃƒÂ¤ume und BlÃƒÂ¤tter haben ihre eigene Symbolik: die Ulme, Symbol des Edelmutes, die zu verschwinden droht oder der Ginkgo ein lebendes Fossil, unverÃƒÂ¤ndert seit der Zeit der Dinosaurier. Er ist ein Symbol von Langlebigkeit, das seit Menschengedenken in China und Japan verehrt wird. In ihrem Atelier werden diese Rohmaterialien mit sehr verschiedenen traditionellen und experimentellen Techniken zu Papier verarbeitet.
&lt;/p&gt;
&lt;h3&gt;Die Basisstrukturen des Papiers&lt;/h3&gt;
&lt;p&gt;
tragen die grossen Naturgesetze und -Formen in sich. Die Papierbilder oder Papierobjekte von Elisabeth Beurret sind von diesen Spiralen, Meandren und Verzweigungen inspiriert. &quot;Weil wir seine inneren Gesetze kennen, sprengt das Objekt den einfachen Rahmen seiner Erscheinung&quot;, Paul Klee (Unendliche Naturgeschichte). In ihren Reisen durch Afrika, Marokko und anderen fernen LÃƒÂ¤ndern sammelt Elisabeth Beurret den kunsthandwerklichen Ausdruck der VÃƒÂ¶lker. Ihre Werke sind magische Reisen durch die Kulturen. 
&lt;/p&gt;
","","5","../../media_art4art/art0005/_thumbs/th_eb_nature1b45x80cm_web.jpg","../../media_art4art/art0005/_thumbs/th_terre-rouge-web.jpg","n","9","0","j","0");
INSERT INTO cms_pages_save VALUES ("23","34","navi_3","exp0005","Hanspeter Kamm","vergangen","2007-11-15 00:00:00","2007-12-31 00:00:00","Vernissage: Donnerstag, 15. November 2007, 18.30 Ã¢â‚¬â€œ 21.00 Uhr","&lt;p&gt;
Hanspeter Kamm erzeugt heute filigrane Gebilde, verquere Vehikel und getarnte Liebesbriefe mit seltsamen Namen wie &quot;GekÃƒÂ¼hltes MÃƒÂ¶tchen&quot; oder &quot;Horizontales Gezwitscher&quot;: immer handwerklich einmalig, immer suggestiv, meistens zeitkritisch oder karikierend. Draht wird zur Luftlinie - Raum, Licht und Schatten spielen mit. 
&lt;/p&gt;
&lt;p&gt;
Hanspeter Kamm ist ein Querdenker und EigenbrÃƒÂ¶tler. Er pendelt zwischen Kunstbegriff und Gefallensurteil frÃƒÂ¶hlich hin und her - und pfeift dazu. 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;Vernissage&lt;/h3&gt;
&lt;p&gt;
Donnerstag, 15. November 2007, 18.30 Ã¢â‚¬â€œ 21.00 Uhr 
&lt;/p&gt;
","","2","../../media_art4art/exp0005/_thumbs/th_kamm ausst 2006 102.jpg","","n","31","0","j","10");
INSERT INTO cms_pages_save VALUES ("26","42","navi_5","art0006","Belvedere Dominique","malerei","0000-00-00 00:00:00","0000-00-00 00:00:00","Die Welt der Bilder von Dominique Belvedere fasziniert und beeindruckt durch die Farbkraft, Dynamik und Ruhe, die sie gleichzeitig ausstrahlt.","Die Welt der Bilder von Dominique Belvedere fasziniert und beeindruckt durch die Farbkraft, Dynamik und Ruhe, die sie gleichzeitig ausstrahlt. Die Vielschichtigkeit der abstrakten Kompositionen fÃƒÂ¼hrt den Betrachter zu Landschaften, deren Konturen sich nur andeutungsweise abzeichnen: eine Reise in unendliche Dimensionen pffnet sich. Kraft wird zur meditativen Stille, Stille zur Kraft. &lt;br /&gt;
&lt;br /&gt;
Auf differenzierte Weise entwickelt Dominique Belvedere subtile und kraftvolle FarbklÃƒÂ¤nge, durchbrochen von eingravierten Elementen und Strichen. Vielschichtig, deckend oder lasierend baut die Malerin das Bildgeschehen auf Holztafeln auf. Durch die GegensÃƒÂ¤tzlichkeit und das Zusammenspiel von intuitiv erarbeiteten und geometrischen BildflÃƒÂ¤chen entsteht Spannung und zugleich Balance. Die Kompositionen der Malerin entstehen als Synthese aus Impressionen ihres vielfÃƒÂ¤ltigen und reichhaltigen Familien- und Berufslebens, aus der Wahrnehmung visueller Fragmente der Natur, des Erlebten und ihrer persÃƒÂ¶nlichen Reflexion. &lt;br /&gt;
&lt;br /&gt;
1958 in ZÃƒÂ¼rich geboren. Sportstudium an der ETH ZÃƒÂ¼rich. LehrtÃƒÂ¤tigkeit an ZÃƒÂ¼rcher Kantonsschule fÃƒÂ¼r Sport, Theater und musische Projekte. Schauspielausbildung in ZÃƒÂ¼rich.&nbsp; Leiterin diverser Theater-Kurse und -AuffÃƒÂ¼hrungen an der ZÃƒÂ¼rcher Kantonsschule, BÃƒÂ¼hnengestaltung, Regie.&lt;br /&gt;
&lt;br /&gt;
Seit 1991&nbsp;&nbsp; Intensivierung der malerischen TÃƒÂ¤tigkeit &lt;br /&gt;
&lt;br /&gt;
Ausstellungen (Auswahl):&lt;br /&gt;
2000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Volkswirtschaftsdirektion des Kantons Zug &lt;br /&gt;
2001&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MÃƒÂ¼nchhof Galerie Wehrli, Kilchberg&lt;br /&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Galerie Siegristenkeller BÃƒÂ¼lach&lt;br /&gt;
2002&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Gruppenausstellung &quot;Ladies only&quot;, Galerie &quot;Art Selection&quot;, ZÃƒÂ¼rich&lt;br /&gt;
2003&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Art Forum Montreux&lt;br /&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Galerie IAM, Lausanne&lt;br /&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MÃƒÂ¼nchhof Galerie Wehrli, Kilchberg &lt;br /&gt;
2004&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; art4art, halle fÃƒÂ¼r kunst, KÃƒÂ¼snacht &lt;br /&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Galerie Eule Art, Flims&lt;br /&gt;
2005&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Galerie Eule Art, Davos&lt;br /&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Galerie de Grancy, Lausanne&lt;br /&gt;
2006&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; art4art, Halle fÃƒÂ¼r Kunst, KÃƒÂ¼snacht&lt;br /&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MÃƒÂ¼nchhof Galerie Wehrli, Kilchberg/ZÃƒÂ¼rich&lt;br /&gt;
2007&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MÃƒÂ¼nchhof Galerie Wehrli, Kilchberg/ZÃƒÂ¼rich&lt;br /&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Galerie de Grancy, Lausanne&lt;br /&gt;
&lt;br /&gt;
Auszeichnung:&lt;br /&gt;
2003&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1. Preis &quot;Grand Jury&quot;, Art Forum Montreux
","","4","../../media_art4art/art0006/_thumbs/th_bild-877b.jpg","../../media_art4art/art0006/_thumbs/th_bild-917b.jpg","n","0","0","j","0");
INSERT INTO cms_pages_save VALUES ("25","34","navi_3","exp0006","Tristan Rà - Images d\'Orient","vergangen","2005-11-10 00:00:00","2006-02-04 00:00:00","Die Kraft der Farbe und des Ausdruckes sowie die Vibration der Stimmung seiner Bilder berÃƒÂ¼hren den Zuschauer","&lt;p&gt;
Tristan RÃƒÂ  ist Maler mit Leib und Seele. Er wuchs in MontluÃƒÂ§on in Frankreich auf und begann Medizin zu studieren. Parallel dazu widmete er sich der Malerei, bis er sich ihr im Laufe der Zeit ganz verschrieb. ÃƒÂ¼ber 30 Jahre lang bereiste er die Welt, weilte in Polynesien, durchquerte SÃƒÂ¼damerika zu Fuss, besuchte Nordindien und mehrmals Libyen, Tunesien, die TÃƒÂ¼rkei und Aegypten. 
&lt;/p&gt;
&lt;p&gt;
Tristan RÃƒÂ  hat eine eigene Welt geschaffen, die mal an Javlensky, mal an Gauguin, mal an Chagall erinnert - und doch eigenstÃƒÂ¤ndig ist. Die Kraft der Farbe und des Ausdruckes sowie die Vibration der Stimmung seiner Bilder berÃƒÂ¼hren den Zuschauer; das PortrÃƒÂ¤t zeugt von der Herzlichkeit einer Begegnung, das Stadtbild spricht von Sehnsucht, im Stillleben erweckt der Maler den einfachen Gegenstand, der den Menschen umgibt, zu neuem Leben. 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;Vernissage&lt;/h3&gt;
&lt;p&gt;
Donnerstag, 10. November, 18:30-21:00 Uhr&lt;br /&gt;
EinfÃƒÂ¼hrung durch die Galeristin und den KÃƒÂ¼nstler&lt;br /&gt;
Patronat: FranzÃƒÂ¶sischer Generalkonsul in ZÃƒÂ¼rich 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;Farbkatalog&lt;/h3&gt;
&lt;p&gt;
Der durch art4art herausgegebene Katalog zur Ausstellung wurde von Intras Versicherungen, Renault Nissan und Publicis Werbeagentur unterstÃƒÂ¼tzt.&lt;br /&gt;
Der Katalog ist bei art4art erhÃƒÂ¤ltlich. 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;WeihnachtsapÃƒÂ©ro&lt;/h3&gt;
&lt;p&gt;
Sonntag, 11. Dezember, 11.00 Ã¢â‚¬â€œ 16.00 Uhr 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;Finissage&lt;/h3&gt;
&lt;p&gt;
Samstag, 04. Februar 2006, 14.00 Ã¢â‚¬â€œ 17.00 Uhr 
&lt;/p&gt;
","","2","../../media_art4art/exp0006/_thumbs/th_bild4.jpg","../../media_art4art/exp0006/_thumbs/th_bild5.jpg","n","27","0","j","9");
INSERT INTO cms_pages_save VALUES ("39","35","btq","btq0004","Kleine Bilder","la_boutique","0000-00-00 00:00:00","0000-00-00 00:00:00","Kleine Bilder
Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis.","Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. &lt;br /&gt;
&lt;br /&gt;
Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. &lt;br /&gt;
&lt;br /&gt;
&lt;br /&gt;
Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. &lt;br /&gt;
&lt;br /&gt;
","","1","../../media_art4art/btq0004/_thumbs/th_bild_05.jpg","","n","0","0","n","0");
INSERT INTO cms_pages_save VALUES ("28","42","navi_5","art0008","Bauer Barbara","malerei","0000-00-00 00:00:00","0000-00-00 00:00:00","Die Werke von Barbara Bauer-Ruchti ÃƒÂ¼berraschen in ihrer SpontaneitÃƒÂ¤t und Farbdynamik. Da kommt einem unwillkÃƒÂ¼rlich die unkonventionelle Kraft, von ein","Das Werk von Barbara Bauer-Ruchti hat nach einem fast 40jÃƒÂ¤hrigen k&uuml;nstlerischen Schaffen, eine formelle Freiheit erreicht, welche KreativitÃƒÂ¤t&nbsp; und Humor ausstrahlt. Aber ihre Bilder sind auch geprÃƒÂ¤gt von einer grossen Lebensfreude und Kraft. Sind es die Jahre in Brasilien oder ist es ihr russischer Ursprung? &lt;br /&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;br /&gt;
In der Arbeit von Barbara Bauer-Ruchti geht es um eine persÃƒÂ¶nliche Geschichte, um die Zeichen des individuellen Ursprunges, die Zeichen eines nur teilweise bewusst erlebten kulturellen Umfeldes, einer kulturellen ÃƒÂ¼berlieferung. Und ÃƒÂ¤hnlich wie bei den Zeichen der Menschheit, welche durch die Suche des KÃƒÂ¼nstlers an die OberflÃƒÂ¤che kommen, entstehen bei Barbara Bauer Zeichen, Formen und Bilder durch die zunehmende Befreiung, Abstreifung des Formellen in ihrem Schaffen, welche unverkennlich den russischen Ursprung der KÃƒÂ¼nstlerin offenlegen; je weniger sich die KÃƒÂ¼nstlerin an eine Absicht hÃƒÂ¤lt, umsomehr ÃƒÂ¼bernehmen&quot; die kulturtypischen ZÃƒÂ¼ge. Kein bewusstes Vorgehen, keine Anlehnung und doch eine grosse Verwandtschaft mit Kandinsky oder Malewitsch, was die Formen anbelangt. Auch kommen stellenweise spontan Szenen zustande, die an Chagall erinnern - Russisches Dorf. &lt;br /&gt;
&lt;br /&gt;
Die Werke von Barbara Bauer-Ruchti ÃƒÂ¼berraschen in ihrer SpontaneitÃƒÂ¤t und Farbdynamik. Da kommt einem unwillkÃƒÂ¼rlich die unkonventionelle Kraft, von einem anderen russischen KÃƒÂ¼nstlers im Sinne, der neue Wege ging: Stravinsky mit &quot;Le sacre du printemps&quot;.&lt;br /&gt;
&lt;br /&gt;
Angaben zu Barbara Bauer-Ruchti:&lt;br /&gt;
&lt;br /&gt;
1921 in SÃƒÂ o Paulo, Brasilien geboren und dort aufgewachsen. Der Vater stammte aus Interlaken, die Mutter aus Moskau. KÃƒÂ¼nstlerische Bildung und PrÃƒÂ¤gung im Elternhaus, in internationalem KÃƒÂ¼nstler- und Architektenmilieu. Graphische Ausbildung in SÃƒÂ o Paulo. 1957 ÃƒÅ“bersiedlung der Familie in die Schweiz. Seit 1960 freischaffende Malerin in Aquarell, Gouache, Ãƒâ€“lkreide und Ãƒâ€“l.&lt;br /&gt;
&lt;br /&gt;
Ausstellungen:&lt;br /&gt;
&lt;br /&gt;
Sal?o de Maio, SÃƒÂ o Paulo&lt;br /&gt;
Burggarten-Keller, Bottmingen, BL&lt;br /&gt;
Kulturzentrum Leimental, BL&lt;br /&gt;
Galerie zur KrÃƒÂ¤he, Basel&lt;br /&gt;
&nbsp; &lt;br /&gt;
&quot;Ich lausche / dem FlÃƒÂ¼gelschlag / des Sonnenvogels / aus der DÃƒÂ¤mmerung / zur MorgenrÃƒÂ¶te / durch alle Zeiten / fliegt er / &nbsp;dem Goldregen / des Zeus / zu begegnen / der die Welten / &nbsp;befruchtet / dem Menschen / wandelnde TrÃƒÂ¤ume / entzÃƒÂ¼ndet / die TrÃƒÂ¤ume / die ich trÃƒÂ¤ume / seither!&quot;&lt;br /&gt;
","","4","../../media_art4art/art0008/_thumbs/th_scannen05.jpg","../../media_art4art/art0008/_thumbs/th_scannen02.jpg","n","0","0","j","0");
INSERT INTO cms_pages_save VALUES ("27","42","navi_5","art0007","Tristan Rà","malerei","0000-00-00 00:00:00","0000-00-00 00:00:00","Tristan RÃƒÂ  bereiste 30 Jahre lang die Welt, weilte in Polynesien, durchquerte SÃƒÂ¼damerika zu Fuss, besuchte Nordindien, Libyen, Tunesien, die TÃƒÂ¼rkei...","&lt;table border=&quot;0&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot; style=&quot;border-width: 0px; width: 100%&quot;&gt;
	&lt;tbody&gt;
		&lt;tr&gt;
			&lt;td valign=&quot;top&quot; style=&quot;width: 100px&quot;&gt;
			&lt;p&gt;
			1945 
			&lt;/p&gt;
			&lt;/td&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			Geboren in MontluÃƒÂ§on, Frankreich Medizinstudium und gleichzeitiges Studium der Malerei an der AcadÃƒÂ©mie Grande ChaumiÃƒÂ¨re. 
			&lt;/p&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			1969 
			&lt;/p&gt;
			&lt;/td&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			Abbruch des Studiums um sich voll der Malerei zu widmen. Arbeitet wÃƒÂ¤hrend 4 Jahren mit dem katalanischen Maler Belmonte. 
			&lt;/p&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			1972 
			&lt;/p&gt;
			&lt;/td&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			EinjÃƒÂ¤hriger Aufenthalt in Zentralamerika und Fussmarsch quer durch SÃƒÂ¼damerika. 
			&lt;/p&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			1970-2000 
			&lt;/p&gt;
			&lt;/td&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			Verschiedene Studienreisen in Nordafrika, Aegypten, Lybien, Tunesien, TÃƒÂ¼rkei, und Europa. 
			&lt;/p&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			1996-1998 
			&lt;/p&gt;
			&lt;/td&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			Studienaufenthalt in der TÃƒÂ¼rkei. 
			&lt;/p&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			2000 
			&lt;/p&gt;
			&lt;/td&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			7-monatiger Aufenthalt in Polynesien und Marquise. 
			&lt;/p&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			2002 
			&lt;/p&gt;
			&lt;/td&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			Aufenthalt in Nordindien, Rajastan. 
			&lt;/p&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			2004 
			&lt;/p&gt;
			&lt;/td&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			Aufenthalt in Tunesien, Aegypten. 
			&lt;/p&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			1975-2004 
			&lt;/p&gt;
			&lt;/td&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			RegelmÃƒÂ¤ssige bedeutende Einzelausstellungen in SÃƒÂ¼dfrankreich (Saint Tropez, Saint Paul de Vence, Gassin, Cannes, Grimaud), Genf, Strasbourg, Lyon, BrÃƒÂ¼ssel, London, New York, Paris, Stuttgart, Hong Kong,Miami und Singapore. 
			&lt;/p&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td valign=&quot;top&quot;&gt;&nbsp;&lt;/td&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			Seine Werke befinden sich in ÃƒÂ¶ffentlichen und privaten Sammlungen in Belgien, Deutschland, Frankreich,Italien, Holland, USA, England, Schweden, Japan und der TÃƒÂ¼rkei und Tunesien. 
			&lt;/p&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			2005 
			&lt;/p&gt;
			&lt;/td&gt;
			&lt;td valign=&quot;top&quot;&gt;
			&lt;p&gt;
			Erstmals in ZÃƒÂ¼rich &quot;art4art, halle fÃƒÂ¼r kunst, KÃƒÂ¼snacht. 
			&lt;/p&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
	&lt;/tbody&gt;
&lt;/table&gt;
&lt;br /&gt;
&lt;p&gt;
Zur Ausstellung erschien ein farbiger, zweisprachiger Katalog, in deutscher und franzÃƒÂ¶sischer Sprache. 
&lt;/p&gt;
&lt;p&gt;
Der Katalog illustriert das Werk des KÃƒÂ¼nstlers, erzÃƒÂ¤hlt ÃƒÂ¼ber die Entstehung und ÃƒÂ¼ber den Zauber der Malerei von Tristan RÃƒÂ . Preis: 30 CHF. - auf Anfrage erhÃƒÂ¤ltlich. 
&lt;/p&gt;
","","3","../../media_art4art/art0007/_thumbs/th_sarah.jpg","../../media_art4art/art0007/_thumbs/th_2008-mvc-093f.jpg","n","25","0","j","0");
INSERT INTO cms_pages_save VALUES ("32","34","navi_3","exp0007","André Bregnard: Eisenskulpturen, Charles Blockey: Bilder","vergangen","2005-09-01 00:00:00","2005-10-08 00:00:00","Vernissage: Donnerstag, 01. September, 18.30 Ã¢â‚¬â€œ 21.00 Uhr, EinfÃƒÂ¼hrung durch die Galeristin","&lt;p&gt;
Bregnard, ein in Kolumbien geborener Neuenburger, der seit Jahren in SÃƒÂ¼dfrankreich lebt hat eine eindrucksvolle Geschichte. ÃƒÂ¼ber Jahre bearbeitet er den Granitstein mit anthopomorphen Formen. Seine Stelen entwickeln sich zunehmend zum Dialog zwischen Volumen und Leere bis seine rechte Hand nicht mehr mitmacht. 
&lt;/p&gt;
&lt;p&gt;
In der Not ist auf der Suche nach neuen MÃƒÂ¶glichkeiten, Ungeahntes entstanden: Subtile Eisenskulpturen, welche mal durch Strenge und Meditation bestechen, mal durch Schwere und Leichtigkeit und oft an architektonische Kunstwerke erinnern.
&lt;/p&gt;
&lt;p&gt;
Ganz anders beim Schotten Blockey: &quot;das ÃƒÅ“berwinden der Zeitdimension und das Durchbrechen des physischen Raumes motivieren meine Malerei; Farbe fÃƒÂ¼r sich kann die Zeitlosigkeit schaffen, die Sprache der Formen und Linien neue RÃƒÂ¤ume bilden.&quot; 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;Vernissage&lt;/h3&gt;
&lt;p&gt;
Donnerstag, 01. September, 18.30 Ã¢â‚¬â€œ 21.00 Uhr&lt;br /&gt;
EinfÃƒÂ¼hrung durch die Galeristin 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;Finissage&lt;/h3&gt;
&lt;p&gt;
Samstag, 08. Oktober, 14.00 Ã¢â‚¬â€œ 17.00 Uhr 
&lt;/p&gt;
","","2","../../media_art4art/exp0007/_thumbs/th_skulptur1.jpg","../../media_art4art/exp0007/_thumbs/th_blockey_bild.jpg","n","30","29","j","8");
INSERT INTO cms_pages_save VALUES ("37","35","btq","btq0002","Schmuck","la_boutique","0000-00-00 00:00:00","0000-00-00 00:00:00","Schmuck",NULL,NULL,"5",NULL,NULL,"n","0","0","n","0");
INSERT INTO cms_pages_save VALUES ("29","42","navi_5","art0009","Blockey Charles","malerei","0000-00-00 00:00:00","0000-00-00 00:00:00","&quot;Das ÃƒÅ“berwinden der Zeitdimension und das Durchbrechen des physischen Raumes motivieren meine Malerei...&quot;","&lt;p&gt;
&quot;Das ÃƒÅ“berwinden der Zeitdimension und das Durchbrechen des physischen Raumes motivieren meine Malerei; Farbe fÃƒÂ¼r sich kann die Zeitlosigkeit schaffen, die Sprache der Formen und Linien neue RÃƒÂ¤ume bilden.&quot; 
&lt;/p&gt;
&lt;table border=&quot;0&quot; class=&quot;table&quot; style=&quot;border-width: 0px&quot;&gt;
	&lt;tbody&gt;
		&lt;tr&gt;
			&lt;td style=&quot;width: 100px&quot;&gt;1960&lt;/td&gt;
			&lt;td&gt;Geboren in Edinburgh, Scottland&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1979 Ã¢â‚¬â€1981&lt;/td&gt;
			&lt;td&gt;Edinburgh School of Art/Leeds School of Art &lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1982 Ã¢â‚¬â€ 1984&lt;/td&gt;
			&lt;td&gt;Studienreise Europa &lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1985 Ã¢â‚¬â€ 1989&lt;/td&gt;
			&lt;td&gt;Assenza Malschule MÃƒÂ¼nchenstein BL, wo er seit &lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1989&lt;/td&gt;
			&lt;td&gt;als Dozent tÃƒÂ¤tig ist.&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1989&lt;/td&gt;
			&lt;td&gt;RegelmÃƒÂ¤ssige Einzel und Gruppen-Ausstellungen in der Region Basel, Solothurn, Westschweiz und Frankreich&lt;br /&gt;
			Verschiedene Werke in ÃƒÂ¶ffentlichen Institutionen in Basel und Solothurn &lt;/td&gt;
		&lt;/tr&gt;
	&lt;/tbody&gt;
&lt;/table&gt;
","","5","../../media_art4art/art0009/_thumbs/th_dscn1520.jpg","../../media_art4art/art0009/_thumbs/th_dscn1510.jpg","n","0","0","j","0");
INSERT INTO cms_pages_save VALUES ("30","41","navi_5","art0010","Bregnard André","skulpturen","0000-00-00 00:00:00","0000-00-00 00:00:00","Subtile Eisenskulpturen, welche mal durch Strenge und Meditation bestechen, mal durch Schwere und Leichtigkeit und oft an architektonische Kunstwerke","&lt;p&gt;
Bregnard, ein in Kolumbien geborener Neuenburger, der seit Jahren in SÃƒÂ¼dfrankreich lebt hat eine eindrucksvolle Geschichte. ÃƒÂ¼ber Jahre bearbeitet er den Granitstein mit anthopomorphen Formen. Seine Stelen entwickeln sich zunehmend zum Dialog zwischen Volumen und Leere bis seine rechte Hand nicht mehr mitmacht. 
&lt;/p&gt;
&lt;p&gt;
In der Not ist auf der Suche nach neuen MÃƒÂ¶glichkeiten, Ungeahntes entstanden: Subtile Eisenskulpturen, welche mal durch Strenge und Meditation bestechen, mal durch Schwere und Leichtigkeit und oft an architektonische Kunstwerke erinnern. 
&lt;/p&gt;
&lt;br /&gt;
&lt;table border=&quot;0&quot; width=&quot;745&quot; height=&quot;180&quot;&gt;
	&lt;tbody&gt;
		&lt;tr&gt;
			&lt;td&gt;1944&nbsp;&nbsp;&nbsp; &lt;/td&gt;
			&lt;td&gt;Geboren in Kolumbien&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;&nbsp;&lt;/td&gt;
			&lt;td&gt;Ausbildung an der Schule fÃƒÂ¼r angewandte Kunst in La Chaux-de-Fonds&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1972 &lt;/td&gt;
			&lt;td&gt;lebt seither in SÃƒÂ¼dfrankreich&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1975&lt;/td&gt;
			&lt;td&gt;Einzel- und Gruppenausstellungen in SÃƒÂ¼dfrankreich, Genf, Neuenburg, Ascona, Vevey und Deutschland&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1976&lt;/td&gt;
			&lt;td&gt;1.Preis der Stadt La Chaux-de-Fonds&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1990 &lt;/td&gt;
			&lt;td&gt;1.Preis fÃƒÂ¼r Skulptur &quot;Forum des Arts&quot; Barjac&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1992&lt;/td&gt;
			&lt;td&gt;Auszeichnung und Vertreten der Schweiz in Dakar-SÃƒÂ©nÃƒÂ©gale&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;&nbsp;&lt;/td&gt;
			&lt;td&gt;Verschiedene Akquisitionen durch die StÃƒÂ¤dte La Chaux-de-Fonds, Neuenburg, Genf, Deutschland.&lt;/td&gt;
		&lt;/tr&gt;
	&lt;/tbody&gt;
&lt;/table&gt;
","","3","../../media_art4art/art0010/_thumbs/th_skulptur1.jpg","../../media_art4art/art0010/_thumbs/th_skuptur3.jpg","n","32","0","j","0");
INSERT INTO cms_pages_save VALUES ("31","41","navi_5","art0011","Brühwiler Herbert","skulpturen","0000-00-00 00:00:00","0000-00-00 00:00:00","Im Zentrum seines Schaffens stehen Haltungen. Haltung als KÃƒÂ¶rperausdruck, sei es in Form von menschenÃƒÂ¤hnlichen Gestalten oder als abstrakte KÃƒÂ¶rper","&lt;p&gt;
Die Werke von Herbert BrÃƒÂ¼hwiler sind sehr naturbezogen. In seiner Wasserinstallation in Horgen im Jahr 2001 setzt er feingeliederte Holzgestalten in die Wasserlandschaft und ÃƒÂ¼berlÃƒÂ¤sst sie der Verwitterung und der VerÃƒÂ¤nderung. 
&lt;/p&gt;
&lt;p&gt;
Im Zentrum seines Schaffens stehen Haltungen. Haltung als KÃƒÂ¶rperausdruck, sei es in Form von menschenÃƒÂ¤hnlichen Gestalten oder als abstrakte KÃƒÂ¶rper. Der KÃƒÂ¼nstler setzt sich mit der wahren Natur des Menschen auseinander. 
&lt;/p&gt;
&lt;br /&gt;
&lt;table border=&quot;0&quot;&gt;
	&lt;tbody&gt;
		&lt;tr&gt;
			&lt;td style=&quot;width: 70px&quot;&gt;1946&lt;/td&gt;
			&lt;td&gt;Geboren in Romanshorn, Thurgau &lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1976&lt;/td&gt;
			&lt;td&gt;Diplom in Angewandter Psychologie &lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1989&lt;/td&gt;
			&lt;td&gt;Beginn der Bildhauerei und Malerei&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1995&lt;/td&gt;
			&lt;td&gt;Beginn regelmÃƒÂ¤ssiger Ausstellungen&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1996 &lt;/td&gt;
			&lt;td&gt;SituationsklÃƒÂ¤rungen, Buchillustration (Leske & Budrich) &lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1997 &lt;/td&gt;
			&lt;td&gt;Horizonte, Grenzen, VÃƒÂ¶gel, Ausstellung Aogis Insos &lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1998&lt;/td&gt;
			&lt;td&gt;KÃƒÂ¶pfe, Wanderausstellung in der Schweiz des Vereins Schweizerischer Holzbildhauer (VSHB) &lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;2000&lt;/td&gt;
			&lt;td&gt;Skulpturen und Aquarelle, Kunsthaus Richterswil&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;2001&lt;/td&gt;
			&lt;td&gt;Goldener Schlegel, Wanderausstellung in der Schweiz und SÃƒÂ¼ddeutschland&lt;br /&gt;
			papier des VSHB, 12 schwimmende Skulpturen, Wasserinstallation auf dem ZÃƒÂ¼richsee, Horgen&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;2002&lt;/td&gt;
			&lt;td&gt;Gruppenausstellung Galerie Vista Nova, ZÃƒÂ¼rich &lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;2003&lt;/td&gt;
			&lt;td&gt;Bank Leu, ZÃƒÂ¼rich&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;2004&lt;/td&gt;
			&lt;td&gt;Gruppenausstellung Kulturfond Horgen; art4art, KÃƒÂ¼snacht&lt;/td&gt;
		&lt;/tr&gt;
	&lt;/tbody&gt;
&lt;/table&gt;
","","4","../../media_art4art/art0011/_thumbs/th_dscn1338.jpg","../../media_art4art/art0011/_thumbs/th_dscn1350.jpg","n","0","0","j","0");
INSERT INTO cms_pages_save VALUES ("33","34","navi_3","exp0008","Pier Daniele La Rocca: Libro labirinto","vergangen","2005-03-03 00:00:00","2005-04-23 00:00:00","Die Installation mit den 21 BÃƒÂ¼chern ist faszinierend und misteriÃƒÂ¶s; sie lÃƒÂ¤sst die Geschichte eines jeden Buches nur erahnen","&lt;p&gt;
&quot;In der antiken Bibliothek Alexandriens habe ich mir den letzten kleinen und in Vergessenheit geratenen Raum vorgestellt. Dort habe ich eine Gruppe von Buch-Objekten hingestellt, ausgewÃƒÂ¤hlt aus dem unendlichen Fundus des Universal-Wissens. Es sind deren 21, die Zahl des Wissens in der alt-indischen Veda-Kultur. Diese BÃƒÂ¼cher erzÃƒÂ¤hlen von Fantasie und von reellen Themen des menschlichen Daseins und wurden nur einmal gelesen, bevor sie in Vergessenheit gerieten. Sie sind fÃƒÂ¼r immer zugeschlagen worden, wie um die Quelle der Inspiration zu verbergen- sie wurden zu &quot;geheimen Seiten.&quot; 
&lt;/p&gt;
&lt;p&gt;
Die Installation mit den 21 BÃƒÂ¼chern ist faszinierend und misterips; sie lÃƒÂ¤sst die Geschichte eines jeden Buches, besetzt mit rÃƒÂ¤tselhaften archaischen Zeichen und Formen, nur erahnen und der Titel lÃƒÂ¤sst trÃƒÂ¤umen: die Argonauten, Phanta Rhei, Urakami, Malabar.... 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;Vernissage&lt;/h3&gt;
&lt;p&gt;
Donnerstag, 03. MÃƒÂ¤rz, 18.30 Ã¢â‚¬â€œ 21.00 Uhr&lt;br /&gt;
EinfÃƒÂ¼hrung durch die Galeristin 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;Farbkatalog&lt;/h3&gt;
&lt;p&gt;
Der durch art4art herausgegebene Katalog zur Ausstellung wurde von Aspecta Assurance International unterstÃƒÂ¼tzt.&lt;br /&gt;
Der Katalog ist bei art4art erhÃƒÂ¤ltlich. 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;Finissage&lt;/h3&gt;
&lt;p&gt;
Samstag, 23. April, 14.00 Ã¢â‚¬â€œ 17.00 Uhr 
&lt;/p&gt;
","","2","../../media_art4art/exp0008/_thumbs/th_il_libro3.jpg","../../media_art4art/exp0008/_thumbs/th_il_libro4.jpg","n","34","0","j","7");
INSERT INTO cms_pages_save VALUES ("38","35","btq","btq0003","Accessoires","la_boutique","0000-00-00 00:00:00","0000-00-00 00:00:00","Accessoires
Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis.","Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.&lt;br /&gt;
&lt;br /&gt;
 
&lt;p&gt;
Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
&lt;/p&gt;
&lt;p&gt;
&nbsp;
&lt;/p&gt;
&lt;p&gt;
Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.
&lt;/p&gt;
&lt;p&gt;
&nbsp;
&lt;/p&gt;
&lt;p&gt;
Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.
&lt;/p&gt;
&lt;p&gt;
&nbsp;
&lt;/p&gt;
","","3","../../media_art4art/btq0003/_thumbs/th_access_01.jpg","","n","0","0","n","0");
INSERT INTO cms_pages_save VALUES ("34","42","navi_5","art0012","La Rocca Pier Daniele","malerei","0000-00-00 00:00:00","0000-00-00 00:00:00","&quot;In der antiken Bibliothek Alexandriens habe ich mir den letzten kleinen und in Vergessenheit geratenen Raum vorgestellt&quot;","&lt;table border=&quot;0&quot; class=&quot;table&quot; style=&quot;border-width: 0px&quot;&gt;
	&lt;tbody&gt;
		&lt;tr valign=&quot;top&quot;&gt;
			&lt;td valign=&quot;top&quot; style=&quot;width: 100px&quot;&gt;1945&lt;/td&gt;
			&lt;td&gt;Geboren am Lago di Garda, Italien &lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1970 Ã¢â‚¬â€ 1975 &lt;/td&gt;
			&lt;td&gt;Studium der Malerei, Musik und Photographie &lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1975 Ã¢â‚¬â€ 1977&lt;/td&gt;
			&lt;td&gt;Journalismus in Mailand&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1978 Ã¢â‚¬â€ 1981&lt;/td&gt;
			&lt;td&gt;BÃƒÂ¼hnengestaltung und Regie in Rom&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1982 Ã¢â‚¬â€ 1989&lt;/td&gt;
			&lt;td&gt;LÃƒÂ¤ngere Aufenthalte in Asien, Afrika und auf&lt;br /&gt;
			den Mittelmeerinseln &lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;Seit 1990 &lt;/td&gt;
			&lt;td&gt;Ausstellungen u.a. in Ascona, Bologna, Faenza, Imola, KÃƒÂ¶ln, Locarno, Rom, Stresa, Turin, Venedig und ZÃƒÂ¼rich &lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;1999 Ã¢â‚¬â€ 2001&lt;/td&gt;
			&lt;td&gt;Forschung und Auseinandersetzung mit literarischen Texten und Dichtung der Antike. Es entstehen die Werkreihen Mul Apin, Rihla und Liber Mutus, die in Katalogen dokumentiert sind.&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;2002&lt;/td&gt;
			&lt;td&gt;ErÃƒÂ¶ffnungsausstellung art4art, halle fÃƒÂ¼r kunst, KÃƒÂ¼snacht&lt;br /&gt;
			Arte Fiera Bologna&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;2003 &lt;/td&gt;
			&lt;td&gt;Dimora di sapienti, Fondazione Cominelli, Cisano Torri del Benaco&lt;br /&gt;
			Kunstgarten Galerie, Aarwangen &lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td&gt;2004 &lt;/td&gt;
			&lt;td&gt;Libro labirinto, Arte moderna, Ammann, Locarno&lt;br /&gt;
			10. Internationale Messe fÃƒÂ¼r Gegenwartskunst, ZÃƒÂ¼rich&lt;/td&gt;
		&lt;/tr&gt;
	&lt;/tbody&gt;
&lt;/table&gt;
","","4","../../media_art4art/art0012/_thumbs/th_2.jpg","../../media_art4art/art0012/_thumbs/th_6.jpg","n","0","0","j","0");
INSERT INTO cms_pages_save VALUES ("35","40","navi_4","eve0004","Farbtöne & Klangfarben","vergangen","2007-06-10 00:00:00","0000-00-00 00:00:00","Neujahrskonzert zur Finissage der Ausstellung von Dominique Belvedere, Samstag, den 20. Januar 2007 um 17.15 Uhr","&lt;p&gt;
Die Cellistin Stefania VeritÃƒÂ  und die Pianistin Susanne MÃƒÂ¶hring spielen Meisterwerke aus der Romantik, der SpÃƒÂ¤tromantik und dem frÃƒÂ¼hen 20. Jahrhundert und unterstreichen mit warmen und kraftvollen KlÃƒÂ¤ngen die GemÃƒÂ¤lde von Dominique Belvedere. 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;Stefania VeritÃƒÂ &lt;/h3&gt;
&lt;p&gt;
Geboren in Italien. 1985 erhielt sie ihr Cello-Diplom am Conservatorio Antonio Vivaldi in Alessandria. Dank eines Stipendiums konnte sie ihre Studien an der Scuola di Alto Perfezionamento Musicale in Saluzzo bei Thomas Demenga und Rocco Filippini fortsetzen. 1999 Aufnahme in die Solistenklasse von Patrick Demenga an der Musikhochschule Bern (Schweiz), mit Abschluss des Solistendiploms 1991. Neben ihrer Mitwirkung in verschiedenen Orchestern unter anderem Tonhalle-Orchester ZÃƒÂ¼rich und Camerata ZÃƒÂ¼rich, ist sie seit 1993 Cellistin des Ensembles von Nina Corti und seit 1997 Mitglied des Ensembles Salon Passion. Zur solistischen und kammermusikalischen TÃƒÂ¤tigkeiten, auf modernem sowie barockem Cello, kommen immer wieder auch Auftritte im Grenzbereich zwischen Jazz und Experimenteller Musik. Lehrerin am Konservatorium ZÃƒÂ¼rich. Aktiv als SoloflÃƒÂ¶tistin, Orchestermusikerin und als Kammermusik-Partnerin. Konzerte im In- und Ausland. Umfangreiches klassisches und modernes Repertoire 
&lt;/p&gt;
&lt;br /&gt;
&lt;h3&gt;Susanne MÃƒÂ¶hring&lt;/h3&gt;
&lt;p&gt;
Geboren in KÃƒÂ¶ln als Tochter des FlÃƒÂ¶tisten Hans JÃƒÂ¼rgen MÃƒÂ¶hring und der SÃƒÂ¤ngerin Anne Schaad. Studium der InstrumentalpÃƒÂ¤dagogik Klavier und Viola an der Musikhochschule Rheinland. Aufbaustudium in der Meisterklasse von Prof. Karl Engel am Konservatorium Bern. 1990 Konzertreife. WÃƒÂ¤hrend des Studiums WeiterfÃƒÂ¼hrung des Bratschenunterrichts bei Henri Crafoord. 1990 Rorary-Preis der Stadt La Chaux-de-Fonds. 1992 Liedpreis der Stadt Bozen. Konzerte solistisch, kammermusikalisch und als Liedbegleiterin im In- und Ausland. Lehrauftrag an der Musikschule der Stadt ZÃƒÂ¼rich. RegelmÃƒÂ¤ssige Leitung von Kammermusikkursen auf dem Jolimont bei Erlach. 
&lt;/p&gt;
","","2","../../media_art4art/eve0004/_thumbs/th_cellistin.jpg","../../media_art4art/eve0004/_thumbs/th_ausstellung6.jpg","n","0","0","j","0");
INSERT INTO cms_pages_save VALUES ("36","35","btq","btq0001","Keramik","la_boutique","0000-00-00 00:00:00","0000-00-00 00:00:00","Geschenke aus Keramik
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquy","Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.&lt;br /&gt;
&lt;br /&gt;
 
&lt;p&gt;
Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
&lt;/p&gt;
&lt;p&gt;
&nbsp;
&lt;/p&gt;
&lt;p&gt;
Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.
&lt;/p&gt;
&lt;p&gt;
&nbsp;
&lt;/p&gt;
&lt;p&gt;
Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.
&lt;/p&gt;
&lt;p&gt;
&nbsp;
&lt;/p&gt;
&lt;p&gt;
Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis. 
&lt;/p&gt;
","","4","../../media_art4art/btq0001/_thumbs/th_pitfiringschalen.jpg","","n","0","0","n","0");
INSERT INTO cms_pages_save VALUES ("41","35","btq","btq0006","Objekte","la_boutique","0000-00-00 00:00:00","0000-00-00 00:00:00","Objekte
Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis.","Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.
&lt;p&gt;
&lt;br /&gt;
Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. 
&lt;/p&gt;
&lt;p&gt;
&lt;br /&gt;
Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. 
&lt;/p&gt;
&lt;p&gt;
&nbsp;
&lt;/p&gt;
","","2","../../media_art4art/btq0006/_thumbs/th_objekt_01.jpg","../../media_art4art/btq0006/_thumbs/th_objekt_02.jpg","n","0","0","n","0");
INSERT INTO cms_pages_save VALUES ("46","42","navi_5","art0013","Bouys Jeanick","malerei","0000-00-00 00:00:00","0000-00-00 00:00:00","Jeanick Bouys Bilder sind seit 1980 regelmÃƒÂ¤ssig in Museen, Galerien und
privaten Sammlungen in Frankreich, Japan, New York und in der Schweiz
zu sehen","Ein merkwÃƒÂ¼rdiger Vogel, mit dieser dickbÃƒÂ¤uchigen Silhouette und dem langen Schnabel eines Ibis, der sich mit seinem &quot;hitchcockischen&quot; Profil in den farbigen Abschnitten der Bilder von Jeanick Bouys aufdrÃƒÂ¤ngt.&lt;br /&gt;
Dieses Fetisch-Tier trÃƒÂ¤gt einen Namen. Es ist ein bobo&quot;, offiziell existieren die bobos. Irgendwo in Afrika. In Wahrheit manifestiert sich Afrika auf der Farbenskala des KÃƒÂ¼nstlers in den Purpur- und BrauntÃƒÂ¶nen. &lt;br /&gt;
Aber warum dieser Zwitter, halb Mensch, halb Vogel - ein Traum von Ikarus? Woher der Anschein, ein irdisches Damenbrett zu ÃƒÂ¼berfliegen, wie eine innere Landschaft einer Kindheit, die dahinfliegt?&lt;br /&gt;
Jean Rouand, Prix Goncourt&lt;br /&gt;
&lt;br /&gt;
Un drÃƒÂ´le d\'oiseau, cette silhouette ventripotente au long bec d\'ibis, qui impose son profil hitchcockien dans les parcelles color?es des tableaux de Jeanick Bouys. Cet animal fÃƒÂ©tiche porte un nom. C\'est un bobo, officiellement les bobos existent. Quelque part en Afrique. D\'ailleurs, l\'Afrique est lÃƒÂ , offrant au peintre sa gamme de pourpres et de bruns. Mais pourquoi cet hybride mi homme pour le bas, mi oiseau pour le haut? un rÃƒÂ¨ve d\'icare? D?o? cette impression de survoler un damier terrestre, comme le paysage intÃƒÂ©rieur d\'une enfance qui soi loigne? &lt;br /&gt;
Jean Rouand, Prix Goncourt&lt;br /&gt;
&lt;br /&gt;
","","4","../../media_art4art/art0013/_thumbs/th_atelier 26 canvas 100x100cm web.jpg","../../media_art4art/art0013/_thumbs/th_atelier-26-paper-27x180cm-w.jpg","n","45","0","j","0");
INSERT INTO cms_pages_save VALUES ("47","40","navi_4","eve0005","Jeanick Bouys: Spuren - traces","vergangen","2008-09-04 00:00:00","0000-00-00 00:00:00","Vernissage am Donnerstag, 4. September 2008, 18.30 Ã¢â‚¬â€œ 21.00 Uhr","BegrÃƒÂ¼ssung und EinfÃƒÂ¼hrung durch die Galeristin&lt;br /&gt;
Der KÃƒÂ¼nstler wird anwesend sein&lt;br /&gt;
&lt;br /&gt;
Jeanick Bouys Bilder sind seit 1980 regelmÃƒÂ¤ssig in Museen, Galerien und privaten Sammlungen in Frankreich, Japan, New York und in der Schweiz zu sehen.&lt;br /&gt;
&lt;br /&gt;
WÃƒÂ¤hrend 10 Jahren arbeitete er in seinem Atelier in New York. J. Bouys hat diverse Preise und Stipendien in Frankreich und Italien gewonnen.&lt;br /&gt;
","","2","../../media_art4art/eve0005/_thumbs/th_atelier 26 canvas 100x100cm web.jpg","","n","0","0","j","0");
INSERT INTO cms_pages_save VALUES ("48","40","navi_4","eve0006","Susanna Merkle: Lesung","vergangen","2008-10-04 00:00:00","0000-00-00 00:00:00","Lesung der Lyrikerin Susanna Merkle mit anschliessendem ApÃƒÂ©ro
Samstag, 4. Oktober 2008, 17:00 Ã¢â‚¬â€œ 18:00 Uhr - Eintritt CHF 15 pro Person","&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
Normal
0
21
false
false
false
MicrosoftInternetExplorer4
&lt;/xml&gt;&lt;![endif]--&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
&lt;/xml&gt;&lt;![endif]--&gt;
&lt;!--[if gte mso 10]&gt;
&lt;style&gt;
/* Style Definitions */
table.MsoNormalTable
{mso-style-name:&quot;Normale Tabelle&quot;;
mso-tstyle-rowband-size:0;
mso-tstyle-colband-size:0;
mso-style-noshow:yes;
mso-style-parent:&quot;&quot;;
mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
mso-para-margin:0cm;
mso-para-margin-bottom:.0001pt;
mso-pagination:widow-orphan;
font-size:10.0pt;
font-family:&quot;Times New Roman&quot;;
mso-ansi-language:#0400;
mso-fareast-language:#0400;
mso-bidi-language:#0400;}
&lt;/style&gt;
&lt;![endif]--&gt;
&lt;strong&gt;EinfÃƒÂ¼hrung
durch die Pariser Kunsthistorikerin FranÃƒÂ§oise Albrecht&lt;/strong&gt;&lt;br /&gt;
&lt;br /&gt;
&lt;strong&gt;Die
Lesung ist auf franzÃƒÂ¶sisch mit deutschen ErlÃƒÂ¤uterungen&lt;/strong&gt;&lt;strong&gt; &lt;/strong&gt;&lt;br /&gt;
&lt;br /&gt;
Susanna
Merkle ist in der TÃƒÂ¼rkei, spÃƒÂ¤ter in Afrika(Kongo) aufgewachsen, wo der Vater -
ein Auslands-Schweizer - lange Jahre als ArchÃƒÂ¤ologe und Geologe beruflich tÃƒÂ¤tig
war. Dadurch, sowie durch ihre ungarisch-jÃƒÂ¼dische Mutter, erlebte Susanna
Merkle ihre Kindheit und Jugend schon sehr frÃƒÂ¼h in einem multikulturellen
Umfeld. Bald nach der Einschulung begann Susanna Merkle zu schreiben. Es waren
kurze Geschichten, ErzÃƒÂ¤hlungen und AufsÃƒÂ¤tze, die vielfach auch in
SchÃƒÂ¼lerzeitungen abgedruckt wurden. Das Schreiben gehÃƒÂ¶rte fortan zu ihrem
weiteren Leben und ist eigentlich eine Passion: PersÃƒÂ¶nliche TagebÃƒÂ¼cher und seit
etwas 30 Jahren Gedichte in FranzÃƒÂ¶sisch. Seit 1996 verfasst sie Lyrik ebenfalls
in deutscher Sprache. In den 80er Jahren des letzten Jahrhunderts gewann
Susanna Merkle Gedicht-Wettbewerbe in Genf und in SÃƒÂ¼dfrankreich in 1998 sowie
207 erhielt sie in Ascona (Italien) beim Ã¢â‚¬Å¾Concorso inernationale Ã¢â‚¬Å¾Voci Nostre&quot;-
eines vom EuropÃƒÂ¤ischen Parlament unterstÃƒÂ¼tzten Wettbewerbes- jeweils einen
1.Preis fÃƒÂ¼r franzÃƒÂ¶sische Lyrik. Susanne Merkle ist Mitglied des Schweizerischen
Autorinnen und Autoren Verbandes sowie des Netzwerk Schreibender Frauen.&lt;br /&gt;
&lt;br /&gt;
In den 80er Jahren des letzten
Jahrhunderts gewann Susanna Merkle Gedicht-Wettbewerbe in Genf und in
SÃƒÂ¼dfrankreich. 1998 sowie 2007 erhielt sie in Ancona (Italien) beim Ã¢â‚¬Å¾Concorso
Internationale Voci Nostre&quot; - eines vom EuropÃƒÂ¤ischen Parlament unterstÃƒÂ¼tzten
Wettbewerbes - jeweils einen 1. Preis fÃƒÂ¼r franzÃƒÂ¶sische Lyrik.&lt;br /&gt;
&lt;br /&gt;
Susanna Merkle ist Mitglied des
Schweizerischen Autorinnen und Autoren Verbandes sowie des Netzwerk
Schreibender Frauen.&lt;br /&gt;
&lt;br /&gt;
Von der Autorin gibt es diverse
Publikationen sowie VerÃƒÂ¶ffentlichungen in Zeitschriften und Anthologien.
Mehrere Gedichte wurden auf Englisch, Italienisch und Ungarisch ÃƒÂ¼bersetzt.&lt;br /&gt;
","","2","../../media_art4art/eve0006/_thumbs/th_merkle.jpg","../../media_art4art/eve0006/_thumbs/th_atelier 26 canvas 100x100cm web.jpg","n","0","0","j","0");
INSERT INTO cms_pages_save VALUES ("49","40","navi_4","eve0007","Jeanick Bouys","vergangen","2008-10-25 00:00:00","0000-00-00 00:00:00","Finissage: Samstag, 25. Oktober 2008, 11.00 Ã¢â‚¬â€œ 15.00 Uhr","Finissage: Samstag, 25. Oktober 2008, 11.00 Ã¢â‚¬â€œ 15.00 Uhr
",NULL,"2",NULL,NULL,"n","0","0","j","0");
INSERT INTO cms_pages_save VALUES ("50","34","navi_3","exp0010","Dominique Belvedere und Stefan Jakob","vergangen","2008-11-20 00:00:00","2009-01-31 00:00:00","Dominique Belvedere und Stefan Jakob, Vernissage am Donnerstag, 20. November 2008, 18:30Ã¢â‚¬â€œ21:00 Uhr, BegrÃƒÂ¼ssung durch die Galeristin und die KÃƒÂ¼nstler","&lt;p&gt;
&nbsp;
&lt;/p&gt;
&lt;h3&gt;Dominique Belvedere Ã¢â‚¬â€œ Neue Bilder&lt;br /&gt;
&lt;/h3&gt;
&lt;p&gt;
Dominique Belvedere ist 1958 in ZÃƒÂ¼rich geboren und in BÃƒÂ¼lach aufgewachsen.
&lt;/p&gt;
&lt;p&gt;
Die Bilder von Belvedere sind schlichte Kompositionen, die durch die Vielschichtigkeit der ÃƒÂ¼bereinander aufgetragenen FarbflÃƒÂ¤chen geprÃƒÂ¤gt sind. Horizontale und vertikale Elemente dynamisieren das Bild und verleihen ihm grosse Spannung und Kraft. Verwischte BildflÃƒÂ¤chen, subtile FarbklÃƒÂ¤nge, intuitiv gesetzte Striche und eingravierte Elemente geben dem Bild einen meditativen Charakter.
&lt;/p&gt;
&lt;p&gt;
&nbsp;
&lt;/p&gt;
&lt;p&gt;
Es entstehen tiefgrÃƒÂ¼ndige Bildwelten mit unendlichem Horizont. &quot;Eine von Zeitspuren geprÃƒÂ¤gte Mauer&quot; [Martin Kraft], oder WÃƒÂ¼stenlandschaften, die Sehnsucht erwecken. Die Bilder erfÃƒÂ¼llen den Raum mit freudiger Stille und Harmonie.
&lt;/p&gt;
&lt;p&gt;
&nbsp;
&lt;/p&gt;
&lt;h3&gt;Stefan Jakob&lt;/h3&gt;Stefan Jakob ist 1961 in Winterthur geboren. Vor 25 Jahren sass er das erste Mal an einer TÃƒÂ¶pferscheibe. Seither beschÃƒÂ¤ftigt ihn das Thema Keramik. Viele Impulse und Anregungen fÃƒÂ¼r sein Schaffen erhielt er in Kursen und Workshops bei national und international bekannten KÃƒÂ¼nstlern.&lt;br /&gt;
&lt;br /&gt;
&lt;p&gt;
WÃƒÂ¤hrend der Ausbildung an der Schule fÃƒÂ¼r Gestaltung in ZÃƒÂ¼rich entdeckte er die Faszination fÃƒÂ¼r das Feuer, ursprÃƒÂ¼ngliche Brenntechniken und den Bau von einfachen KeramikbrennÃƒÂ¶fen. Die Mitarbeit an den Ausstellungen &quot;Pfahlbauland ZÃƒÂ¼rich&quot; und &quot;Urgeschichte Live&quot; im Landesmuseum gaben ihm einen vertieften Einblick in das Rekonstruieren von neolitischen GefÃƒÂ¤ssen und das Brennen im offenen Feuer.
&lt;/p&gt;
","","2","../../media_art4art/exp0010/_thumbs/th_dscn1812.jpg","../../media_art4art/exp0010/_thumbs/th_dscn1808.jpg","n","26","57","j","6");
INSERT INTO cms_pages_save VALUES ("52","43","navi_5","art0015","Kamm Hanspeter","objektkunst","0000-00-00 00:00:00","0000-00-00 00:00:00","Eine phantasievolle Welt, die Freiheit atmet. Die Draht-Objekte
von Kamm verbinden Poesie, Humor, Leichtigkeit und technisch-kÃƒÂ¼nstlerische Virtuosit
","Auf die Frage was ihn am meisten zu seinem Schaffen antrieb, sagt Kamm: &quot; Ich wollte vor allem etwas gegen das banale, eintÃƒÂ¶nige Leben tun, gegen die aufgezwungene AutoritÃƒÂ¤t, ich wollte die Freiheit bewahren - ich liebe Karikatur und Ironie...&quot; Er vereint Poesie, Leichtigkeit und &quot;art brut&quot;, er ist nicht Opfer, sondern macht sich auf feinste Art lustig - der Zuschauer kann nur schmunzeln und zustimmen.&lt;br /&gt;
&lt;br /&gt;
Der Schweizer ObjektkÃƒÂ¼nstler Hanspeter Kamm wurde am 24. April 1938 in Winterthur geboren. Er lernte Schaufensterdekorateur, spÃƒÂ¤ter Grafiker und war Art Direktor einer bedeutenden Werbeagentur in Stuttgart. Hanspeter Kamm aber ist vor allem ein grosser Erfinder, der mit unermÃƒÂ¼dlichem Schaffensdrang, mit sprudelnder Fantasie und Experimentierfreude im Laufe der Zeit seinem vielfÃƒÂ¤ltigen Werk eine unverkennbare Handschrift aufsetzte. Seine kÃƒÂ¼nstlerischtechnische VirtuositÃƒÂ¤t schenkte ihm Narrenfreiheit, die immer zu neuen Kreationen fÃƒÂ¤hrt; er ist ein Innovator in der Kunst.&lt;br /&gt;
&lt;br /&gt;
Sein wichtigster Werkstoff Draht, ist Strich und Schraffierung zugleich. Mit ihm verlÃƒÂ¤sst er die FlÃƒÂ¤che, entwirft vielschichtige RÃƒÂ¤ume. Seltsame Gestalten, Kobolde, Untiere auf Vehikeln bevÃƒÂ¶lkern Drahtreliefs und Objekte. Serien von Kleinplastiken, ironische und interaktive Grossobjekte, strukturelle Arbeiten mit Einbezug der Licht- und Schattenwirkung, &quot;Zeichnungen im Raum&quot;, sind fÃƒÂ¼r das vielfÃƒÂ¤ltige Werk von Hanspeter Kamm charakteristisch. &quot;Dreidimensionale Zeichnungen&quot; nennt Hanspeter Kamm seine Drahtkunst. Ein Reich voller Leben, Lust und Bewegung.&lt;br /&gt;
&lt;br /&gt;
Hanspeter Kamm ist ein Querdenker und EigenbrÃƒÂ¶tler. Er pendelt zwischen Kunstbegriff und Gefallensurteil frÃƒÂ¶hlich hin und her - und pfeift dazu. Er ist ein Meister der &quot;verspinntisierten&quot; Heiterkeit und augenzwinkernden Ernsthaftigkeit. Die versteckten, humorvollen, ironischen, manchmal sarkastischen Botschaften im Draht fÃƒÂ¼hren uns an den Ursprung unserer eigenen Wahrnehmung. Seine Welt fasziniert, seine Werke lÃƒÂ¶sen Staunen und spontane Begeisterung aus.&lt;br /&gt;
&lt;br /&gt;
Der Kreis der Kunstsammler und -liebhaber dieses namhaften KÃƒÂ¼nstlers zieht sich von der Schweiz ÃƒÂ¼ber Europa hin bis Amerika und Fernost. 
","","4","../../media_art4art/art0015/_thumbs/th_objekt64web.jpg","../../media_art4art/art0015/_thumbs/th_objekt45web.jpg","n","0","0","j","0");
INSERT INTO cms_pages_save VALUES ("51","42","navi_5","art0014","Buchwalder Fredy","malerei","0000-00-00 00:00:00","0000-00-00 00:00:00","Buchwalders Afrikaaufenthalt hat ihn in seiner Malerei wie in seinem Leben markiert. Motive tauchen immer noch auf und inspirieren sein Schaffen.","Buchwalders Afrikaaufenthalt hat ihn in seiner Malerei wie in seinem Leben markiert. Motive tauchen immer noch auf und inspirieren sein Schaffen. Buchwalder forscht weiter in seiner Maltechnik, die viele Schritte durchlaufen. So sind es Asphalt, Quarzsand und Arylbinder, die seinen sensiblen Malgrund bilden.&lt;br /&gt;
&lt;br /&gt;
In Norditalien, wo er jetzt lebt, sind es vorallem die ElementarkrÃƒÂ¤fte, das Zusammenspiel von Granit, Wasser und dem besonderen Licht, die seine Malerei inspirieren. Das Neapelgelb des Winterlichtes oder das Goldgelb eines Herbsttages sind QualitÃƒÂ¤ten, in welche er eintaucht. &quot;Die Geburt des Bildes entsteht durch die Vereinigung von MaterialitÃƒÂ¤t, den FarbtÃƒÂ¶nen und der formgebenden, gravurhaften Linie. Die zeichenhafte Sprache der reliefhaften, eingekratzten Linie provoziert die PrÃƒÂ¤senz des Augenblickes, ein schÃƒÂ¶pfendes Erfinden im Nichtwissen.&quot;&lt;br /&gt;
&lt;br /&gt;
Angaben zu Fredy Buchwalder:&lt;br /&gt;
&lt;br /&gt;
Fredy Buchwalder, 1955 in Zwingen BL geboren und aufgewachsen. Seit 1972&lt;br /&gt;
intensive BeschÃƒÂ¤ftigung mit der Malerei und Studium in den USA und Basel. Seit&lt;br /&gt;
1985 freischaffender Kunstmaler und Dozent an der Assenza-Malschule, MÃƒÂ¼nchenstein. &nbsp;&lt;br /&gt;
&lt;br /&gt;
Seit 1999 regelmÃƒÂ¤ssig Ausstellungen in der Schweiz, darunter im 2000 &quot;Actionpainting&quot; in ZÃƒÂ¼rich und MÃƒÂ¼nchen unter dem Motto &quot;Innovation und Kunst&quot; fÃƒÂ¼r Arthur D. Little International.&lt;br /&gt;
&lt;br /&gt;
2001 Atelieraufenthalt in Dakar, Senegal. 2002/03 Afrika-Ausstellung in der Galerie art4art. Seit einigen Jahren lebt und arbeitet er im Piemont/Norditalien. Bilder in ÃƒÂ¶ffentlichem und privatem Besitz in der Schweiz.&lt;br /&gt;
&lt;br /&gt;
&quot;Die Suche nach archaischer UrsprÃƒÂ¼nglichkeit, die ElementarkrÃƒÂ¤fte, das Zusammenspiel von Granit, Wasser und dem besonderen Licht in meiner neuen Wahlheimat in Norditalien inspirieren meine Malerei. Ein sensibler Malgrund erlaubt die Geburt des Bildes als Vereinigung von MaterialitÃƒÂ¤t, den FarbtÃƒÂ¶nen und der formgebenden, gravurhaften Linie.&quot;&lt;br /&gt;
","","4","../../media_art4art/art0014/_thumbs/th_fb_p1000750_web.jpg","../../media_art4art/art0014/_thumbs/th_p1010151.jpg","n","0","0","j","0");
INSERT INTO cms_pages_save VALUES ("53","43","navi_5","art0016","Munuera Lucia","objektkunst","0000-00-00 00:00:00","0000-00-00 00:00:00","Die Arbeiten von Lucia Munuera  knÃƒÂ¶pfen an eine uralte Tradition, bringt aber sehr moderne, bisweilen strenge Formen hervor ...","Die Arbeiten von Lucia Munuera&nbsp; knÃƒÂ¼pfen an eine uralte Tradition, bringt aber sehr moderne, bisweilen strenge Formen hervor, die alle im Handaufbau entstehen. Der langsame Entstehungsprozess lÃƒÂ¤sst der KÃƒÂ¼nstlerin Zeit, ihre intuitiven Ideen direkt einfliessen zu lassen. Eine besonders grosse Herausforderung sind grÃƒÂ¶ssere Objekte, die aus mehreren Teilen zusammengesetzt werden und somit im Raku an die Grenze des Machbaren gehen. Raku ist eine faszinierende Art Keramik zu brennen. &lt;br /&gt;
&lt;br /&gt;
Der Ursprung findet sich im 16. Jahrhundert, wo Trinkschalen fÃƒÂ¼r die Teezeremonien des Zen-Buddhismus in dieser Technik hergestellt wurden. Die Elemente Feuer, Wasser, Erde und Luft spielen eine bedeutende Rolle im Entstehungsprozess. Bei 1000 Grad Celsius werden die glÃƒÂ¼henden Objekte mit Eisenzangen aus dem&nbsp; Ofen gehoben, danach in SÃƒÂ¤gespÃƒÂ¤nen reduziert und anschliessend in Wasser geschmaucht. &quot;Es ist jedes Mal wie ein Wunder, wenn das StÃƒÂ¼ck die Strapazen ÃƒÂ¼berstanden hat&quot; sagt Munuera.&lt;br /&gt;
&lt;br /&gt;
Lucia Munuera-Blum, 1964 in ZÃƒÂ¼rich geboren, lebt und arbeitet in Richterswil. Seit 1991 widmet sie sich dem Raku. Ihre fundierten Kenntnisse hat sie vorwiegend in Intensiv-Seminaren und auf autodidaktischem Weg erworben.&lt;br /&gt;
&lt;br /&gt;
&nbsp;&lt;br /&gt;
","","4","../../media_art4art/art0016/_thumbs/th_schale_web.jpg","../../media_art4art/art0016/_thumbs/th_dscn0725web.jpg","n","0","0","j","0");
INSERT INTO cms_pages_save VALUES ("54","43","navi_5","art0017","Grobet Daniel","objektkunst","0000-00-00 00:00:00","0000-00-00 00:00:00","Die Leidenschaft, die Grobet in seiner Arbeit antreibt, ist das Gleichgewicht. &quot;Es fasziniert mich und fordert mich heraus...","Die Leidenschaft, die Grobet in seiner Arbeit antreibt, ist das Gleichgewicht. &quot;Es fasziniert mich und fordert mich heraus. Ich versuche es bildnerisch umzusetzen, denn wir alle streben ein Leben lang kÃƒÂ¶rperlich und seelisch nach Gleichgewicht. Diese Suche beginnt mit dem ersten Schritt.&quot; Grobet\'s Vorliebe fÃƒÂ¼r das Eisen ist in der Einfachheit des Materials begrÃƒÂ¼ndet. Man findet es ÃƒÂ¼berall, es wird kalt oder glÃƒÂ¼hend bearbeitet, es rostet und nimmt die wunderschÃƒÂ¶ne Farbe der BaumstÃƒÂ¤mme an. &lt;br /&gt;
&lt;br /&gt;
In seinem Atelier erahnt er die Skulptur. Er bearbeitet das Eisen anders als ein Bildhauer; er biegt, dreht und schlÃƒÂ¤gt es. Er bringt harmonische Linien auf verschiedenen Ebenen in Beziehung und Verbindung zueinander. Ist die fertige Skulptur entstanden, so bekommt sie ihre definitive &quot;Allure&quot; im Raum oder in der freien Natur. Das Werk Grobet\'s lebt im Dialog mit dem Wind oder mit der Neugier des Betrachters, der es nicht lassen kann, subtil mit dem Gleichgewicht zu spielen.&lt;br /&gt;
&lt;br /&gt;
Angaben zu Daniel Grobet &nbsp;&lt;br /&gt;
&lt;br /&gt;
&lt;table border=&quot;0&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot;&gt;
	&lt;tbody&gt;
		&lt;tr&gt;
			&lt;td width=&quot;95&quot; valign=&quot;top&quot;&gt;1936&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;503&quot; valign=&quot;top&quot;&gt;Geboren in St. Imier, Schweiz.&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;95&quot; valign=&quot;top&quot;&gt;1955 - 60&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;503&quot; valign=&quot;top&quot;&gt;Theologiestudium mit Staatsexamen in Paris.&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;95&quot; valign=&quot;top&quot;&gt;1960 - 74 &lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;503&quot; valign=&quot;top&quot;&gt;Als reformierter Pfarrer in Paris und Korsika tÃƒÂ¤tig.&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;95&quot; valign=&quot;top&quot;&gt;1974&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;503&quot; valign=&quot;top&quot;&gt;Begegnung mit einem Werk Calders in der Fondation Maeght, Saint- Paul-de-Vence. Beeindruckt und fasziniert durch Gleichgewicht und Bewegung, beschliesst er, diese Dynamik in Eisenskulpturen umzusetzen.&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;95&quot; valign=&quot;top&quot;&gt;1974 - 96&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;503&quot; valign=&quot;top&quot;&gt;Autodidakt. Erste Werke.&lt;br /&gt;
			Entwickelt die Kollektion &quot;Attrape-Feux&quot;.&lt;br /&gt;
			Skulpturenausstellungen in der Schweiz und Deutschland.&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;95&quot; valign=&quot;top&quot;&gt;Seit 1996&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;503&quot; valign=&quot;top&quot;&gt;Lebt in SÃƒÂ¼dfrankreich.&lt;br /&gt;
			Arbeitet thematisch an immer komplexeren Gleichgewichten. &lt;br /&gt;
			Ausstellungen in Frankreich, Deutschland und der Schweiz.&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
	&lt;/tbody&gt;
&lt;/table&gt;
&nbsp;&lt;br /&gt;
Werke von Daniel Grobet befinden sich in ÃƒÂ¶ffentlichen und privaten Sammlungen in der Schweiz und in Frankreich. Das Westschweizer Fernsehen TSR hat 1993 und 2002 zwei Filme ÃƒÂ¼ber seine Arbeit gedreht.&lt;br /&gt;
&lt;br /&gt;
In der Berichterstattung des Jahres 2003 des Credit Suisse standen die Arbeiten von Daniel Grobet symbolhaft fÃƒÂ¼r das VerstÃƒÂ¤ndnis der Credit Suisse Group von 360&nbsp; Finance. Durch sorgfÃƒÂ¤ltige Kombination statischer und dynamischer Elemente erreicht der KÃƒÂ¼nstler in seinen handgefertigten Eisenskulpturen ein harmonisches Gleichgewicht.&quot; In diesem Jahr fand die erste Ausstellung bei art4art statt.&lt;br /&gt;
&lt;br /&gt;
Im Oktober 2006 war Daniel Grobet Ehrengast des &quot;XIIe parcours de l\'art&quot; in Avignon, eines der bedeutendsten Kunst-Events SÃƒÂ¼dfrankreichs.
","","4","../../media_art4art/art0017/_thumbs/th_dsc01139[1]web.jpg","../../media_art4art/art0017/_thumbs/th_dsc04627_1web.jpg","n","0","0","j","0");
INSERT INTO cms_pages_save VALUES ("55","42","navi_5","art0018","Bravi Giuseppe","malerei","0000-00-00 00:00:00","0000-00-00 00:00:00","In den Grotten von Lascaux hat sich der Mensch zum ersten Mal in Zeichen ausgedrÃƒÂ¼ckt und damit die unendliche Dimension seines Strebens konkretisiert.","In den Grotten von Lascaux hat sich der Mensch zum ersten Mal in Zeichen ausgedrÃƒÂ¼ckt und damit die unendliche Dimension seines Strebens konkretisiert. Seit dreissig Jahren setzt sich Bravi mit der verfÃƒÂ¼hrerischen und emotionalen Kraft der Zeichen auseinander.&lt;br /&gt;
&lt;br /&gt;
Sein Werk ist immer noch unverkennbar, mal an Klee erinnernd, mal an archÃƒÂ¤ologische Recherchen im mediterranen Raum.&lt;br /&gt;
&lt;br /&gt;
&quot;Der Zufall kann sehr kreativ sein. Das Entscheidende ist, ihn zu erkennen.&quot; (Giuseppe Bravi)&nbsp; &quot;Giuseppe Bravi&nbsp; hat dann erkannt, dass man dem &quot;cogito ergo sum&quot; von Descartes eine Wahrnehmung der Welt, welche Intuition, UnerklÃƒÂ¤rbares, Poesie der Worte, der Formen und der Farbe einbezieht, gegenÃƒÂ¼berstellen muss&quot;&nbsp; (Eric-Alain Kohler)&lt;br /&gt;
&lt;br /&gt;
Angaben zu Giuseppe Bravi &nbsp;&lt;br /&gt;
&lt;br /&gt;
&lt;table border=&quot;0&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot;&gt;
	&lt;tbody&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;1940 &lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Geboren in Mailand&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;seit 1949&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Lebt und arbeitet in Gardone Riviera, Brescia, Italien&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;seit 1966 &lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;RegelmÃƒÂ¤ssige persÃƒÂ¶nliche und Gruppenausstellungen in Italien, Ãƒâ€“sterreich, Japan und in der Schweiz&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
	&lt;/tbody&gt;
&lt;/table&gt;
&nbsp; &lt;br /&gt;
Einzelausstellungen (Auszug seit 1982) &nbsp;&lt;br /&gt;
&lt;br /&gt;
&lt;table border=&quot;0&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot;&gt;
	&lt;tbody&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;1983 &lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Galerie Farel, Aigle, CH&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;1984&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Galerie C. Planque, Lausanne, CH&lt;br /&gt;
			Galerie Contemporaine, GenÃƒÂ¨ve, CH&lt;br /&gt;
			Studio Toni De Rossi, Verona, I&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;1985 &lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Galerie Farel, Aigle, CH&lt;br /&gt;
			Istituto italiano di&nbsp; Cultura, Vienna A&lt;br /&gt;
			Galerie & Atelier, Feldmeilen, CH&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;1988&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Galerie Contemporaine, GenÃƒÂ¨ve, CH&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;1989&nbsp;&nbsp;&nbsp;&nbsp; &lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Studio Toni De Rossi, Verona, I&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;1990&nbsp;&nbsp;&nbsp;&nbsp; &lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Galerie Contemporaine, GenÃƒÂ¨ve, CH&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;1991&nbsp;&nbsp;&nbsp;&nbsp; &lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Galerie Dougoud, Corcelettes - Grandson, CH&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;1992&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Centro di Cultura Einaudi, Mantova, I&lt;br /&gt;
			Studio Toni De Rossi, Verona, I&lt;br /&gt;
			Galerie Farel, Aigle, CH&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;1996&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Studio Toni De Rossi, Verona, I&lt;br /&gt;
			Galleria Cronos, Concesio, I&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;1997&nbsp;&nbsp;&nbsp;&nbsp; &lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Galerie Alexandre Mottier, GenÃƒÂ¨ve, CH&lt;br /&gt;
			Collegiata S. Maria, Lauro, I&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;1999&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Galerie Alexandre Mottier, GenÃƒÂ¨ve, CH&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;2000&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Galerie Alexandre Mottier, GenÃƒÂ¨ve, CH&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;2001&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Sala d\'arte Novaglio, Bovezzo, I&lt;br /&gt;
			Libreria II Labirinto, Alghero, I&lt;br /&gt;
			Africa, XII Settimana d\'arte di Cecina, I&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;2002&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Segni 2000/2002, Villa Usignolo, Sarezzo, I&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td width=&quot;103&quot; valign=&quot;top&quot;&gt;2003&lt;br /&gt;
			&lt;br /&gt;
			&lt;/td&gt;
			&lt;td width=&quot;496&quot; valign=&quot;top&quot;&gt;Galerie Alexandre Mottier, GenÃƒÂ¨ve, CH&lt;br /&gt;
			art4art, Halle fÃƒÂ¼r Kunst, KÃƒÂ¼snacht, CH&lt;br /&gt;
			Galerie Farel, Aigle, CH&lt;br /&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
	&lt;/tbody&gt;
&lt;/table&gt;
","","4","../../media_art4art/art0018/_thumbs/th_africaoracolo_web.jpg","../../media_art4art/art0018/_thumbs/th_bravi-neu-0607-016.jpg","n","0","0","j","0");
INSERT INTO cms_pages_save VALUES ("56","40","navi_4","eve0008","Vernissage Dominique Belvedere - Stefan Jakob","vergangen","2008-11-20 00:00:00","2008-11-20 00:00:00","Vernissage Dominique Belvedere Ã¢â‚¬â€œ Stefan Jakob am 20.11.,18:30 Uhr. Die KÃƒÂ¼nstler werden anwesend sein, EinfÃƒÂ¼hrung durch die Galeristin",NULL,NULL,"2",NULL,NULL,"n","0","0","n","0");
INSERT INTO cms_pages_save VALUES ("57","43","navi_5","art0019","Jakob Stefan","objektkunst","0000-00-00 00:00:00","0000-00-00 00:00:00","Ã¢â‚¬Å¾Das letzte Wort hat das FeuerÃ¢â‚¬Å“. Diese Aussage hat in der keramischen Arbeit von Stefan Jakob eine zentrale Bedeutung. Seine keramischen Objekte sind.","Ã¢â‚¬Å¾Das letzte Wort hat das Feuer&quot;. Diese Aussage hat in der keramischen Arbeit von Stefan Jakob eine zentrale Bedeutung. Seine keramischen Objekte sind im wahrsten Sinne durch das Feuer gegangen. Die frÃƒÂ¼heren Raku-GefÃƒÂ¤sse mit ihren schwarzen, aufgerissenen und rauen und OberflÃƒÂ¤chen-Strukturen erinnern an verbrannte Erde oder verwitterten Fels.&lt;br /&gt;
&lt;br /&gt;
Die glasierten, weissen mit schwarzen Rissen durchzogenen FlÃƒÂ¤chen im Inneren der GefÃƒÂ¤sse, stehen im Gegensatz zur rauen Aussenseite.  Diese GegensÃƒÂ¤tze sind Teil der Spannung zwischen innen und aussen und betonen das GefÃƒÂ¤ss, dessen Gebrauchswert aber nicht im Vordergrund steht. Bei einigen Werken brechen die schwarzen Risse in der Glasur  vÃƒÂ¶llig  auf und bilden eine geschundene, weisse OberflÃƒÂ¤che, die stark an ausgetrocknete Salzseen erinnert.&lt;br /&gt;
&lt;br /&gt;
&lt;p align=&quot;left&quot;&gt;
Nach einem mehrmonatigen Auslandaufenthalt in diesem Jahr entstanden die neuen Arbeiten von Stefan Jakob. Das Arbeiten als Arist in Residence in einem Art Center in Canberra, fÃƒÂ¼hrte zu einer intensiven Auseinandersetzung mit der unvergleichlichen Natur Australiens. In den ausgetrockneten WÃƒÂ¼sten und Gebirgen fand er seine Strukturen wieder, mit denen er sich in seinen keramischen Werken schon seit lÃƒÂ¤ngerer Zeit auseinandersetzt. Besonders die Millionen Jahre alten und stark verwitterten Schichtungen der Felsformationen in den Canyons inspirierten ihn sehr. Auch die schwarzen StÃƒÂ¤mme des Grasbaumes, der jedes Jahr nur wenige Millimeter wÃƒÂ¤chst, fÃƒÂ¼hrten zu neuen Arbeiten. Bis zu 80 cm hohe schlanke GefÃƒÂ¤sse sind entstanden. Die Aussenseite ist aufgebaut aus hunderten, Millimeter dicken, flach gepressten WÃƒÂ¼lsten, die eine einzigartige OberflÃƒÂ¤chenstruktur ergeben. Dazu kontrastiert die weisse Glasur mit den schwarzen Rissen im Innenraum.&nbsp;
&lt;/p&gt;
&lt;p align=&quot;left&quot;&gt;
&lt;br /&gt;
Die meisten dieser Raku-Objekte haben eine strenge, gespannte Form. Andere beginnen sich zu drehen, sind verspielt und erinnern an TÃƒÂ¤nzer.
&lt;/p&gt;
","","4","../../media_art4art/art0019/_thumbs/th_objekte-geschichtet1.jpg","../../media_art4art/art0019/_thumbs/th_kugelobjekt.jpg","n","0","0","j","0");
INSERT INTO cms_pages_save VALUES ("58","40","navi_4","eve0009","Stefan Jakob: Raku-Brennen vor der Galerie","vergangen","2008-12-14 00:00:00","0000-00-00 00:00:00","WeihnachtsapÃƒÂ©ro: Raku-Brennen vor der Galerie am Sonntag, 14.12.2008, 11.00 Uhr ","Zwischen 11.00 - 15.00 h werden die Besucher in das Geheimnis des
Raku-Brennens eingefÃƒÂ¼hrt. Kinder wie auch Erwachsene kÃƒÂ¶nnen eine
Tonschale glasieren und in einem kleinen holzbefeuerten Raku-Ofen
brennen. Der KÃƒÂ¼nstler bietet Ihnen die MÃƒÂ¶glichkeit, ein ganz
persÃƒÂ¶nliches Weihnachtsgeschenk zu gestalten.&lt;br /&gt;
&lt;br /&gt;
&lt;p&gt;
Mit langen Zangen werden die glÃƒÂ¼henden Schalen nach nur einer halben
Stunde aus dem 1000Ã‚Â° C heissen Raku-Ofen genommen und dann zum
AuskÃƒÂ¼hlen ins SÃƒÂ¤gemehl eingegraben. Hier erhalten sie auch das fÃƒÂ¼r
Raku-Objekte charakteristische CraquelÃƒÂ©e Muster und die in allen Farben
schillernde GlasuroberflÃƒÂ¤che. 
&lt;/p&gt;
","","2","../../media_art4art/eve0009/_thumbs/th_paar.jpg","","n","0","0","j","0");
INSERT INTO cms_pages_save VALUES ("59","40","navi_4","eve0010","Dominique Belvedere - Stefan Jakob","vergangen","2009-01-31 00:00:00","0000-00-00 00:00:00","Finissage: Samstag, 31. Januar 2009, 10.00 Ã¢â‚¬â€œ 15.00 Uhr ",NULL,NULL,"5",NULL,NULL,"n","0","0","j","0");
INSERT INTO cms_pages_save VALUES ("60","34","navi_3","exp0011","Susi Kramer","vergangen","2009-03-05 00:00:00","2009-05-09 00:00:00","Susi Kramer, Vernissage am Donnerstag, 5. MÃƒÂ¤rz 2009, 18:30Ã¢â‚¬â€œ21:00 Uhr, Laudatio durch Nicole Scholl, Kunsthistorikerin","Susi Kramer, geboren 1947, lebt und arbeitet in Oberhof (AG) und Cannes (F).&lt;br /&gt;
&lt;br /&gt;
Die Ausstellung widerspiegelt ein spannendes Spektrum an vielseitigen Arbeiten der KÃƒÂ¼nstlerin.&lt;br /&gt;
&lt;br /&gt;
Seit 1993 arbeitet die Malerin auch mit Acrylglass. Die einzigartigen Technik, die bemalten Acrylglassplatten im Ofen zu verschmelzen, ist eine grosse Herausforderung. Die Farben erhalten dadurch eine prÃƒÂ¤gende Leuchtkraft und die Objekte eine faszinierende DreidimensionalitÃƒÂ¤t und Transparenz.&lt;br /&gt;
&lt;br /&gt;
Ihre erste Ausstellung fand 1975 in Teheran statt und seither folgten Ausstellungen in der Schweiz, in Europa und Asien. Die KÃƒÂ¼nstlerin hat verschiedene Kunst-am-Bau-Mandate gewonnen.
","","2","../../media_art4art/exp0011/_thumbs/th_aussenbild gerade 296_xl.jpg","../../media_art4art/exp0011/_thumbs/th_fri6193_xl.jpg","n","0","0","j","5");
INSERT INTO cms_pages_save VALUES ("61","42","navi_5","art0020","Nina K.","malerei","0000-00-00 00:00:00","0000-00-00 00:00:00","Nina K.Ã¢â‚¬â„¢s Bilder sind eine Reise ins Innere des menschlichen Seins. Jedes Bild erzÃƒÂ¤hlt nicht nur seine Geschichte, sondern ist Zeuge einer tiefen ...","Nina K.Ã¢â‚¬â„¢s Bilder sind eine Reise ins Innere des menschlichen Seins. Jedes Bild erzÃƒÂ¤hlt nicht nur seine Geschichte, sondern ist Zeuge einer tiefen Auseinandersetzung mit dem Selbst. Materialien mit hohem Symbolwert wie Pigmente, Erde, Lehm, zermalte Steine und vor allem Asche, appliziert Nina K. mit Farben, Schritt fÃƒÂ¼r Schritt, wie in einem Urritual. Wie Sedimente ÃƒÂ¼berlagern sich die Farbschichten. Archaische Symbole, werden ins Bild integriert. Symbole der menschlichen Vergangenheit.&lt;br /&gt;
&lt;br /&gt;
Nina K.Ã¢â‚¬â„¢s Bilder erforschen Tiefen. Sie versinnbildlichen&nbsp; geheimnisvolle, verborgene SchÃƒÂ¤tze, die man nicht nur mit offenen Augen entdecken kann. Sie sind das Resultat eines sensiblen, tiefen Abenteuers in der innigsten Freiheit des Selbst.&lt;br /&gt;
&lt;br /&gt;
MehrjÃƒÂ¤hrige Kunstausbildung, diverse Fortbildungen und Studien, sowie Ausstellungen im In- und Ausland gehÃƒÂ¶ren zu Ihrem Lebenslauf.
","","4","../../media_art4art/art0020/_thumbs/th_bild014_e.jpg","../../media_art4art/art0020/_thumbs/th_bild0047_e.jpg","n","0","0","j","0");
INSERT INTO cms_pages_save VALUES ("62","43","navi_5","art0021","Susi Kramer","objektkunst","0000-00-00 00:00:00","0000-00-00 00:00:00","Susi Kramer, Vernissage am Donnerstag, 5. MÃƒÂ¤rz 2009, 18:30Ã¢â‚¬â€œ21:00 Uhr, Laudatio durch Nicole Scholl, Kunsthistorikerin","Susi Kramer, geboren 1947, lebt und arbeitet in Oberhof (AG) und Cannes (F).&lt;br /&gt;
&lt;br /&gt;
Die Ausstellung widerspiegelt ein spannendes Spektrum an vielseitigen Arbeiten der KÃƒÂ¼nstlerin.&lt;br /&gt;
&lt;br /&gt;
Seit 1993 arbeitet die Malerin auch mit Acrylglass. Die einzigartigen
Technik, die bemalten Acrylglassplatten im Ofen zu verschmelzen, ist
eine grosse Herausforderung. Die Farben erhalten dadurch eine prÃƒÂ¤gende
Leuchtkraft und die Objekte eine faszinierende DreidimensionalitÃƒÂ¤t und
Transparenz.&lt;br /&gt;
&lt;br /&gt;
Ihre erste Ausstellung fand 1975 in Teheran statt und seither folgten
Ausstellungen in der Schweiz, in Europa und Asien. Die KÃƒÂ¼nstlerin hat
verschiedene Kunst-am-Bau-Mandate gewonnen.
","","4","../../media_art4art/art0021/_thumbs/th_aussenbild gerade 296_xl.jpg","","n","0","0","j","0");
INSERT INTO cms_pages_save VALUES ("63","40","navi_4","eve0011","Susi Kramer - Sonntagsapéro","vergangen","2009-04-05 00:00:00","0000-00-00 00:00:00","Einladung zum SonntagsapÃƒÂ©ro am 5. April 2009, 11:00 - 15:00 Uhr
","Einladung zum SonntagsapÃƒÂ©ro am 5. April 2009, 11:00 - 15:00 Uhr&lt;br /&gt;
&lt;br /&gt;
Liebe Kunstfreunde&lt;br /&gt;
Ich freue mich, auch im Namen von Susi Kramer, Sie zu einem gemÃƒÂ¼tlichen Rundgang durch diese erfrischende Ausstellung und zum ApÃƒÂ©ro einzuladen.&lt;br /&gt;
&nbsp;&lt;br /&gt;
Die KÃƒÂ¼nstlerin wird anwesend sein.
","","2","../../media_art4art/eve0011/_thumbs/th_jardin-magique-ii_2.jpg","../../media_art4art/eve0011/_thumbs/th_hauptbild_xl.jpg","n","0","0","j","0");
INSERT INTO cms_pages_save VALUES ("64","40","navi_4","eve0012","Susi Kramer","vergangen","2009-05-09 00:00:00","0000-00-00 00:00:00","Finissage: Samstag, 9. Mai 2009, 11.00 Ã¢â‚¬â€œ 15.00 Uhr
In Anwesenheit der KÃƒÂ¼nstlerin","Finissage: Samstag, 9. Mai 2009, 11.00 Ã¢â‚¬â€œ 15.00 Uhr&lt;br /&gt;
In Anwesenheit der KÃƒÂ¼nstlerin
",NULL,"2",NULL,NULL,"n","0","0","j","0");
INSERT INTO cms_pages_save VALUES ("65","34","navi_3","exp0012","Kamel Berkouk: Neue Bilder und Holzskulpturen","vergangen","2009-05-28 00:00:00","2009-07-11 00:00:00","Vernissage: Donnerstag, 28. Mai 2009, 18.30 - 21.00 Uhr","Neue Bilder und Holzskulpturen&lt;br /&gt;
&lt;br /&gt;
Vernissage: Donnerstag, 28. Mai 2009, 18.30 - 21. O0 Uhr&lt;br /&gt;
ApÃƒÂ©ro Sonntag, 14. Juni 2009, 11.00 - 15.00 Uhr&lt;br /&gt;
Finissage: Samstag, 11. Juli 2009, 11.00 - 15.00 Uhr
","","2","../../media_art4art/exp0012/_thumbs/th_kamelberkouk_ausstellungsbild1.jpg","../../media_art4art/exp0012/_thumbs/th_41090367_karte-4.jpg","n","16","0","j","4");
INSERT INTO cms_pages_save VALUES ("66","40","navi_4","eve0013","Kamel Berkouk - Sonntagsapéro","vergangen","2009-06-14 00:00:00","0000-00-00 00:00:00","ApÃƒÂ©ro: Sonntag, 14. Juni 11.00 - 15.00 Uhr","ApÃƒÂ©ro: Sonntag, 14. Juni 11.00 - 15.00 Uhr
",NULL,"2",NULL,NULL,"n","0","0","j","0");
INSERT INTO cms_pages_save VALUES ("67","40","navi_4","eve0014","Kamel Berkouk - Konzert","vergangen","2009-07-03 00:00:00","0000-00-00 00:00:00","Konzert: Freitag, 3. Juli, 20.00 Uhr Ã¢â‚¬Å“brasilianische MusikÃ¢â‚¬Â
         Edmauro de Oliveira, Gitarre/Stimme - JoÃƒÂ¢o dos Bastos, FlÃƒÂ¶te","F a r b e&nbsp; -&nbsp; K l a n g&nbsp; -&nbsp; R h y t m u s&nbsp; &lt;br /&gt;
&lt;br /&gt;
Brasilianische Musik gespielt vom Duo Brasilis: &lt;br /&gt;
Edmauro de Oliveira, Gitarre/Vocal&lt;br /&gt;
JoÃƒÂ£o dos Bastos, FlÃƒÂ¶te &lt;br /&gt;
&nbsp;&lt;br /&gt;
Freitag, den 3. Juli um 20.00 Uhr &lt;br /&gt;
&nbsp;&lt;br /&gt;
Musikalische Reise nach Brasilien, durch die klassische und traditionelle brasilianische Musik.&lt;br /&gt;
&lt;br /&gt;
Wir bitten um vorzeitige Reservation via e-Mail, da die PlÃƒÂ¤tze&lt;br /&gt;
limitiert sind! Konzerteintritt inkl. ApÃƒÂ©ro CHF 40&lt;br /&gt;
","","2","../../media_art4art/eve0014/_thumbs/th_a4a_brasil.jpg","","n","0","0","j","0");
INSERT INTO cms_pages_save VALUES ("68","41","navi_5","art0022","Krähenbühl Etienne","skulpturen","0000-00-00 00:00:00","0000-00-00 00:00:00","&quot;Mon expression cÃ¢â‚¬â„¢est la matiÃƒÂ¨re.&quot; Mit seinen Arbeiten schliesst KrÃƒÂ¤henbÃƒÂ¼hl an die Reihe der seit den 50ger und 60ger Jahren mit grossem Erfolg...","&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
Normal
0
false
false
false
EN-US
X-NONE
X-NONE
MicrosoftInternetExplorer4
&lt;/xml&gt;&lt;![endif]--&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
&lt;/xml&gt;&lt;![endif]--&gt;
&lt;!--[if gte mso 10]&gt;
&lt;style&gt;
/* Style Definitions */
table.MsoNormalTable
{mso-style-name:&quot;Normale Tabelle&quot;;
mso-tstyle-rowband-size:0;
mso-tstyle-colband-size:0;
mso-style-noshow:yes;
mso-style-priority:99;
mso-style-qformat:yes;
mso-style-parent:&quot;&quot;;
mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
mso-para-margin:0cm;
mso-para-margin-bottom:.0001pt;
mso-pagination:widow-orphan;
font-size:11.0pt;
font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;
mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:&quot;Times New Roman&quot;;
mso-fareast-theme-font:minor-fareast;
mso-hansi-font-family:Calibri;
mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:&quot;Times New Roman&quot;;
mso-bidi-theme-font:minor-bidi;}
&lt;/style&gt;
&lt;![endif]--&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
Normal
0
false
false
false
EN-US
X-NONE
X-NONE
MicrosoftInternetExplorer4
&lt;/xml&gt;&lt;![endif]--&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
&lt;/xml&gt;&lt;![endif]--&gt;
&lt;!--[if gte mso 10]&gt;
&lt;style&gt;
/* Style Definitions */
table.MsoNormalTable
{mso-style-name:&quot;Normale Tabelle&quot;;
mso-tstyle-rowband-size:0;
mso-tstyle-colband-size:0;
mso-style-noshow:yes;
mso-style-priority:99;
mso-style-qformat:yes;
mso-style-parent:&quot;&quot;;
mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
mso-para-margin-top:0cm;
mso-para-margin-right:0cm;
mso-para-margin-bottom:10.0pt;
mso-para-margin-left:0cm;
line-height:115%;
mso-pagination:widow-orphan;
font-size:11.0pt;
font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;
mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:&quot;Times New Roman&quot;;
mso-fareast-theme-font:minor-fareast;
mso-hansi-font-family:Calibri;
mso-hansi-theme-font:minor-latin;}
&lt;/style&gt;
&lt;![endif]--&gt;
Ã‚Â«&nbsp;Elle
est fondamentale pour moi, c\'est un ancrage, elle retient mes pensÃƒÂ©es, ma
recherche, par elle j\'ai rencontrÃƒÂ© l\'extÃƒÂ©rieur. Le mÃƒÂ©tal s\'est imposÃƒÂ© trÃƒÂ¨s tÃƒÂ´t,
et ses particularitÃƒÂ©s aussi. &lt;br /&gt;
&lt;br /&gt;
Depuis 1968,
je travaille fer, acier, inox, bronze, selon les pÃƒÂ©riodes et les thÃƒÂ©matiques
qui me prÃƒÂ©occupent. Ce sont des dÃƒÂ©fis dans la crÃƒÂ©ation et dans l\'expression par
leurs voix, il y a sans cesse lutte, ÃƒÂ©merveillement et jeu.&nbsp;Ã‚Â»&lt;br /&gt;
&lt;br /&gt;
Mit seinen
Arbeiten schliesst KrÃƒÂ¤henbÃƒÂ¼hl an die Reihe der seit den fÃƒÂ¼nfziger und sechziger
Jahren mit grossem Erfolg tÃƒÂ¤tigen Schweizer Eisenplastiker an: Bernhard
LuginbÃƒÂ¼hl, Jean Tinguely, Robert MÃƒÂ¼ller - doch hat er durch seine
Experimentierfreude und seine Materialkenntnis, die ihn auch mit Physikern
intensiv zusammenarbeiten lassen, seinen eigenen Weg und seine eigene
Ausdrucksweise gefunden.&lt;br /&gt;
","","4","../../media_art4art/art0022/_thumbs/th_dsc_0081.jpg","../../media_art4art/art0022/_thumbs/th_afrika-2009.jpg","n","0","0","j","0");
INSERT INTO cms_pages_save VALUES ("69","34","navi_3","exp0013","Etienne Krähenbühl - Charles Blockey","vergangen","2009-09-03 00:00:00","2009-10-24 00:00:00","JubilÃƒÂ¤umsausstellung: 7 Jahre art4art
Vernissage Donnerstag, 3. September, 18:30 Uhr","&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
Normal
0
false
false
false
EN-US
X-NONE
X-NONE
MicrosoftInternetExplorer4
&lt;/xml&gt;&lt;![endif]--&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
&lt;/xml&gt;&lt;![endif]--&gt;
&lt;!--[if gte mso 10]&gt;
&lt;style&gt;
/* Style Definitions */
table.MsoNormalTable
{mso-style-name:&quot;Normale Tabelle&quot;;
mso-tstyle-rowband-size:0;
mso-tstyle-colband-size:0;
mso-style-noshow:yes;
mso-style-priority:99;
mso-style-qformat:yes;
mso-style-parent:&quot;&quot;;
mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
mso-para-margin-top:0cm;
mso-para-margin-right:0cm;
mso-para-margin-bottom:10.0pt;
mso-para-margin-left:0cm;
line-height:115%;
mso-pagination:widow-orphan;
font-size:11.0pt;
font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;
mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:&quot;Times New Roman&quot;;
mso-fareast-theme-font:minor-fareast;
mso-hansi-font-family:Calibri;
mso-hansi-theme-font:minor-latin;}
&lt;/style&gt;
&lt;![endif]--&gt;
&lt;strong&gt;Charles Blockey&lt;/strong&gt;
- Paperworks on canvas&lt;br /&gt;
&lt;br /&gt;
Viele
Arbeiten Charles Blockeys erscheinen ÃƒÂ¤usserst sensibel. Sie atmen Ã‚Â« Luft,
Licht, Ton oder Etwas Ã‚Â» und muten wie eine Poesie an, welche den Betrachter in
unbestimmte und freilassende RÃƒÂ¤ume mitnimmt.&lt;br /&gt;
&lt;br /&gt;
Ã‚Â«
Das ÃƒÅ“berwinden der Zeitdimension und das Durchbrechen des physischen Raumes
motivieren meine Malerei; Farbe fÃƒÂ¼r sich kann die Zeitlosigkeit schaffen, die
Sprache der Formen und Linien neue RÃƒÂ¤ume bilden. Ã‚Â»&lt;br /&gt;
&lt;br /&gt;
&lt;br /&gt;
&lt;strong&gt;Etienne KrÃƒÂ¤henbÃƒÂ¼hl&lt;/strong&gt; - Sculptures mÃƒÂ©mobiles&lt;br /&gt;
&lt;br /&gt;
Mon expression c\'est la matiÃƒÂ¨re. &lt;br /&gt;
&lt;br /&gt;
Elle est
fondamentale pour moi, c\'est un ancrage, elle retient mes pensÃƒÂ©es, ma
recherche, par elle j\'ai rencontrÃƒÂ© l\'extÃƒÂ©rieur. Le mÃƒÂ©tal s\'est imposÃƒÂ© trÃƒÂ¨s tÃƒÂ´t,
et ses particularitÃƒÂ©s aussi. &lt;br /&gt;
&lt;br /&gt;
Depuis 1968, je travaille fer, acier, inox,
bronze, selon les pÃƒÂ©riodes et les thÃƒÂ©matiques qui me prÃƒÂ©occupent. Ce sont des
dÃƒÂ©fis dans la crÃƒÂ©ation et dans l\'expression par leurs voix, il y a sans cesse lutte,
ÃƒÂ©merveillement et jeu.&lt;br /&gt;
&lt;br /&gt;
","","2","../../media_art4art/exp0013/_thumbs/th_dsc_0081.jpg","../../media_art4art/exp0013/_thumbs/th_souffle-1aa-copym.jpg","n","68","29","j","3");
INSERT INTO cms_pages_save VALUES ("70","40","navi_4","eve0015","Sonntagsapéro 11:00-15:00 Uhr","vergangen","2009-09-20 00:00:00","2009-09-20 00:00:00","JubilÃƒÂ¤umsausstellung: Etienne KrÃƒÂ¤henbÃƒÂ¼hl & Charles Blockey","&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
Normal
0
false
false
false
EN-US
X-NONE
X-NONE
MicrosoftInternetExplorer4
&lt;/xml&gt;&lt;![endif]--&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
&lt;/xml&gt;&lt;![endif]--&gt;
&lt;!--[if gte mso 10]&gt;
&lt;style&gt;
/* Style Definitions */
table.MsoNormalTable
{mso-style-name:&quot;Normale Tabelle&quot;;
mso-tstyle-rowband-size:0;
mso-tstyle-colband-size:0;
mso-style-noshow:yes;
mso-style-priority:99;
mso-style-qformat:yes;
mso-style-parent:&quot;&quot;;
mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
mso-para-margin:0cm;
mso-para-margin-bottom:.0001pt;
mso-pagination:widow-orphan;
font-size:11.0pt;
font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;
mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:&quot;Times New Roman&quot;;
mso-fareast-theme-font:minor-fareast;
mso-hansi-font-family:Calibri;
mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:&quot;Times New Roman&quot;;
mso-bidi-theme-font:minor-bidi;}
&lt;/style&gt;
&lt;![endif]--&gt;
&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
Normal
0
false
false
false
EN-US
X-NONE
X-NONE
MicrosoftInternetExplorer4
&lt;/xml&gt;&lt;![endif]--&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
&lt;/xml&gt;&lt;![endif]--&gt;
&lt;!--[if gte mso 10]&gt;
&lt;style&gt;
/* Style Definitions */
table.MsoNormalTable
{mso-style-name:&quot;Normale Tabelle&quot;;
mso-tstyle-rowband-size:0;
mso-tstyle-colband-size:0;
mso-style-noshow:yes;
mso-style-priority:99;
mso-style-qformat:yes;
mso-style-parent:&quot;&quot;;
mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
mso-para-margin:0cm;
mso-para-margin-bottom:.0001pt;
mso-pagination:widow-orphan;
font-size:11.0pt;
font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;
mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:&quot;Times New Roman&quot;;
mso-fareast-theme-font:minor-fareast;
mso-hansi-font-family:Calibri;
mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:&quot;Times New Roman&quot;;
mso-bidi-theme-font:minor-bidi;}
&lt;/style&gt;
&lt;![endif]--&gt;
&lt;strong&gt;Einladung zum SonntagsapÃƒÂ©ro am 20. September
2009, 11:00 - 15:00 Uhr&lt;/strong&gt;&lt;br /&gt;
&lt;br /&gt;
Liebe Kunstfreunde&lt;br /&gt;
&lt;br /&gt;
Ich freue mich, auch im Namen der KÃƒÂ¼nstler, Sie zu
einem gemÃƒÂ¼tlichen 
Rundgang durch diese Ã¢â‚¬Å¾klangvolle&quot; Ausstellung
einzuladen.&lt;br /&gt;
&nbsp;
&lt;br /&gt;
Mit
herzlichen GrÃƒÂ¼ssen&lt;br /&gt;
&lt;br /&gt;
Camilla Jeannet&lt;br /&gt;
&lt;br /&gt;
","","2","../../media_art4art/eve0015/_thumbs/th_web-p1010035.jpg","../../media_art4art/eve0015/_thumbs/th_web-kraehen-dsc_6032b.jpg","n","0","0","j","0");
INSERT INTO cms_pages_save VALUES ("71","34","navi_3","exp0014","Accrochage und Sonderschau Tristan Rà","vergangen","2009-11-19 00:00:00","2010-01-30 00:00:00","Accrochage mit neuen Werken von Berkouk, Blockey, Bouys, Bravi, BrÃƒÂ¼hwiler, Buchwalder, Grobet, Nina K. und Kramer.
","&lt;!--[if !mso]&gt;
&lt;style&gt;
v\\:* {behavior:url(#default#VML);}
o\\:* {behavior:url(#default#VML);}
w\\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
&lt;/style&gt;
&lt;![endif]--&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
&lt;/xml&gt;&lt;![endif]--&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
Normal
0
false
21
false
false
false
DE
X-NONE
X-NONE
&lt;/xml&gt;&lt;![endif]--&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
&lt;/xml&gt;&lt;![endif]--&gt;
&lt;!--[if gte mso 10]&gt;
&lt;style&gt;
/* Style Definitions */
table.MsoNormalTable
{mso-style-name:&quot;Normale Tabelle&quot;;
mso-tstyle-rowband-size:0;
mso-tstyle-colband-size:0;
mso-style-noshow:yes;
mso-style-priority:99;
mso-style-qformat:yes;
mso-style-parent:&quot;&quot;;
mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
mso-para-margin-top:0cm;
mso-para-margin-right:0cm;
mso-para-margin-bottom:10.0pt;
mso-para-margin-left:0cm;
mso-pagination:widow-orphan;
font-size:11.0pt;
font-family:&quot;Cambria&quot;,&quot;serif&quot;;
mso-ascii-font-family:Cambria;
mso-ascii-theme-font:minor-latin;
mso-hansi-font-family:Cambria;
mso-hansi-theme-font:minor-latin;
mso-fareast-language:EN-US;}
&lt;/style&gt;
&lt;![endif]--&gt;
Liebe Kunstfreunde, liebe Freunde der art4art&lt;br /&gt;
&lt;br /&gt;
Ich wÃƒÂ¼nsche Ihnen frohe Weihnachten und die besten WÃƒÂ¼nsche fÃƒÂ¼r einen
schÃƒÂ¶nen Jahresausklang!&lt;br /&gt;
&lt;br /&gt;
Ich kann mit Freude und Genugtuung auf ein schÃƒÂ¶nes Ausstellungsjahr
zurÃƒÂ¼ckblicken und danke Ihnen fÃƒÂ¼r Ihren Besuch wÃƒÂ¤hrend dieses Jahres. Sie
haben dazu beigetragen, dass ich mit Begeisterung namhafte Ausstellungen,
Konzerte und Lesungen in der Galerie durchfÃƒÂ¼hren konnte. Mit Ihrer
UnterstÃƒÂ¼tzung ermuntern Sie mich, mich weiterhin fÃƒÂ¼r die Kunstszene zu
engagieren und Ihnen professionelle KÃƒÂ¼nstler vorzustellen. Auch freue ich mich,
Sie persÃƒÂ¶nlich zu Hause beraten und unterstÃƒÂ¼tzen zu dÃƒÂ¼rfen, damit Sie sich mit guter
Kunst umgeben kÃƒÂ¶nnen. &lt;br /&gt;
&lt;br /&gt;
Bei dieser Gelegenheit mache ich Sie gerne auf die Sonderschau Ã¢â‚¬Å¾Voyages
en Orient&quot; des bekannten franzÃƒÂ¶sischen KÃƒÂ¼nstlers Ã¢â‚¬Å¾Tristan RÃƒÂ &quot; wÃƒÂ¤hrend des
Monats Januar 2010 aufmerksam.&lt;br /&gt;
&lt;br /&gt;
Mit den allerbesten NeujahrswÃƒÂ¼nschen &lt;br /&gt;
Herzlich, Camilla Jeannet&lt;br /&gt;
&lt;br /&gt;
Agenda:&lt;br /&gt;
&lt;br /&gt;
Accrochage mit neuen Werken von Berkouk, Blockey, Bouys, Bravi,
BrÃƒÂ¼hwiler, Buchwalder, Grobet, Nina K. und Kramer.&lt;br /&gt;
&lt;br /&gt;
09.01.2010, 11:00-15:00 ErÃƒÂ¶ffnung der Sonderschau Tristan RÃƒÂ  &lt;br /&gt;
","","2","../../media_art4art/exp0014/_thumbs/th_2010-01-l1020528.jpg","../../media_art4art/exp0014/_thumbs/th_2008-mvc-096f.jpg","n","0","0","j","2");
INSERT INTO cms_pages_save VALUES ("72","40","navi_4","eve0016","Lesung Susanna Merkle - Reise in den Orient","vergangen","2010-01-23 00:00:00","0000-00-00 00:00:00","Einladung zu einer poetischen Orient-Reise - 
Lesung der Lyrikerin Susanne Merkle zur Sonderschau von Tristan RÃƒÂ  mit anschliessendem ApÃƒÂ©ro, 17:00 Uhr ","&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
Normal
0
21
false
false
false
DE
X-NONE
X-NONE
&lt;/xml&gt;&lt;![endif]--&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
&lt;/xml&gt;&lt;![endif]--&gt;
&lt;!--[if gte mso 10]&gt;
&lt;style&gt;
/* Style Definitions */
table.MsoNormalTable
{mso-style-name:&quot;Normale Tabelle&quot;;
mso-tstyle-rowband-size:0;
mso-tstyle-colband-size:0;
mso-style-noshow:yes;
mso-style-priority:99;
mso-style-qformat:yes;
mso-style-parent:&quot;&quot;;
mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
mso-para-margin:0cm;
mso-para-margin-bottom:.0001pt;
mso-pagination:widow-orphan;
font-size:11.0pt;
font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;
mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:&quot;Times New Roman&quot;;
mso-fareast-theme-font:minor-fareast;
mso-hansi-font-family:Calibri;
mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:&quot;Times New Roman&quot;;
mso-bidi-theme-font:minor-bidi;}
&lt;/style&gt;
&lt;![endif]--&gt;
23.01.2010, 17:00-18:00 Uhr&lt;br /&gt;
EinfÃƒÂ¼hrung durch die Pariser
Kunsthistorikerin FranÃƒÂ§oise Albrecht. Die Lesung ist auf FranzÃƒÂ¶sisch mit
deutschen ErlÃƒÂ¤uterungen.&lt;br /&gt;
&lt;br /&gt;
Ich freue mich sehr, Sie zu diesem
Anlass und zum anschliessenden ApÃƒÂ©ro zu begrÃƒÂ¼ssen!&lt;br /&gt;
&lt;br /&gt;
&lt;strong&gt;Eintritt CHF 20.- pro Person. Anmeldung
erwÃƒÂ¼nscht.&lt;/strong&gt;&lt;br /&gt;
&lt;br /&gt;
Mit herzlichen GrÃƒÂ¼ssen&lt;br /&gt;
Camilla Jeannet&lt;br /&gt;
&lt;br /&gt;
","","2","../../media_art4art/eve0016/_thumbs/th_merkle.jpg","../../media_art4art/eve0016/_thumbs/th_2010-01-l1020528.jpg","n","0","0","j","0");
INSERT INTO cms_pages_save VALUES ("74","34","navi_3","exp0015","Hanspeter Kamm - Flugjahr 2010","vergangen","2010-03-13 00:00:00","2010-05-29 00:00:00","Vernissage Samstag, 13. MÃƒÂ¤rz 2010, 11:00-17:00 Uhr - 
WÃƒÂ¤hrend der FrÃƒÂ¼hlingsferien vom 26.4.-7.5. geschlossen","13.03.2010.-29.05.2010&lt;br /&gt;
Vernissage Samstag, 13. MÃƒÂ¤rz 2010, 11:00-17:00 Uhr&lt;br /&gt;
&lt;br /&gt;
Als einen &quot;begeisterten Mythenbauer und -zerstÃƒÂ¶rer&quot; bezeichnet sich Hanspeter Kamm und das &quot;gut&quot; gibt es fÃƒÂ¼r ihn nicht, denn massgebend ist fÃƒÂ¼r ihn die Ernsthaftigkeit und die Verbindlichkeit. Er webt verklÃƒÂ¤rt an mÃƒÂ¤rchenhaften Geschichten und behauptet, er erforsche den Raum.&lt;br /&gt;
&lt;br /&gt;
Er arbeitet aus dem Bauch und studiert den &quot;Umsturz der Werte&quot;. Immer geht es ihm um QualitÃƒÂ¤t, wenn er wochenlang stur und diszipliniert DrÃƒÂ¤hte verbiegt, wÃƒÂ¼rgt und schweisst, und in allen denkbaren Linienkombinationen den Luftraum erforscht.&lt;br /&gt;
","","2","../../media_art4art/exp0015/_thumbs/th_2010-03-11-p1010523.jpg","../../media_art4art/exp0015/_thumbs/th_2010-03-kamm-p1010511.jpg","n","52","0","j","1");
INSERT INTO cms_pages_save VALUES ("75","40","navi_4","eve0017","Hanspeter Kamm - Neue Objekte","vergangen","2010-04-11 00:00:00","2010-04-11 00:00:00","ApÃƒÂ©ro in Anwesenheit des KÃƒÂ¼nstlers, 11:00-15:00 Uhr",NULL,NULL,"2",NULL,NULL,"n","52","0","j","0");
INSERT INTO cms_pages_save VALUES ("76","40","navi_4","eve0018","Hanspeter Kamm - Finissage","vergangen","2010-05-29 00:00:00","2010-05-29 00:00:00","Finissage in Anwesenheit von Hanspeter Kamm am Samstag, den 29. Mai 2010 von 11:00 - 15:00 Uhr. Video ÃƒÂ¼ber das Schaffen des KÃƒÂ¼nstlers.","Finissage der Ausstellung in Anwesenheit von Hanspeter Kamm am Samstag, den 29. Mai von 11:00 - 15:00 Uhr. Video ÃƒÂ¼ber das Schaffen des KÃƒÂ¼nstlers.
","","2","../../media_art4art/eve0018/_thumbs/th_kamm-himself.jpg","../../media_art4art/eve0018/_thumbs/th_p1010912web.jpg","n","52","0","j","0");
INSERT INTO cms_pages_save VALUES ("77","40","navi_3","exp0016","von Ballmoos Kurt - Landschaften & Etienne Krähenbühl - Scul","vergangen","2010-11-18 00:00:00","2011-01-29 00:00:00","Vernissage in Anwesenheit der Künstler: Donnerstag 18. November 18:30 - 21:00 Uhr ","<p><strong>Vernissage, Donnerstag 18. November, 18:30-21:00 Uhr</strong><br />
<strong><br />
Advents-Apéro, Samstag, 11. Dezember, 11:00-15:00 Uhr</strong><br />
<strong><br />
Neujahrs-Jazzkonzert, Samstag, 15. Januar 2011,
18:00-19:00 Uhr</strong><br />
Alex Wilson, Piano &amp; Rodrigo Aravena, Bass<br />
<strong><br />
Finissage, Samstag, 29. Januar 2011, 11:00-15:00 Uhr</strong><br />
<br />
<br />
<strong>Kurt von Ballmoos </strong>wurde 1934 in der
Schweiz geboren. Nach einer Lehre als
Fotolithograf, Weiterbildung in Bern in den Bereichen Malerei, Farbe und Lithografie.
Seit 1956 arbeitet er im eigenen Atelier und gehört seid 1963 der
schweizerischen Vereinigung der Maler, Bildhauer und Architekten an. Er ist
Mitbegründer der Gruppe \"impact\" Lausanne. Sein Werk umfasst Wandmalerei,
Bühnenbilder, sowie Illustrationen und humoristische Zeichnungen.<br />
Seit 1959
stellt er regelmässig in der Schweiz, Deutschland, Kanada und den USA
aus. Bilder von Kurt von Ballmoos sind in den Musées des Beaux-Arts in
Lausanne, Vevey und Pully zu sehen.<br />
<br />
<strong>Etienne Krähenbühl </strong>hat eine höchst
eigenständige skulpturale Sprache entwickelt.
Er setzt den Akzent einerseits auf den fragilen und flexiblen Charakter der Materie
und anderseits auf die Bewegung, den Klang und auf die Solidarität
in der Interaktion unter den Elementen. Er verwendet neben \"hightech\"- Legierungen
(Titan, Nickel) allerlei Materialien, wie verrostete Metalle, Gesammeltes, Holz und
Papier...</p>","","2","../../media_art4art/exp0016/_thumbs/th_landschaft-01.jpg","../../media_art4art/exp0016/_thumbs/th_etienne-k.jpg","n","80","68","j","1");
INSERT INTO cms_pages_save VALUES ("78","34","navi_3","exp0017","Accrochage","vergangen","2010-06-17 00:00:00","2010-10-09 00:00:00","Neue Bilder und Objekte der KÃƒÂ¼nstler der Galerie.
Neu: Catherine Marchadour, Frankreich. 
Galerie wÃƒÂ¤hrend der Sommerferien geschlossen.","Neue Bilder der KÃƒÂ¼nstler der Galerie: Berkouk, Blockey, Buchwalder, Bravi, BrÃƒÂ¼hwiler, Grobet, Kamm, Kramer, KrÃƒÂ¤henbÃƒÂ¼hl, Nina.K, Tristan RÃƒÂ &lt;br /&gt;
Neu: Catherine Marchadour, Frankreich&lt;br /&gt;
&lt;br /&gt;
Galerie wÃƒÂ¤hrend der Sommerferien geschlossen.&lt;br /&gt;
","","2","../../media_art4art/exp0017/_thumbs/th_cm 047.jpg","../../media_art4art/exp0017/_thumbs/th_dscn3615w.jpg","n","0","0","j","14");
INSERT INTO cms_pages_save VALUES ("79","40","navi_4","eve0019","Welcome-Back-Apéro","vergangen","2010-08-28 00:00:00","2010-08-28 00:00:00","Bilder, Acrylobjekte, Drahtobjekte, Holzskulpturen, Mobiles von 
Berkouk, Blockey, Buchwalder, Bravi, BrÃƒÂ¼hwiler, Grobet, Kamm, KrÃƒÂ¤henbÃƒÂ¼hl, Marchadour","&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
Normal
0
21
false
false
false
DE
X-NONE
X-NONE
MicrosoftInternetExplorer4
&lt;/xml&gt;&lt;![endif]--&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
&lt;/xml&gt;&lt;![endif]--&gt;
&lt;!--[if gte mso 10]&gt;
&lt;style&gt;
/* Style Definitions */
table.MsoNormalTable
{mso-style-name:&quot;Normale Tabelle&quot;;
mso-tstyle-rowband-size:0;
mso-tstyle-colband-size:0;
mso-style-noshow:yes;
mso-style-priority:99;
mso-style-qformat:yes;
mso-style-parent:&quot;&quot;;
mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
mso-para-margin:0cm;
mso-para-margin-bottom:.0001pt;
mso-pagination:widow-orphan;
font-size:11.0pt;
font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;
mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:&quot;Times New Roman&quot;;
mso-fareast-theme-font:minor-fareast;
mso-hansi-font-family:Calibri;
mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:&quot;Times New Roman&quot;;
mso-bidi-theme-font:minor-bidi;}
&lt;/style&gt;
&lt;![endif]--&gt;&lt;strong&gt;Samstag, 28. August 2010 11.00 -
15.00 Uhr&lt;br /&gt;
&lt;/strong&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
Normal
0
21
false
false
false
DE
X-NONE
X-NONE
MicrosoftInternetExplorer4
&lt;/xml&gt;&lt;![endif]--&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;
&lt;/xml&gt;&lt;![endif]--&gt;
&lt;!--[if gte mso 10]&gt;
&lt;style&gt;
/* Style Definitions */
table.MsoNormalTable
{mso-style-name:&quot;Normale Tabelle&quot;;
mso-tstyle-rowband-size:0;
mso-tstyle-colband-size:0;
mso-style-noshow:yes;
mso-style-priority:99;
mso-style-qformat:yes;
mso-style-parent:&quot;&quot;;
mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
mso-para-margin:0cm;
mso-para-margin-bottom:.0001pt;
mso-pagination:widow-orphan;
font-size:11.0pt;
font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;
mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:&quot;Times New Roman&quot;;
mso-fareast-theme-font:minor-fareast;
mso-hansi-font-family:Calibri;
mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:&quot;Times New Roman&quot;;
mso-bidi-theme-font:minor-bidi;}
&lt;/style&gt;
&lt;![endif]--&gt;&lt;strong&gt;&lt;br /&gt;
Bilder,
Acrylglasobjekte, Drahtobjekte, Holzskulpturen, mobile Eisenskulpturen&lt;br /&gt;
&lt;br /&gt;
&lt;/strong&gt;Berkouk, Blockey,
Bouys, Buchwalder, Bravi, BrÃƒÂ¼hwiler, Grobet, Kamm, KrÃƒÂ¤henbÃƒÂ¼hl, Nina K. , Kramer, Tristan RÃƒÂ  &lt;br /&gt;
&lt;br /&gt;
&lt;strong&gt;Neu: Catherine
Marchadour, Frankreich &lt;/strong&gt;&lt;br /&gt;
&lt;br /&gt;
&lt;strong&gt;Finissage: 30. Oktober
2010 &lt;/strong&gt;&lt;br /&gt;
&lt;br /&gt;
Ãƒâ€žhnlich einer
Installation, wird sich bis Ende Oktober 2010 die Ausstellung in einem Rhythmus
von ca. 3 Wochen laufend erneuern. &lt;br /&gt;
&lt;br /&gt;
&lt;br /&gt;
&lt;strong&gt;
&lt;br /&gt;
&lt;/strong&gt;
","","2","../../media_art4art/eve0019/_thumbs/th_cm 019.jpg","../../media_art4art/eve0019/_thumbs/th_cm-058-(9)web.jpg","n","0","0","j","0");
INSERT INTO cms_pages_save VALUES ("80","42","navi_5","art0023","von Ballmoos Kurt","malerei","0000-00-00 00:00:00","0000-00-00 00:00:00","Kurt von Ballmoos wurde 1934 in der Schweiz geboren. Nach einer Lehre
als Fotolithograf ...
","&lt;strong&gt;Kurt von Ballmoos &lt;/strong&gt;wurde 1934 in der
Schweiz geboren. Nach einer Lehre als
Fotolithograf, Weiterbildung in Bern in den Bereichen Malerei, Farbe und Lithografie.
Seit 1956 arbeitet er im eigenen Atelier und gehÃƒÂ¶rt seit 1963 der
schweizerischen Vereinigung der Maler, Bildhauer und Architekten an.&lt;br /&gt;
&lt;br /&gt;
Er ist
MitbegrÃƒÂ¼nder der Gruppe Ã‚Â« impact Ã‚Â» Lausanne. Sein Werk umfasst Wandmalerei,
BÃƒÂ¼hnenbilder, sowie Illustrationen und humoristische Zeichnungen.&lt;br /&gt;
&lt;br /&gt;
Seit 1959
stellt er regelmÃƒÂ¤ssig in der Schweiz, Deutschland, Kanada und den USA
aus. Bilder von Kurt von Ballmoos sind in den MusÃƒÂ©es des Beaux-Arts in
Lausanne, Vevey und Pully zu sehen.&lt;br /&gt;
&lt;br /&gt;
","","4","../../media_art4art/art0023/_thumbs/th_landschaft-01.jpg","../../media_art4art/art0023/_thumbs/th_dsc_3223bw.jpg","n","0","0","j","0");
INSERT INTO cms_pages_save VALUES ("81","34","navi_4","eve0020","15.01.2011: Neujahrs-Jazzkonzert mit Alex Wilson und Rodrigo","vergangen","2011-01-15 00:00:00","2011-01-15 00:00:00","Alex Wilson, UK, Piano & Rodrigo Aravena, Chile, Bass - 
Samstag, 15. Januar 18.00-19:00 Uhr","<p><strong><br />
Alex Wilson&nbsp;: </strong><a href=\"http://www.alexwilson.ch/art4art\" target=\"_blank\"><strong>www.alexwilson.ch/art4art</strong></a><br />
<strong>Rodrigo Aravena: <a href=\"http://www.themuscats.com\" target=\"_blank\">www.themuscats.com</a><br />
</strong><br />
<strong>Türöffnung und Kasse ab 17:00 Uhr<br />
Konzert von 18:00-19:30 Uhr, inkl. Pause<br />
<br />
Eintritt: CHF 35, inkl. Apéro</strong><br />
<br />
<strong>Platzzahl beschränkt, Reservationen nach Eingang per Mail oder Telefon</strong><br />
<br />
Das Konzert findet im Rahmen der Ausstellung von Kurt von Ballmoos und Etienne Krähenbühl statt.</p>","","2","../../media_art4art/eve0020/_thumbs/th_alex-wilson.jpg","../../media_art4art/eve0020/_thumbs/th_rodrigo-aravena.jpg","n","0","0","j","15");
INSERT INTO cms_pages_save VALUES ("82","34","navi_4","eve0021","11.12.2010 Adventsapéro 11:00-15:00 Uhr","vergangen","2010-12-11 00:00:00","2010-12-11 00:00:00","Landschaften von Kurt von Ballmoos
Eisenplastiken und Objekte von Etienne KrÃƒÂ¤henbÃƒÂ¼hl","<!--[if !mso]>
<mce:style><! 
v\\:* {behavior:url(#default#VML);}
o\\:* {behavior:url(#default#VML);}
w\\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
-->
<!--[endif] --><!--[if gte mso 9]><xml>
Normal
0
false
21
false
false
false
DE-CH
X-NONE
X-NONE
</xml><![endif]--><!--[if gte mso 9]><xml>
</xml><![endif]--><!--[if gte mso 10]>
<mce:style><! 
/* Style Definitions */
table.MsoNormalTable
{mso-style-name:\"Normale Tabelle\";
mso-tstyle-rowband-size:0;
mso-tstyle-colband-size:0;
mso-style-noshow:yes;
mso-style-priority:99;
mso-style-qformat:yes;
mso-style-parent:\"\";
mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
mso-para-margin-top:0cm;
mso-para-margin-right:0cm;
mso-para-margin-bottom:10.0pt;
mso-para-margin-left:0cm;
line-height:115%;
mso-pagination:widow-orphan;
font-size:11.0pt;
font-family:\"Calibri\",\"sans-serif\";
mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;
mso-fareast-font-family:\"Times New Roman\";
mso-fareast-theme-font:minor-fareast;
mso-hansi-font-family:Calibri;
mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:\"Times New Roman\";
mso-bidi-theme-font:minor-bidi;}
-->
<!--[endif] -->
<p>
<strong><br />
Landschaften von Kurt von Ballmoos</strong><br />
<br />
<strong>Eisenplastiken
und Objekte von Etienne Krähenbühl</strong><br />
<br />
<strong>Herzlich
Willkommen</strong> <strong>zum Adventsapéro und zum Besuch dieser zwei
kontrastreichen Kunstwelten!</strong><strong><br />
</strong>
</p>","","2","../../media_art4art/eve0021/_thumbs/th_temps-suspendu-miroir-2008-.jpg","../../media_art4art/eve0021/_thumbs/th_dsc_3223bw.jpg","n","0","0","j","16");



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
INSERT INTO cms_redirect VALUES ("1","1","0","0","home");
INSERT INTO cms_redirect VALUES ("2","2","0","0","uumlber_uns");
INSERT INTO cms_redirect VALUES ("3","3","0","0","events");
INSERT INTO cms_redirect VALUES ("4","3","32","0","laufend");
INSERT INTO cms_redirect VALUES ("5","3","33","0","kommend");
INSERT INTO cms_redirect VALUES ("6","3","34","0","vergangen");
INSERT INTO cms_redirect VALUES ("7","11","0","0","kuumlnstler");
INSERT INTO cms_redirect VALUES ("8","11","42","0","malerei");
INSERT INTO cms_redirect VALUES ("9","11","43","0","objektkunst");
INSERT INTO cms_redirect VALUES ("10","11","41","0","skulpturen");
INSERT INTO cms_redirect VALUES ("11","4","0","0","expos");
INSERT INTO cms_redirect VALUES ("12","4","36","0","laufend");
INSERT INTO cms_redirect VALUES ("13","4","39","0","kommend");
INSERT INTO cms_redirect VALUES ("14","4","40","0","vergangen");
INSERT INTO cms_redirect VALUES ("15","5","0","0","dienste");
INSERT INTO cms_redirect VALUES ("16","6","0","0","medien");
INSERT INTO cms_redirect VALUES ("17","28","0","0","links");
INSERT INTO cms_redirect VALUES ("18","29","0","0","kontakt__zeiten");
INSERT INTO cms_redirect VALUES ("19","20","0","0","impressum");
INSERT INTO cms_redirect VALUES ("20","38","0","0","news");
INSERT INTO cms_redirect VALUES ("21","35","0","0","la_boutique");
INSERT INTO cms_redirect VALUES ("22","35","0","36","keramik");
INSERT INTO cms_redirect VALUES ("23","35","0","37","schmuck");
INSERT INTO cms_redirect VALUES ("24","35","0","38","accessoires");
INSERT INTO cms_redirect VALUES ("25","35","0","39","kleine_bilder");
INSERT INTO cms_redirect VALUES ("26","35","0","40","kunstkarten");
INSERT INTO cms_redirect VALUES ("27","35","0","41","objekte");
INSERT INTO cms_redirect VALUES ("28","35","0","93","neue_boutiqueseite");
INSERT INTO cms_redirect VALUES ("29","3","34","7","kamel_berkouk_loisea");
INSERT INTO cms_redirect VALUES ("30","3","34","8","giuseppe_bravi_afrik");
INSERT INTO cms_redirect VALUES ("31","3","34","9","elisabeth_beurret_ar");
INSERT INTO cms_redirect VALUES ("32","3","34","23","hanspeter_kamm");
INSERT INTO cms_redirect VALUES ("33","3","34","25","tristan_ra_images_do");
INSERT INTO cms_redirect VALUES ("34","3","34","32","andre_bregnard_eisen");
INSERT INTO cms_redirect VALUES ("35","3","34","33","pier_daniele_la_rocc");
INSERT INTO cms_redirect VALUES ("36","3","34","45","jeanick_bouys_quotsp");
INSERT INTO cms_redirect VALUES ("37","3","34","50","dominique_belvedere_");
INSERT INTO cms_redirect VALUES ("38","3","34","60","susi_kramer");
INSERT INTO cms_redirect VALUES ("39","3","34","65","kamel_berkouk_neue_b");
INSERT INTO cms_redirect VALUES ("40","4","40","69","etienne_kraehenbuehl");
INSERT INTO cms_redirect VALUES ("41","3","34","71","accrochage_und_sonde");
INSERT INTO cms_redirect VALUES ("42","3","34","74","hanspeter_kamm__flug");
INSERT INTO cms_redirect VALUES ("43","3","34","77","von_ballmoos_kurt__l");
INSERT INTO cms_redirect VALUES ("44","3","34","78","accrochage");
INSERT INTO cms_redirect VALUES ("45","3","34","83","kamel_berkouk__bilde");
INSERT INTO cms_redirect VALUES ("46","3","34","85","sommeraccrochage");
INSERT INTO cms_redirect VALUES ("47","3","34","86","charles_blockey");
INSERT INTO cms_redirect VALUES ("48","4","40","91","daniel_airam");
INSERT INTO cms_redirect VALUES ("95","3","33","14","lesung_reise_durch_z");
INSERT INTO cms_redirect VALUES ("50","4","40","35","farbtoene__klangfarb");
INSERT INTO cms_redirect VALUES ("51","4","40","47","jeanick_bouys_quotsp");
INSERT INTO cms_redirect VALUES ("52","4","40","48","susanna_merkle_lesun");
INSERT INTO cms_redirect VALUES ("53","4","40","49","jeanick_bouys");
INSERT INTO cms_redirect VALUES ("54","4","40","58","stefan_jakob_rakubre");
INSERT INTO cms_redirect VALUES ("55","4","40","59","dominique_belvedere_");
INSERT INTO cms_redirect VALUES ("56","4","40","63","susi_kramer__sonntag");
INSERT INTO cms_redirect VALUES ("57","4","40","64","susi_kramer");
INSERT INTO cms_redirect VALUES ("58","4","40","66","kamel_berkouk__sonnt");
INSERT INTO cms_redirect VALUES ("59","4","40","67","kamel_berkouk__konze");
INSERT INTO cms_redirect VALUES ("96","3","33","70","sonntagsapero_110015");
INSERT INTO cms_redirect VALUES ("61","3","32","72","lesung_susanna_merkl");
INSERT INTO cms_redirect VALUES ("62","3","34","75","hanspeter_kamm__neue");
INSERT INTO cms_redirect VALUES ("63","3","34","76","hanspeter_kamm__fini");
INSERT INTO cms_redirect VALUES ("64","3","34","79","welcomebackapero");
INSERT INTO cms_redirect VALUES ("65","3","34","81","15012011_neujahrsjaz");
INSERT INTO cms_redirect VALUES ("66","4","40","82","11122010_adventsaper");
INSERT INTO cms_redirect VALUES ("67","4","40","84","accorchage");
INSERT INTO cms_redirect VALUES ("68","4","40","87","sommeraccrochage_fin");
INSERT INTO cms_redirect VALUES ("69","4","40","88","accrochage");
INSERT INTO cms_redirect VALUES ("70","4","40","89","vernissage_daniel_ai");
INSERT INTO cms_redirect VALUES ("71","3","32","92","neues_event");
INSERT INTO cms_redirect VALUES ("72","11","42","16","berkouk_kamel");
INSERT INTO cms_redirect VALUES ("73","11","42","22","beurret_elisabeth");
INSERT INTO cms_redirect VALUES ("74","11","42","26","belvedere_dominique");
INSERT INTO cms_redirect VALUES ("75","11","42","27","tristan_ra");
INSERT INTO cms_redirect VALUES ("76","11","42","28","bauer_barbara");
INSERT INTO cms_redirect VALUES ("77","11","42","29","blockey_charles");
INSERT INTO cms_redirect VALUES ("78","11","41","30","bregnard_andre");
INSERT INTO cms_redirect VALUES ("79","11","41","31","bruehwiler_herbert");
INSERT INTO cms_redirect VALUES ("80","11","42","34","la_rocca_pier_daniel");
INSERT INTO cms_redirect VALUES ("81","11","42","46","bouys_jeanick");
INSERT INTO cms_redirect VALUES ("82","11","42","51","buchwalder_fredy");
INSERT INTO cms_redirect VALUES ("83","11","43","52","kamm_hanspeter");
INSERT INTO cms_redirect VALUES ("84","11","43","53","munuera_lucia");
INSERT INTO cms_redirect VALUES ("85","11","43","54","grobet_daniel");
INSERT INTO cms_redirect VALUES ("86","11","42","55","bravi_giuseppe");
INSERT INTO cms_redirect VALUES ("87","11","43","57","jakob_stefan");
INSERT INTO cms_redirect VALUES ("88","11","42","61","nina_k");
INSERT INTO cms_redirect VALUES ("89","11","43","62","susi_kramer");
INSERT INTO cms_redirect VALUES ("90","11","41","68","kraehenbuehl_etienne");
INSERT INTO cms_redirect VALUES ("91","11","42","80","von_ballmoos_kurt");
INSERT INTO cms_redirect VALUES ("92","11","42","90","airam_daniel");



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
    inhalt2 text NOT NULL,
    bild1 varchar(125),
    aktiv enum('j','n') DEFAULT "j" NOT NULL,
    galerie enum('n','a','b') DEFAULT "n",
   PRIMARY KEY (seiten_id)
);

#
# Daten von Tabelle 'cms_seiten'
#
INSERT INTO cms_seiten VALUES ("1","1","1","home","halle für kunst","2","3","<h2>Dies ist ein Text</h2>
<p>Dies ist ein Text </p>
<h3><br />Dies ist ein Text</h3>
<p>Dies ist ein Text Dies ist ein Text Dies ist ein Text Dies ist ein Text Dies ist ein TextDies ist ein TextDies ist ein TextDies ist ein TextDies ist ein TextDies ist ein Text<br />Dies ist ein TextDies ist ein Text </p>
<p><br />hallo das ist ein paragraph </p>
<p><br />das ist ein zweiter paragraph </p>","","../../media_art4art/navi_1/_thumbs/th_paintings_0241w.jpg","j","a");
INSERT INTO cms_seiten VALUES ("2","3","1","events","","6","2","<h3>Anschriften und Informationen zu unseren Top Five Kunden: </h3>
<ul>
<li>Kunde 1</li>
<li>Kunde 2</li>
<li>Kunde 3</li>
<li>Kunde 4</li>
<li>Kunde 5</li>
</ul>","","../gifs/blank.gif","n","n");
INSERT INTO cms_seiten VALUES ("3","5","1","dienste","","4","0","<h2>Kunstberatung </h2>
<p>
Camilla Jeannet berät Private und Firmen in Sachen Kunst, sowohl bei Einzelanschaffungen, als auch im Rahmen von Gesamtkonzepten.
</p>
<p>&nbsp;</p>
<h2>Künstlervertretung und -vermittlung</h2>
<p>
art4art vertritt die
Künstler der Galerie auch ausserhalb der jeweils aktuellen Ausstellung. Wir suchen
für Sie Bilder nach Ihrem Badarf.
</p>
<p>&nbsp;</p>
<h2>Auftragsmalerei</h2>
<p>
Seit immer haben Künstler im Auftrag Original-Werke kreiert. Gefällt Ihnen
das Schaffen eines Künstlers ganz besonders, besprechen Sie es mit uns.<br />
<br /></p>
<h2>Events</h2>
<p>
Eine Galerie strahlt ein inspirierendes Ambiente aus, das sich ausgezeichnet
für öffentliche und private Anlässe eignet. So hat art4art in den letzten
Jahren verschiedene Konzerte, Lesungen und private Einladungen durchgeführt.<br />
<br /></p>
<h2>Finanzierung</h2>
<p>
Zur Finanzierung Ihrer Kunstanschaffungen können flexible Lösungen gefunden
werden.</p>","","../gifs/blank.gif","n","n");
INSERT INTO cms_seiten VALUES ("9","6","1","Medienmitteilungen","","4","0","<h2>Unerschöpfliche Fantasiewelt (Kamel Berkouk)</h2>
<p>10.03.11 (Zürichsee-Zeitung rechtes Ufer)<br />
<a href=\"/art4art/media/navi_7/zsz-berkouk_10%2003_11.pdf\" target=\"_blank\">&gt;download pdf</a><br />
<br /></p>
<h2>Kontrastierende Kunstwelten (von Ballmoos / Krähenbühl)</h2>
<p>17.11.10 (Zürichsee-Zeitung rechtes Ufer)<br />
<a href=\"/art4art/media/navi_7/ZSZ_17_11_10.pdf\" target=\"_blank\">&gt;download pdf</a><br />
<br /></p>
<h2>Spannender Dialog in der Galerie (Accrochage)</h2>
<p>19.11.09 (Zürichsee-Zeitung rechtes Ufer)<br />
<a href=\"/art4art/media/navi_7/ZSZ_19_11_09.pdf\" target=\"_blank\">&gt;download pdf</a><br />
<br /></p>
<h2>Kunsterlebnis der besonderen Art (Kamel Berkouk)</h2>
<p>27.05.09 (Zürichsee-Zeitung rechtes Ufer)<br />
<a href=\"/art4art/media/navi_7/zsz-berkouk_27_05_09.pdf\" target=\"_blank\">&gt;download pdf</a><br />
<br /></p>
<h2>Lart pour l\'art (Kunstszene)</h2>
<p>September 2008 (Seesicht Magazin)<br />
<a href=\"/art4art/media/navi_7/seesicht408_126%20(2).pdf\" target=\"_blank\">&gt;download pdf</a><br />
<br /></p>
<h2>Komischer Vogel in Galerie art4art (Bouys)</h2>
<p><a href=\"/media/navi_7/bobo.pdf\" target=\"_blank\"></a></p>
<p>
03.09.2008 (Tagesanzeiger) 
</p>
<p>
<a href=\"/art4art/media/navi_7/ta_02_09_2008.pdf\" target=\"_blank\">&gt;download pdf<br />
</a>
</p>
<p>&nbsp;</p>
<h2>Voll verdrahtete Karikaturen (Kamm)</h2>
<p>08.01.08 (Tagesanzeiger)<br />
<a href=\"/art4art/media/navi_7/kamm.pdf\" target=\"_blank\">&gt; download pdf</a><br />
<br /></p>
<h2>Papier- und Raku-Kunst (Beurret Munuera)</h2>
<p>05.09.07 (Zürichsee-Zeitung rechtes Ufer)<br />
<a href=\"/art4art/media/navi_7/beurret_munuera.pdf\" target=\"_blank\">&gt;download pdf</a><br />
<br /></p>
<h2>Die Galerie ar4art bezieht neue Ausstellungsräume in Erlenbach </h2>
<p>26.05.2007 (Lokal Info)<br />
<a href=\"/art4art/media/navi_7/lokalinfo_galerie_kommt_nach_erlenbach.pdf\" target=\"_blank\">&gt; download pdf</a><br />
<br /></p>
<h2>art4art - halle für kunst - Neueröffnung im Dorfkern von Erlenbach</h2>
<p>
16.05.2007 (Tages-Anzeiger) 
</p>
<p>
<a href=\"/art4art/media/navi_7/2007_05_16.pdf\" target=\"_blank\">&gt; download pdf</a> 
</p>","","../gifs/blank.gif","j","n");
INSERT INTO cms_seiten VALUES ("10","20","1","impressum","Konzept und Inhalt","3","0","art4art, halle für kunst 
<p>
Camilla Jeannet 
</p>
<p>
François Jeannet<br />
&nbsp; 
</p>
<h2>Gestaltung und Konzept</h2>
<p>
Marianne Mathys, Zürich 
</p>
<p>
<a href=\"mailto:marianne_mathys@bluewin.ch\" target=\"_blank\">marianne_mathys@bluewin.ch</a><br />
&nbsp; 
</p>
<h2>Programmierung und Konzept</h2>
<p>
Roland Hempen, Zürich 
</p>
<p>
<a href=\"http://www.hempenweb.ch\" target=\"_blank\" title=\"hempenweb – die kleine feine Internetagentur\">www.hempenweb.ch</a> 
</p>
","",NULL,"n","n");
INSERT INTO cms_seiten VALUES ("5","2","2","über uns","Aus Liebe zur Kunst","2","0","<p>art4art präsentiert zeitgenössische Kunst von Schweizer und internationalen Künstlern und steht für ein gesamtheitliches Kunstverständnis, das Malerei, Objekte, Skulpturen, Photographie und Musik einschliesst. </p>
<p><br />Neben den wechselnden Ausstellungen sind permanent Werke der Künstler der Galerie im Lager zu besichtigen. <br /><br />Die Galeristin Camilla Jeannet, Initiantin von art4art, berät seit bald sieben Jahren Private und Firmen in Sachen Kunst. Während der Ausstellungen finden Lesungen, Konzerte und Vorträge sowie private Events statt. Zusammen mit Firmen und Sponsoren realisiert art4art Kunst-Events.<br /><br />Die Aktivitäten von art4art werden von folgenden Sponsoren unterstützt: Zürichsee Medien, Seesicht Magazin und Küsnachter. </p>","","../../media_art4art/navi_2/_thumbs/th_camilla_dsc_0033.jpg","j","a");
INSERT INTO cms_seiten VALUES ("6","4","1","expos","","6","2","","","","n","n");
INSERT INTO cms_seiten VALUES ("7","11","0","künstler","","6","1","<p>Fachperson f</p>","","","j","n");
INSERT INTO cms_seiten VALUES ("33","43","1","objektkunst","","6","1","","","","n","n");
INSERT INTO cms_seiten VALUES ("32","42","1","malerei","","6","1","","","","n","n");
INSERT INTO cms_seiten VALUES ("18","28","1","links","Links, die wir gerne weiter empfehlen...","3","0","<a href=\"http://www.hempenweb.ch\" target=\"_blank\" title=\"hempenweb - die kleine feine Internetagentur\" class=\"weiter\">hempenWeb – die kleine feine Internetagentur</a><br />
<br />
","","","n","n");
INSERT INTO cms_seiten VALUES ("19","29","1","kontakt",NULL,"2","4","<h2>Kontaktperson </h2>
<p>
Camilla Jeannet<br />
Telefon +41 43 277 90 30 
</p>
<p>
Mobile +41 79 379 12 41 
</p>
<p>
Fax +41 44 991 36 66 
</p>
<p>
E-mail <a href=\"mailto:info@art4art.ch\">info@art4art.ch</a> 
</p>
<p>
<a href=\"http://www.art4art.ch\" target=\"_blank\">www.art4art.ch</a> 
</p>
<p>
<a href=\"http://www.art4art.ch\" target=\"_blank\"><br />
</a>
</p>
<h2>Adresse</h2>
<p>
art4art, halle für kunst 
</p>
<p>
Dorfstrasse 2 
</p>
<p>
Postfach 422 
</p>
<p>
<a href=\"http://map.search.ch/8703-erlenbach/dorfstr.2\" target=\"_blank\">
8703 Erlenbach/Zürich</a> 
</p>
<br />
<p>
Im Dorfkern, an der Hauptkreuzung mit der Seestrasse,
</p>
<p>
5 Gehminuten vom Bahnhof Erlenbach,<br />
Richtung Rapperswil 
</p>
<br />
<h2>Öffnungszeiten</h2>
<p>
Dienstag bis Freitag 14.30 – 18.30 Uhr 
</p>
<p>
Samstag 11.00 – 15.00 Uhr 
</p>
<p>
und nach Vereinbarung 
</p>
","","../../media_art4art/navi_10/_thumbs/th_annabelle2.jpg","n","n");
INSERT INTO cms_seiten VALUES ("22","32","1","laufend",NULL,"6","2","","",NULL,"n","n");
INSERT INTO cms_seiten VALUES ("23","33","1","kommend","","6","2","","","","n","n");
INSERT INTO cms_seiten VALUES ("24","34","1","vergangen","","6","2","","","","n","n");
INSERT INTO cms_seiten VALUES ("25","35","1","boutique","unsere neue \'art4art la boutique\'","6","5","<p>In der neuen\"art4art <em>la boutique\"</em> werden Kunstobjekte von zahlreichen Künstler, Kunstgeschenke aus Museum-Shops verschiedener Länder und Epochen, Schmuck, Accessoires, sowie Kunstkarten angeboten. Der gemeinsame Nenner des Angebotes ist der künstlerische Hintergrund der Objekte <br />
<br />
Mit \"art4art <em>la boutique\" </em>erhält die Zürichsee-Region eine Bereicherung in Sachen Einkauf von hochwertigen Dekorations- und Geschenkobjekten; eine echte Alternative zum Gang nach Zürich-City<br />
<br /></p>
<div class=\"img_thumb_rahmen\" style=\"float: left; margin-left: 0px;\">
<img title=\"Kunstkarten\" src=\"/art4art/media_art4art/navi_11/_thumbs/th_carte1.jpg\" border=\"0\" alt=\"Kunstkarten\" align=\"top\" /> 
</div>
<div class=\"img_thumb_rahmen\" style=\"float: left; margin-left: 40px;\">
<img title=\"Objekte\" src=\"/art4art/media_art4art/navi_11/_thumbs/th_hippos_300dpi.jpg\" border=\"0\" alt=\"Objekte\" align=\"top\" /> 
</div>
<div class=\"img_thumb_rahmen\" style=\"float: left; margin-left: 40px;\">
<img title=\"Schmuck\" src=\"/art4art/media_art4art/navi_11/_thumbs/th_kandinskycollier2_300dpi.jpg\" border=\"0\" alt=\"Schmuck\" align=\"top\" /> 
</div>
<div class=\"img_thumb_rahmen\" style=\"margin-top: 30px; margin-left: 0px;\">
<img title=\"Schmuck\" src=\"/art4art/media_art4art/navi_11/_thumbs/th_jadeanhaenger_300dpi.jpg\" border=\"0\" alt=\"Schmuck\" align=\"top\" /> 
</div>
<div class=\"img_thumb_rahmen\" style=\"float: left; margin-left: 40px; margin-top: 30px;\">
<img title=\"Objekte\" src=\"/art4art/media_art4art/navi_11/_thumbs/th_o0019.jpg\" border=\"0\" alt=\"Objekte\" align=\"top\" /> 
</div>
<div class=\"img_thumb_rahmen\" style=\"float: left; margin-left: 40px; margin-top: 30px;\">
<img title=\"Objekte\" src=\"/art4art/media_art4art/navi_11/_thumbs/th_objekt_u_web.jpg\" border=\"0\" alt=\"Objekte\" align=\"top\" /> 
</div>
<div class=\"img_thumb_rahmen\" style=\"margin-left: 0px; margin-top: 30px;\">
<img title=\"Objekte\" src=\"/art4art/media_art4art/navi_11/_thumbs/th_dsc2597.jpg\" border=\"0\" alt=\"Objekte\" align=\"top\" /> 
</div>
<div class=\"img_thumb_rahmen\" style=\"margin-top: 30px; float: left; margin-left: 40px;\">
<img title=\"Kunstkarten\" src=\"/art4art/media_art4art/navi_11/_thumbs/th_carte2.jpg\" border=\"0\" alt=\"Kunstkarten\" align=\"top\" /> 
</div>
<div class=\"img_thumb_rahmen\" style=\"margin-top: 30px; float: left; margin-left: 40px;\">
<img title=\"Accessoirs\" src=\"/art4art/media_art4art/navi_11/_thumbs/th_larissa-fun-schwarz.jpg\" border=\"0\" alt=\"Accessoirs\" align=\"top\" /> 
</div>","","../gifs/blank.gif","j","n");
INSERT INTO cms_seiten VALUES ("26","36","1","laufend","","6","2","","","","n","n");
INSERT INTO cms_seiten VALUES ("28","38","1","news",NULL,"1","0","","",NULL,"n","n");
INSERT INTO cms_seiten VALUES ("29","39","1","kommend",NULL,"6","2","","","../../media_art4art/navi_3_20/_thumbs/th_paar.jpg","n","n");
INSERT INTO cms_seiten VALUES ("30","40","1","vergangen",NULL,"6","2","","","../../media_art4art/navi_3_30/_thumbs/th_ausstellung2.jpg","n","n");
INSERT INTO cms_seiten VALUES ("31","41","1","skulpturen","","6","1","","","","n","n");



# ----------------------------------------------------------
#
# Struktur von Tabelle 'cms_seiten_save'
#
DROP TABLE IF EXISTS cms_seiten_save;
CREATE TABLE cms_seiten_save (
    seiten_id smallint(6) NOT NULL auto_increment,
    nav_id smallint(6) DEFAULT "0" NOT NULL,
    nummer tinyint(4) DEFAULT "0" NOT NULL,
    kurztitel varchar(125) NOT NULL,
    zusatztext varchar(125),
    template tinyint(3) DEFAULT "1" NOT NULL,
    modul tinyint(3) unsigned DEFAULT "0" NOT NULL,
    inhalt1 text NOT NULL,
    inhalt2 text NOT NULL,
    bild1 varchar(125),
    aktiv enum('j','n') DEFAULT "j" NOT NULL,
    galerie enum('n','a','b') DEFAULT "n",
   PRIMARY KEY (seiten_id)
);

#
# Daten von Tabelle 'cms_seiten_save'
#
INSERT INTO cms_seiten_save VALUES ("1","1","1","home","halle fÃƒÂ¼r kunst","2","0","<h2>Dies ist ein Text</h2>
<p>Dies ist ein Text </p>
<h3><br />Dies ist ein Text</h3>
<p>Dies ist ein Text Dies ist ein Text Dies ist ein Text Dies ist ein Text Dies ist ein TextDies ist ein TextDies ist ein TextDies ist ein TextDies ist ein TextDies ist ein Text<br />Dies ist ein TextDies ist ein Text </p>
<p><br />hallo das ist ein paragraph </p>
<p><br />das ist ein zweiter paragraph </p>","","../../media_art4art/navi_1/_thumbs/th_paintings_0241w.jpg","j","b");
INSERT INTO cms_seiten_save VALUES ("2","3","1","events",NULL,"5","2","<h3>Anschriften und Informationen zu unseren Top Five Kunden: </h3>
<ul>
	<li>Kunde 1</li>
	<li>Kunde 2</li>
	<li>Kunde 3</li>
	<li>Kunde 4</li>
	<li>Kunde 5</li>
</ul>
","",NULL,"n","n");
INSERT INTO cms_seiten_save VALUES ("3","5","1","dienste","","2","0","<h2>Kunstberatung </h2>
<p>
Camilla Jeannet berät Private und Firmen in Sachen Kunst, sowohl bei Einzelanschaffungen, als auch im Rahmen von Gesamtkonzepten.
</p>
<p>&nbsp;</p>
<h2>Künstlervertretung und -vermittlung</h2>
<p>
art4art vertritt die
Künstler der Galerie auch ausserhalb der jeweils aktuellen Ausstellung. Wir suchen
für Sie Bilder nach Ihrem Badarf.
</p>
<p>&nbsp;</p>
<h2>Auftragsmalerei</h2>
<p>
Seit immer haben Künstler im Auftrag Original-Werke kreiert. Gefällt Ihnen
das Schaffen eines Künstlers ganz besonders, besprechen Sie es mit uns.<br />
<br /></p>
<h2>Events</h2>
<p>
Eine Galerie strahlt ein inspirierendes Ambiente aus, das sich ausgezeichnet
für öffentliche und private Anlässe eignet. So hat art4art in den letzten
Jahren verschiedene Konzerte, Lesungen und private Einladungen durchgeführt.<br />
<br /></p>
<h2>Finanzierung</h2>
<p>
Zur Finanzierung Ihrer Kunstanschaffungen können flexible Lösungen gefunden
werden.</p>","","../../media_art4art/navi_6/_thumbs/th_dscn2965sc.jpg","n","n");
INSERT INTO cms_seiten_save VALUES ("9","6","1","Medienmitteilungen"," ","3","0","<h2>Seesicht Magazin</h2>
<p>September 2008<br />
\"Lart pour l\'art\" (Kunstszene)<br />
<a href=\"/beta/cms/media/navi_7/seesicht408_126%20(2).pdf\" target=\"_blank\">&gt;download pdf</a><br />
<br /></p>
<h2>Tagesanzeiger</h2>
<p>
03.09.2008</p>
<p>
\"Komischer Vogel in Galerie art4art\" (Bouys)<a href=\"/media/navi_7/bobo.pdf\" target=\"_blank\"><br />
</a>
</p>
<p>
<a href=\"/beta/cms/media/navi_7/ta_02_09_2008.pdf\" target=\"_blank\">&gt;download pdf<br />
</a>
</p>
<p>&nbsp;</p>
<h2>Medienmitteilungen zur Ausstellung Jeanick Bouys</h2>
<p>
<a href=\"/media/navi_7/communique_bouys_2008_09.pdf\" target=\"_blank\"><span>&gt; Bouys communiqué 2008_09.pdf</span></a>
</p>
<p>
<a href=\"/beta/cms/media/navi_7/bouys_medieninfo_2008_09.pdf\" target=\"_blank\">&gt; Bouys Medieninfo 2008_09.pdf</a><br />
<br /></p>
<h2>Tagesanzeiger</h2>
<p>08.01.08<br />
Voll verdrahtete Karikaturen (Kamm)<br />
<a href=\"/media/navi_7/kamm.pdf\" target=\"_blank\">&gt; download pdf</a><br />
<br /></p>
<h2>Zürichsee-Zeitung rechtes Ufer</h2>
<p>05.09.07<br />
Papier- und Raku-Kunst (Beurret Munuera)<br />
<a href=\"/beta/cms/media/navi_7/beurret_munuera.pdf\" target=\"_blank\">&gt;download pdf</a><br />
<br /></p>
<h2>Lokal Info</h2>
<p>
26.05.2007 
</p>
<p>
Die Galerie ar4art bezieht neue Ausstellungsräume in Erlenbach 
</p>
<p>
<a href=\"/beta/cms/media/navi_7/lokalinfo_galerie_kommt_nach_erlenbach.pdf\" target=\"_blank\">&gt; download pdf</a><br />
<br /></p>
<h2>Tages-Anzeiger</h2>
<p>
16.05.2007<br />
art4art - halle für kunst - Neueröffnung im Dorfkern von Erlenbach<br />
<a href=\"/beta/cms/media/navi_7/2007_05_16.pdf\" target=\"_blank\">&gt; download pdf</a> 
</p>","","../../media_art4art/navi_7/_thumbs/th_berkoukbild5.jpg","j","n");
INSERT INTO cms_seiten_save VALUES ("10","20","1","impressum","Konzept und Inhalt","3","0","<p>art4art, halle für kunst 
</p>
<p>
Camilla Jeannet 
</p>
<p>
François Jeannet</p>
<h2>Gestaltung und Konzept</h2>
<p>
Marianne Mathys, Zürich 
</p>
<p>
<a href=\"mailto:marianne_mathys@bluewin.ch\" target=\"_blank\">marianne_mathys@bluewin.ch</a></p>
<h2>Programmierung und Konzept</h2>
<p>
Roland Hempen, Zürich 
</p>
<p>
<a title=\"hempenweb Ã¢â‚¬â€œ die kleine feine Internetagentur\" href=\"http://www.hempenweb.ch\" target=\"_blank\">www.hempenweb.ch</a> 
</p>","","","n","n");
INSERT INTO cms_seiten_save VALUES ("5","2","2","über uns","Aus Liebe zur Kunst","2","0","<p>art4art präsentiert zeitgenössische Kunst von Schweizer und internationalen Künstlern und steht für ein gesamtheitliches Kunstverständnis, das Malerei, Objekte, Skulpturen, Photographie und Musik einschliesst. </p>
<p><br />Neben den wechselnden Ausstellungen sind permanent Werke der Künstler der Galerie im Lager zu besichtigen. <br /><br />Die Galeristin Camilla Jeannet, Initiantin von art4art, berät seit bald sieben Jahren Private und Firmen in Sachen Kunst. Während der Ausstellungen finden Lesungen, Konzerte und Vorträge sowie private Events statt. Zusammen mit Firmen und Sponsoren realisiert art4art Kunst-Events.<br /><br />Die Aktivitäten von art4art werden von folgenden Sponsoren unterstützt: Zürichsee Medien, Seesicht Magazin und Küsnachter. </p>","","../../media_art4art/navi_2/_thumbs/th_camilla_dsc_0033.jpg","j","a");
INSERT INTO cms_seiten_save VALUES ("6","4","1","expos",NULL,"5","2","","",NULL,"n","n");
INSERT INTO cms_seiten_save VALUES ("7","11","0","künstler","","5","1","<p>Fachperson f</p>","","","j","n");
INSERT INTO cms_seiten_save VALUES ("33","43","1","objektkunst",NULL,"5","1","","",NULL,"n","n");
INSERT INTO cms_seiten_save VALUES ("32","42","1","malerei","","5","1","","","","n","n");
INSERT INTO cms_seiten_save VALUES ("18","28","1","links","Links, die wir gerne weiter empfehlen...","2","0","<p><a title=\"hempenweb - die kleine feine Internetagentur\" href=\"http://www.hempenweb.ch\" target=\"_blank\">hempenWeb - die kleine feine Internetagentur</a></p>","","","n","n");
INSERT INTO cms_seiten_save VALUES ("19","29","1","kontakt","","2","4","<h2>Kontaktperson </h2>
<p>
Camilla Jeannet<br />
Telefon +41 43 277 90 30 
</p>
<p>
Mobile +41 79 379 12 41 
</p>
<p>
Fax +41 44 991 36 66 
</p>
<p>
E-mail <a href=\"mailto:info@art4art.ch\">info@art4art.ch</a> 
</p>
<p>
<a href=\"http://www.art4art.ch\" target=\"_blank\">www.art4art.ch</a> 
</p>
<p>
<a href=\"http://www.art4art.ch\" target=\"_blank\"><br />
</a>
</p>
<h2>Adresse</h2>
<p>
art4art, halle für kunst 
</p>
<p>
Dorfstrasse 2 
</p>
<p>
Postfach 422 
</p>
<p>
<a href=\"http://map.search.ch/8703-erlenbach/dorfstr.2\" target=\"_blank\">
8703 Erlenbach/Zürich</a> 
</p>
<p>&nbsp;</p>
<p>
Im Dorfkern, an der Hauptkreuzung mit der Seestrasse,
</p>
<p>
5 Gehminuten vom Bahnhof Erlenbach,<br />
Richtung Rapperswil 
</p>
<p>&nbsp;</p>
<h2>Öffnungszeiten</h2>
<p>
Die Galerie bleibt während der Herbstferien bis 23.10.2010 geschlossen<br />
Besuch auf Vereinbarung möglich</p>
<p>&nbsp;</p>
<p>
Dienstag bis Freitag 14.30 bis 18.30 Uhr 
</p>
<p>
Samstag 11.00 bis 15.00 Uhr 
</p>
<p>
und nach Vereinbarung 
</p>","","../../media_art4art/navi_10/_thumbs/th_annabelle2.jpg","n","n");
INSERT INTO cms_seiten_save VALUES ("22","32","1","laufend",NULL,"5","2","","",NULL,"n","n");
INSERT INTO cms_seiten_save VALUES ("23","33","1","kommend",NULL,"5","2","","",NULL,"n","n");
INSERT INTO cms_seiten_save VALUES ("24","34","1","vergangen",NULL,"5","2","","",NULL,"n","n");
INSERT INTO cms_seiten_save VALUES ("25","35","1","boutique","unsere neue \'art4art la boutique\'","3","0","In der neuen\"art4art <em>la boutique\"</em> werden Kunstobjekte von zahlreichen KÃƒÂ¼nstler, Kunstgeschenke aus Museum-Shops verschiedener LÃƒÂ¤nder und Epochen, Schmuck, Accessoires, sowie Kunstkarten angeboten. Der gemeinsame Nenner des Angebotes ist der kÃƒÂ¼nstlerische Hintergrund der Objekte <br />
<br />
Mit \"art4art <em>la boutique\" </em>erhÃƒÂ¤lt die ZÃƒÂ¼richsee-Region eine Bereicherung in Sachen Einkauf von hochwertigen Dekorations- und Geschenkobjekten; eine echte Alternative zum Gang nach ZÃƒÂ¼rich-City<br />
<br />
<div class=\"img_thumb_rahmen\" style=\"float: left; margin-left: 0px\">
<img src=\"/media_art4art/navi_11/_thumbs/th_carte1.jpg\" border=\"0\" alt=\"Kunstkarten\" title=\"Kunstkarten\" align=\"top\" /> 
</div>
<div class=\"img_thumb_rahmen\" style=\"float: left; margin-left: 40px\">
<img src=\"/media_art4art/navi_11/_thumbs/th_hippos_300dpi.jpg\" border=\"0\" alt=\"Objekte\" title=\"Objekte\" align=\"top\" /> 
</div>
<div class=\"img_thumb_rahmen\" style=\"float: left; margin-left: 40px\">
<img src=\"/media_art4art/navi_11/_thumbs/th_kandinskycollier2_300dpi.jpg\" border=\"0\" alt=\"Schmuck\" title=\"Schmuck\" align=\"top\" /> 
</div>
<div class=\"img_thumb_rahmen\" style=\"margin-top: 30px; margin-left: 0px\">
<img src=\"/media_art4art/navi_11/_thumbs/th_jadeanhaenger_300dpi.jpg\" border=\"0\" alt=\"Schmuck\" title=\"Schmuck\" align=\"top\" /> 
</div>
<div class=\"img_thumb_rahmen\" style=\"float: left; margin-left: 40px; margin-top: 30px\">
<img src=\"/media_art4art/navi_11/_thumbs/th_o0019.jpg\" border=\"0\" alt=\"Objekte\" title=\"Objekte\" align=\"top\" /> 
</div>
<div class=\"img_thumb_rahmen\" style=\"float: left; margin-left: 40px; margin-top: 30px\">
<img src=\"/media_art4art/navi_11/_thumbs/th_objekt_u_web.jpg\" border=\"0\" alt=\"Objekte\" title=\"Objekte\" align=\"top\" /> 
</div>
<div class=\"img_thumb_rahmen\" style=\"margin-left: 0px; margin-top: 30px\">
<img src=\"/media_art4art/navi_11/_thumbs/th_dsc2597.jpg\" border=\"0\" alt=\"Objekte\" title=\"Objekte\" align=\"top\" /> 
</div>
<div class=\"img_thumb_rahmen\" style=\"margin-top: 30px; float: left; margin-left: 40px\">
<img src=\"/media_art4art/navi_11/_thumbs/th_carte2.jpg\" border=\"0\" alt=\"Kunstkarten\" title=\"Kunstkarten\" align=\"top\" /> 
</div>
<div class=\"img_thumb_rahmen\" style=\"margin-top: 30px; float: left; margin-left: 40px\">
<img src=\"/media_art4art/navi_11/_thumbs/th_larissa-fun-schwarz.jpg\" border=\"0\" alt=\"Accessoirs\" title=\"Accessoirs\" align=\"top\" /> 
</div>
","","../gifs/blank.gif","j","n");
INSERT INTO cms_seiten_save VALUES ("26","36","1","laufend",NULL,"5","2","","","../gifs/blank.gif","n","n");
INSERT INTO cms_seiten_save VALUES ("28","38","1","news",NULL,"1","0","","",NULL,"n","n");
INSERT INTO cms_seiten_save VALUES ("29","39","1","kommend",NULL,"5","2","","","../../media_art4art/navi_3_20/_thumbs/th_paar.jpg","n","n");
INSERT INTO cms_seiten_save VALUES ("30","40","1","vergangen",NULL,"5","2","","","../../media_art4art/navi_3_30/_thumbs/th_ausstellung2.jpg","n","n");
INSERT INTO cms_seiten_save VALUES ("31","41","1","skulpturen",NULL,"5","1","","",NULL,"n","n");



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



# ----------------------------------------------------------
#
# Struktur von Tabelle 'cms_templates'
#
DROP TABLE IF EXISTS cms_templates;
CREATE TABLE cms_templates (
    id tinyint(3) NOT NULL auto_increment,
    template_id tinyint(3) unsigned DEFAULT "0" NOT NULL,
    template_name varchar(40) DEFAULT "zweispaltig_340_420_tpl.html" NOT NULL,
    template_descr varchar(125),
    thumbsize char(10),
   PRIMARY KEY (id)
);

#
# Daten von Tabelle 'cms_templates'
#
INSERT INTO cms_templates VALUES ("1","1","zweispaltig_340_420_tpl.html","zweispaltig_340_420_tpl.html - Detail zu: expo, event; home, &uuml;ber uns, services, etc.","300x300");
INSERT INTO cms_templates VALUES ("2","2","zweispaltig_420_340_tpl.html","zweispaltig_420_340_tpl.html - Detail zu: expo, event; home, &uuml;ber uns, services, etc.","300x300");
INSERT INTO cms_templates VALUES ("3","3","zweispaltig_500_260v_tpl.html","zweispaltig_500_260v_tpl.html - Detailseiten: k&uuml;nstler mit Bilderleiste vertikal","98x98");
INSERT INTO cms_templates VALUES ("5","5","einspaltig_760h_tpl.html","einspaltig_760h_tpl.html - Detailseiten: K&uuml;nstler mit horizontaler Bildleiste oben","98x98");
INSERT INTO cms_templates VALUES ("6","6","einspaltig_760v_tpl.html","einspaltig_760v_tpl.html - Auswahlseiten Events, Expos, K&uuml;nstler","98x98");
INSERT INTO cms_templates VALUES ("4","4","zweispaltig_500_260_tpl.html","zweispaltig_500_260_tpl.html - Detailseiten: Alternativseite f&uuml;r Seiten mit Text, zB. medien (ohne Bilder)","98x98");



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
INSERT INTO cms_users VALUES ("5","jeannet","ad0b067393f388576ca5320375270ce3","NUMKLBD");
INSERT INTO cms_users VALUES ("3","hempen","e9911456f39b5e6d738669ac8d438b20","NUMKLBD");


