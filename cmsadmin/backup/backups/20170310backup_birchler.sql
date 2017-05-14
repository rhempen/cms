#----------------------------------------------
# Backup der Datenbank cms_birchler
# Erstellt am 10.03.2017 23:47
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
INSERT INTO cms_config VALUES ("4","general","MAX_LIST_ITEMS","3",NULL,NULL);
INSERT INTO cms_config VALUES ("5","general","LANGUAGE","DE",NULL,NULL);
INSERT INTO cms_config VALUES ("6","general","CMS_ROOT","/",NULL,NULL);
INSERT INTO cms_config VALUES ("7","general","EMAIL_RECEIVER","info@birchler-architektur.ch",NULL,NULL);
INSERT INTO cms_config VALUES ("8","general","GOOGLE_ANALYTICS","UA-10022482-1",NULL,NULL);
INSERT INTO cms_config VALUES ("10","menu","HMENU_RICHTUNG","left","right",NULL);
INSERT INTO cms_config VALUES ("11","menu","HMENU_SUBMENU","submenu","dropdown",NULL);
INSERT INTO cms_config VALUES ("12","menu","SUBMENU_DIR","vertikal","horizontal",NULL);
INSERT INTO cms_config VALUES ("13","menu","SUBNAV_SOFORT","ja","nein",NULL);
INSERT INTO cms_config VALUES ("14","menu","SMURL","ja","nein",NULL);
INSERT INTO cms_config VALUES ("15","menu","SMURL_REFRESH","ausf&uuml;hren","",NULL);
INSERT INTO cms_config VALUES ("20","pictures","THUMB_PAGE_MAX_WIDTH","98",NULL,NULL);
INSERT INTO cms_config VALUES ("21","pictures","THUMB_PAGE_MAX_HEIGHT","98",NULL,NULL);
INSERT INTO cms_config VALUES ("22","pictures","THUMB_NAVI_MAX_WIDTH","358",NULL,NULL);
INSERT INTO cms_config VALUES ("23","pictures","THUMB_NAVI_MAX_HEIGHT","358",NULL,NULL);
INSERT INTO cms_config VALUES ("24","pictures","IMAGE_MAX_WIDTH","960",NULL,NULL);
INSERT INTO cms_config VALUES ("25","pictures","IMAGE_MAX_HEIGHT","480",NULL,NULL);
INSERT INTO cms_config VALUES ("26","pictures","DISK_DB_ADJUSTMENT","ausf&uuml;hren",NULL,NULL);
INSERT INTO cms_config VALUES ("32","meta-tags","KEYWORDS","webdesign, php, html, xhtml, javascript, Z�rich, Hempen, Roland Hempen, hempenweb",NULL,"Birchler, Architekt, Architektur, Einsiedeln");
INSERT INTO cms_config VALUES ("33","meta-tags","DESCRIPTION","hempenWeb ist eine kleine feine Internetagentur, die es sich zur Aufgabe macht, Ihren Internetauftritt individuell und einmal",NULL,"Ruedi Birchler Architekt ETH/SIA, Allmeindstrasse 17, 8840 Einsiedeln");
INSERT INTO cms_config VALUES ("34","meta-tags","PAGE_TOPIC","Webdesign, WebProgrammer, Php, Internetagentur, Z�rich",NULL,"Architektur, Bauten, Lincoln, Br�el, Linsi, Energieberatung, ");
INSERT INTO cms_config VALUES ("35","meta-tags","PUBLISHER","Roland Hempen, WebPublisher, WebProgrammer Php, www.hempenweb.ch, Marianne Mathys, Grafik, Design, Z�rich",NULL,"Roland Hempen, WebPublisher, WebProgrammer Php, hempenweb, Marianne Mathys, Grafik, Design, Z�rich");
INSERT INTO cms_config VALUES ("36","general","TEMPLATE_DIR","frontend/themes/birchler/tpl",NULL,NULL);



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
<p class=\"teasertext\"><img src=\"/beta/cms/media_birchler/navi_056/_thumbs/th_home_2.png\" alt=\"\" width=\"480\" height=\"90\" /> <br />Bouillon aufkochen. Erbsen beigeben, ca. 5 Minuten k�cheln lassen. Pro Person 1 EL Erbsen herausnehmen und beiseite stellen. Suppe fein p�rieren. Mit der H�lfte der Cr�me fra�che verfeinern und aufkochen. Butter und Mehl mit einer Gabel verkneten und in die kochende Suppe einr�hren. Mit Salz und Pfeffer pikant w�rzen.</p>");
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
INSERT INTO cms_galerien VALUES ("472","51","2","N","../../media/navi_12/_images/home_1.png","Siedlung Lincoln in Einsiedeln beim Friedhof");
INSERT INTO cms_galerien VALUES ("497","51","1","N","../../media/navi_12/_images/home_2.png","Diverse Ansichten auf Bauten in Einsiedeln");
INSERT INTO cms_galerien VALUES ("520","56","1","N","../../media/navi_056/_images/home_2.png",NULL);
INSERT INTO cms_galerien VALUES ("539","58","1","N","../../media/navi_11_30/_images/linsi_aussenansicht.jpg","Garten");
INSERT INTO cms_galerien VALUES ("540","58","2","N","../../media/navi_11_30/_images/linsi_treppe.jpg","Treppenhaus");
INSERT INTO cms_galerien VALUES ("547","54","1","N","../../media/navi_13/_images/plan_birchler.png","Lageplan");
INSERT INTO cms_galerien VALUES ("591","61","1","N","../../media/navi_11_60/_images/nord-west.jpg","Ansicht West");
INSERT INTO cms_galerien VALUES ("592","61","4","N","../../media/navi_11_60/_images/pict0055.jpg","Innenraum");
INSERT INTO cms_galerien VALUES ("593","61","3","N","../../media/navi_11_60/_images/s�d-ost.jpg","Ansicht Ost");
INSERT INTO cms_galerien VALUES ("594","61","2","N","../../media/navi_11_60/_images/west.jpg","Ansicht Süd");
INSERT INTO cms_galerien VALUES ("661","51","3","N","../../media/navi_12/_images/home_3.png","Diverse Ansichten auf Bauten in Einsiedeln");
INSERT INTO cms_galerien VALUES ("662","51","4","N","../../media_birchler/navi_12/_images/home_1.png","");
INSERT INTO cms_galerien VALUES ("663","51","5","N","../../media_birchler/navi_12/_images/home_2.png","");
INSERT INTO cms_galerien VALUES ("664","51","6","N","../../media_birchler/navi_12/_images/home_3.png","");
INSERT INTO cms_galerien VALUES ("670","72","6","N","../../media_birchler/navi_11_170/_images/ag-694_5.jpg","");
INSERT INTO cms_galerien VALUES ("671","72","8","N","../../media_birchler/navi_11_170/_images/ag_690_roh3.jpg","");
INSERT INTO cms_galerien VALUES ("672","72","7","N","../../media_birchler/navi_11_170/_images/ag_700_roh2.jpg","");
INSERT INTO cms_galerien VALUES ("673","72","5","N","../../media_birchler/navi_11_170/_images/ag_700_roh3.jpg","");
INSERT INTO cms_galerien VALUES ("681","79","5","N","../../media_birchler/navi_11_220/_images/dsc00024.jpg","");
INSERT INTO cms_galerien VALUES ("683","79","6","N","../../media_birchler/navi_11_220/_images/dsc00040.jpg","");
INSERT INTO cms_galerien VALUES ("684","71","6","N","../../media_birchler/navi_11_160/_images/ag-689_7_b.jpg","");
INSERT INTO cms_galerien VALUES ("685","71","5","N","../../media_birchler/navi_11_160/_images/ag-689_8_b.jpg","");
INSERT INTO cms_galerien VALUES ("686","71","4","N","../../media_birchler/navi_11_160/_images/ag-792_6_aussicht.jpg","");
INSERT INTO cms_galerien VALUES ("687","70","4","N","../../media_birchler/navi_11_150/_images/ag-674_6_b.jpg","");
INSERT INTO cms_galerien VALUES ("688","70","5","N","../../media_birchler/navi_11_150/_images/ag-685_8.jpg","");
INSERT INTO cms_galerien VALUES ("690","69","2","N","../../media_birchler/navi_11_140/_images/ag-674_1_b.jpg","");
INSERT INTO cms_galerien VALUES ("691","74","7","N","../../media_birchler/navi_11_190/_images/ag-694_7_b.jpg","");
INSERT INTO cms_galerien VALUES ("692","74","8","N","../../media_birchler/navi_11_190/_images/ag-699_3_b.jpg","");
INSERT INTO cms_galerien VALUES ("694","74","9","N","../../media_birchler/navi_11_190/_images/img_0020.jpg","");
INSERT INTO cms_galerien VALUES ("696","74","10","N","../../media_birchler/navi_11_190/_images/img_0074.jpg","");
INSERT INTO cms_galerien VALUES ("697","68","6","N","../../media_birchler/navi_11_130/_images/ag-672_4_b.jpg","");
INSERT INTO cms_galerien VALUES ("698","68","8","N","../../media_birchler/navi_11_130/_images/ag-672_7.jpg","");
INSERT INTO cms_galerien VALUES ("699","68","5","N","../../media_birchler/navi_11_130/_images/ag-673_2_b.jpg","");
INSERT INTO cms_galerien VALUES ("700","68","7","N","../../media_birchler/navi_11_130/_images/ag-673_5_b.jpg","");
INSERT INTO cms_galerien VALUES ("711","67","6","N","../../media_birchler/navi_11_120/_images/4155-02.jpg","");
INSERT INTO cms_galerien VALUES ("712","67","5","N","../../media_birchler/navi_11_120/_images/4155-19.jpg","");
INSERT INTO cms_galerien VALUES ("713","67","7","N","../../media_birchler/navi_11_120/_images/4155-28.jpg","");
INSERT INTO cms_galerien VALUES ("714","67","8","N","../../media_birchler/navi_11_120/_images/luftbild_b�sch.jpg","");
INSERT INTO cms_galerien VALUES ("715","57","5","N","../../media_birchler/navi_11_20/_images/unbenannt-1.jpg","");
INSERT INTO cms_galerien VALUES ("716","57","8","N","../../media_birchler/navi_11_20/_images/unbenannt-2.jpg","");
INSERT INTO cms_galerien VALUES ("717","57","7","N","../../media_birchler/navi_11_20/_images/unbenannt-3.jpg","");
INSERT INTO cms_galerien VALUES ("718","57","6","N","../../media_birchler/navi_11_20/_images/unbenannt-4.jpg","");
INSERT INTO cms_galerien VALUES ("719","55","8","N","../../media_birchler/navi_11_10/_images/lincoln01.jpg","");
INSERT INTO cms_galerien VALUES ("720","55","6","N","../../media_birchler/navi_11_10/_images/lincoln03.jpg","");
INSERT INTO cms_galerien VALUES ("721","55","5","N","../../media_birchler/navi_11_10/_images/lincoln04.jpg","");
INSERT INTO cms_galerien VALUES ("722","55","7","N","../../media_birchler/navi_11_10/_images/lincoln05.jpg","");
INSERT INTO cms_galerien VALUES ("723","58","3","N","../../media_birchler/navi_11_30/_images/linsi_aussenansicht.jpg","");
INSERT INTO cms_galerien VALUES ("724","58","4","N","../../media_birchler/navi_11_30/_images/linsi_treppe.jpg","");
INSERT INTO cms_galerien VALUES ("725","66","6","N","../../media_birchler/navi_11_110/_images/69570012.jpg","");
INSERT INTO cms_galerien VALUES ("726","66","5","N","../../media_birchler/navi_11_110/_images/69570016.jpg","");
INSERT INTO cms_galerien VALUES ("727","66","4","N","../../media_birchler/navi_11_110/_images/69570020.jpg","");
INSERT INTO cms_galerien VALUES ("731","64","3","N","../../media_birchler/navi_11_90/_images/dsc_0192.jpg","");
INSERT INTO cms_galerien VALUES ("732","64","4","N","../../media_birchler/navi_11_90/_images/dsc_0202.jpg","");
INSERT INTO cms_galerien VALUES ("736","61","5","N","../../media_birchler/navi_11_60/_images/nord-west.jpg","");
INSERT INTO cms_galerien VALUES ("737","61","6","N","../../media_birchler/navi_11_60/_images/pict0055.jpg","");
INSERT INTO cms_galerien VALUES ("738","61","7","N","../../media_birchler/navi_11_60/_images/s�d-ost.jpg","");
INSERT INTO cms_galerien VALUES ("739","61","8","N","../../media_birchler/navi_11_60/_images/west.jpg","");
INSERT INTO cms_galerien VALUES ("740","76","4","N","../../media_birchler/navi_11_210/_images/00029.jpg","");
INSERT INTO cms_galerien VALUES ("741","76","3","N","../../media_birchler/navi_11_210/_images/00031.jpg","");
INSERT INTO cms_galerien VALUES ("742","62","10","N","../../media_birchler/navi_11_70/_images/dsc00033.jpg","");
INSERT INTO cms_galerien VALUES ("743","62","7","N","../../media_birchler/navi_11_70/_images/dsc00035.jpg","");
INSERT INTO cms_galerien VALUES ("744","62","8","N","../../media_birchler/navi_11_70/_images/dsc00037.jpg","");
INSERT INTO cms_galerien VALUES ("745","62","6","N","../../media_birchler/navi_11_70/_images/dsc00038.jpg","");
INSERT INTO cms_galerien VALUES ("746","62","9","N","../../media_birchler/navi_11_70/_images/dsc00039.jpg","");
INSERT INTO cms_galerien VALUES ("747","54","2","N","../../media_birchler/navi_13/_images/plan_birchler.png","");
INSERT INTO cms_galerien VALUES ("748","56","2","N","../../media_birchler/navi_056/_images/home_2.png","");
INSERT INTO cms_galerien VALUES ("749","52","1","N","../../media_birchler/navi_14/_images/impressum_1.png","");
INSERT INTO cms_galerien VALUES ("760","41","1","N","../../media_birchler/navi_07/_images/birchlerteaminternet01.jpg","");
INSERT INTO cms_galerien VALUES ("761","41","2","N","../../media_birchler/navi_07/_images/teambirchler02.jpg","");
INSERT INTO cms_galerien VALUES ("762","41","3","N","../../media_birchler/navi_07/_images/teambirchler03.jpg","");
INSERT INTO cms_galerien VALUES ("813","80","2","N","../../media_birchler/navi_11_220/_images/brel11.jpg","");
INSERT INTO cms_galerien VALUES ("814","80","3","N","../../media_birchler/navi_11_220/_images/brel21.jpg","");
INSERT INTO cms_galerien VALUES ("815","80","5","N","../../media_birchler/navi_11_220/_images/brel31.jpg","");
INSERT INTO cms_galerien VALUES ("816","80","6","N","../../media_birchler/navi_11_220/_images/brel41.jpg","");
INSERT INTO cms_galerien VALUES ("817","80","4","N","../../media_birchler/navi_11_220/_images/brel51.jpg","");
INSERT INTO cms_galerien VALUES ("818","80","1","N","../../media_birchler/navi_11_220/_images/brel61.jpg","");
INSERT INTO cms_galerien VALUES ("819","69","4","N","../../media_birchler/navi_11_140/_images/img0909b.jpg","");
INSERT INTO cms_galerien VALUES ("820","69","5","N","../../media_birchler/navi_11_140/_images/img0932b.jpg","");
INSERT INTO cms_galerien VALUES ("822","69","3","N","../../media_birchler/navi_11_140/_images/img0967b.jpg","");
INSERT INTO cms_galerien VALUES ("823","69","6","N","../../media_birchler/navi_11_140/_images/img0970b.jpg","");
INSERT INTO cms_galerien VALUES ("825","52","2","N","../../media_birchler/navi_14/_images/wp20140419113448pro.jpg","");
INSERT INTO cms_galerien VALUES ("826","52","3","N","../../media_birchler/navi_14/_images/wp20140419113500pro.jpg","");
INSERT INTO cms_galerien VALUES ("827","52","4","N","../../media_birchler/navi_14/_images/wp20140419120920pro.jpg","");
INSERT INTO cms_galerien VALUES ("828","52","5","N","../../media_birchler/navi_14/_images/wp20140420114928pro.jpg","");
INSERT INTO cms_galerien VALUES ("829","52","6","N","../../media_birchler/navi_14/_images/wp20140420115559pro.jpg","");
INSERT INTO cms_galerien VALUES ("830","52","7","N","../../media_birchler/navi_14/_images/wp20140419122347pro.jpg","");
INSERT INTO cms_galerien VALUES ("831","52","8","N","../../media_birchler/navi_14/_images/wp20140419122432pro.jpg","");
INSERT INTO cms_galerien VALUES ("832","52","9","N","../../media_birchler/navi_14/_images/wp20140419124300pro.jpg","");
INSERT INTO cms_galerien VALUES ("850","83","4","N","../../media_birchler/navi_11_240/_images/img6710k.jpg","");
INSERT INTO cms_galerien VALUES ("851","83","3","N","../../media_birchler/navi_11_240/_images/img6724k.jpg","");
INSERT INTO cms_galerien VALUES ("852","83","5","N","../../media_birchler/navi_11_240/_images/img6740k.jpg","");
INSERT INTO cms_galerien VALUES ("853","83","1","N","../../media_birchler/navi_11_240/_images/img6796k.jpg","");
INSERT INTO cms_galerien VALUES ("854","83","2","N","../../media_birchler/navi_11_240/_images/img6811k.jpg","");
INSERT INTO cms_galerien VALUES ("855","83","6","N","../../media_birchler/navi_11_240/_images/img6887k.jpg","");
INSERT INTO cms_galerien VALUES ("862","84","4","N","../../media_birchler/navi_11_250/_images/img7583kopie.jpg","");
INSERT INTO cms_galerien VALUES ("864","84","2","N","../../media_birchler/navi_11_250/_images/img7613.jpg","");
INSERT INTO cms_galerien VALUES ("865","84","3","N","../../media_birchler/navi_11_250/_images/img7634.jpg","");
INSERT INTO cms_galerien VALUES ("866","84","1","N","../../media_birchler/navi_11_250/_images/img7688.jpg","");
INSERT INTO cms_galerien VALUES ("867","84","5","N","../../media_birchler/navi_11_250/_images/img7724.jpg","");
INSERT INTO cms_galerien VALUES ("868","85","2","N","../../media_birchler/navi_11_260/_images/img7315.jpg","");
INSERT INTO cms_galerien VALUES ("869","85","3","N","../../media_birchler/navi_11_260/_images/img7330.jpg","");
INSERT INTO cms_galerien VALUES ("870","85","1","N","../../media_birchler/navi_11_260/_images/img7333.jpg","");
INSERT INTO cms_galerien VALUES ("871","85","4","N","../../media_birchler/navi_11_260/_images/img7354.jpg","");
INSERT INTO cms_galerien VALUES ("872","73","3","N","../../media_birchler/navi_11_180/_images/schindellegigangkl.jpg","");
INSERT INTO cms_galerien VALUES ("873","73","2","N","../../media_birchler/navi_11_180/_images/schindellegischlafzimmerkl.jpg","");
INSERT INTO cms_galerien VALUES ("874","73","1","N","../../media_birchler/navi_11_180/_images/schindellegiwohnzimmerkl.jpg","");
INSERT INTO cms_galerien VALUES ("875","86","1","N","../../media_birchler/navi_11_265/_images/img7411.jpg","");
INSERT INTO cms_galerien VALUES ("876","86","2","N","../../media_birchler/navi_11_265/_images/img7412.jpg","");
INSERT INTO cms_galerien VALUES ("878","86","6","N","../../media_birchler/navi_11_265/_images/img7441.jpg","");
INSERT INTO cms_galerien VALUES ("880","86","4","N","../../media_birchler/navi_11_265/_images/img7458.jpg","");
INSERT INTO cms_galerien VALUES ("881","86","3","N","../../media_birchler/navi_11_265/_images/img7496.jpg","");
INSERT INTO cms_galerien VALUES ("882","86","5","N","../../media_birchler/navi_11_265/_images/img7529.jpg","");
INSERT INTO cms_galerien VALUES ("883","63","2","N","../../media_birchler/navi_11_80/_images/0109261.jpg","");
INSERT INTO cms_galerien VALUES ("884","63","1","N","../../media_birchler/navi_11_80/_images/0109262.jpg","");
INSERT INTO cms_galerien VALUES ("885","63","3","N","../../media_birchler/navi_11_80/_images/dscn1408.jpg","");
INSERT INTO cms_galerien VALUES ("886","143","1","P","../../media_birchler/navi_1030001/_images/ag690roh3.jpg","");
INSERT INTO cms_galerien VALUES ("887","143","2","P","../../media_birchler/navi_1030001/_images/ag700roh2.jpg","");
INSERT INTO cms_galerien VALUES ("888","143","3","P","../../media_birchler/navi_1030001/_images/ag700roh3.jpg","");
INSERT INTO cms_galerien VALUES ("889","143","4","P","../../media_birchler/navi_1030001/_images/ag6945.jpg","");
INSERT INTO cms_galerien VALUES ("890","144","3","P","../../media_birchler/navi_1030002/_images/img7634.jpg","");
INSERT INTO cms_galerien VALUES ("891","144","1","P","../../media_birchler/navi_1030002/_images/img7613.jpg","");
INSERT INTO cms_galerien VALUES ("892","144","2","P","../../media_birchler/navi_1030002/_images/img7688.jpg","");
INSERT INTO cms_galerien VALUES ("893","144","4","P","../../media_birchler/navi_1030002/_images/img7583.jpg","");
INSERT INTO cms_galerien VALUES ("894","144","5","P","../../media_birchler/navi_1030002/_images/img7724.jpg","");
INSERT INTO cms_galerien VALUES ("895","145","2","P","../../media_birchler/navi_1030003/_images/img7411.jpg","");
INSERT INTO cms_galerien VALUES ("896","145","3","P","../../media_birchler/navi_1030003/_images/img7529.jpg","");
INSERT INTO cms_galerien VALUES ("897","145","4","P","../../media_birchler/navi_1030003/_images/img7412.jpg","");
INSERT INTO cms_galerien VALUES ("898","145","1","P","../../media_birchler/navi_1030003/_images/img7441.jpg","");
INSERT INTO cms_galerien VALUES ("899","145","5","P","../../media_birchler/navi_1030003/_images/img7458.jpg","");
INSERT INTO cms_galerien VALUES ("900","145","6","P","../../media_birchler/navi_1030003/_images/img7496.jpg","");
INSERT INTO cms_galerien VALUES ("901","146","1","P","../../media_birchler/navi_1030004/_images/img7315.jpg","");
INSERT INTO cms_galerien VALUES ("902","146","2","P","../../media_birchler/navi_1030004/_images/img7330.jpg","");
INSERT INTO cms_galerien VALUES ("903","146","3","P","../../media_birchler/navi_1030004/_images/img7333.jpg","");
INSERT INTO cms_galerien VALUES ("904","146","4","P","../../media_birchler/navi_1030004/_images/img7354.jpg","");
INSERT INTO cms_galerien VALUES ("905","147","1","P","../../media_birchler/navi_1030005/_images/lincoln01.jpg","");
INSERT INTO cms_galerien VALUES ("906","147","2","P","../../media_birchler/navi_1030005/_images/lincoln03.jpg","");
INSERT INTO cms_galerien VALUES ("907","147","3","P","../../media_birchler/navi_1030005/_images/lincoln04.jpg","");
INSERT INTO cms_galerien VALUES ("908","147","4","P","../../media_birchler/navi_1030005/_images/lincoln05.jpg","");
INSERT INTO cms_galerien VALUES ("913","148","1","P","../../media_birchler/navi_1030006/_images/unbenannt1.jpg","");
INSERT INTO cms_galerien VALUES ("914","148","2","P","../../media_birchler/navi_1030006/_images/unbenannt3.jpg","");
INSERT INTO cms_galerien VALUES ("915","148","3","P","../../media_birchler/navi_1030006/_images/unbenannt4.jpg","");
INSERT INTO cms_galerien VALUES ("916","148","4","P","../../media_birchler/navi_1030006/_images/unbenannt2.jpg","");
INSERT INTO cms_galerien VALUES ("917","149","1","P","../../media_birchler/navi_1030007/_images/bruel61.jpg","");
INSERT INTO cms_galerien VALUES ("918","149","2","P","../../media_birchler/navi_1030007/_images/bruel51.jpg","");
INSERT INTO cms_galerien VALUES ("919","149","3","P","../../media_birchler/navi_1030007/_images/bruel11.jpg","");
INSERT INTO cms_galerien VALUES ("920","149","4","P","../../media_birchler/navi_1030007/_images/bruel21.jpg","");
INSERT INTO cms_galerien VALUES ("921","149","5","P","../../media_birchler/navi_1030007/_images/bruel31.jpg","");
INSERT INTO cms_galerien VALUES ("922","149","6","P","../../media_birchler/navi_1030007/_images/bruel41.jpg","");
INSERT INTO cms_galerien VALUES ("923","150","1","P","../../media_birchler/navi_1030008/_images/bauten1.png","");



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
INSERT INTO cms_modules VALUES ("1","PAGES_OVERVIEW","Unterseiten zur aktuellen Menuposition auflisten");
INSERT INTO cms_modules VALUES ("2","KONTAKTFORMULAR","Kontaktformular");
INSERT INTO cms_modules VALUES ("3","SITEMAP","Sitemap");



