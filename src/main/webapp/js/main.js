function initXMLHttpRequest(){
	var req=null;
	if(window.XMLHttpRequest){
		req=new XMLHttpRequest();
	}else if(window.ActiveXObject){
		req=new ActiveXObject("Microsoft.XMLHTTP");
	}
	return req;
}

function getXMLHttpRequest(){
	var req=null;
	try{
		req=new XMLHttpRequest();
	}catch(e){
		try{
			req=new ActiveXObject("Microsoft.XMLHTTP");
		}catch(e){
			alert("您的浏览器不支持XMLHttpRequest对象");
		}
	}
	return req;
}