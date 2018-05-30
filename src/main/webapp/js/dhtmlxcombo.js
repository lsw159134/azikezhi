/*
Product Name: dhtmlxCombo 
Version: 5.1.0 
Edition: Standard 
License: content of this file is covered by DHTMLX Commercial or enterpri. Usage outside GPL terms is prohibited. To obtain Commercial or Enterprise license contact sales@dhtmlx.com
Copyright UAB Dinamenta http://www.dhtmlx.com
*/

if(typeof(window.dhx)=="undefined"){
	window.dhx=window.dhx4={
			version:"5.1.0",skin:null,skinDetect:function(a){
				var b=Math.floor(dhx4.readFromCss(a+"_skin_detect")/10)*10;
				return{10:"dhx_skyblue",20:"dhx_web",30:"dhx_terrace",40:"material"}[b]||null
			},readFromCss:function(c,d,e){
				var b=document.createElement("DIV");
				b.className=c;
				if(document.body.firstChild!=null){
					document.body.insertBefore(b,document.body.firstChild)
				}else{
					document.body.appendChild(b)
				}if(typeof(e)=="string"){b.innerHTML=e}
				var a=b[d||"offsetWidth"];
				b.parentNode.removeChild(b);
				b=null;
				return a
			},lastId:1,newId:function(){
				return this.lastId++
			},zim:{data:{},step:5,first:function(){
				return 100
			},last:function(){
				var c=this.first();
				for(var b in this.data){
					c=Math.max(c,this.data[b])}return c
				},reserve:function(a){this.data[a]=this.last()+this.step;return this.data[a]},clear:function(a){
					if(this.data[a]!=null){
						this.data[a]=null;
						delete this.data[a]
					}
				}
			},s2b:function(a){
				if(typeof(a)=="string"){
					a=a.toLowerCase()
				}
				return(a==true||a==1||a=="true"||a=="1"||a=="yes"||a=="y"||a=="on")},s2j:function(s){
					var obj=null;
					dhx4.temp=null;
					try{
						eval("dhx4.temp="+s)
					}catch(e){
						dhx4.temp=null
					}
					obj=dhx4.temp;
					dhx4.temp=null;
					return obj
				},absLeft:function(a){
					if(typeof(a)=="string"){
						a=document.getElementById(a)
					}
					return this.getOffset(a).left
				},absTop:function(a){
					if(typeof(a)=="string"){
						a=document.getElementById(a)
					}return this.getOffset(a).top
				},_aOfs:function(a){
					var c=0,b=0;
					while(a){
						c=c+parseInt(a.offsetTop);
						b=b+parseInt(a.offsetLeft);
						a=a.offsetParent
					}return{top:c,left:b}
				},_aOfsRect:function(d){
					var g=d.getBoundingClientRect();
					var h=document.body;
					var b=document.documentElement;
					var a=window.pageYOffset||b.scrollTop||h.scrollTop;
					var e=window.pageXOffset||b.scrollLeft||h.scrollLeft;
					var f=b.clientTop||h.clientTop||0;
					var i=b.clientLeft||h.clientLeft||0;
					var j=g.top+a-f;
					var c=g.left+e-i;
					return{top:Math.round(j),left:Math.round(c)}
				},getOffset:function(a){
					if(a.getBoundingClientRect){
						return this._aOfsRect(a)
					}else{
						return this._aOfs(a)
					}
				},_isObj:function(a){
					return(a!=null&&typeof(a)=="object"&&typeof(a.length)=="undefined")
				},_copyObj:function(d){
					if(this._isObj(d)){
						var c={};
						for(var b in d){
							if(typeof(d[b])=="object"&&d[b]!=null){
								c[b]=this._copyObj(d[b])
							}else{
								c[b]=d[b]
							}
						}
					}else{
						var c=[];
						for(var b=0;b<d.length;b++){
							if(typeof(d[b])=="object"&&d[b]!=null){
								c[b]=this._copyObj(d[b])}else{c[b]=d[b]
							}
						}
					}
					return c
				},screenDim:function(){
					var a=(navigator.userAgent.indexOf("MSIE")>=0);
					var b={};
					b.left=document.body.scrollLeft;
					b.right=b.left+(window.innerWidth||document.body.clientWidth);
					b.top=Math.max((a?document.documentElement:document.getElementsByTagName("html")[0]).scrollTop,document.body.scrollTop);
					b.bottom=b.top+(a?Math.max(document.documentElement.clientHeight||0,document.documentElement.offsetHeight||0):window.innerHeight);
					return b
				},selectTextRange:function(d,g,b){
					d=(typeof(d)=="string"?document.getElementById(d):d);
					var a=d.value.length;
					g=Math.max(Math.min(g,a),0);
					b=Math.min(b,a);
					if(d.setSelectionRange){
						try{
							d.setSelectionRange(g,b)
						}catch(f){}
					}else{
						if(d.createTextRange){
							var c=d.createTextRange();
							c.moveStart("character",g);
							c.moveEnd("character",b-a);
							try{c.select()}catch(f){}
						}
					}
				},transData:null,transDetect:function(){
					if(this.transData==null){
						this.transData={transProp:false,transEv:null};
						var c={MozTransition:"transitionend",WebkitTransition:"webkitTransitionEnd",OTransition:"oTransitionEnd",msTransition:"transitionend",transition:"transitionend"};
						for(var b in c){
							if(this.transData.transProp==false&&document.documentElement.style[b]!=null){
								this.transData.transProp=b;
								this.transData.transEv=c[b]
							}
						}c=null
					}
					return this.transData
				},_xmlNodeValue:function(a){
					var c="";
					for(var b=0;b<a.childNodes.length;b++){
						c+=(a.childNodes[b].nodeValue!=null?a.childNodes[b].nodeValue.toString().replace(/^[\n\r\s]{0,}/,"").replace(/[\n\r\s]{0,}$/,""):"")
					}
					return c
				}
			};
	window.dhx4.isIE=(navigator.userAgent.indexOf("MSIE")>=0||navigator.userAgent.indexOf("Trident")>=0);
	window.dhx4.isIE6=(window.XMLHttpRequest==null&&navigator.userAgent.indexOf("MSIE")>=0);
	window.dhx4.isIE7=(navigator.userAgent.indexOf("MSIE 7.0")>=0&&navigator.userAgent.indexOf("Trident")<0);
	window.dhx4.isIE8=(navigator.userAgent.indexOf("MSIE 8.0")>=0&&navigator.userAgent.indexOf("Trident")>=0);
	window.dhx4.isIE9=(navigator.userAgent.indexOf("MSIE 9.0")>=0&&navigator.userAgent.indexOf("Trident")>=0);
	window.dhx4.isIE10=(navigator.userAgent.indexOf("MSIE 10.0")>=0&&navigator.userAgent.indexOf("Trident")>=0&&window.navigator.pointerEnabled!=true);
	window.dhx4.isIE11=(navigator.userAgent.indexOf("Trident")>=0&&window.navigator.pointerEnabled==true);
	window.dhx4.isEdge=(navigator.userAgent.indexOf("Edge")>=0);
	window.dhx4.isOpera=(navigator.userAgent.indexOf("Opera")>=0);
	window.dhx4.isChrome=(navigator.userAgent.indexOf("Chrome")>=0)&&!window.dhx4.isEdge;
	window.dhx4.isKHTML=(navigator.userAgent.indexOf("Safari")>=0||navigator.userAgent.indexOf("Konqueror")>=0)&&!window.dhx4.isEdge;
	window.dhx4.isFF=(navigator.userAgent.indexOf("Firefox")>=0);
	window.dhx4.isIPad=(navigator.userAgent.search(/iPad/gi)>=0);
	window.dhx4.dnd={
			evs:{},p_en:((window.dhx4.isIE||window.dhx4.isEdge)&&(window.navigator.pointerEnabled||window.navigator.msPointerEnabled)),_mTouch:function(a){
			return(window.dhx4.isIE10&&a.pointerType==a.MSPOINTER_TYPE_MOUSE||window.dhx4.isIE11&&a.pointerType=="mouse"||window.dhx4.isEdge&&a.pointerType=="mouse")
		},_touchOn:function(a){
			if(a==null){
				a=document.body
			}
			a.style.touchAction=a.style.msTouchAction="";
			a=null
		},_touchOff:function(a){
			if(a==null){a=document.body}
			a.style.touchAction=a.style.msTouchAction="none";
			a=null
		}
	};
	if(window.navigator.pointerEnabled==true){
		window.dhx4.dnd.evs={start:"pointerdown",move:"pointermove",end:"pointerup"}
	}else{
		if(window.navigator.msPointerEnabled==true){
			window.dhx4.dnd.evs={start:"MSPointerDown",move:"MSPointerMove",end:"MSPointerUp"}
		}else{
			if(typeof(window.addEventListener)!="undefined"){
				window.dhx4.dnd.evs={start:"touchstart",move:"touchmove",end:"touchend"}
			}
		}
	}
}
if(typeof(window.dhx4.template)=="undefined"){
	window.dhx4.trim=function(a){return String(a).replace(/^\s{1,}/,"").replace(/\s{1,}$/,"")};
	window.dhx4.template=function(b,c,a){
		return b.replace(/#([a-z0-9_-]{1,})(\|([^#]*))?#/gi,function(){
			var g=arguments[1];
			var f=window.dhx4.trim(arguments[3]);
			var h=null;var e=[c[g]];
			if(f.length>0){
				f=f.split(":");
				var d=[];
				for(var i=0;i<f.length;i++){
					if(i>0&&d[d.length-1].match(/\\$/)!=null){
						d[d.length-1]=d[d.length-1].replace(/\\$/,"")+":"+f[i]
					}else{
						d.push(f[i])
					}
				}
				h=d[0];
				for(var i=1;i<d.length;i++){e.push(d[i])}
			}
			if(typeof(h)=="string"&&typeof(window.dhx4.template[h])=="function"){
				return window.dhx4.template[h].apply(window.dhx4.template,e)
			}
			if(g.length>0&&typeof(c[g])!="undefined"){
				if(a==true){
					return window.dhx4.trim(c[g])
				}
				return String(c[g])
			}
			return""
		})
	};
	window.dhx4.template.date=function(a,b){
		if(a!=null){
			if(a instanceof Date){
				return window.dhx4.date2str(a,b)
			}else{
				a=a.toString();
				if(a.match(/^\d*$/)!=null){
					return window.dhx4.date2str(new Date(parseInt(a)),b)
				}
				return a
			}
		}
		return""
	};
	window.dhx4.template.maxlength=function(b,a){return String(b).substr(0,a)};
	window.dhx4.template.number_format=function(d,e,c,a){
		var b=window.dhx4.template._parseFmt(e,c,a);
		if(b==false){return d}return window.dhx4.template._getFmtValue(d,b)
	};
	window.dhx4.template.lowercase=function(a){
		if(typeof(a)=="undefined"||a==null){a=""}return String(a).toLowerCase()
	};
	window.dhx4.template.uppercase=function(a){if(typeof(a)=="undefined"||a==null){a=""}return String(a).toUpperCase()};
	window.dhx4.template._parseFmt=function(h,c,a){
		var d=h.match(/^([^\.\,0-9]*)([0\.\,]*)([^\.\,0-9]*)/);
		if(d==null||d.length!=4){
			return false
		}
		var b={i_len:false,i_sep:(typeof(c)=="string"?c:","),d_len:false,d_sep:(typeof(a)=="string"?a:"."),s_bef:(typeof(d[1])=="string"?d[1]:""),s_aft:(typeof(d[3])=="string"?d[3]:"")};
		var g=d[2].split(".");
		if(g[1]!=null){
			b.d_len=g[1].length
		}
		var e=g[0].split(",");
		if(e.length>1){
			b.i_len=e[e.length-1].length
		}return b
	};
	window.dhx4.template._getFmtValue=function(value,fmt){
		var r=String(value).match(/^(-)?([0-9]{1,})(\.([0-9]{1,}))?$/);
		if(r!=null&&r.length==5){
			var v0="";
			if(r[1]!=null){
				v0+=r[1]
			}
			v0+=fmt.s_bef;
			if(fmt.i_len!==false){
				var i=0;var v1="";
				for(var q=r[2].length-1;q>=0;q--){
					v1=""+r[2].charAt(q)+v1;
					if(++i==fmt.i_len&&q>0){
						v1=fmt.i_sep+v1;i=0
					}
				}
				v0+=v1
			}else{
				v0+=r[2]
			}
			if(fmt.d_len!==false){
				if(r[4]==null){r[4]=""}
				while(r[4].length<fmt.d_len){r[4]+="0"}
				eval("dhx4.temp = new RegExp(/\\d{"+fmt.d_len+"}/);");
				var t1=(r[4]).match(dhx4.temp);
				if(t1!=null){v0+=fmt.d_sep+t1}
				dhx4.temp=t1=null
			}
			v0+=fmt.s_aft;
			return v0
		}
		return value
	}
}
if(typeof(window.dhx4.dateLang)=="undefined"){
	window.dhx4.dateLang="en";
	window.dhx4.dateStrings={
		en:{
			monthFullName:["January","February","March","April","May","June","July","August","September","October","November","December"],monthShortName:["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],
			dayFullName:["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],
			dayShortName:["Su","Mo","Tu","We","Th","Fr","Sa"]
		}
	};
	window.dhx4.dateFormat={en:"%Y-%m-%d"};
	window.dhx4.date2str=function(f,d,a){
		if(d==null||typeof(d)=="undefined"){
			d=window.dhx4.dateFormat[window.dhx4.dateLang]
		}
		if(a==null||typeof(a)=="undefined"){
			a=window.dhx4.dateStrings[window.dhx4.dateLang]
		}
		if(f instanceof Date){
			var e=function(g){return(String(g).length==1?"0"+String(g):g)};
			var b=function(i){
				switch(i){
					case"%d":return e(f.getDate());
					case"%j":return f.getDate();
					case"%D":return a.dayShortName[f.getDay()];
					case"%l":return a.dayFullName[f.getDay()];
					case"%m":return e(f.getMonth()+1);
					case"%n":return f.getMonth()+1;
					case"%M":return a.monthShortName[f.getMonth()];
					case"%F":return a.monthFullName[f.getMonth()];
					case"%y":return e(f.getYear()%100);
					case"%Y":return f.getFullYear();
					case"%g":return(f.getHours()+11)%12+1;
					case"%h":return e((f.getHours()+11)%12+1);
					case"%G":return f.getHours();
					case"%H":return e(f.getHours());
					case"%i":return e(f.getMinutes());
					case"%s":return e(f.getSeconds());case"%a":return(f.getHours()>11?"pm":"am");
					case"%A":return(f.getHours()>11?"PM":"AM");
					case"%%":return"%";
					case"%u":return f.getMilliseconds();
					case"%P":if(window.dhx4.temp_calendar!=null&&window.dhx4.temp_calendar.tz!=null){
							return window.dhx4.temp_calendar.tz
					}
					var l=f.getTimezoneOffset();
					var j=Math.abs(Math.floor(l/60));
					var g=Math.abs(l)-j*60;
					return(l>0?"-":"+")+e(j)+":"+e(g);
					default:return i
			}	
		};
		var c=String(d||window.dhx4.dateFormat).replace(/%[a-zA-Z]/g,b)}return(c||String(f))
	};
	window.dhx4.str2date=function(g,s,x){
		if(s==null||typeof(s)=="undefined"){s=window.dhx4.dateFormat[window.dhx4.dateLang]}
		if(x==null||typeof(x)=="undefined"){x=window.dhx4.dateStrings[window.dhx4.dateLang]}
		s=s.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\\:|]/g,"\\$&");
		var u=[];
		var j=[];
		s=s.replace(/%[a-z]/gi,function(e){
			switch(e){
				case"%d":case"%m":case"%y":case"%h":case"%H":case"%i":case"%s":j.push(e);
					return"(\\d{2})";
				case"%D":case"%l":case"%M":case"%F":j.push(e);
					return"([a-zéûä\u0430-\u044F\u0451]{1,})";
				case"%j":case"%n":case"%g":case"%G":j.push(e);
					return"(\\d{1,2})";
				case"%Y":j.push(e);
					return"(\\d{4})";
				case"%a":j.push(e);
					return"([a|p]m)";
				case"%A":j.push(e);
				return"([A|P]M)";
				case"%u":j.push(e);return"(\\d{1,6})";
				case"%P":j.push(e);return"([+-]\\d{1,2}:\\d{1,2})"
			}return e
		});
		var y=new RegExp(s,"i");
		var l=g.match(y);
		if(l==null||l.length-1!=j.length){return"Invalid Date"}
		for(var b=1;b<l.length;b++){
			u.push(l[b])
		}
		var c={"%y":1,"%Y":1,"%n":2,"%m":2,"%M":2,"%F":2,"%d":3,"%j":3,"%a":4,"%A":4,"%H":5,"%G":5,"%h":5,"%g":5,"%i":6,"%s":7,"%u":7,"%P":7};
		var m={};
		var i={};
		for(var b=0;b<j.length;b++){
			if(typeof(c[j[b]])!="undefined"){
				var d=c[j[b]];
				if(!m[d]){
					m[d]=[];
					i[d]=[]
				}
				m[d].push(u[b]);
				i[d].push(j[b])
			}
		}
		u=[];
		j=[];
		for(var b=1;b<=7;b++){
			if(m[b]!=null){
				for(var o=0;o<m[b].length;o++){
					u.push(m[b][o]);j.push(i[b][o])
				}
			}
		}
		var a=new Date();
		a.setDate(1);
		a.setHours(0);
		a.setMinutes(0);
		a.setSeconds(0);
		a.setMilliseconds(0);
		var n=function(p,e){
			for(var f=0;f<e.length;f++){
				if(e[f].toLowerCase()==p){return f}}
				return -1
			};
		for(var b=0;b<u.length;b++){
			switch(j[b]){
				case"%d":case"%j":case"%n":case"%m":case"%Y":case"%H":case"%G":case"%i":case"%s":case"%u":if(!isNaN(u[b])){
					a[{"%d":"setDate","%j":"setDate","%n":"setMonth","%m":"setMonth","%Y":"setFullYear","%H":"setHours","%G":"setHours","%i":"setMinutes","%s":"setSeconds","%u":"setMilliseconds"
					}[j[b]]](Number(u[b])+(j[b]=="%m"||j[b]=="%n"?-1:0))
				}break;
				case"%M":case"%F":var h=n(u[b].toLowerCase(),x[{"%M":"monthShortName","%F":"monthFullName"}[j[b]]]);if(h>=0){a.setMonth(h)}break;
				case"%y":if(!isNaN(u[b])){var t=Number(u[b]);a.setFullYear(t+(t>50?1900:2000))}break;
				case"%g":case"%h":if(!isNaN(u[b])){var t=Number(u[b]);if(t<=12&&t>=0){a.setHours(t+(n("pm",u)>=0?(t==12?0:12):(t==12?-12:0)))}}break;
				case"%P":if(window.dhx4.temp_calendar!=null){window.dhx4.temp_calendar.tz=u[b]}break
			}
		}
		return a
	}
}
if(typeof(window.dhx4.ajax)=="undefined"){
	window.dhx4.ajax={
			cache:false,method:"get",parse:function(a){
				if(typeof a!=="string"){return a}
				a=a.replace(/^[\s]+/,"");
				if(window.DOMParser&&!dhx4.isIE){
					var b=(new window.DOMParser()).parseFromString(a,"text/xml")
				}else{
					if(window.ActiveXObject!==window.undefined){
						var b=new window.ActiveXObject("Microsoft.XMLDOM");
						b.async="false";b.loadXML(a)
					}
				}return b
			},xmltop:function(a,d,c){
				if(typeof d.status=="undefined"||d.status<400){
					xml=(!d.responseXML)?dhx4.ajax.parse(d.responseText||d):(d.responseXML||d);
					if(xml&&xml.documentElement!==null){
						try{
							if(!xml.getElementsByTagName("parsererror").length){return xml.getElementsByTagName(a)[0]
							}
						}catch(b){}
					}
				}if(c!==-1){
					dhx4.callEvent("onLoadXMLError",["Incorrect XML",arguments[1],c])
				}
				return document.createElement("DIV")
			},xpath:function(c,a){
				if(!a.nodeName){a=a.responseXML||a}
				if(dhx4.isIE){
					try{return a.selectNodes(c)||[]}catch(f){return[]}
				}else{
					var d=[];
					var g;
					var b=(a.ownerDocument||a).evaluate(c,a,null,XPathResult.ANY_TYPE,null);
					while(g=b.iterateNext()){d.push(g)}return d
				}
			},query:function(a){
				return dhx4.ajax._call((a.method||"GET"),a.url,a.data||"",(a.async||true),a.callback,null,a.headers)
			},get:function(a,b){
				return this._call("GET",a,null,true,b)
			},getSync:function(a){
				return this._call("GET",a,null,false)
			},put:function(b,a,c){
				return this._call("PUT",b,a,true,c)
			},del:function(b,a,c){
				return this._call("DELETE",b,a,true,c)
			},post:function(b,a,c){
				if(arguments.length==1){a=""}else{
					if(arguments.length==2&&(typeof(a)=="function"||typeof(window[a])=="function")){
						c=a;a=""
					}else{a=String(a)}
				}
				return this._call("POST",b,a,true,c)
			},postSync:function(b,a){
				a=(a==null?"":String(a));return this._call("POST",b,a,false)
			},getLong:function(a,b){
				this._call("GET",a,null,true,b,{url:a})
			},postLong:function(b,a,c){
				if(arguments.length==2&&(typeof(a)=="function"||typeof(window[a]))){
					c=a;a=""
				}
				this._call("POST",b,a,true,c,{url:b,postData:a})
			},_call:function(b,c,d,h,j,o,f){
				if(typeof d==="object"){
					var g=[];
					for(var l in d){
						g.push(l+"="+encodeURIComponent(d[l]))
					}
					d=g.join("&")
				}
				var e=dhx.promise.defer();
				var n=(window.XMLHttpRequest&&!dhx4.isIE?new XMLHttpRequest():new ActiveXObject("Microsoft.XMLHTTP"));
				var i=(navigator.userAgent.match(/AppleWebKit/)!=null&&navigator.userAgent.match(/Qt/)!=null&&navigator.userAgent.match(/Safari/)!=null);
				if(h==true){
					n.onreadystatechange=function(){
						if((n.readyState==4)||(i==true&&n.readyState==3)){
							if(n.status!=200||n.responseText==""){
								e.reject(n);
								if(!dhx4.callEvent("onAjaxError",[{xmlDoc:n,filePath:c,async:h}])){return}
							}
							window.setTimeout(function(){
								if(typeof(j)=="function"){
									try{
										j.apply(window,[{xmlDoc:n,filePath:c,async:h}])
									}catch(a){
										e.reject(a)
									}
									e.resolve(n.responseText)
								}
								if(o!=null){
									if(typeof(o.postData)!="undefined"){
										dhx4.ajax.postLong(o.url,o.postData,j)
									}else{
										dhx4.ajax.getLong(o.url,j)
									}
								}
								j=null;
								n=null
							},1)
						}
					}
				}
				if(b=="GET"){c+=this._dhxr(c)}
				n.open(b,c,h);
				if(f!=null){for(var m in f){
					n.setRequestHeader(m,f[m])
				}
			}else{
				if(b=="POST"||b=="PUT"||b=="DELETE"){
					n.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
				}else{
					if(b=="GET"){d=null}
				}
				
			}
			n.setRequestHeader("X-Requested-With","XMLHttpRequest");
			n.send(d);
			if(h!=true){
				if((n.readyState==4)||(i==true&&n.readyState==3)){
					if(n.status!=200||n.responseText==""){
						dhx4.callEvent("onAjaxError",[{xmlDoc:n,filePath:c,async:h}])
					}
				}
			}e.xmlDoc=n;
			e.filePath=c;
			e.async=h;
			return e
		},_dhxr:function(a,b){
			if(this.cache!=true){
				if(a.match(/^[\?\&]$/)==null){
					a=(a.indexOf("?")>=0?"&":"?")
				}
				if(typeof(b)=="undefined"){b=true}
				return a+"dhxr"+new Date().getTime()+(b==true?"=1":"")
			}
			return""
		}
	}
}
if(typeof(window.dhx4._enableDataLoading)=="undefined"){
	window.dhx4._enableDataLoading=function(g,c,f,e,h){
		if(h=="clear"){
			for(var b in g._dhxdataload){
				g._dhxdataload[b]=null;
				delete g._dhxdataload[b]
			}
			g._loadData=null;
			g._dhxdataload=null;
			g.load=null;
			g.loadStruct=null;
			g=null;
			return
		}
		g._dhxdataload={initObj:c,xmlToJson:f,xmlRootTag:e,onBeforeXLS:null};
		g._loadData=function(n,o,p){
			if(arguments.length==2){p=o;o=null}
			var m=null;
			if(arguments.length==3){p=arguments[2]}
			this.callEvent("onXLS",[]);
			if(typeof(n)=="string"){
				var l=n.replace(/^\s{1,}/,"").replace(/\s{1,}$/,"");
				var s=new RegExp("^<"+this._dhxdataload.xmlRootTag);
				if(s.test(l.replace(/^<\?xml[^\?]*\?>\s*/,""))){
					m=dhx4.ajax.parse(n);
					if(m!=null){m=this[this._dhxdataload.xmlToJson].apply(this,[m])}
				}
				if(m==null&&(l.match(/^[\s\S]*{[.\s\S]*}[\s\S]*$/)!=null||l.match(/^[\s\S]*\[[.\s\S]*\][\s\S]*$/)!=null)){m=dhx4.s2j(l)}
				if(m==null){
					var j=[];
					if(typeof(this._dhxdataload.onBeforeXLS)=="function"){
						var l=this._dhxdataload.onBeforeXLS.apply(this,[n]);
						if(l!=null&&typeof(l)=="object"){
							if(l.url!=null){n=l.url}
							if(l.params!=null){
								for(var q in l.params){
									j.push(q+"="+encodeURIComponent(l.params[q]))
								}
							}
						}
					}
					var r=this;
					var i=function(a){
						var t=null;
						if((a.xmlDoc.getResponseHeader("Content-Type")||"").search(/xml/gi)>=0||(a.xmlDoc.responseText.replace(/^\s{1,}/,"")).match(/^</)!=null){
							t=r[r._dhxdataload.xmlToJson].apply(r,[a.xmlDoc.responseXML])
						}else{
							t=dhx4.s2j(a.xmlDoc.responseText)
						}if(t!=null){
							r[r._dhxdataload.initObj].apply(r,[t,n])
						}
						r.callEvent("onXLE",[]);
						if(p!=null){
							if(typeof(p)=="function"){
								p.apply(r,[])
							}else{
								if(typeof(window[p])=="function"){
									window[p].apply(r,[])
								}
							}
						}
						i=p=null;
						t=a=r=null};
						j=j.join("&")+(typeof(o)=="string"?"&"+o:"");
						if(dhx4.ajax.method=="post"){
							return dhx4.ajax.post(n,j,i)
						}else{
							if(dhx4.ajax.method=="get"){
								return dhx4.ajax.get(n+(j.length>0?(n.indexOf("?")>0?"&":"?")+j:""),i)
							}
						}
						return
					}
				}else{
					if(typeof(n.documentElement)=="object"||(typeof(n.tagName)!="undefined"&&typeof(n.getElementsByTagName)!="undefined"&&n.getElementsByTagName(this._dhxdataload.xmlRootTag).length>0)){
						m=this[this._dhxdataload.xmlToJson].apply(this,[n])
					}else{
						m=window.dhx4._copyObj(n)
					}
				}if(m!=null){
					this[this._dhxdataload.initObj].apply(this,[m])
				}
				this.callEvent("onXLE",[]);
				if(p!=null){
					if(typeof(p)=="function"){
						p.apply(this,[])
					}else{
						if(typeof(window[p])=="function"){
							window[p].apply(this,[])
						}
					}
					p=null
				}
			};
			if(h!=null){
				var d={struct:"loadStruct",data:"load"};
				for(var b in h){
					if(h[b]==true){
						g[d[b]]=function(){
							return this._loadData.apply(this,arguments)
						}
					}
				}
			}
			g=null
		}
	}