# ----------------------------------------------------------
#
# Struktur von Tabelle 'cms_navigation'
#
DROP TABLE IF EXISTS cms_navigation;
CREATE TABLE cms_navigation (
    nav_id smallint(6) NOT NULL auto_increment,
    domain varchar(10),
    kap smallint(5) unsigned DEFAULT "0" NOT NULL,
    ukap smallint(5) unsigned DEFAULT "0" NOT NULL,
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
INSERT INTO cms_navigation VALUES ("41","navi_07","2","0","Über uns","Überuns","navi_07","j","n","H");
INSERT INTO cms_navigation VALUES ("44","navi_10","4","0","Energieberatung","Energieberatung","navi_10","n","n","H");
INSERT INTO cms_navigation VALUES ("51","navi_12","1","0","Home","Home","navi_12","j","j","H");
INSERT INTO cms_navigation VALUES ("52","navi_14","7","0","Impressum","Impressum","navi_14","j","n","H");
INSERT INTO cms_navigation VALUES ("53","navi_11","3","0","Bauten","Bauten","navi_11","j","n","H");
INSERT INTO cms_navigation VALUES ("54","navi_13","5","0","Kontakt","Kontakt","navi_13","j","n","H");
INSERT INTO cms_navigation VALUES ("55","navi_11","3","120","Siedlung Lincoln","SiedlungLincoln","navi_11_10","j","n","");
INSERT INTO cms_navigation VALUES ("56","navi_056","6","0","Links","Links","navi_056","j","n","H");
INSERT INTO cms_navigation VALUES ("57","navi_11","3","100","Kirchgemeindehaus","Kirchgemeindehaus","navi_11_20","j","n","");
INSERT INTO cms_navigation VALUES ("58","navi_11","3","130","MFH Linsi Thalwil","MFHLinsiThalwil","navi_11_30","j","n","");
INSERT INTO cms_navigation VALUES ("61","navi_11","3","170","ZFH Reckholdern","ZFHReckholdern","navi_11_60","j","n","");
INSERT INTO cms_navigation VALUES ("62","navi_11","3","190","MFH Hirschi Schwyz","MFHHirschiSchwyz","navi_11_70","j","n","");
INSERT INTO cms_navigation VALUES ("63","navi_11","3","160","ZFH Ruhstaller","ZFHRuhstaller","navi_11_80","j","n","");
INSERT INTO cms_navigation VALUES ("64","navi_11","3","150","ZFH Laschkolnig Clark","ZFHLaschkolnigClark","navi_11_90","j","n","");
INSERT INTO cms_navigation VALUES ("66","navi_11","3","140","Selgis Brücke Muotathal","SelgisBrückeMuotath","navi_11_110","j","n","");
INSERT INTO cms_navigation VALUES ("67","navi_11","3","90","Musikhaus Kloster Einsiedeln","MusikhausKlosterEins","navi_11_120","j","n","");
INSERT INTO cms_navigation VALUES ("68","navi_11","3","80","EFH Egli","EFHEgli","navi_11_130","j","n","");
INSERT INTO cms_navigation VALUES ("69","navi_11","3","60","Friedhof Einsiedeln","FriedhofEinsiedeln","navi_11_140","j","n","");
INSERT INTO cms_navigation VALUES ("70","navi_11","3","50","MFH Genossame Dorf Binzen","MFHGenossameDorfBinz","navi_11_150","j","n","");
INSERT INTO cms_navigation VALUES ("71","navi_11","3","40","EFH Schuler","EFHSchuler","navi_11_160","j","n","");
INSERT INTO cms_navigation VALUES ("72","navi_11","3","20","EFH und Praxis Bühler","EFHundPraxisBühler","navi_11_170","j","n","");
INSERT INTO cms_navigation VALUES ("73","navi_11","3","10","Wohnung Baumann","WohnungBaumann","navi_11_180","j","n","");
INSERT INTO cms_navigation VALUES ("74","navi_11","3","70","Garten Staub","GartenStaub","navi_11_190","j","n","");
INSERT INTO cms_navigation VALUES ("76","navi_11","3","180","ZFH Luegeten","ZFHLuegeten","navi_11_210","j","n","");
INSERT INTO cms_navigation VALUES ("79","navi_11","3","30","Aufstockung ZFH Kälin","AufstockungZFHKälin","navi_11_220","j","n","");
INSERT INTO cms_navigation VALUES ("80","navi_11","3","110","Schulhaus Brüel Einsiedeln","SchulhausBrüelEinsi","navi_11_220","j","n","");
INSERT INTO cms_navigation VALUES ("82","navi_11","3","200","MFH STWEG Matter","MFHSTWEGMatter","navi_11_230","j","n","");
INSERT INTO cms_navigation VALUES ("83","navi_11","3","210","Überbauung Familia","ÜberbauungFamilia","navi_11_240","j","n","");
INSERT INTO cms_navigation VALUES ("84","navi_11","3","220","EFH Zehnder","EFHZehnder","navi_11_250","j","n","");
INSERT INTO cms_navigation VALUES ("85","navi_11","3","240","EFH Platzi","EFHPlatzi","navi_11_240","j","n","");
INSERT INTO cms_navigation VALUES ("86","navi_11","3","230","EFH Lombard","EFHLombard","navi_11_230","j","n","");
INSERT INTO cms_navigation VALUES ("103","navi_103","8","0","Bauten 2","Bauten2","navi_103","j","n","H");
INSERT INTO cms_navigation VALUES ("104","navi_103","8","10","Einfamilienhäuser","Einfamilienhäuser","navi_103_10","j","n","");
INSERT INTO cms_navigation VALUES ("105","navi_103","8","20","Mehrfamilienhäuser","Mehrfamilienhäuser","navi_103_20","j","n","");
INSERT INTO cms_navigation VALUES ("106","navi_103","8","30","Öffentliche Bauten","ÖffentlicheBauten","navi_103_30","j","n","");



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
INSERT INTO cms_pages VALUES ("143","104","navi_103","navi_1030001","EFH und Praxis B&#252;hler","Einfamilienhäuser","0000-00-00 00:00:00","0000-00-00 00:00:00","Das Terrassenhaus aus den 60-er Jahren an der Oberen Sihleggstrasse 
in Schindellegi erfordete eine gründliche Sanierung, energetisch und 
im Ausbau.","<p>Das Terrassenhaus aus den 60-er Jahren an der Oberen Sihleggstrasse in Schindellegi erfordete eine gründliche Sanierung, energetisch und im Ausbau. Eine sehr gute Aussendämmung und entsprechende Fenster rückten die Energieschleuder in die Nähe des Minergiestandardes und erlaubten den Einbau einer kleinen Erdsondenwärmepumpe. Die Qualität des Grundrisses wurde beibehalten und mit präzisen Eingriffen und einem hochwertigen Ausbau versehen. Damit entspricht die Wohnung wieder der sehr attraktiven Wohnlage.</p>","","12","../../media_birchler/navi_1030001/_thumbs/th_ag690roh3.jpg","","b","0","0","j","1");
INSERT INTO cms_pages VALUES ("144","104","navi_103","navi_1030002","EFH Zehnder","Einfamilienhäuser","0000-00-00 00:00:00","0000-00-00 00:00:00","Das Einfamilienhaus steht im ländlichen Raum an der Strasse von Einsiedeln nach Alpthal. Es ist ein Massanzug für einen Zwei-Personen-Haushalt...","<p>Das Einfamilienhaus steht im ländlichen Raum an der Strasse von Einsiedeln nach Alpthal. Es ist ein Massanzug für einen Zwei-Personen-Haushalt mit nachhaltiger Energieversorgung: Stöckholzheizung, 11 m2 Sonnenkollektoren und 11.5 kWp PV-Anlage.<br />Das Gebäude wurde in Massivbauweise errichtet und mit Eternit bekleidet. Der rohe Beton dominiert zusammen mit dem Holzboden den Wohnraum. Der hochwertige Ausbau kontrastiert mit der bescheidenen äusseren Erscheinung des Hauses.</p>","","11","../../media_birchler/navi_1030002/_thumbs/th_img7613.jpg","","b","0","0","j","2");
INSERT INTO cms_pages VALUES ("145","104","navi_103","navi_1030003","EFH Lombard","Einfamilienhäuser","0000-00-00 00:00:00","0000-00-00 00:00:00","EFH Lombard
","<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>","","13","../../media_birchler/navi_1030003/_thumbs/th_img7441.jpg","","b","0","0","j","3");
INSERT INTO cms_pages VALUES ("146","104","navi_103","navi_1030004","EFH Platzi","Einfamilienhäuser","0000-00-00 00:00:00","0000-00-00 00:00:00","EFH Platzi","<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>","","11","../../media_birchler/navi_1030004/_thumbs/th_img7315.jpg","","b","0","0","j","4");
INSERT INTO cms_pages VALUES ("147","105","navi_103","navi_1030005","Siedlung Lincoln","Mehrfamilienhäuser","0000-00-00 00:00:00","0000-00-00 00:00:00","Die Siedlung Lincoln liegt nordöstlich vom Ortskern Einsiedeln in einer lockeren Baustruktur. Die Erschliessung vom Lincolnweg in die Tiefe ...","<p>Die Siedlung Lincoln liegt nordöstlich vom Ortskern Einsiedeln in einer lockeren Baustruktur. Die Erschliessung vom Lincolnweg in die Tiefe des Grundstückes gleicht der bestehenden Ordnung, ebenso das Höhenniveau der neuen Gebäude. Die Siedlung vereint 6 Reiheneinfamilienhäuser und ein Mehrfamilienhaus mit 7 Wohnungen. In der grossen Gesamtform finden 13 verschieden grosse und massgeschneiderte Wohnungen Platz. Die verdichtete Bauweise erlaubt eine Differenzierung des Aussenraums in kleinere private und grosszügige halböffentliche Freiflächen. Die Gebäudestruktur richtet sich in einer NO/SW Lage aus. Die Gebäude werden über die Nordostseite erschlossen, was eine Anordnung der privaten Gärten auf der Südwestseite erlaubt, mit Blick auf das Kloster, den Ort Einsiedeln und in das Alpthal. Die Häuser wurden in Massivbauweise errichtet und mit einer Holzschalung bekleidet. Raumhohe Fensteröffnungen gestalten die Fassade.</p>","","11","../../media_birchler/navi_1030005/_thumbs/th_lincoln03.jpg","","b","0","0","j","1");
INSERT INTO cms_pages VALUES ("148","106","navi_103","navi_1030006","Kirchgemeindehaus","Öffentliche_Bauten","0000-00-00 00:00:00","0000-00-00 00:00:00","Die evangelisch-reformierte Kirchgemeinde Einsiedeln ist eine Diasporagemeinde und eine der wenigen Kirchgemeinden, deren Mitgliederzahl wächst...","<p>Die evangelisch-reformierte Kirchgemeinde Einsiedeln ist eine Diasporagemeinde und eine der wenigen Kirchgemeinden, deren Mitgliederzahl kontinuierlich wächst. Dies führt zu weiterem Raumbedarf. Aus Kostengründen musste der Bau eines neuen Kirchgemeindezentrums mit grosszügigem Saal aufgegeben werden. Mit dem Anbau eines Kirchgemeindehauses an die Kirche, wurden deren Nutzungs-Möglichkeiten optimiert und für die Jugend und den Unterricht zusätzliche Räume geschaffen. Die Anordnung der Küche auf dem Niveau des Festplatzes und der Kirche, eine Erweiterungsmöglichkeit der Kirche und eine vollständige Behinderten-Gängigkeit waren von Priorität. Die Kirche steht unter Denkmalschutz und konnte in ihrer Substanz erhalten werden. Zusammen mit dem Pfarrhaus und dem Neubau bildet sie um einen attraktiven Innenhof ein Ensemble. Auf drei unterschiedlichen Niveaus befinden sich der Vorplatz, der Pfarrgarten und der Festplatz der Kirche. Die in der Mitte gelegene Kirche behält ihre dominierende Stellung und wird mit dem neuen Zugang vom Schlüsselmattweg aufgewertet.<br />Im ersten Geschoss des Neubaus sind die Jugendräume angeordnet. Im zweiten befinden sich die Unterrichtsräume in verschiedenen Grössen. Der grösste Raum dient als Cafeteria, Kirchgemeindesaal und Erweiterung der Kirche.</p>","","11","../../media_birchler/navi_1030006/_thumbs/th_unbenannt1.jpg","","b","0","0","j","1");
INSERT INTO cms_pages VALUES ("149","106","navi_103","navi_1030007","Schulhaus Br&#252;hl Einsiedeln","Öffentliche_Bauten","0000-00-00 00:00:00","0000-00-00 00:00:00","Das Schulhaus Brüel ist das grosszügigste profane Gebäude in der Umgebung von Einsiedeln. Es dokumentiert eindrücklich die Bedeutung der Volksschule..","<p>Das Schulhaus Brüel ist das grosszügigste profane Gebäude in der Umgebung von Einsiedeln. Es dokumentiert eindrücklich die Bedeutung der Volksschule im ausgehenden 19. Jahrhundert. Aufgrund der grosszügigen räumlichen Konzeption und der, in seiner Grundstruktur sehr guten Bausubstanz kann dieses Haus der Schule durchaus weitere 100 Jahre dienen. 34 Jahre nach der letzten Gesamtsanierung wurde das Haus sanft renoviert und in Bezug auf die schulischen Einrichtungen modernisiert. Dach, Fassade, Treppenhaus und Aula wurden in enger Zusammenarbeit mit der Denkmalpflege nahe der historischen Fassung restauriert. Die Schulzimmer wurden gemäss den Bedürfnissen der Schule erneuert, d.h. mit Akustikdecken und zeitgemässen Einrichtungen versehen. Die grossen Korridore wurden mit einer Glaswand vom Treppenhaus abgetrennt und dienen nun nicht nur als Garderobe, sondern auch als Gruppenraum für die zwei dahinter liegenden Schulzimmer. Die Gruppenräume bilden den Übergang vom historischen Treppenhaus zu den modernen Schulzimmern. Mit dem Einbau eines Liftes wurde das gesamte Schulhaus rollstuhlgängig.</p>","","11","../../media_birchler/navi_1030007/_thumbs/th_bruel61.jpg","","b","0","0","j","2");
INSERT INTO cms_pages VALUES ("150","104","navi_103","navi_1030008","EFH Einsiedeln","Einfamilienhäuser","2017-02-01 00:00:00","2017-12-31 00:00:00","Einfamilienhaus in Einsiedeln, erbaut nach dem Minergiestandard","<p>Die Vermietung der Wohnungen wurde schwieriger und gelang nur mit dem Versprechen, eine Küche zu sanieren. Daraus ergab sich der Ersatz aller Küchen und Bäder und eine energetische Sanierung im Minergie-Standard. Mit gezielten Eingriffen wurden Verbesserungen angebracht, ohne die Grundrisse mit dem idealen Wohnungsmix zu verändern. Das enge und dunkle Treppenhaus wurde bis auf die Fassadenflucht mit verglasten Podesten erweitert und mit grossen Fenstern geöffnet. Den giebelseitigen Wohnungen wurde ein Estrichraum zugeschlagen. In der strassenseitigen 4-1/2-Zimmer-Wohnung in Form eines zusätzlichen Zimmers, in der seeseitigen 5-1/2-Zimmer mit einer Galerie. Die Küchen der grossen Wohnungen wurden zum Korridor hin geöffnet und mit einer breiten Schiebetür versehen, was beiden Räumen Weite und Tageslicht bringt. Generell sollte die äussere Erscheinung etwa gleich bleiben, um zusammen mit zwei gleichzeitig erbauten</p>","","12","../../media_birchler/navi_1030008/_thumbs/th_bauten1.png","","b","0","0","j","5");



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
INSERT INTO cms_redirect VALUES ("5","53","73","0","wohnung_baumann");
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
INSERT INTO cms_redirect VALUES ("21","53","64","0","zfh_laschkolnig_clar");
INSERT INTO cms_redirect VALUES ("22","53","63","0","zfh_ruhstaller");
INSERT INTO cms_redirect VALUES ("23","53","61","0","zfh_reckholdern");
INSERT INTO cms_redirect VALUES ("24","53","76","0","zfh_luegeten");
INSERT INTO cms_redirect VALUES ("25","53","62","0","mfh_hirschi_schwyz");
INSERT INTO cms_redirect VALUES ("26","44","0","0","energieberatung");
INSERT INTO cms_redirect VALUES ("27","54","0","0","kontakt");
INSERT INTO cms_redirect VALUES ("28","56","0","0","links");
INSERT INTO cms_redirect VALUES ("29","52","0","0","impressum");
INSERT INTO cms_redirect VALUES ("33","53","82","0","mfh_stweg_matter");
INSERT INTO cms_redirect VALUES ("35","53","83","0","ueberbauung_familia");
INSERT INTO cms_redirect VALUES ("36","53","84","0","efh_zehnder");
INSERT INTO cms_redirect VALUES ("37","53","85","0","efh_platzi");
INSERT INTO cms_redirect VALUES ("38","53","86","0","efh_lombard");
INSERT INTO cms_redirect VALUES ("55","103","0","0","bauten_2");
INSERT INTO cms_redirect VALUES ("56","103","104","0","einfamilienhaeuser");
INSERT INTO cms_redirect VALUES ("57","103","105","0","mehrfamilienhaeuser");
INSERT INTO cms_redirect VALUES ("58","103","104","143","efh_und_praxis_buehl");
INSERT INTO cms_redirect VALUES ("59","103","104","144","efh_zehnder");
INSERT INTO cms_redirect VALUES ("60","103","104","145","efh_lombard");
INSERT INTO cms_redirect VALUES ("61","103","104","146","efh_platzi");
INSERT INTO cms_redirect VALUES ("63","103","105","147","siedlung_lincoln");
INSERT INTO cms_redirect VALUES ("64","103","106","0","oeffentliche_bauten");
INSERT INTO cms_redirect VALUES ("65","103","106","148","kirchgemeindehaus");
INSERT INTO cms_redirect VALUES ("66","103","106","149","schulhaus_bruehl_ein");
INSERT INTO cms_redirect VALUES ("74","103","104","150","efh_einsiedeln");



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
INSERT INTO cms_seiten VALUES ("41","41","1","Über uns","","12","0","<ul>
<li></li>
<li></li>
<li></li>
<li></li>
<li><a title=\"Mail an Benjamin M�ller senden\" href=\"mailto:b.mueller@birchler-architektur.ch\">Benjamin Müller</a>, Bachelor of Arts ZFH in Architektur</li>
<li><a title=\"Mail an J�rg Reding senden\" href=\"mailto:j.reding@birchler-architektur.ch\">Jörg Reding</a>, Hochbauzeichner, Bauleiter</li>
<li><a title=\"Mail an Yannick Bellmont senden\" href=\"mailto:y.bellmont@birchler-architektur.ch\">Yannick Bellmont</a>, Lernender Zeichner EFZ Fachrichtung Architektur</li>
<li><a title=\"Mail an Marion Vetsch senden\" href=\"mailto:buero@birchler-architektur.ch\">Marion Vetsch</a>, dipl. Technikerin HF Hochbau</li>
<li><a title=\"Mail an Philipp Kl�ui senden\" href=\"mailto:p.klaeui@birchler-architektur.ch\">Philipp Kläui</a>, Zeichner EFZ Fachrichtung Architektur</li>
<li><a title=\"Mail an Ruedi Birchler senden\" href=\"mailto:r.birchler@birchler-architektur.ch\">Ruedi Birchler</a>, dipl. Architekt ETH/SIA</li>
<li><a title=\"Mail an Simon Birchler senden\" href=\"mailto:buero@birchler-architektur.ch\">Simon Birchler</a>, Praktikant</li>
<li></li>
</ul>","","../../media_birchler/navi_07/_thumbs/th_teambirchler03.jpg","n");
INSERT INTO cms_seiten VALUES ("44","44","1","Energieberatung",NULL,"12","0","","",NULL,"n");
INSERT INTO cms_seiten VALUES ("51","51","1","Home","","14","0","<p>Birchler Architektur AG<br /> Allmeindstrasse 17<br />8840 Einsiedeln<br />Telefon: 055 412 77 17<br /><br /><a href=\"mailto:info@birchler-architektur.ch\">info@birchler-architektur.ch</a></p>
<p>&nbsp;</p>
<p>&nbsp;</p>","","../../media_birchler/navi_12/_thumbs/th_home_3.png","n");
INSERT INTO cms_seiten VALUES ("52","52","1","Impressum","","12","0","<p><strong>Betreiber &amp; Inhalt </strong><br />Birchler Architektur AG, Einsiedeln<br /><a href=\"mailto:info@birchler-architektur.ch\">info@birchler-architektur.ch</a></p>
<p><a title=\"Homepage Birchler Architektur\" href=\"http://www.birchler-architektur.ch\" target=\"_blank\">www.birchler-architektur.ch<br /></a></p>
<p>&nbsp;</p>
<p><strong>Schwarz-weiss Fotos<br /></strong>Martin Linsi, Einsiedeln</p>
<p><strong><br /></strong></p>
<p><strong>Gestaltung &amp; Design<br /></strong>Marianne Mathys, Balterswil<br /><a href=\"mailto:marianne.mathys@leunet.ch\">marianne.mathys@leunet.ch</a></p>
<p><br /><strong>Programmierung<br /></strong>Roland Hempen, Z�rich <br /><a title=\"hempenweb - die kleine feine Internetagentur\" href=\"http://www.hempenweb.ch\" target=\"_blank\">www.hempenweb.ch</a></p>
<p style=\"text-align: left;\"><br /><strong>Haftungsausschluss</strong><br />Der Inhalt dieser Webseiten wird mit gr�sstm�glicher Sorgfalt gepflegt. Trotzdem wird f�r den Inhalt keine Haftung �bernommen. Druckfehler, Irrt�mer und �nderungen vorbehalten. Der Inhalt ist urheberrechtlich gesch�tzt. Das gilt sowohl f�r die Texte, als auch f�r die Bilder.<br />F�r die Inhalte externer Links �bernehmen wir keine Haftung. F�r den Inhalt der verlinkten Seiten sind ausschliesslich deren Betreiber verantwortlich.</p>
<p>&nbsp;</p>
<p>&nbsp;</p>","","../../media_birchler/navi_14/_thumbs/th_impressum_1.png","n");
INSERT INTO cms_seiten VALUES ("53","53","1","Bauten","","12","0","","","","n");
INSERT INTO cms_seiten VALUES ("54","54","1","Kontakt","","11","0","<p>Wir freuen uns �ber Ihre Kontaktaufnahme und werden uns so schnell als m�glich mit Ihnen in Verbindung setzen. Senden Sie uns Ihre Anfrage mittels untenstehendem Link.<br />Vielen Dank, Ihr Birchler-Architektur-Team</p>
<p>&nbsp;</p>
<p><span class=\"detailname\">Birchler Architektur AG</span><br /> Allmeindstrasse 17<br /> 8840 Einsiedeln</p>
<p><strong>Telefon:&nbsp; 055 412 77 17</strong></p>
<p class=\"detail_inline\"><strong>Fax:&nbsp; 055 412 54 03</strong></p>
<p>&nbsp;</p>
<p class=\"info_url\"><a title=\"Main an Birchler-Architektur\" href=\"mailto:info@birchler-architektur.ch\">info@birchler-architektur.ch</a></p>
<p><a href=\"http://www.birchler-architektur.ch\" target=\"_self\">www.birchler-architektur.ch</a></p>","","../../media_birchler/navi_13/_thumbs/th_plan_birchler.png","b");
INSERT INTO cms_seiten VALUES ("55","55","1","Siedlung Lincoln, Einsiedeln Neubau 2007","","11","0","<p style=\"text-align: left;\">Die Siedlung Lincoln liegt nordöstlich vom Ortskern Einsiedeln in einer lockeren Baustruktur. Die Erschliessung vom Lincolnweg in die Tiefe des Grundstückes gleicht der bestehenden Ordnung, ebenso das Höhenniveau der neuen Gebäude. Die Siedlung vereint 6 Reiheneinfamilienhäuser und ein Mehrfamilienhaus mit 7 Wohnungen. In der grossen Gesamtform finden 13 verschieden grosse und massgeschneiderte Wohnungen Platz. Die verdichtete Bauweise erlaubt eine Differenzierung des Aussenraums in kleinere private und grosszügige halböffentliche Freiflächen. Die Gebäudestruktur richtet sich in einer NO/SW Lage aus. Die Gebäude werden über die Nordostseite erschlossen, was eine Anordnung der privaten Gärten auf der Südwestseite erlaubt, mit Blick auf das Kloster, den Ort Einsiedeln und in das Alpthal. Die Häuser wurden in Massivbauweise errichtet und mit einer Holzschalung bekleidet. Raumhohe Fensteröffnungen gestalten die Fassade.</p>","","../../media_birchler/navi_11_10/_thumbs/th_lincoln04.jpg","b");
INSERT INTO cms_seiten VALUES ("56","56","1","Links","","12","0","<ul>
<li><a title=\"hempenweb die kleine feine Internetagentur\" href=\"http://www.hempenweb.ch\" target=\"_blank\">hempenweb die kleine feine Internetagentur</a></li>
</ul>","","../../media_birchler/navi_056/_thumbs/th_home_2.png","n");
INSERT INTO cms_seiten VALUES ("57","57","1","Kirchgemeindehaus","","11","0","<p>Die evangelisch-reformierte Kirchgemeinde Einsiedeln ist eine Diasporagemeinde und eine der wenigen Kirchgemeinden, deren Mitgliederzahl kontinuierlich wächst. Dies führt zu weiterem Raumbedarf. Aus Kostengründen musste der Bau eines neuen Kirchgemeindezentrums mit grosszügigem Saal aufgegeben werden. Mit dem Anbau eines Kirchgemeindehauses an die Kirche, wurden deren Nutzungs-Möglichkeiten optimiert und für die Jugend und den Unterricht zusätzliche Räume geschaffen. Die Anordnung der Küche auf dem Niveau des Festplatzes und der Kirche, eine Erweiterungsmöglichkeit der Kirche und eine vollständige Behinderten-Gängigkeit waren von Priorität. Die Kirche steht unter Denkmalschutz und konnte in ihrer Substanz erhalten werden. Zusammen mit dem Pfarrhaus und dem Neubau bildet sie um einen attraktiven Innenhof ein Ensemble. Auf drei unterschiedlichen Niveaus befinden sich der Vorplatz, der Pfarrgarten und der Festplatz der Kirche. Die in der Mitte gelegene Kirche behält ihre dominierende Stellung und wird mit dem neuen Zugang vom Schlüsselmattweg aufgewertet.<br />Im ersten Geschoss des Neubaus sind die Jugendräume angeordnet. Im zweiten befinden sich die Unterrichtsräume in verschiedenen Grössen. Der grösste Raum dient als Cafeteria, Kirchgemeindesaal und Erweiterung der Kirche.</p>","","../../media_birchler/navi_11_20/_thumbs/th_unbenannt-1.jpg","b");
INSERT INTO cms_seiten VALUES ("58","58","1","MFH Linsi Thalwil","","11","0","<p>Die Vermietung der Wohnungen wurde schwieriger und gelang nur mit dem Versprechen, eine Küche zu sanieren. Daraus ergab sich der Ersatz aller Küchen und Bäder und eine energetische Sanierung im Minergie-Standard. Mit gezielten Eingriffen wurden Verbesserungen angebracht, ohne die Grundrisse mit dem idealen Wohnungsmix zu verändern. Das enge und dunkle Treppenhaus wurde bis auf die Fassadenflucht mit verglasten Podesten erweitert und mit grossen Fenstern geöffnet. Den giebelseitigen Wohnungen wurde ein Estrichraum zugeschlagen. In der strassenseitigen 4-1/2-Zimmer-Wohnung in Form eines zusätzlichen Zimmers, in der seeseitigen 5-1/2-Zimmer mit einer Galerie. Die Küchen der grossen Wohnungen wurden zum Korridor hin geöffnet und mit einer breiten Schiebetür versehen, was beiden Räumen Weite und Tageslicht bringt. Generell sollte die äussere Erscheinung etwa gleich bleiben, um zusammen mit zwei gleichzeitig erbauten Nachbargebäuden weiterhin ein Ensemble zu bilden, ohne jedoch die Modernisierung zu verstecken. Das in seiner Grundsubstanz solide und gut erhaltene Gebäude wurde mit einer 18cm dicken verputzten Mineralwolldämmung versehen. Die schmalen und auskragenden Balkone wurden abgefräst und auf der Südseite mit neuen, grösseren ersetzt. Es wurden neue Monobloc-Fenster eingesetzt, welche bei optimaler Dämmung von Leibung und Rahmen keinen Glaslichtverlust bringen. <br />Zum Minergie-Standard gehört auch die Komfortlüftung, die an der Zürcherstrasse auch aus Schallschutzgründen sinnvoll ist. Das Lüftungsgerät ist im Estrich platziert, die Abluft wird über teils alte, teils neue Kanäle aus den Nasszellen geführt. Die Zuluft wird über die Fassade in die Schlaf- und Wohnräume geblasen. Das Gebäude wurde im Betrieb, das heisst ohne Umzug der Bewohner saniert.</p>","","../../media_birchler/navi_11_30/_thumbs/th_linsi_aussenansicht.jpg","b");
INSERT INTO cms_seiten VALUES ("61","61","1","ZFH Reckholdern","","11","0","","","../../media_birchler/navi_11_60/_thumbs/th_nord-west.jpg","b");
INSERT INTO cms_seiten VALUES ("62","62","1","MFH Hirschi Schwyz","","11","0","","","../../media_birchler/navi_11_70/_thumbs/th_dsc00038.jpg","b");
INSERT INTO cms_seiten VALUES ("63","63","1","ZFH Ruhstaller","","11","0","","","../../media_birchler/navi_11_80/_thumbs/th_0109262.jpg","b");
INSERT INTO cms_seiten VALUES ("64","64","1","ZFH Laschkolnig Clark","","11","0","","","../../media_birchler/navi_11_90/_thumbs/th_dsc_0192.jpg","b");
INSERT INTO cms_seiten VALUES ("66","66","1","Selgis Brücke Muotathal","","11","0","","","../../media_birchler/navi_11_110/_thumbs/th_69570020.jpg","b");
INSERT INTO cms_seiten VALUES ("67","67","1","Musikhaus Kloster Einsiedeln","","11","0","","","../../media_birchler/navi_11_120/_thumbs/th_4155-19.jpg","b");
INSERT INTO cms_seiten VALUES ("68","68","1","EFH Egli","","11","0","","","../../media_birchler/navi_11_130/_thumbs/th_ag-673_2_b.jpg","b");
INSERT INTO cms_seiten VALUES ("69","69","1","Friedhof Einsiedeln","","11","0","","","../../media_birchler/navi_11_140/_thumbs/th_ag-674_1_b.jpg","b");
INSERT INTO cms_seiten VALUES ("70","70","1","MFH Genossame Dorf Binzen","","11","0","","","../../media_birchler/navi_11_150/_thumbs/th_ag-674_6_b.jpg","b");
INSERT INTO cms_seiten VALUES ("71","71","1","EFH Schuler","","11","0","","","../../media_birchler/navi_11_160/_thumbs/th_ag-792_6_aussicht.jpg","b");
INSERT INTO cms_seiten VALUES ("72","72","1","EFH und Praxis Bühler","","11","0","<p>Für den Neubau des Wohnhauses mit biologischer Praxis kam nur eine weitgehend biologische Bauweise in Frage. Gewählt wurde eine leimfreie Massivholzkonstruktion in Appenzellerholz, gedämmt mit Holzfaserdämmung und verkleidet mit unbehandelter Douglasienschalung. Auch die inneren Boden- und Wandverkleidungen sind in Holz und Linoleum ausgeführt. Beheizt wird das Gebäude mit einem zentralen Holzspeicherofen und Sonnenkollektoren. Abwechslungsreiche Aussenräume im Garten und auf den Terrassen ergänzen die Innenräume.</p>","","../../media_birchler/navi_11_170/_thumbs/th_ag_700_roh3.jpg","b");
INSERT INTO cms_seiten VALUES ("73","73","1","Wohnung Baumann","","11","0","<p>Das Terrassenhaus aus den 60-er Jahren an der Oberen Sihleggstrasse in Schindellegi erfordete eine gründliche Sanierung, energetisch und im Ausbau. Eine sehr gute Aussendämmung und entsprechende Fenster rückten die Energieschleuder in die Nähe des Minergiestandardes und erlaubten den Einbau einer kleinen Erdsondenwärmepumpe. Die Qualität des Grundrisses wurde beibehalten und mit präzisen Eingriffen und einem hochwertigen Ausbau versehen. Damit entspricht die Wohnung wieder der sehr attraktiven Wohnlage.</p>","","../../media_birchler/navi_11_180/_thumbs/th_schindellegiwohnzimmerkl.jpg","b");
INSERT INTO cms_seiten VALUES ("74","74","1","Garten Staub","","11","0","","","../../media_birchler/navi_11_190/_thumbs/th_ag-694_7_b.jpg","b");
INSERT INTO cms_seiten VALUES ("76","76","1","ZFH Luegeten","","11","0","","","../../media_birchler/navi_11_210/_thumbs/th_00031.jpg","b");
INSERT INTO cms_seiten VALUES ("79","79","1","Aufstockung ZFH Kälin","","11","0","","","../../media_birchler/navi_11_220/_thumbs/th_dsc00024.jpg","b");
INSERT INTO cms_seiten VALUES ("80","80","1","Schulhaus Brüel Einsiedeln","","11","0","<p>Das Schulhaus Brüel ist das grosszügigste profane Gebäude in der Umgebung von Einsiedeln. Es dokumentiert eindrücklich die Bedeutung der Volksschule im ausgehenden 19. Jahrhundert. Aufgrund der grosszügigen räumlichen Konzeption und der, in seiner Grundstruktur sehr guten Bausubstanz kann dieses Haus der Schule durchaus weitere 100 Jahre dienen. 34 Jahre nach der letzten Gesamtsanierung wurde das Haus sanft renoviert und in Bezug auf die schulischen Einrichtungen modernisiert. Dach, Fassade, Treppenhaus und Aula wurden in enger Zusammenarbeit mit der Denkmalpflege nahe der historischen Fassung restauriert. Die Schulzimmer wurden gemäss den Bedürfnissen der Schule erneuert, d.h. mit Akustikdecken und zeitgemässen Einrichtungen versehen. Die grossen Korridore wurden mit einer Glaswand vom Treppenhaus abgetrennt und dienen nun nicht nur als Garderobe, sondern auch als Gruppenraum für die zwei dahinter liegenden Schulzimmer. Die Gruppenräume bilden den Übergang vom historischen Treppenhaus zu den modernen Schulzimmern. Mit dem Einbau eines Liftes wurde das gesamte Schulhaus rollstuhlgängig.</p>","","../../media_birchler/navi_11_220/_thumbs/th_brel61.jpg","b");
INSERT INTO cms_seiten VALUES ("82","82","1","MFH STWEG Matter","","11","0","<p>Der Neubau im Zentrum von Einsiedeln, zwischen Zürichstrasse und der Alp, bildet den Übergang von Wohn- zu Industriezone. Die umliegenden Satteldachhäuser werden von grösseren Strukturen abgelöst, bis hin zu den Hallen der ehemaligen Ziegelei.<br />Das bestehende Haus wurde abgebrochen. Der Neubau hat eine Nord/Süd Ausrichtung und wird über die Zürichstrasse erschlossen. Das Gebäude bietet Platz für fünf Parteien. Füderselben Familie einziehen werden. Das Gemeinschaftliche war ein Anliegen von Bauherrschaft und Architekt. Der Gemeinschaftsraum mit Küche im Erdgeschoss bildet den Kern. Er wird von allen Bewohnern genutzt und es lässt sich zusätzlich der Eingangsbereich dazu schalten, so entsteht ein grosszügiger Raum für verschiedenste Anlässe. Weitere Räume wie Werkraum, Sauna, Fitnessraum und Waschküche werden von den Bewohnern geteilt.<br />Die Parkplätze befinden sich in der Garage im Untergeschoss und sind mittels eines Autolifts erschlossen. Das Gebäude wurde im Massivbau erstellt und mit einer Eternitschalung verkleidet. Raumhohe Fensteröffnungen und Terrassen gestalten die Fassade. Eine Pelletheizung und Sonnenkollektoren auf dem Dach dienen als Wärmeerzeuger.</p>","","","n");
INSERT INTO cms_seiten VALUES ("83","83","1","Überbauung Familia","","11","0","","","","b");
INSERT INTO cms_seiten VALUES ("84","84","1","EFH Zehnder","","11","0","<p>Das Einfamilienhaus steht im ländlichen Raum an der Strasse von Einsiedeln nach Alpthal. Es ist ein Massanzug für einen Zwei-Personen-Haushalt mit nachhaltiger Energieversorgung: Stöckholzheizung, 11 m2 Sonnenkollektoren und 11.5 kWp PV-Anlage.<br />Das Gebäude wurde in Massivbauweise errichtet und mit Eternit bekleidet. Der rohe Beton dominiert zusammen mit dem Holzboden den Wohnraum. Der hochwertige Ausbau kontrastiert mit der bescheidenen äusseren Erscheinung des Hauses.</p>","","","b");
INSERT INTO cms_seiten VALUES ("85","85","1","EFH Platzi","","11","0","","","","b");
INSERT INTO cms_seiten VALUES ("86","86","1","EFH Lombard","","11","0","","","../../media_birchler/navi_11_265/_thumbs/th_img7411.jpg","b");
INSERT INTO cms_seiten VALUES ("87","87","1","Bauten_255",NULL,"1","0","","",NULL,"n");
INSERT INTO cms_seiten VALUES ("88","88","1","Bauten_265",NULL,"1","0","","",NULL,"n");
INSERT INTO cms_seiten VALUES ("89","89","1","Bauten_255",NULL,"1","0","","",NULL,"n");
INSERT INTO cms_seiten VALUES ("90","90","1","Bauten_265",NULL,"1","0","","",NULL,"n");
INSERT INTO cms_seiten VALUES ("91","91","1","Bauten_265",NULL,"1","0","","",NULL,"n");
INSERT INTO cms_seiten VALUES ("92","92","1","Bauten_265",NULL,"1","0","","",NULL,"n");
INSERT INTO cms_seiten VALUES ("93","93","1","Bauten_265",NULL,"1","0","","",NULL,"n");
INSERT INTO cms_seiten VALUES ("94","94","1","Bauten_265",NULL,"1","0","","",NULL,"n");
INSERT INTO cms_seiten VALUES ("95","95","1","Bauten_265",NULL,"1","0","","",NULL,"n");
INSERT INTO cms_seiten VALUES ("96","96","1","Bauten_265",NULL,"1","0","","",NULL,"n");
INSERT INTO cms_seiten VALUES ("97","97","1","Bauten_265",NULL,"1","0","","",NULL,"n");
INSERT INTO cms_seiten VALUES ("98","98","1","Bauten_255",NULL,"1","0","","",NULL,"n");
INSERT INTO cms_seiten VALUES ("99","99","1","Bauten_265",NULL,"1","0","","",NULL,"n");
INSERT INTO cms_seiten VALUES ("100","100","1","Bauten_265",NULL,"1","0","","",NULL,"n");
INSERT INTO cms_seiten VALUES ("101","101","1","Bauten_265",NULL,"1","0","","",NULL,"n");
INSERT INTO cms_seiten VALUES ("102","102","1","Bauten_265",NULL,"1","0","","",NULL,"n");
INSERT INTO cms_seiten VALUES ("103","103","1","Bauten 2","","13","0","","","","n");
INSERT INTO cms_seiten VALUES ("104","104","1","Einfamilienhäuser","","15","1","","","","n");
INSERT INTO cms_seiten VALUES ("105","105","1","Mehrfamilienhäuser","","15","1","","","","n");
INSERT INTO cms_seiten VALUES ("106","106","1","Öffentliche Bauten","","15","1","","","","n");



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
INSERT INTO cms_spezial VALUES ("birchler","M1","460","348",NULL);
INSERT INTO cms_spezial VALUES ("birchler","M2","480","180",NULL);
INSERT INTO cms_spezial VALUES ("birchler","M3","960","180",NULL);
INSERT INTO cms_spezial VALUES ("birchler","M4","348","348",NULL);



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
INSERT INTO cms_templates VALUES ("13","11","rb_zweispaltig_360_360_tpl.html","zweispaltig_360_360 -  1.Spalte Text, 2. Spalte Bildergalerie","348x348");
INSERT INTO cms_templates VALUES ("14","12","rb_zweispaltig_480_240_180_tpl.html","zweispaltig_480_240 -  1.Spalte oben Bild (H&ouml;he 180), unten Text, 2. Spalte leer","480x180");
INSERT INTO cms_templates VALUES ("15","13","rb_zweispaltig_480_240_348_tpl.html","zweispaltig_480_240 -  1.Spalte oben Bild (H&ouml;he 348), unten Text, 2. Spalte leer","460x348");
INSERT INTO cms_templates VALUES ("18","14","rb_einspaltig_960_tpl.html","einspaltig_960 - oben ganze Breite Bild, unten Text","960x180");
INSERT INTO cms_templates VALUES ("19","15","rb_einspaltig_760v_tpl.html","einspaltig_760_tpl - links Kurztexte rechts max. 2 Thumbnails","98x98");



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


