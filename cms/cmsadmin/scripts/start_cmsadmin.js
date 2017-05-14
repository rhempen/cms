// cms - cmsadmin general Javascript functions
// Copyright (c) 2009 Roland Hempen (http://www.hempenweb.ch)
/*
richtiges Einbinden von JS in XHTML - Warum ist <![CDATA[ auskommentiert?
Dem Validator wird mitgeteilt, dass es sich im CDATA-Tag um Text (Character Data) handelt
welcher nicht als XHTML anzusehen ist. Laut DTD wird ohne diese Angabe n�mlich standardm��ig 
PCData angewandt, was f�r Parsed Character Data steht. Der Nachteil von PCDATA besteht nun darin, 
dass XHTML-Tags im Kontext validiert werden und man dadurch gen�tigt ist jedes Tag zu entwerten 
(z.B. per Umschreibung als &lt; f�r "<" oder per Escapen der Zeichen mit einem Backslash (\). 
Diese Entwertung entf�llt bei der Angabe als CDATA und validiert einwandfrei.
Da nun aber einige �ltere Browser dieses Tag nicht verstehen (und Javascript-Fehler werfen) wird es 
f�r sie einfach auskommentiert. Das Dokument validiert wie gehabt, da die Kommentarzeichen f�r den 
Validator keine Bedeutung haben, und auch �ltere Browser die XHTML nicht verstehen und alles als 
HTML parsen, interpretieren das Javascript korrekt.
*/

// <![CDATA[

function logincheck() {
	md5pw = hex_md5(document.forms["generalForm"].elements["password"].value);
	document.forms["generalForm"].elements["pwcode"].value = md5pw;
	return true;
}

function frame_buster() {
	if (top.location != self.location) {
		top.location.href = './index.php?act=login';
	}
}

function start_form(action) {
	var act = action.toUpperCase();
	if (document.getElementById('pwcode')) {
		md5pw = hex_md5(document.forms["generalForm"].elements["password"].value);
		document.getElementById('pwcode').value = md5pw;
	}
	document.getElementById('act').value=act;
	document.generalForm.submit();	
}

function show_hide(id) {
	switch (id) {
		case 'change':
			document.getElementById('change').style.display='inline';
			document.getElementById('login').style.display='none';
			document.getElementById('forgot').style.display='none';
			break;
		case 'forgot':
			document.getElementById('forgot').style.display='inline';
			document.getElementById('login').style.display='none';
			document.getElementById('change').style.display='none';
			break;
		default:
			document.getElementById('login').style.display='inline';
			document.getElementById('change').style.display='none';
			document.getElementById('forgot').style.display='none';
			break;		
	}
	if (document.getElementById('msg')) document.getElementById('msg').style.display='none';
}

//]]>