if(typeof(window.dhx4._eventable)=="undefined"){
	window.dhx4._eventable=function(a,b){
		if(b=="clear"){
			a.detachAllEvents();
			a.dhxevs=null;
			a.attachEvent=null;
			a.detachEvent=null;
			a.checkEvent=null;
			a.callEvent=null;
			a.detachAllEvents=null;
			a=null;return
		}
		a.dhxevs={data:{}};
		a.attachEvent=function(c,e){
			c=String(c).toLowerCase();
			if(!this.dhxevs.data[c]){
				this.dhxevs.data[c]={}
			}
			var d=window.dhx4.newId();
			this.dhxevs.data[c][d]=e;
			return d
		};
		a.detachEvent=function(f){
			for(var d in this.dhxevs.data){
				var e=0;
				for(var c in this.dhxevs.data[d]){
					if(c==f){
						this.dhxevs.data[d][c]=null;
						delete this.dhxevs.data[d][c]
					}else{e++}
				}
				if(e==0){
					this.dhxevs.data[d]=null;delete this.dhxevs.data[d]
				}
			}
		};
		a.checkEvent=function(c){
			c=String(c).toLowerCase();
			return(this.dhxevs.data[c]!=null)
		};
		a.callEvent=function(d,f){
			d=String(d).toLowerCase();
			if(this.dhxevs.data[d]==null){return true}
			var e=true;
			for(var c in this.dhxevs.data[d]){
				e=this.dhxevs.data[d][c].apply(this,f)&&e
			}
			return e
		};
		a.detachAllEvents=function(){
			for(var d in this.dhxevs.data){
				for(var c in this.dhxevs.data[d]){
					this.dhxevs.data[d][c]=null;
					delete this.dhxevs.data[d][c]
				}
				this.dhxevs.data[d]=null;
				delete this.dhxevs.data[d]
			}
		};
		a=null
	};
	dhx4._eventable(dhx4)
}
if(!window.dhtmlxValidation){
	dhtmlxValidation=function(){};
	dhtmlxValidation.prototype={
		isEmpty:function(a){return a==""},isNotEmpty:function(a){
			return(a instanceof Array?a.length>0:!a=="")
		},isValidBoolean:function(a){
			return !!a.toString().match(/^(0|1|true|false)$/)
		},isValidEmail:function(a){
			return !!a.toString().match(/(^[a-z0-9]([0-9a-z\-_\.]*)@([0-9a-z_\-\.]*)([.][a-z]{3})$)|(^[a-z]([0-9a-z_\.\-]*)@([0-9a-z_\-\.]*)(\.[a-z]{2,5})$)/i)
		},isValidInteger:function(a){
			return !!a.toString().match(/(^-?\d+$)/)
		},isValidNumeric:function(a){
			return !!a.toString().match(/(^-?\d\d*[\.|,]\d*$)|(^-?\d\d*$)|(^-?[\.|,]\d\d*$)/)
		},isValidAplhaNumeric:function(a){
			return !!a.toString().match(/^[_\-a-z0-9]+$/gi)
		},isValidDatetime:function(b){
			var a=b.toString().match(/^(\d{4})-(\d{2})-(\d{2})\s(\d{2}):(\d{2}):(\d{2})$/);return a&&!!(a[1]<=9999&&a[2]<=12&&a[3]<=31&&a[4]<=59&&a[5]<=59&&a[6]<=59)||false
		},isValidDate:function(a){
			var b=a.toString().match(/^(\d{4})-(\d{2})-(\d{2})$/);return b&&!!(b[1]<=9999&&b[2]<=12&&b[3]<=31)||false
		},isValidTime:function(b){
			var a=b.toString().match(/^(\d{1,2}):(\d{1,2}):(\d{1,2})$/);return a&&!!(a[1]<=24&&a[2]<=59&&a[3]<=59)||false
		},isValidIPv4:function(a){
			var b=a.toString().match(/^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/);return b&&!!(b[1]<=255&&b[2]<=255&&b[3]<=255&&b[4]<=255)||false
		},isValidCurrency:function(a){
			return a.toString().match(/^\$?\s?\d+?([\.,\,]?\d+)?\s?\$?$/)&&true||false
		},isValidSSN:function(a){
			return a.toString().match(/^\d{3}\-?\d{2}\-?\d{4}$/)&&true||false
		},isValidSIN:function(a){
			return a.toString().match(/^\d{9}$/)&&true||false
		}
	};
	dhtmlxValidation=new dhtmlxValidation()
}
if(typeof(window.dhtmlx)=="undefined"){
	window.dhtmlx={
		extend:function(d,c){
			for(var e in c){
				if(!d[e]){d[e]=c[e]}
			}return d
		},extend_api:function(a,d,c){
			var b=window[a];
			if(!b){return}
			window[a]=function(g){
				if(g&&typeof g=="object"&&!g.tagName){
					var f=b.apply(this,(d._init?d._init(g):arguments));
					for(var e in dhtmlx){
						if(d[e]){
							this[d[e]](dhtmlx[e])
						}
					}
					for(var e in g){
						if(d[e]){
							this[d[e]](g[e])
						}else{
							if(e.indexOf("on")===0){
								this.attachEvent(e,g[e])
							}
						}
					}
				}else{
					var f=b.apply(this,arguments)
				}
				if(d._patch){
					d._patch(this)
				}
				return f||this
			};
			window[a].prototype=b.prototype;if(c){
				dhtmlx.extend(window[a].prototype,c)
			}
		},url:function(a){
			if(a.indexOf("?")!=-1){
				return"&"
			}else{return"?"}
		}
	}
}
function dhtmlDragAndDropObject(){
	if(window.dhtmlDragAndDrop){
		return window.dhtmlDragAndDrop
	}
	this.lastLanding=0;
	this.dragNode=0;
	this.dragStartNode=0;
	this.dragStartObject=0;
	this.tempDOMU=null;
	this.tempDOMM=null;
	this.waitDrag=0;
	window.dhtmlDragAndDrop=this;
	return this
}
dhtmlDragAndDropObject.prototype.removeDraggableItem=function(a){
	a.onmousedown=null;
	a.dragStarter=null;
	a.dragLanding=null
};
dhtmlDragAndDropObject.prototype.addDraggableItem=function(a,b){
	a.onmousedown=this.preCreateDragCopy;
	a.dragStarter=b;this.addDragLanding(a,b)
};
dhtmlDragAndDropObject.prototype.addDragLanding=function(a,b){
	a.dragLanding=b
};
dhtmlDragAndDropObject.prototype.preCreateDragCopy=function(a){
	if((a||window.event)&&(a||event).button==2){
		return
	}
	if(window.dhtmlDragAndDrop.waitDrag){
		window.dhtmlDragAndDrop.waitDrag=0;
		document.body.onmouseup=window.dhtmlDragAndDrop.tempDOMU;
		document.body.onmousemove=window.dhtmlDragAndDrop.tempDOMM;
		return false
	}
	if(window.dhtmlDragAndDrop.dragNode){
		window.dhtmlDragAndDrop.stopDrag(a)
	}
	window.dhtmlDragAndDrop.waitDrag=1;
	window.dhtmlDragAndDrop.tempDOMU=document.body.onmouseup;
	window.dhtmlDragAndDrop.tempDOMM=document.body.onmousemove;
	window.dhtmlDragAndDrop.dragStartNode=this;
	window.dhtmlDragAndDrop.dragStartObject=this.dragStarter;
	document.body.onmouseup=window.dhtmlDragAndDrop.preCreateDragCopy;
	document.body.onmousemove=window.dhtmlDragAndDrop.callDrag;
	window.dhtmlDragAndDrop.downtime=new Date().valueOf();
	if((a)&&(a.preventDefault)){a.preventDefault();return false}return false
};
dhtmlDragAndDropObject.prototype.callDrag=function(c){
	if(!c){c=window.event}
	dragger=window.dhtmlDragAndDrop;
	if((new Date()).valueOf()-dragger.downtime<100){return}
	if(!dragger.dragNode){
		if(dragger.waitDrag){
			dragger.dragNode=dragger.dragStartObject._createDragNode(dragger.dragStartNode,c);
			if(!dragger.dragNode){return dragger.stopDrag()}
			dragger.dragNode.onselectstart=function(){return false};
			dragger.gldragNode=dragger.dragNode;
			document.body.appendChild(dragger.dragNode);
			document.body.onmouseup=dragger.stopDrag;dragger.waitDrag=0;
			dragger.dragNode.pWindow=window;dragger.initFrameRoute()
		}else{
			return dragger.stopDrag(c,true)
		}
	}
	if(dragger.dragNode.parentNode!=window.document.body&&dragger.gldragNode){
		var a=dragger.gldragNode;
		if(dragger.gldragNode.old){
			a=dragger.gldragNode.old
		}
		a.parentNode.removeChild(a);
		var b=dragger.dragNode.pWindow;
		if(a.pWindow&&a.pWindow.dhtmlDragAndDrop.lastLanding){
			a.pWindow.dhtmlDragAndDrop.lastLanding.dragLanding._dragOut(a.pWindow.dhtmlDragAndDrop.lastLanding)
		}
		if(_isIE){
			var f=document.createElement("Div");
			f.innerHTML=dragger.dragNode.outerHTML;
			dragger.dragNode=f.childNodes[0]
		}else{
			dragger.dragNode=dragger.dragNode.cloneNode(true)
		}
		dragger.dragNode.pWindow=window;
		dragger.gldragNode.old=dragger.dragNode;
		document.body.appendChild(dragger.dragNode);
		b.dhtmlDragAndDrop.dragNode=dragger.dragNode
	}
	dragger.dragNode.style.left=c.clientX+15+(dragger.fx?dragger.fx*(-1):0)+(document.body.scrollLeft||document.documentElement.scrollLeft)+"px";
	dragger.dragNode.style.top=c.clientY+3+(dragger.fy?dragger.fy*(-1):0)+(document.body.scrollTop||document.documentElement.scrollTop)+"px";
	if(!c.srcElement){
		var d=c.target
	}else{d=c.srcElement}
	dragger.checkLanding(d,c)
};
dhtmlDragAndDropObject.prototype.calculateFramePosition=function(e){
	if(window.name){
		var c=parent.frames[window.name].frameElement.offsetParent;
		var d=0;
		var b=0;
		while(c){
			d+=c.offsetLeft;
			b+=c.offsetTop;
			c=c.offsetParent
		}
		if((parent.dhtmlDragAndDrop)){
			var a=parent.dhtmlDragAndDrop.calculateFramePosition(1);
			d+=a.split("_")[0]*1;b+=a.split("_")[1]*1
		}
		if(e){return d+"_"+b}else{this.fx=d}
		this.fy=b
	}return"0_0"
};
dhtmlDragAndDropObject.prototype.checkLanding=function(b,a){
	if((b)&&(b.dragLanding)){
		if(this.lastLanding){
			this.lastLanding.dragLanding._dragOut(this.lastLanding)
		}
		this.lastLanding=b;
		this.lastLanding=this.lastLanding.dragLanding._dragIn(this.lastLanding,this.dragStartNode,a.clientX,a.clientY,a);
		this.lastLanding_scr=(_isIE?a.srcElement:a.target)
	}else{
		if((b)&&(b.tagName!="BODY")){
			this.checkLanding(b.parentNode,a)
		}else{
			if(this.lastLanding){
				this.lastLanding.dragLanding._dragOut(this.lastLanding,a.clientX,a.clientY,a)
			}this.lastLanding=0;
			if(this._onNotFound){this._onNotFound()}
		}
	}
};
dhtmlDragAndDropObject.prototype.stopDrag=function(b,c){
	dragger=window.dhtmlDragAndDrop;if(!c){
		dragger.stopFrameRoute();
		var a=dragger.lastLanding;dragger.lastLanding=null;
		if(a){
			a.dragLanding._drag(dragger.dragStartNode,dragger.dragStartObject,a,(_isIE?event.srcElement:b.target))
		}
	}
	dragger.lastLanding=null;
	if((dragger.dragNode)&&(dragger.dragNode.parentNode==document.body)){
		dragger.dragNode.parentNode.removeChild(dragger.dragNode)
	}
	dragger.dragNode=0;
	dragger.gldragNode=0;
	dragger.fx=0;dragger.fy=0;dragger.dragStartNode=0;dragger.dragStartObject=0;
	document.body.onmouseup=dragger.tempDOMU;document.body.onmousemove=dragger.tempDOMM;
	dragger.tempDOMU=null;dragger.tempDOMM=null;dragger.waitDrag=0
};
dhtmlDragAndDropObject.prototype.stopFrameRoute=function(c){
	if(c){
		window.dhtmlDragAndDrop.stopDrag(1,1)
	}
	for(var a=0;a<window.frames.length;a++){
		try{
			if((window.frames[a]!=c)&&(window.frames[a].dhtmlDragAndDrop)){
				window.frames[a].dhtmlDragAndDrop.stopFrameRoute(window)
			}
		}catch(b){}
	}try{
		if((parent.dhtmlDragAndDrop)&&(parent!=window)&&(parent!=c)){
			parent.dhtmlDragAndDrop.stopFrameRoute(window)
		}
	}catch(b){}
};
dhtmlDragAndDropObject.prototype.initFrameRoute=function(c,d){
	if(c){
		window.dhtmlDragAndDrop.preCreateDragCopy();
		window.dhtmlDragAndDrop.dragStartNode=c.dhtmlDragAndDrop.dragStartNode;
		window.dhtmlDragAndDrop.dragStartObject=c.dhtmlDragAndDrop.dragStartObject;
		window.dhtmlDragAndDrop.dragNode=c.dhtmlDragAndDrop.dragNode;
		window.dhtmlDragAndDrop.gldragNode=c.dhtmlDragAndDrop.dragNode;
		window.document.body.onmouseup=window.dhtmlDragAndDrop.stopDrag;
		window.waitDrag=0;
		if(((!_isIE)&&(d))&&((!_isFF)||(_FFrv<1.8))){
			window.dhtmlDragAndDrop.calculateFramePosition()
		}
	}try{
		if((parent.dhtmlDragAndDrop)&&(parent!=window)&&(parent!=c)){
			parent.dhtmlDragAndDrop.initFrameRoute(window)
		}
	}catch(b){}
	for(var a=0;a<window.frames.length;a++){
		try{
			if((window.frames[a]!=c)&&(window.frames[a].dhtmlDragAndDrop)){
				window.frames[a].dhtmlDragAndDrop.initFrameRoute(window,((!c||d)?1:0))
			}
		}catch(b){}
	}
};
_isFF=false;
_isIE=false;_isOpera=false;_isKHTML=false;_isMacOS=false;_isChrome=false;_FFrv=false;_KHTMLrv=false;
_OperaRv=false;if(navigator.userAgent.indexOf("Macintosh")!=-1){_isMacOS=true}
if(navigator.userAgent.toLowerCase().indexOf("chrome")>-1){_isChrome=true}
if((navigator.userAgent.indexOf("Safari")!=-1)||(navigator.userAgent.indexOf("Konqueror")!=-1)){
	_KHTMLrv=parseFloat(navigator.userAgent.substr(navigator.userAgent.indexOf("Safari")+7,5));
	if(_KHTMLrv>525){_isFF=true;_FFrv=1.9}else{_isKHTML=true}
}else{
	if(navigator.userAgent.indexOf("Opera")!=-1){
		_isOpera=true;_OperaRv=parseFloat(navigator.userAgent.substr(navigator.userAgent.indexOf("Opera")+6,3))
	}else{
		if(navigator.appName.indexOf("Microsoft")!=-1){
			_isIE=true;if((navigator.appVersion.indexOf("MSIE 8.0")!=-1||navigator.appVersion.indexOf("MSIE 9.0")!=-1||navigator.appVersion.indexOf("MSIE 10.0")!=-1||document.documentMode>7)&&document.compatMode!="BackCompat"){_isIE=8}
		}else{
			if(navigator.appName=="Netscape"&&navigator.userAgent.indexOf("Trident")!=-1){
				_isIE=8
			}else{
				_isFF=true;
				_FFrv=parseFloat(navigator.userAgent.split("rv:")[1])
			}
		}
	}
}
if(typeof(window.dhtmlxEvent)=="undefined"){
	function dhtmlxEvent(b,c,a){
		if(b.addEventListener){
			b.addEventListener(c,a,false)
		}else{
			if(b.attachEvent){
				b.attachEvent("on"+c,a)
			}
		}
	}
}if(dhtmlxEvent.touchDelay==null){
	dhtmlxEvent.touchDelay=2000
}
if(typeof(dhtmlxEvent.initTouch)=="undefined"){
	dhtmlxEvent.initTouch=function(){
		var d;var e;var b,a;
		dhtmlxEvent(document.body,"touchstart",function(f){
			e=f.touches[0].target;b=f.touches[0].clientX;a=f.touches[0].clientY;
			d=window.setTimeout(c,dhtmlxEvent.touchDelay)
		});
		function c(){
			if(e){
				var f=document.createEvent("HTMLEvents");
				f.initEvent("dblclick",true,true);
				e.dispatchEvent(f);d=e=null
			}
		}
		dhtmlxEvent(document.body,"touchmove",function(f){
			if(d){
				if(Math.abs(f.touches[0].clientX-b)>50||Math.abs(f.touches[0].clientY-a)>50){
					window.clearTimeout(d);d=e=false
				}
			}
		});
		dhtmlxEvent(document.body,"touchend",function(f){
			if(d){
				window.clearTimeout(d);d=e=false
			}
		});
		dhtmlxEvent.initTouch=function(){}
	}
}(function(b){
	var c=typeof setImmediate!=="undefined"?setImmediate:function(e){setTimeout(e,0)};
	function d(f,g){
		var e=this;e.promise=e;e.state="pending";
		e.val=null;
		e.fn=f||null;e.er=g||null;
		e.next=[]
	}
	d.prototype.resolve=function(f){
		var e=this;
		if(e.state==="pending"){
			e.val=f;e.state="resolving";
			c(function(){e.fire()})
		}
	};
	d.prototype.reject=function(f){
		var e=this;if(e.state==="pending"){
			e.val=f;
			e.state="rejecting";
			c(function(){e.fire()})
		}
	};
	d.prototype.then=function(f,h){
		var e=this;var g=new d(f,h);
		e.next.push(g);
		if(e.state==="resolved"){
			g.resolve(e.val)
		}
		if(e.state==="rejected"){g.reject(e.val)}
		return g
	};
	d.prototype.fail=function(e){
		return this.then(null,e)
	};
	d.prototype.finish=function(g){
		var e=this;e.state=g;
		if(e.state==="resolved"){
			for(var f=0;f<e.next.length;f++){
				e.next[f].resolve(e.val)
			}
		}if(e.state==="rejected"){
			for(var f=0;f<e.next.length;f++){
				e.next[f].reject(e.val)
			}
			if(!e.next.length){throw (e.val)}
		}
	};
	d.prototype.thennable=function(j,f,h,n,m){
		var g=this;m=m||g.val;
		if(typeof m==="object"&&typeof j==="function"){
			try{
				var i=0;
				j.call(m,function(e){
					if(i++!==0){return}
					f(e)
				},function(e){
					if(i++!==0){
						return
					}
					h(e)
				})
			}catch(l){h(l)}
		}else{
			n(m)
		}
	};
	d.prototype.fire=function(){
		var f=this;var g;
		try{g=f.val&&f.val.then}catch(h){f.val=h;f.state="rejecting";return f.fire()}
		f.thennable(g,function(e){
			f.val=e;f.state="resolving";f.fire()
		},function(e){
			f.val=e;f.state="rejecting";f.fire()
		},function(i){
			f.val=i;
			if(f.state==="resolving"&&typeof f.fn==="function"){
				try{f.val=f.fn.call(undefined,f.val)}catch(j){f.val=j;return f.finish("rejected")}
			}if(f.state==="rejecting"&&typeof f.er==="function"){
				try{f.val=f.er.call(undefined,f.val);f.state="resolving"}catch(j){f.val=j;return f.finish("rejected")}
			}
			if(f.val===f){f.val=TypeError();return f.finish("rejected")}
			f.thennable(g,function(e){
				f.val=e;f.finish("resolved")
			},function(e){
				f.val=e;f.finish("rejected")
			},function(e){
				f.val=e;f.state==="resolving"?f.finish("resolved"):f.finish("rejected")
			})
		})
	};
	d.prototype.done=function(){
		if(this.state="rejected"&&!this.next){throw this.val}return null
	};
	d.prototype.nodeify=function(e){
		if(typeof e==="function"){
			return this.then(function(g){
				try{e(null,g)}catch(f){setImmediate(function(){throw f})}return g
			},function(g){
				try{e(g)}catch(f){setImmediate(function(){throw f})}return g
			})
		}return this
	};
	d.prototype.spread=function(e,f){
		return this.all().then(function(g){
			return typeof e==="function"&&e.apply(null,g)},f)
	};
	d.prototype.all=function(){
		var e=this;
		return this.then(function(r){
			var f=new d();
			if(!(r instanceof Array)){
				f.reject(TypeError);return f
			}
			var h=0;var q=r.length;
			function m(){if(++h===q){f.resolve(r)}}
			for(var n=0,j=r.length;n<j;n++){
				var s=r[n];var g;
				try{g=s&&s.then}catch(o){
					f.reject(o);break
				}(function(l){
					e.thennable(g,function(i){r[l]=i;m()
				},function(i){
					f.reject(i)
				},function(){
					m()
				},s
				)})(n)
			}return f
		})
	};
	var a={all:function(e){
		var f=new d(null,null);
		f.resolve(e);return f.all()
	},defer:function(){
		return new d(null,null)
	},fcall:function(){
		var h=new d();
		var f=Array.apply([],arguments);
		var g=f.shift();
		try{var j=g.apply(null,f);h.resolve(j)}catch(i){h.reject(i)}return h
	},nfcall:function(){
		var h=new d();var f=Array.apply([],arguments);
		var g=f.shift();
		try{
			f.push(function(e,j){if(e){return h.reject(e)}return h.resolve(j)});g.apply(null,f)
		}catch(i){
			h.reject(i)}return h
		}
	};
	b.promise=a
})(dhx);
function dhtmlXCombo(f,j,c,h,e){
	var g=this;var d=null;var l=null;
	if(typeof(f)=="object"&&!f.tagName){
		d=f;f=d.parent;c=d.width;j=d.name;h=d.mode;l=d.skin
	}
	this.cont=(typeof(f)=="string"?document.getElementById(f):f);
	this.conf={
			skin:null,
			form_name:j||"dhxcombo",
			combo_width:(parseInt(c)||this.cont.offsetWidth||120)-(dhx4.isFF||dhx4.isIE||dhx4.isChrome||dhx4.isOpera?2:0),
			combo_image:false,
			combo_focus:false,opts_type:(typeof(h)=="string"&&typeof(this.modes[h])!="undefined"?h:"option"),
			opts_count:8,opts_count_min:3,opts_width:null,item_h:null,list_zi_id:window.dhx4.newId(),
			allow_free_text:true,allow_empty_value:true,
			free_text_empty:false,enabled:true,
			btn_left:((window.dhx4.isIE6||window.dhx4.isIE7||window.dhx4.isIE8)&&typeof(window.addEventListener)=="undefined"?1:0),
			ro_mode:false,ro_text:"",ro_tm:null,ro_tm_time:750,img_path:"",img_def:"",
			img_def_dis:true,
			template:{
				header:true,input:"#text#",option:"#text#"
			},f_func:null,f_mode:false,f_url:false,f_cache:false,f_cache_data:{},
			f_dyn:false,f_dyn_end:false,f_mask:"",f_ac:true,f_ac_text:"",f_server_tm:null,f_server_last:"",
			f_loading:false,s_tm:null,s_time:200,s_mode:"select",last_hover:null,last_selected:null,
			last_match:null,last_text:"",last_value:"",tm_hover:null,tm_confirm_blur:null,clear_click:false,
			clear_blur:false,clear_bsp:false,clear_key:false,i_ofs:23,sp:{dhx_skyblue:{list_ofs:1,hdr_ofs:1,scr_ofs:1},
			dhx_web:{list_ofs:0,hdr_ofs:1,scr_ofs:0},dhx_terrace:{list_ofs:1,hdr_ofs:1,scr_ofs:1},
			material:{list_ofs:0,hdr_ofs:1,scr_ofs:1}},col_w:null
		};
	this.conf.combo_image=(this.modes[this.conf.opts_type].image==true);
	this.t={};this.base=document.createElement("DIV");
	this.base.style.width="60px";
	this.base.innerHTML="<input type='text' class='dhxcombo_input' style='width:40px;' autocomplete='off'><input type='hidden' value=''><input type='hidden' value='false'><div class='dhxcombo_select_button'><div class='dhxcombo_select_img'></div></div>"+(this.conf.combo_image?"<div class='dhxcombo_top_image'>"+this.modes[this.conf.opts_type].getTopImage(null,this.conf.enabled)+"</div>":"");this.cont.appendChild(this.base);this.list=document.createElement("DIV");this.list._listId=window.dhx4.newId();this.list.style.display="none";document.body.insertBefore(this.list,document.body.firstChild);this._doOnListScroll=function(){if(g.conf.s_tm!=null){window.clearTimeout(g.conf.s_tm)}g.conf.s_tm=window.setTimeout(g._doOnListScrollAction,g.conf.s_time)};this._doOnListScrollAction=function(){g.conf.s_tm=null;if(g.conf.s_mode=="scroll"&&g.list.scrollHeight-g.list.scrollTop-10<g.list.clientHeight){g._subloadRequest()}};if(typeof(window.addEventListener)=="function"){this.list.addEventListener("scroll",this._doOnListScroll,false)}else{this.list.attachEvent("onscroll",this._doOnListScroll)}this.setSkin(l||window.dhx4.skin||(typeof(dhtmlx)!="undefined"?dhtmlx.skin:null)||window.dhx4.skinDetect("dhxcombo")||"material");this._updateTopImage=function(a){if(!this.conf.combo_image){return}if(a!=null){this.base.lastChild.innerHTML=this.t[a].obj.getTopImage(this.t[a].item,this.conf.enabled)}else{this.base.lastChild.innerHTML=this.modes[this.conf.opts_type].getTopImage(null,this.conf.enabled)}};this._filterOpts=function(u){if(this.conf.f_server_tm){window.clearTimeout(this.conf.f_server_tm)}var o=String(this.base.firstChild.value).replace(new RegExp(this._fixRE(this.conf.f_ac_text)+"$","i"),"");if(this.conf.f_server_last==o.toLowerCase()){this._checkForMatch();return}if(this.conf.f_url!=null&&this.checkEvent("onDynXLS")){this.conf.f_server_last=o.toLowerCase();this.callEvent("onDynXLS",[o]);return}if(this.conf.f_url!=null){if(o.length==0){this.conf.f_server_last=o.toLowerCase();this.clearAll();return}if(this.conf.f_cache==true&&this.conf.f_cache_data[o]!=null){this.clearAll();this.conf.f_server_last=o.toLowerCase();for(var n=0;n<this.conf.f_cache_data[o].data.length;n++){this.load(this.conf.f_cache_data[o].data[n])}if(this.conf.f_dyn){this.conf.f_dyn_end=this.conf.f_cache_data[o].dyn_end;this.conf.f_mask=this.conf.f_cache_data[o].mask}if(u!==true){this._showList(true);this._checkForMatch()}}else{this.conf.f_server_tm=window.setTimeout(function(){g.conf.f_server_last=o.toLowerCase();g.conf.f_mask=o;var q="mask="+encodeURIComponent(o);if(g.conf.f_dyn){q+="&pos=0";g.conf.f_dyn_end=false}var a=function(z){if(g.conf.f_cache){if(!g.conf.f_cache_data[o]){g.conf.f_cache_data[o]={data:[],dyn_end:false,mask:o}}g.conf.f_cache_data[o].data.push(z.xmlDoc.responseXML)}g.clearAll();g.load(z.xmlDoc.responseText);var y=(g.base.offsetWidth>0&&g.base.offsetHeight>0);if(y==true&&g.conf.enabled==true&&g.conf.combo_focus==true&&u!==true){if(g.conf.f_ac&&g.conf.f_mode=="start"&&g.conf.clear_bsp==false&&g.list.firstChild!=null){var t=g.list.firstChild._optId;var A=String(g.t[t].obj.getText(g.list.firstChild,true));if(o==g.base.firstChild.value&&String(A).toLowerCase().indexOf(String(o).toLowerCase())===0){g.base.firstChild.value=A;g.conf.f_ac_text=A.substr(o.length);g._selectRange(o.length,A.length)}}g._showList(true);g._checkForMatch()}a=null};if(window.dhx4.ajax.method=="post"){window.dhx4.ajax.post(g.conf.f_url,q,a)}else{if(window.dhx4.ajax.method=="get"){window.dhx4.ajax.get(g.conf.f_url+(String(g.conf.f_url).indexOf("?")>=0?"&":"?")+q,a)}}},200)}}else{this.conf.f_server_last=o.toLowerCase();var m=(o.length==0?true:new RegExp((this.conf.f_mode=="start"?"^":"")+this._fixRE(o),"i"));var p=null;for(var v in this.t){var x=false;if(m!==true){if(this.conf.f_func!=null){var s=this._getOption(this.t[v].item._optId,n);x=(this.conf.f_func.apply(window,[o,s])==true)}else{var w=this.t[v].obj.getText(this.t[v].item,true);x=(m.test(w)==true)}}if(m===true||x==true){this.t[v].item.style.display="";if(p==null&&o.length>0){p=String(this.t[v].obj.getText(this.t[v].item,true))}}else{this.t[v].item.style.display="none"}}if(this.conf.f_ac&&this.conf.f_mode=="start"&&this.conf.clear_bsp==false&&p!=null){this.conf.f_ac_text=p.replace(new RegExp("^"+o,"i"),"");this.base.firstChild.value=p;this._selectRange(this.conf.f_server_last.length,this.base.firstChild.value.length)}if(this.conf.f_mode=="between"&&this.conf.clear_bsp==true){this._checkForMatch(true)}if(u!==true){this._showList(true);this._checkForMatch()}}};this._searchRO=function(m){if(this.conf.ro_tm){window.clearTimeout(this.conf.ro_tm)}this.conf.ro_text+=m;this._showList();for(var n=0;n<this.list.childNodes.length;n++){var a=this.list.childNodes[n]._optId;var o=String(this.t[a].obj.getText(this.list.childNodes[n],true)).toLowerCase();if(o.indexOf(this.conf.ro_text)===0){this._setSelected(a,true,true);this._confirmSelect("script",false);break}}this.conf.ro_tm=window.setTimeout(function(){g.conf.ro_text=""},this.conf.ro_tm_time)};this._fixRE=function(a){return String(a).replace(/[\\\^\$\*\+\?\.\(\)\|\{\}\[\]]/gi,"\\$&")};this._initObj=function(a){if(typeof(a.template)!="undefined"){this.setTemplate(a.template)}if(a.add!=true&&this.conf.f_loading!=true){this.clearAll(false)}this.addOption(a.options)};this._xmlToObj=function(H,p,o){var u={add:false,options:[]};var B=(p==true?H:H.getElementsByTagName("complete"));if(B.length>0){if(window.dhx4.s2b(B[0].getAttribute("add"))==true){u.add=true}var A=B[0].childNodes;for(var y=0;y<A.length;y++){if(typeof(A[y].tagName)!="undefined"){if(String(A[y].tagName).toLowerCase()=="template"){var G={};for(var s=0;s<A[y].childNodes.length;s++){var z=A[y].childNodes[s];if(z.tagName!=null){var C=z.tagName;if(typeof(this.conf.template[C])!="undefined"){G[C]=window.dhx4._xmlNodeValue(z)}if(C=="columns"){for(var E=0;E<z.childNodes.length;E++){var r=z.childNodes[E];if(r.tagName!=null&&r.tagName=="column"){var x={};for(var F in {width:1,css:1,header:1,option:1}){if(r.getAttribute(F)!=null){x[F]=r.getAttribute(F)}}for(var F in {header:1,option:1}){var D=r.getElementsByTagName(F);if(D[0]!=null&&D[0].firstChild!=null){x[F]=window.dhx4._xmlNodeValue(D[0])}}if(G.columns==null){G.columns=[]}G.columns.push(x)}r=null}}}z=null}this.setTemplate(G)}if(String(A[y].tagName).toLowerCase()=="option"){var v=false;if(p==true){v=(u.options.length==o)}else{v=window.dhx4.s2b(A[y].getAttribute("selected"))}var m={value:A[y].getAttribute("value"),text:window.dhx4._xmlNodeValue(A[y]),selected:v,checked:window.dhx4.s2b(A[y].getAttribute("checked"))};for(var F in {img:1,img_dis:1,img_src:1,img_src_dis:1,css:1}){if(A[y].getAttribute(F)!=null){m[F]=A[y].getAttribute(F)}}for(var s=0;s<A[y].childNodes.length;s++){if(A[y].childNodes[s].tagName!=null&&String(A[y].childNodes[s].tagName).toLowerCase()=="text"){m.text={};var z=A[y].childNodes[s];for(var E=0;E<z.childNodes.length;E++){if(z.childNodes[E].tagName!=null){m.text[z.childNodes[E].tagName]=window.dhx4._xmlNodeValue(z.childNodes[E])}}}}u.options.push(m)}}}B=A=null}return u};window.dhx4._enableDataLoading(this,"_initObj","_xmlToObj","complete",{data:true});window.dhx4._eventable(this);this._getNearItem=function(n,m){var a=null;while(n!=null){n=n[m<0?"previousSibling":"nextSibling"];if(a==null&&n!=null&&n.style.display==""&&n._optId!=null){a=n;n=null}}return a};this.setName(this.conf.form_name);this._doOnListMouseMove=function(m){m=m||event;var a=m.target||m.srcElement;while(a!=null&&a!=this){if(typeof(a._optId)!="undefined"){if(g.conf.tm_hover){window.clearTimeout(g.conf.tm_hover)}g._setSelected(a._optId,false,false,true)}a=a.parentNode}a=null};this._doOnListMouseDown=function(a){a=a||event;a.cancelBubble=true;g.conf.clear_click=true;window.setTimeout(function(){g.base.firstChild.focus()},1)};this._doOnListMouseUp=function(n){n=n||event;if(n.button!=g.conf.btn_left){return}var a=n.target||n.srcElement;while(a!=null&&a!=this){if(typeof(a._optId)!="undefined"){var m=true;if(typeof(g.t[a._optId].obj.optionClick)=="function"&&g.t[a._optId].obj.optionClick(a,n,g)!==true){m=false}if(m){g._setSelected(a._optId,null,true);g._confirmSelect("click")}}a=a.parentNode}a=null};this._doOnListMouseOut=function(a){if(g.conf.tm_hover){window.clearTimeout(g.conf.tm_hover)}g.conf.tm_hover=window.setTimeout(function(){var m=g.conf.last_match||g.conf.last_selected;if(g.conf.last_match==null&&g.t[m]!=null){if(g.base.firstChild.value!=g.t[m].obj.getText(g.t[m].item,true)){m=null}}g._setSelected(m,null,true,true)},1)};this._doOnBaseMouseDown=function(q){if(!g.conf.enabled){return}g.conf.clear_click=true;q=q||event;if(q.button!=g.conf.btn_left){return}var m=q.target||q.srcElement;if(m!=this.firstChild){window.setTimeout(function(){g.base.firstChild.focus()},1);var o=m;while(o!=this&&o!=null){if(o==this.lastChild){if(typeof(g.modes[g.conf.opts_type].topImageClick)=="function"){var n=(g.conf.last_hover||g.conf.last_selected);var a=(n!=null?g.t[n].item:null);if(g.modes[g.conf.opts_type].topImageClick(a,g)!==true){n=a=null;return}}o=null}else{o=o.parentNode}}}if(g._isListVisible()){g._hideList()}else{if(m!=this.firstChild){g.conf.clear_blur=true}g._showList();g._setSelected(g.conf.last_selected,true,true)}m=null};this._doOnBodyMouseDown=function(){if(g.conf.clear_click){g.conf.clear_click=false;return}g._confirmSelect("blur")};this._doOnInputFocus=function(){g.conf.clear_blur=false;if(g.conf.tm_confirm_blur){window.clearTimeout(g.conf.tm_confirm_blur)}if(g.conf.combo_focus==false){g.conf.combo_focus=true;if(g.conf.skin=="material"&&g.base.className.match(/dhxcombo_actv/)==null){g.base.className+=" dhxcombo_actv"}g.callEvent("onFocus",[])}};this._doOnInputBlur=function(){if(g.conf.clear_blur==true){g.conf.clear_blur=false;return}if(g.conf.tm_confirm_blur){window.clearTimeout(g.conf.tm_confirm_blur)}g.conf.tm_confirm_blur=window.setTimeout(function(){if(g.conf.clear_click==false){g._confirmSelect("blur");g.conf.combo_focus=false;if(g.conf.skin=="material"&&g.base.className.match(/dhxcombo_actv/)!=null){g.base.className=g.base.className.replace(/\s*dhxcombo_actv/gi,"")}g.callEvent("onBlur",[])}},20)};this._doOnInputKeyUp=function(a){a=a||event;if(g.conf.f_mode!=false){g.conf.clear_bsp=(a.keyCode==8||a.keyCode==46);g._filterOpts();return}else{g._checkForMatch()}};this._doOnInputKeyDown=function(a){a=a||event;if((a.keyCode==38||a.keyCode==40)&&!a.ctrlKey&&!a.shiftKey&&!a.altKey){if(a.preventDefault){a.preventDefault()}else{a.returnValue=false}a.cancelBubble=true;g._keyOnUpDown(a.keyCode==38?-1:1)}if(a.keyCode==113){if(!g._isListVisible()){g._showList();if(g.base.firstChild.value==g.conf.last_text){g._setSelected(g.conf.last_selected,true,true);g.base.firstChild.value=g.conf.last_text;g.conf.f_server_last=g.base.firstChild.value.toLowerCase()}else{g.conf.f_server_last=g.base.firstChild.value.toLowerCase();if(g.conf.f_mode==false){g._checkForMatch()}}}else{}}if(a.keyCode==27){if(a.preventDefault){a.preventDefault()}else{a.returnValue=false}a.cancelBubble=true;g._cancelSelect()}if(a.keyCode==13){if(a.preventDefault){a.preventDefault()}g._confirmSelect("kbd")}if(g.conf.ro_mode==true&&((a.keyCode>=48&&a.keyCode<=57)||(a.keyCode>=65&&a.keyCode<=90))){g._searchRO(String.fromCharCode(a.keyCode).toLowerCase());a.cancelBubble=true}g.conf.clear_key=true;g.callEvent("onKeyPressed",[a.keyCode||a.charCode])};this._doOnInputKeyPress=function(a){if(g.conf.clear_key){g.conf.clear_key=false;return}a=a||event;g.callEvent("onKeyPressed",[a.keyCode||a.charCode])};this._keyOnUpDown=function(a){var m=null;if(this.conf.last_hover){m=this.t[this.conf.last_hover].item}else{if(this.conf.last_selected){m=this.t[this.conf.last_selected].item}}if(!m&&this._getListVisibleCount()==0){return}if(m!=null&&m.style.display!=""){m=null}this._showList();if(m!=null){if(this.t[m._optId].obj.isSelected(m)){m=this._getNearItem(m,a)}}else{m=this.list.firstChild;if(m.style.display!=""){m=this._getNearItem(m,1)}}if(m==null){return}this._setSelected(m._optId,true,true);if(this.conf.f_mode==false){this.base.firstChild.value=this.t[m._optId].obj.getText(m,true)}else{var n=String(this.t[m._optId].obj.getText(m,true));if(this.conf.f_mode=="start"&&this.conf.f_ac==true){if(n.toLowerCase().indexOf(this.conf.f_server_last)===0){this.conf.f_ac_text=n.substring(this.conf.f_server_last.length,n.length);this.base.firstChild.value=n;this._selectRange(this.conf.f_server_last.length,this.base.firstChild.value.length)}else{this.base.firstChild.value=n;this.conf.f_server_last=this.base.firstChild.value.toLowerCase();this._selectRange(0,this.base.firstChild.value.length)}}else{this.base.firstChild.value=n;this.conf.f_server_last=this.base.firstChild.value.toLowerCase()}}m=null};this.conf.evs_nodes=[{node:document.body,evs:{mousedown:"_doOnBodyMouseDown"}},{node:this.base,evs:{mousedown:"_doOnBaseMouseDown"}},{node:this.base.firstChild,evs:{keyup:"_doOnInputKeyUp",keydown:"_doOnInputKeyDown",keypress:"_doOnInputKeyPress",focus:"_doOnInputFocus",blur:"_doOnInputBlur"}},{node:this.list,evs:{mousemove:"_doOnListMouseMove",mousedown:"_doOnListMouseDown",mouseup:"_doOnListMouseUp",mouseout:"_doOnListMouseOut"}}];for(var b=0;b<this.conf.evs_nodes.length;b++){for(var i in this.conf.evs_nodes[b].evs){if(typeof(window.addEventListener)=="function"){this.conf.evs_nodes[b].node.addEventListener(i,this[this.conf.evs_nodes[b].evs[i]],false)}else{this.conf.evs_nodes[b].node.attachEvent("on"+i,this[this.conf.evs_nodes[b].evs[i]])}}}this.unload=function(){this.clearAll();this.t=null;for(var n=0;n<this.conf.evs_nodes.length;n++){for(var m in this.conf.evs_nodes[n].evs){if(typeof(window.addEventListener)=="function"){this.conf.evs_nodes[n].node.removeEventListener(m,this[this.conf.evs_nodes[n].evs[m]],false)}else{this.conf.evs_nodes[n].node.detachEvent("on"+m,this[this.conf.evs_nodes[n].evs[m]])}this.conf.evs_nodes[n].evs[m]=null;delete this.conf.evs_nodes[n].evs[m]}this.conf.evs_nodes[n].node=null;this.conf.evs_nodes[n].evs=null;delete this.conf.evs_nodes[n].node;delete this.conf.evs_nodes[n].evs;this.conf.evs_nodes[n]=null}window.dhx4._eventable(this,"clear");window.dhx4._enableDataLoading(this,null,null,null,"clear");this._mcDetachHeader();this.DOMelem_input=this.DOMelem_button=this.DOMlist=this.DOMelem=this.DOMParent=null;for(var m in this.conf){this.conf[m]=null;delete this.conf[m]}this.conf=null;if(typeof(window.addEventListener)=="function"){this.list.removeEventListener("scroll",this._doOnListScroll,false)}else{this.list.detachEvent("onscroll",this._doOnListScroll)}this.base.parentNode.removeChild(this.base);this.list.parentNode.removeChild(this.list);this.base=this.list=this.cont=null;this.modes=null;for(var m in this){if(typeof(this[m])=="function"){this[m]=null}}g=null};this.DOMelem_input=this.base.firstChild;this.DOMelem_button=this.base.childNodes[this.base.childNodes.length-(this.conf.combo_image?2:1)];this.DOMlist=this.list;this.DOMelem=this.base;this.DOMParent=f;f=null;if(d!=null){if(d.filter!=null){if(typeof(d.filter)=="string"){this.enableFilteringMode(true,d.filter,window.dhx4.s2b(d.filter_cache),window.dhx4.s2b(d.filter_sub_load))}else{this.enableFilteringMode(true)}}if(d.image_path!=null){this.setImagePath(d.image_path)}if(d.default_image!=null||d.default_image_dis!=null){this.setDefaultImage(d.default_image,d.default_image_dis)}if(d.items||d.options){this.addOption(d.items||d.options)}if(d.xml||d.json){this.load(d.xml||d.json)}if(typeof(d.readonly)!="undefined"){this.readonly(d.readonly)}d=null}return this}function dhtmlXComboFromSelect(c){if(typeof(c)=="string"){c=document.getElementById(c)}var b=c.offsetWidth;var j=c.getAttribute("name")||null;var d=document.createElement("SPAN");c.parentNode.insertBefore(d,c);var f=c.getAttribute("mode")||c.getAttribute("opt_type")||"option";var e=new dhtmlXCombo(d,j,b,f);d=null;var h=c.getAttribute("imagePath");if(h){e.setImagePath(h)}var i=c.getAttribute("defaultImage");var g=c.getAttribute("defaultImageDis");if(window.dhx4.s2b(g)==true){g=true}if(i!=null||g!=null){e.setDefaultImage(i,g)}var a=e._xmlToObj([c],true,c.selectedIndex);if(a.options.length>0){e.addOption(a.options)}a=null;c.parentNode.removeChild(c);c=null;return e}dhtmlXCombo.prototype.setName=function(a){this.conf.form_name=a;this.base.childNodes[1].name=a;this.base.childNodes[2].name=a.replace(/(\[.*)?$/,"_new_value$1")};dhtmlXCombo.prototype.readonly=function(a){if(window.dhx4.s2b(a)){this.base.firstChild.setAttribute("readOnly","true");this.conf.ro_mode=true}else{this.base.firstChild.removeAttribute("readOnly");this.conf.ro_mode=false}};dhtmlXCombo.prototype.setPlaceholder=function(a){if(typeof(a)=="undefined"||a==null){a=""}this.base.firstChild.setAttribute("placeholder",String(a))};dhtmlXCombo.prototype.setTemplate=function(c){for(var b in c){if(typeof(this.conf.template[b])!="undefined"){if(b=="header"){this.conf.template[b]=window.dhx4.s2b(c[b])}else{this.conf.template[b]=String(c[b])}}}if(c.columns!=null){this._mcMakeTemplate(c.columns)}else{this._mcDetachHeader()}for(var b in this.t){this.t[b].obj.setText(this.t[b].item,this.t[b].item._conf.text)}this._confirmSelect("template")};dhtmlXCombo.prototype.setSkin=function(a){if(a==this.conf.skin){return}this.conf.skin=a;this.base.className="dhxcombo_"+this.conf.skin+(this.conf.enabled?"":" dhxcombo_disabled");this.list.className="dhxcombolist_"+this.conf.skin+(this.hdr!=null?" dhxcombolist_multicolumn":"");if(this.hdr!=null){this.hdr.className="dhxcombolist_"+this.conf.skin+" dhxcombolist_hdr"}this.conf.i_ofs=(a=="material"?26:23);this._adjustBase()};dhtmlXCombo.prototype.getInput=function(){return this.base.firstChild};dhtmlXCombo.prototype.getButton=function(){return this.base.childNodes[this.base.childNodes.length-(this.conf.combo_image?2:1)]};dhtmlXCombo.prototype.getList=function(){return this.list};dhtmlXCombo.prototype.getBase=function(){return this.base};dhtmlXCombo.prototype.getParent=function(){return this.DOMParent};dhtmlXCombo.prototype.forEachOption=function(a){for(var b=0;b<this.list.childNodes.length;b++){a.apply(window,[this._getOption(this.list.childNodes[b]._optId,b)])}};dhtmlXCombo.prototype.setFocus=function(){if(this.conf.enabled){this.base.firstChild.focus()}};dhtmlXCombo.prototype.setFontSize=function(a,b){if(a!=null){this.base.firstChild.style.fontSize=a}if(b!=null){this.list.style.fontSize=b}};dhtmlXCombo.prototype.getOption=function(e){var f=null;var c=null;for(var d=0;d<this.list.childNodes.length;d++){if(f==null){var b=this.list.childNodes[d]._optId;if(this.t[b].obj.getValue(this.t[b].item)==e){f=b;c=d}}}return(f==null?null:this._getOption(f,c))};dhtmlXCombo.prototype.getOptionByIndex=function(a){if(a<0){return null}if(this.list.childNodes[a]==null){return null}return this._getOption(this.list.childNodes[a]._optId,a)};dhtmlXCombo.prototype.getOptionByLabel=function(e){var f=null;var c=null;for(var d=0;d<this.list.childNodes.length;d++){if(f==null){var b=this.list.childNodes[d]._optId;if(this.t[b].obj.getText(this.t[b].item,true)==e){f=b;c=d}}}return(f==null?null:this._getOption(f,c))};dhtmlXCombo.prototype.getSelectedIndex=function(){return this._getOptionProp(this.conf.last_selected,"index",-1)};dhtmlXCombo.prototype.getSelectedText=function(){return this._getOptionProp(this.conf.last_selected,"text","")};dhtmlXCombo.prototype.getSelectedValue=function(){return this._getOptionProp(this.conf.temp_selected||this.conf.last_selected,"value",null)};dhtmlXCombo.prototype.getActualValue=function(){return this.base.childNodes[1].value};dhtmlXCombo.prototype.getComboText=function(){return this.base.childNodes[0].value};dhtmlXCombo.prototype.getIndexByValue=function(b){var a=this.getOption(b);return(a!=null?a.index:-1)};dhtmlXCombo.prototype.setComboText=function(a){if(this.conf.allow_free_text!=true){return}this.unSelectOption();this.conf.last_text=this.base.firstChild.value=a;this.conf.f_server_last=this.base.firstChild.value.toLowerCase()};dhtmlXCombo.prototype.setComboValue=function(b){var a=this.getOption(b);if(a!=null){this.selectOption(a.index)}else{this.conf.last_value=b;this.base.childNodes[1].value=this.conf.last_value;this.base.childNodes[2].value="true"}};dhtmlXCombo.prototype.selectOption=function(b,c,a){if(b<0||b>=this.list.childNodes.length){return}var d=this.list.childNodes[b]._optId;this._setSelected(d,this._isListVisible(),true);this._confirmSelect("script")};dhtmlXCombo.prototype.unSelectOption=function(){if(this.conf.last_hover!=null){this.t[this.conf.last_hover].obj.setSelected(this.t[this.conf.last_hover].item,false);this.conf.last_hover=null}this.base.firstChild.value="";if(this.conf.f_mode!=false){this._filterOpts(true)}this._hideList();this._updateTopImage(null);this._confirmSelect("script")};dhtmlXCombo.prototype.confirmValue=function(){this._confirmSelect("script")};dhtmlXCombo.prototype.enable=function(a){a=(typeof(a)=="undefined"?true:window.dhx4.s2b(a));if(this.conf.enabled==a){return}this.conf.enabled=a;if(a){this.base.className="dhxcombo_"+this.conf.skin;this.base.firstChild.removeAttribute("disabled")}else{this._hideList();this.base.className="dhxcombo_"+this.conf.skin+" dhxcombo_disabled";this.base.firstChild.setAttribute("disabled","true")}this._updateTopImage(this.conf.last_selected)};dhtmlXCombo.prototype.disable=function(a){a=(typeof(a)=="undefined"?true:window.dhx4.s2b(a));this.enable(!a)};dhtmlXCombo.prototype.isEnabled=function(){return(this.conf.enabled==true)};dhtmlXCombo.prototype.show=function(a){if(typeof(a)=="undefined"){a=true}else{a=window.dhx4.s2b(a)}this.base.style.display=(a==true?"":"none")};dhtmlXCombo.prototype.hide=function(a){if(typeof(a)=="undefined"){a=true}this.show(!a)};dhtmlXCombo.prototype.isVisible=function(){return(this.base.style.display=="")};dhtmlXCombo.prototype.setFilterHandler=function(a){if(typeof(a)=="function"){this.conf.f_func=a;this.conf.f_mode=true;this.conf.f_dyn=this.conf.f_cache=this.conf.f_url=null}else{if(typeof(a)=="string"&&typeof(window[a])=="function"){this.conf.f_func=window[a];this.conf.f_mode=true;this.conf.f_dyn=this.conf.f_cache=this.conf.f_url=null}else{this.conf.f_func=null}}};dhtmlXCombo.prototype.enableFilteringMode=function(d,b,a,c){if(d==true||d=="between"){this.conf.f_mode=(d==true?"start":"between");if(b){this.conf.f_url=b;this.conf.f_cache=window.dhx4.s2b(a);this.conf.f_dyn=window.dhx4.s2b(c)}else{this.conf.f_url=null;this.conf.f_cache=false;this.conf.f_dyn=false}}else{this.conf.f_mode=false;this.conf.f_url=null;this.conf.f_cache=false;this.conf.f_dyn=false}};dhtmlXCombo.prototype.filter=function(c,a){for(var d=0;d<this.list.childNodes.length;d++){var b=c.apply(window,[this._getOption(this.list.childNodes[d]._optId,d)]);this.list.childNodes[d].style.display=(b===true?"":"none")}if(typeof(a)=="undefined"||a==true){this._showList(true)}};dhtmlXCombo.prototype.sort=function(c){var a=[];for(var b=0;b<this.list.childNodes.length;b++){var d=this.list.childNodes[b]._optId;a.push([d,this._getOption(d,b)])}if(c=="asc"||c=="desc"){k=true;a.sort(function(f,e){f=f[1].text_option.toLowerCase();e=e[1].text_option.toLowerCase();var g=(c=="asc"?1:-1);return(f>e?g:-1*g)})}else{if(typeof(c)=="function"||typeof(window[c])=="function"){if(typeof(window[c])=="function"){c=window[c]}a.sort(function(f,e){return c.apply(window,[f[1],e[1]])})}}while(this.list.childNodes.length>0){this.list.removeChild(this.list.lastChild)}for(var b=0;b<a.length;b++){this.list.appendChild(this.t[a[b][0]].item)}};dhtmlXCombo.prototype.enableAutocomplete=function(a){if(typeof(a)=="undefined"){a=true}else{a=window.dhx4.s2b(a)}this.conf.f_ac=a};dhtmlXCombo.prototype.disableAutocomplete=function(a){if(typeof(a)=="undefined"){a=true}else{a=window.dhx4.s2b(a)}this.enableAutocomplete(!a)};dhtmlXCombo.prototype.allowFreeText=function(b,a){this.conf.allow_free_text=(typeof(b)=="undefined"?true:window.dhx4.s2b(b));this.conf.free_text_empty=(typeof(a)=="undefined"?false:window.dhx4.s2b(a))};dhtmlXCombo.prototype._checkForMatch=function(d){var a=window.dhx4.trim(this.base.firstChild.value).toLowerCase();var e=null;var b=this.list.firstChild;while(b!=null){if(b.style.display==""&&b._optId!=null){var c=window.dhx4.trim(this.t[b._optId].obj.getText(b,true)).toLowerCase();if(a==c){e=b._optId;b=null}}if(b!=null){b=b.nextSibling}}if(this.conf.last_match==null){if(e!=null){this._setSelected(e,true,true);this.conf.last_match=e}else{if(this.conf.f_mode!="between"||d==true){this._setSelected(null,true,true);this.conf.last_match=null}}}else{if(e!=null){if(e!=this.conf.last_match){this._setSelected(e,true,true);this.conf.last_match=e}}else{this._setSelected(null,true,true);this.conf.last_match=null}}};dhtmlXCombo.prototype._selectRange=function(b,a){if(this.conf.combo_focus==true){window.dhx4.selectTextRange(this.base.firstChild,b,a)}};dhtmlXCombo.prototype.openSelect=function(){if(!this._isListVisible()){this._showList()}};dhtmlXCombo.prototype.closeAll=function(){this._hideList()};dhtmlXCombo.prototype._showList=function(a){if(this._getListVisibleCount()==0){if(a&&this._isListVisible()){this._hideList()}return}if(this._isListVisible()){this._checkListHeight();return}this.list.style.zIndex=window.dhx4.zim.reserve(this.conf.list_zi_id);if(this.hdr!=null&&this.conf.template.header==true){this.hdr.style.zIndex=Number(this.list.style.zIndex)+1}this.list.style.visibility="hidden";this.list.style.display="";if(this.hdr!=null&&this.conf.template.header==true){this.hdr.style.visibility=this.list.style.visibility;this.hdr.style.display=this.list.style.display}var b=(this.hdr!=null&&this.conf.template.header==true?this.hdr.offsetHeight:0);this.list.style.width=Math.max(this.conf.opts_width||this.conf.col_w||0,this.conf.combo_width)+"px";this.list.style.top=window.dhx4.absTop(this.base)+b+this.base.offsetHeight-1+"px";this.list.style.left=window.dhx4.absLeft(this.base)+"px";if(this.hdr!=null&&this.conf.template.header==true){this.hdr.style.width=this.list.style.width;this.hdr.style.left=this.list.style.left;this.hdr.style.top=parseInt(this.list.style.top)-b+"px"}this._checkListHeight();this.list.style.visibility="visible";if(this.hdr!=null&&this.conf.template.header==true){this.hdr.style.visibility="visible"}this.callEvent("onOpen",[])};dhtmlXCombo.prototype._hideList=function(){if(!this._isListVisible()){return}window.dhx4.zim.clear(this.conf.list_zi_id);this.list.style.display="none";if(this.hdr!=null&&this.conf.template.header==true){this.hdr.style.display="none"}this.conf.clear_click=false;this.callEvent("onClose",[])};dhtmlXCombo.prototype._isListVisible=function(){return(this.list.style.display=="")};dhtmlXCombo.prototype._getListVisibleCount=function(){var a=0;for(var b=0;b<this.list.childNodes.length;b++){a+=(this.list.childNodes[b].style.display==""?1:0)}return a};dhtmlXCombo.prototype._checkListHeight=function(){if(!this._isListVisible()){return}if(this.conf.item_h==null){var j=this.list.firstChild;while(j!=null){if(j.style.display==""){this.conf.item_h=j.offsetHeight+(this.hdr!=null?-1:0);j=null}else{j=j.nextSibling}}j=null}var l=window.dhx4.screenDim();var f=window.dhx4.absTop(this.base);var b=this.base.offsetHeight;var a=(this.hdr!=null&&this.conf.template.header==true?this.hdr.offsetHeight:0);var c=Math.max(0,Math.floor((f-a-l.top)/this.conf.item_h));var i=Math.max(0,Math.floor((l.bottom-(f+b+a))/this.conf.item_h));var m=this._getListVisibleCount();if(i<Math.min(this.conf.opts_count_min,m)&&c>i){i=null}var g=Math.min((i==null?c:i),this.conf.opts_count,m);var d=(g<m?(g*this.conf.item_h)+"px":"");var e=this.conf.sp[this.conf.skin][this.hdr!=null&&this.conf.template.header==true?"hdr_ofs":"list_ofs"];this.list.style.height=d;this.list.style.top=(i==null?f-this.list.offsetHeight+e:f+b+a-e)+"px";if(this.hdr!=null&&this.conf.template.header==true){this.hdr.style.top=(i==null?f-a-this.list.offsetHeight+e:f+b-e)+"px"}};dhtmlXCombo.prototype._scrollToItem=function(e){var d=this.t[e].item.offsetTop;var c=d+this.t[e].item.offsetHeight;var b=this.list.scrollTop;var a=b+this.list.clientHeight;if(d<b){this.list.scrollTop=d+(this.hdr!=null&&this.conf.template.header==true?1:0)}else{if(c>a){this.list.scrollTop=c-this.list.clientHeight+(this.hdr!=null&&this.conf.template.header==true?-this.conf.sp[this.conf.skin].scr_ofs:0)}}};dhtmlXCombo.prototype._setSelected=function(d,c,b,a){this.conf.temp_selected=null;if(b){this._updateTopImage(d)}if(d!=null&&this.conf.last_hover==d){if(c){this._scrollToItem(d)}return}if(this.conf.last_hover!=null){this.t[this.conf.last_hover].obj.setSelected(this.t[this.conf.last_hover].item,false);this.conf.last_hover=null;if(d==null){this.callEvent("onSelectionChange",[])}}if(d!=null){this.t[d].obj.setSelected(this.t[d].item,true);this.conf.last_hover=d;if(a!=true){this.conf.temp_selected=d;this.callEvent("onSelectionChange",[])}if(this.conf.s_mode=="select"&&this.t[d].item==this.t[d].item.parentNode.lastChild){this._subloadRequest()}if(c){this._scrollToItem(d)}}};dhtmlXCombo.prototype._subloadRequest=function(){if(this.conf.f_url!=null&&this.conf.f_dyn==true&&this.conf.f_dyn_end==false){var c="mask="+encodeURIComponent(this.conf.f_mask)+"&pos="+this.list.childNodes.length;var a=this;var b=function(e){if(a.conf.f_cache){a.conf.f_cache_data[a.conf.f_mask].data.push(e.xmlDoc.responseXML)}var d=a.list.childNodes.length;a.conf.f_loading=true;a.load(e.xmlDoc.responseXML);a.conf.f_loading=false;if(d==a.list.childNodes.length){a.conf.f_dyn_end=true;if(a.conf.f_cache){a.conf.f_cache_data[a.conf.f_mask].dyn_end=true}}b=a=null};if(window.dhx4.ajax.method=="post"){window.dhx4.ajax.post(this.conf.f_url,c,b)}else{if(window.dhx4.ajax.method=="get"){window.dhx4.ajax.get(this.conf.f_url+(String(this.conf.f_url).indexOf("?")>=0?"&":"?")+c,b)}}}};dhtmlXCombo.prototype.addOption=function(f,g,b,a,d){var c=null;if(!(f instanceof Array)){var h=this._renderOption({value:f,text:g,css:b,img:a});if(c==null&&window.dhx4.s2b(d)==true){c=h}}else{for(var e=0;e<f.length;e++){if(typeof(f[e])=="undefined"){continue}if(f[e] instanceof Array){h=this._renderOption({value:f[e][0],text:f[e][1],css:f[e][2],img:f[e][3]});if(c==null&&window.dhx4.s2b(f[e][4])==true){c=h}}else{var h=this._renderOption(f[e]);if(c==null&&window.dhx4.s2b(f[e].selected)==true){c=h}}}}if(c!=null){this._setSelected(c,this._isListVisible(),true);this._confirmSelect("onInit")}};dhtmlXCombo.prototype.updateOption=function(a,c,b,d){var e=this._getOptionId(a);if(e==null){return}this.t[e].obj.update(this.t[e].item,{value:c,text:b,css:d});if(this.conf.last_selected==e){this.conf.last_text=this.base.firstChild.value=this.t[e].obj.getText(this.t[e].item,true);this.conf.f_server_last=this.base.firstChild.value.toLowerCase()}};dhtmlXCombo.prototype.deleteOption=function(d){for(var b in this.t){var c=this.t[b].obj.getValue(this.t[b].item);if(c==d){this._removeOption(b)}}if(this._isListVisible()){this._showList(true)}};dhtmlXCombo.prototype.clearAll=function(b){b=(typeof(b)=="undefined"?true:window.dhx4.s2b(b));for(var c in this.t){this._removeOption(c)}if(this.conf.tm_hover){window.clearTimeout(this.conf.tm_hover)}this.conf.last_hover=null;this.conf.last_selected=null;this.list.scrollTop=0;if(b==true){this._hideList()}};dhtmlXCombo.prototype._renderOption=function(d){var e=window.dhx4.newId();var c=document.createElement("DIV");c._optId=e;c._tpl=this.conf.template;if(typeof(d.img)=="undefined"&&typeof(d.img_src)!="undefined"){d.img=d.img_src;delete d.img_src}if(typeof(d.img_dis)=="undefined"&&typeof(d.img_src_dis)!="undefined"){d.img_dis=d.img_src_dis;delete d.img_src_dis}d.img_path=this.conf.img_path;d.img_def=this.conf.img_def;d.img_def_dis=this.conf.img_def_dis;this.list.appendChild(c);var b=(this._isListVisible()&&window.dhx4.isFF==true);if(b==true){var a=this.list.scrollTop;this.list.scrollTop-=1}if(this.hdr!=null){d.multicol=true}this.t[c._optId]={obj:this.modes[this.conf.opts_type].render(c,d),item:c,conf:{type:this.conf.opts_type}};c=null;if(b==true){this.list.scrollTop+=1}return e};dhtmlXCombo.prototype._removeOption=function(a){this.t[a].obj.destruct(this.t[a].item);this.t[a].obj=null;this.t[a].item.parentNode.removeChild(this.t[a].item);this.t[a].item=null;this.t[a].conf=null;this.t[a]=null;delete this.t[a];if(this.conf.last_hover==a){this.conf.last_hover=null}if(this.conf.last_selected==a){this.conf.last_selected=null;this._confirmSelect("onDelete")}};dhtmlXCombo.prototype._confirmSelect=function(c,a){var b=false;if(typeof(a)=="undefined"){a=true}if(this.conf.f_server_tm){window.clearTimeout(this.conf.f_server_tm)}if(this.conf.last_hover!=null){b=b||(this.conf.last_value!=this._getOptionValue(this.conf.last_hover));this.conf.last_match=this.conf.last_selected=this.conf.last_hover;this.conf.last_value=this._getOptionValue(this.conf.last_selected);this.conf.last_text=this.base.firstChild.value=this.t[this.conf.last_selected].obj.getText(this.t[this.conf.last_selected].item,true);this.conf.f_server_last=this.base.firstChild.value.toLowerCase();this.base.childNodes[1].value=this.conf.last_value;this.base.childNodes[2].value="false"}else{if(this.conf.allow_free_text||(this.base.firstChild.value==""&&this.conf.allow_empty_value)){b=b||(this.conf.last_text!=this.base.firstChild.value);this.conf.last_match=this.conf.last_value=this.conf.last_selected=null;this.conf.last_text=this.base.firstChild.value;this.conf.f_server_last=this.base.firstChild.value.toLowerCase();this.base.childNodes[1].value=this.conf.last_text;this.base.childNodes[2].value="true"}else{if(c!="template"){this._cancelSelect(true);this._updateTopImage(this.conf.last_selected);return}}}if(this.conf.f_ac&&this.conf.f_mode=="start"){this.conf.f_ac_text="";if(c!="blur"){this._selectRange(this.base.firstChild.value.length,this.base.firstChild.value.length)}}if(a){this._hideList()}if(b==true&&c!="onInit"&&c!="onDelete"){this.callEvent("onSelectionChange",[]);this.callEvent("onChange",[this.conf.last_value,this.conf.last_text])}};dhtmlXCombo.prototype._cancelSelect=function(a){this._hideList();if(a==true&&this.conf.allow_free_text==false&&this.conf.free_text_empty==true){this.conf.f_server_last=this.conf.last_match=this.conf.last_value=this.conf.last_selected=null;this.base.childNodes[1].value=this.conf.last_text=this.base.firstChild.value="";this.base.childNodes[2].value="false"}else{this.base.firstChild.value=this.conf.last_text}if(this.conf.f_mode!=false){this._filterOpts(true)}};dhtmlXCombo.prototype._getOption=function(g,d){if(!this.t[g]){return null}if(typeof(d)=="undefined"){d=-1}if(d<0){for(var f=0;f<this.list.childNodes.length;f++){if(d<0&&this.list.childNodes[f]._optId==g){d=f}}}var e={value:this.t[g].obj.getValue(this.t[g].item),text:this.t[g].obj.getText(this.t[g].item),text_input:this.t[g].obj.getText(this.t[g].item,true),text_option:this.t[g].obj.getText(this.t[g].item,null,true),css:this.t[g].obj.getCss(this.t[g].item),selected:(g==this.conf.last_selected),index:d};if(typeof(this.t[g].obj.getExtraData)=="function"){var c=this.t[g].obj.getExtraData(this.t[g].item);for(var b in c){if(typeof(e[b])=="undefined"){e[b]=c[b]}}}return e};dhtmlXCombo.prototype._getOptionProp=function(d,c,b){if(d!=null){var a=this._getOption(d);if(a!=null){return a[c]}}return b};dhtmlXCombo.prototype._getOptionId=function(b){var d=null;for(var a=0;a<this.list.childNodes.length;a++){if(d==null){var c=this.list.childNodes[a]._optId;if(b==this.t[c].obj.getValue(this.t[c].item)){d=c}}}return d};dhtmlXCombo.prototype._getOptionValue=function(a){return this._getOptionProp(a,"value",null)};dhtmlXCombo.prototype.setSize=function(a){this.conf.combo_width=parseInt(a)-(dhx4.isFF||dhx4.isIE||dhx4.isChrome||dhx4.isOpera?2:0);this.base.style.width=Math.max(0,this.conf.combo_width)+"px";this._adjustBase();if(this._isListVisible()){this._hideList();this._showList()}};dhtmlXCombo.prototype._adjustBase=function(){this.base.firstChild.style.width=Math.max(0,(this.conf.combo_width-(this.conf.i_ofs+1)-(this.conf.combo_image?this.conf.i_ofs:0)))+"px";this.base.firstChild.style.marginLeft=(this.conf.combo_image?this.conf.i_ofs+"px":"0px")};dhtmlXCombo.prototype.setOptionWidth=function(a){this.conf.opts_width=(parseInt(a)||null)};dhtmlXCombo.prototype.setOptionIndex=function(c,a){if(isNaN(a)||a<0){return}var d=this.getOption(c);if(d==null){return}if(a==d.index){return}var b=this.list.childNodes[d.index];b.parentNode.removeChild(b);if(this.list.childNodes[a]!=null){this.list.insertBefore(b,this.list.childNodes[a])}else{this.list.appendChild(b)}b=null};dhtmlXCombo.prototype.getOptionsCount=function(){return this.list.childNodes.length};dhtmlXCombo.prototype._mcMakeTemplate=function(i){var e="";var d="";this.conf.col_w=0;for(var f=0;f<i.length;f++){var a=Number(parseInt(i[f].width)||50);var c=(i[f].css||"");var g=(f==0&&window.dhx4.isIE6==true?"_first":"");d+="<div class='dhxcombo_cell"+g+" "+c+"' style='width:60px;'><div class='dhxcombo_cell_text'>"+(i[f].option||"&nbsp;")+"</div></div>";e+="<div class='dhxcombo_hdrcell"+g+" "+c+"' style='width:"+a+"px;'><div class='dhxcombo_hdrcell_text'>"+(i[f].header||"&nbsp;")+"</div></div>";this.conf.col_w+=a+1}var a=500;var b=document.createElement("DIV");b.style.position="absolute";b.style.top="10px";b.style.left=-a*2+"px";b.style.width=a+"px";b.style.height="50px";b.style.overflowY="scroll";b.innerHTML="<div>&nbsp;</div>";document.body.appendChild(b);this.conf.col_w+=a-b.firstChild.offsetWidth+10;b.parentNode.removeChild(b);b=null;this.conf.template.option=d;this._mcAttachHeader(e);this.list.className+=" dhxcombolist_multicolumn"};dhtmlXCombo.prototype._mcAttachHeader=function(a){if(this.hdr==null){this.hdr=document.createElement("DIV");this.hdr.className="dhxcombolist_"+this.conf.skin+" dhxcombolist_hdr";this.hdr.style.display="none";this.list.parentNode.insertBefore(this.hdr,this.list);if(typeof(window.addEventListener)=="function"){this.hdr.addEventListener("mousedown",this._doOnListMouseDown,false)}else{this.hdr.attachEvent("onmousedown",this._doOnListMouseDown)}if(this.conf.opts_type=="checkbox"&&this.conf.combo_image==true){this.conf.combo_image=false;if(this.base.lastChild.className.match(/dhxcombo_top_image/)!=null){this.base.removeChild(this.base.lastChild)}this._adjustBase()}}this.hdr.innerHTML="<div class='dhxcombo_hdrtext'>"+a+"</div>"};dhtmlXCombo.prototype._mcDetachHeader=function(){if(this.hdr!=null){if(typeof(window.addEventListener)=="function"){this.hdr.removeEventListener("mousedown",this._doOnListMouseDown,false)}else{this.hdr.detachEvent("onmousedown",this._doOnListMouseDown)}this.hdr.parentNode.removeChild(this.hdr);this.hdr=null}this.conf.col_w=null;this.conf.item_h=null};dhtmlXCombo.prototype.modes={};dhtmlXCombo.prototype.doWithItem=function(a,g,e,c){var f=(a>=0&&a<this.list.childNodes.length?this.list.childNodes[a]._optId:null);if(f==null){return null}if(typeof(this.t[f].obj[g])!="function"){return null}var d=[this.t[f].item];for(var b=2;b<arguments.length;b++){d.push(arguments[b])}return this.t[f].obj[g].apply(this.t[f].obj,d)};function dhtmlXComboExtend(d,c){for(var b in dhtmlXCombo.prototype.modes[c]){if(typeof(dhtmlXCombo.prototype.modes[d][b])=="undefined"){dhtmlXCombo.prototype.modes[d][b]=dhtmlXCombo.prototype.modes[c][b]}}}dhtmlXCombo.prototype.modes.option={image:false,html:false,option_css:"dhxcombo_option_text",render:function(a,b){a._conf={value:b.value,css:""};a.className="dhxcombo_option";a.innerHTML="<div class='"+this.option_css+"'>&nbsp;</div>";if(b.css!=null){a.lastChild.style.cssText=b.css;a._conf.css=b.css}this.setText(a,b.text);return this},destruct:function(a){a._conf=null},update:function(a,b){a._conf.value=b.value;a._conf.css=b.css;a.lastChild.style.cssText=b.css;this.setText(a,b.text)},setText:function(c,d,b){c._conf.text=d;var a=(typeof(d)=="object"?window.dhx4.template(c._tpl.option,this.replaceHtml(c._conf.text,b),true):window.dhx4.trim(this.replaceHtml(c._conf.text,b)||""));c.lastChild.innerHTML=(a.length==0?"&nbsp;":a)},getText:function(c,a,b){if(window.dhx4.s2b(a)&&typeof(c._conf.text)=="object"){return window.dhx4.template(c._tpl.input,c._conf.text,true)}if(window.dhx4.s2b(b)&&typeof(c._conf.text)=="object"){return window.dhx4.template(c._tpl.option,c._conf.text,true)}return c._conf.text},getValue:function(a){return a._conf.value},getCss:function(a){return a._conf.css},setSelected:function(a,b){a.className="dhxcombo_option"+(b?" dhxcombo_option_selected":"")},isSelected:function(a){return String(a.className).indexOf("dhxcombo_option_selected")>=0},getExtraData:function(a){return{type:"option"}},replaceHtml:function(e,d){if(this.html==true){return e}if(typeof(d)=="undefined"||d==null){d={}}if(typeof(e)=="object"){var c={};for(var b in e){c[b]=(d[b]==true?e[b]:this.replaceHtml(e[b]))}}else{var c=(e||"").replace(/[\<\>\&\s]/g,function(a){switch(a){case"<":return"&lt;";case">":return"&gt;";case"&":return"&amp;";case" ":return"&nbsp;"}return a})}return c}};dhtmlXCombo.prototype.modes.checkbox={image:true,html:false,image_css:"dhxcombo_checkbox dhxcombo_chbx_#state#",option_css:"dhxcombo_option_text dhxcombo_option_text_chbx",render:function(b,c){if(this.image_css_regexp==null){this.image_css_regexp=new RegExp(this.image_css.replace("#state#","\\d*"))}b._conf={value:c.value,css:"",checked:window.dhx4.s2b(c.checked)};b.className="dhxcombo_option";var a={};if(c.multicol==true){c.text.checkbox="<div class='"+String(this.image_css).replace("#state#",(b._conf.checked?"1":"0"))+"'></div>&nbsp;";a.checkbox=true;b.innerHTML="<div class='"+dhtmlXCombo.prototype.modes.option.option_css+"'></div>"}else{b.innerHTML="<div class='"+String(this.image_css).replace("#state#",(b._conf.checked?"1":"0"))+"'></div><div class='"+this.option_css+"'>&nbsp;</div>"}if(c.css!=null){b.lastChild.style.cssText+=c.css;b._conf.css=c.css}this.setText(b,c.text,a);return this},setChecked:function(b,c){b._conf.checked=window.dhx4.s2b(c);var a=String(this.image_css).replace("#state#",(b._conf.checked?"1":"0"));this._changeChbxCss(b.childNodes,a)},_changeChbxCss:function(a,b){for(var c=0;c<a.length;c++){if(a[c].tagName!=null&&a[c].className!=null&&a[c].className.match(this.image_css_regexp)!=null){a[c].className=b}else{if(a[c].childNodes.length>0){this._changeChbxCss(a[c].childNodes,b)}}}},isChecked:function(a){return(a._conf.checked==true)},getExtraData:function(a){return{type:"checkbox",checked:a._conf.checked}},optionClick:function(e,d,f){var c=true;var b=(d.target||d.srcElement);while(c==true&&b!=null&&b!=e&&b.className!=null){if(b.className.match(this.image_css_regexp)!=null){var a=[e._conf.value,!e._conf.checked];if(f.callEvent("onBeforeCheck",a)===true){this.setChecked(e,!this.isChecked(e));f.callEvent("onCheck",a)}c=false;a=null}else{b=b.parentNode}}b=f=e=null;return c},getTopImage:function(b,a){return""},topImageClick:function(a,b){return true}};dhtmlXComboExtend("checkbox","option");dhtmlXCombo.prototype.setChecked=function(a,b){this.doWithItem(a,"setChecked",b)};dhtmlXCombo.prototype.getChecked=function(a){var b=[];for(var c=0;c<this.list.childNodes.length;c++){if(this.isChecked(c)){b.push(this._getOptionProp(this.list.childNodes[c]._optId,"value",""))}}return b};dhtmlXCombo.prototype.isChecked=function(a){return this.doWithItem(a,"isChecked")};dhtmlXCombo.prototype.modes.image={image:true,html:false,image_css:"dhxcombo_image",option_css:"dhxcombo_option_text dhxcombo_option_text_image",render:function(a,b){a._conf={value:b.value,css:""};a.className="dhxcombo_option";a.innerHTML="<div class='"+this.image_css+"'></div><div class='"+this.option_css+"'>&nbsp;</div>";if(b.css!=null){a.lastChild.style.cssText+=b.css;a._conf.css=b.css}this.setText(a,b.text);this.setImage(a,b.img,b.img_dis,b.img_path,b.img_def,b.img_def_dis);return this},update:function(a,b){a._conf.value=b.value;a._conf.css=b.css;a.lastChild.style.cssText=b.css;this.setText(a,b.text);this.setImage(a,b.img,b.img_dis,b.img_path,b.img_def,b.img_def_dis)},setImage:function(c,a,e,f,d,b){if(a!=null&&a.length>0){a=f+a}else{if(d!=null&&d.length>0){a=f+d}else{a=null}}if(e!=null&&e.length>0){e=f+e}else{if(b!=null&&b.length>0){e=f+b}else{if(b==true){e=a}else{e=null}}}c._conf.img=a;c._conf.img_dis=e;c.firstChild.style.backgroundImage=(a!=null?"url("+a+")":"none")},getExtraData:function(a){return{type:"image"}},getTopImage:function(d,c){var b=(c?"img":"img_dis");if(d!=null&&d._conf[b]!=null){return"<div class='"+this.image_css+"' style='background-image:url("+d._conf[b]+");'></div>"}return""}};dhtmlXComboExtend("image","option");dhtmlXCombo.prototype.setDefaultImage=function(a,b){if(a!=null){this.conf.img_def=a}if(b!=null){this.conf.img_def_dis=b}};dhtmlXCombo.prototype.setImagePath=function(a){this.conf.img_path=a};
			
			