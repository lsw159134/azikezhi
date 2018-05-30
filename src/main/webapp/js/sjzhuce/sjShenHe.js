function shenHe(){
	var realShiro = document.getElementById("realShiro").value;
	var shenHeId = document.getElementById("shenHeId").value;
	$.post("shiroShenHe?id="+shenHeId+"&shiro="+realShiro,
            function(data){
				if(data.result=="success"){
					document.getElementById("form").submit();
					alert(data.msg);
				}else if(data.result=="fail"){
					alert(data.msg);
				}
			}
	   	)
} 