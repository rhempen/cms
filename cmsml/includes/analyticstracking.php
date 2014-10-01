<?php
/*
 * Google-Analytics Include-File
 * created by hempenweb.ch 
 * Author: Roland Hempen
 * CreationDate: 02.02.2013
 * 
 */


 $tpl->setCurrentBlock('googleAnalytics');
 ?>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-38189179-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

<?php
  $tpl->parseCurrentBlock();
?>