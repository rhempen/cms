/*  =========================================================
Suckerfish Dropdown - JavaScript für IE6 
Quelle: http://htmldog.com/articles/suckerfish/dropdowns/
Datei: suckerfish.js
Autor: Patrick Griffiths (aka HTML Dog)
========================================================== */
sfHover = function() {
   var sfEls = document.getElementById("servicenavigation").getElementsByTagName("LI");
   for (var i=0; i<sfEls.length; i++) {
      sfEls[i].onmouseover=function() {
         this.className+=" sfhover";
      }
      sfEls[i].onmouseout=function() {
        this.className=this.className.replace(new RegExp(" sfhover\\b"), "");
      }
   }
}
if (window.attachEvent) window.attachEvent("onload", sfHover);
