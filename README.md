anglerfish
==========

潮汐データyaml作成スクリプト
=========

```
var d=document;var s=document.createElement("script");s.type="text/javascript";s.src="http://code.jquery.com/jquery-1.11.0.min.js";d.getElementsByTagName('head')[0].appendChild(s);
var region='', pref='', port='', regionid=1, prefid=1, portid=1;
$('ul.area > li > a').each(function(){
    region += '- id: '+regionid+'<br/>';
    region += '  name: '+$(this).text()+'<br/>';

    $(this).parent().find('ul.pref > li > a').each(function(index_pref){
        pref += '- id: '+prefid+'<br/>';
        pref += '  region_id: '+regionid+'<br/>';
        pref += '  name: '+$(this).text()+'<br/>';

        $(this).parent().find('ul.port > li > a').each(function(index_port){
            port += '- id: '+portid+'<br/>';
            port += '  pref_id: '+prefid+'<br/>';
            port += '  name: '+$(this).text()+'<br/>';

            portid++;
        });

        prefid++;
    });

    regionid++;
});
var r = $('<div style="position:absolute;top:0;left:0;z-index:999999;width:100%;background-color:white;"/>');
$('body').append(r);
r.html('<pre>'+region + pref + port+'</pre>');
```
