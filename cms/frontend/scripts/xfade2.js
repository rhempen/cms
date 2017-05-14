/*****

Image Cross Fade Redux
Version 1.0
Last revision: 02.15.2006
steve@slayeroffice.com

Please leave this notice intact. 

Rewrite of old code found here: http://slayeroffice.com/code/imageCrossFade/index.html


*****/


window.addEventListener?window.addEventListener("load",so_init,false):window.attachEvent("onload",so_init);

var d=document, imgs=new Array(), imgs1=new Array(), imgs2=new Array(), zInterval = null, current=0, pause=false;

function so_init() {
	if (!d.getElementById("imageContainer1")) return;

	imgs1 = d.getElementById("imageContainer1").getElementsByTagName("img");
	if (imgs1.length == 0) return;
	
	for(i=1;i<imgs1.length;i++) imgs1[i].xOpacity = 0;
	imgs1[0].style.display = "block";
	imgs1[0].xOpacity = .99;
	setTimeout(so_xfade1,5000);
	
//	imgs2 = d.getElementById("imageContainer2").getElementsByTagName("img");
//	for(i=1;i<imgs2.length;i++) imgs2[i].xOpacity = 0;
//	imgs2[0].style.display = "block";
//	imgs2[0].xOpacity = .99;	
//	setTimeout(so_xfade2,1000);
}

function so_xfade1(inp) {
	cOpacity = imgs1[current].xOpacity;
	nIndex = imgs1[current+1]?current+1:0;

	nOpacity = imgs1[nIndex].xOpacity;
	
	cOpacity-=.05; 
	nOpacity+=.05;
	
	imgs1[current].xOpacity = cOpacity;
	imgs1[nIndex].xOpacity = nOpacity;
	
	setOpacity(imgs1[current]); 
	setOpacity(imgs1[nIndex]);
	
	if(cOpacity<=0) {
    imgs1[current].style.display = "none";
		current = nIndex;
		setTimeout(so_xfade1,5000);
	} else {
   	imgs1[nIndex].style.display = "block";
		setTimeout(so_xfade1,50);
	}
}

function so_xfade2() {
	cOpacity = imgs2[current].xOpacity;
	nIndex = imgs2[current+1]?current+1:0;

	nOpacity = imgs2[nIndex].xOpacity;
	
	cOpacity-=.05; 
	nOpacity+=.05;
	
	imgs2[current].xOpacity = cOpacity;
	imgs2[nIndex].xOpacity = nOpacity;
	
	setOpacity(imgs2[current]); 
	setOpacity(imgs2[nIndex]);
	
	if(cOpacity<=0) {
    imgs2[current].style.display = "none";
		current = nIndex;
		setTimeout(so_xfade2,4000);
	} else {
   	imgs2[nIndex].style.display = "block";
		setTimeout(so_xfade2,50);
	}
}

function setOpacity(obj) {
		if(obj.xOpacity>.99) {
			obj.xOpacity = .99;
			return;
		}
		obj.style.opacity = obj.xOpacity;
		obj.style.MozOpacity = obj.xOpacity;
		obj.style.filter = "alpha(opacity=" + (obj.xOpacity*100) + ")";
}
	
