// JavaScript Document
<!--//--><![CDATA[//><!--

// Root-Verzeichnis des CMS aus dem pathname ermitteln
var base_url;
var main_css;
var cms			= splitPathname();
var werte		= new werteListe(location.search);
var mediadir = mediaDir(werte['dir']);

// den Pfad richtig aufbauen
function splitPathname() {
	var cms = "";
	var path = location.pathname.split("/");
	for (var i=0; i<=path.length; i++) {
		if (!path[i].match(/cmsadmin/) && !path[i].match(/index/)) {
			cms = cms + path[i] + "/";
		} else {
			break;
		}
	}
	return cms;
}
// anhand GET-Parameter die base_url bestimmen
function werteListe (querystring) {
  if (querystring == '') return;
  var wertestring = querystring.slice(1);
  var paare = wertestring.split("&");
  var paar, name, wert;
  for (var i=0; i<paare.length;i++) {
    paar = paare[i].split("=");
    name = paar[0];
    wert = paar[1];
    name = unescape(name).replace("+", " ");
    wert = unescape(wert).replace("+", " ");
    this[name] = wert;
  }
}
// den MEDIA-Verzeichnisnamen herauslösen
function mediaDir(pfad) {
	var pfade	= pfad.split('/');
	for (var j=0; j<pfade.length; j++) {
		if (pfade[j].match(/media/)) {
			var mediadir = pfade[j];
			break;
		}
	} 
	if (mediadir == '') { mediadir = 'media_hempenweb'; }
	return mediadir;
}

//base_url = cms + 'media_hempenweb';
base_url = cms + mediadir;
main_css = cms + 'cmsadmin/css/cms_tinymce.css';
//alert(main_css);

tinyMCE.init ({
  /* mode : "textareas", */
  languages : "de",
  mode : "exact",
  elements: "longtxt, longtxt2, frgcontent",
  theme : "advanced",
  height : "250",
  dialog_type : "window",
  inline_styles : true,
  remove_linebreaks : false,
  force_br_newlines : true,
  force_p_newlines : false,
  force_hex_style_colors : true,
  convert_fonts_to_spans : true,
  apply_source_formatting : true,
  theme_advanced_resizing : true,
  theme_advanced_resize_horizontal : false,
  theme_advanced_resizing_use_cookie : false,
  event_elements : "a,div,h1,h2,h3,h4,h5,h6,img,p,span",
  font_size_style_values : "xx-small,x-small,small,medium,large,x-large,xx-large",
  save_enablewhendirty : true,
  entities : "160,nbsp,60,lt,62,gt",
  content_css : main_css,
  remove_trailing_nbsp : true,
  document_base_url : base_url,
  relative_urls : false, 
//  plugins : "autosave,contextmenu,emotions,save,searchreplace,visualchars,advimage,fullscreen,table",
  plugins : "contextmenu,fullscreen,searchreplace,table,advimage,paste,preview,imagemanager,ibrowser,imanager",
  theme_advanced_more_colors : false,
  theme_advanced_toolbar_location : "top",
  theme_advanced_toolbar_align : "left",
  theme_advanced_statusbar_location : "bottom",
  theme_advanced_source_editor_width : "700",
  /* theme_advanced_resizing : true,*/
  theme_advanced_blockformats : "a,p,h1,h2,h3",
//  theme_advanced_buttons1 : "formatselect,separator,forecolor,backcolor,separator,bold,italic,underline,separator,justifyleft,justifycenter,justifyright,justifyfull,separator,bullist,numlist,separator,outdent,indent",
  theme_advanced_buttons1 : ",newdocument,fullscreen,separator,cut,copy,pastetext,pasteword,separator,formatselect,separator,bold,italic,underline,separator,justifyleft,justifycenter,justifyright,justifyfull,separator,bullist,numlist,separator,outdent,indent,separator,cleanup",
//  theme_advanced_buttons2 : "newdocument,separator,fullscreen,separator,anchor,separator,link,unlink,separator,sub,sup,separator,charmap,separator,undo,redo,separator,search,replace,separator,visualchars,removeformat,separator,cleanup,code",
  theme_advanced_buttons2 : "anchor,separator,link,unlink,separator,charmap,separator,undo,redo,separator,search,replace,separator,tablecontrols,separator,image,insertimage,code",
//  theme_advanced_buttons3 : "separator,insertimage,separator,ibrowser,separator,imanager,separator",
  theme_advanced_buttons3 : "",
  debug : false
});
//--><!]]>
