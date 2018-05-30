/**
 * 
 */

function testLogin(){
	var tel = document.getElementById("tele").value;
	var password = document.getElementById("password").value;
	var verify = document.getElementById("verify").value;
	if(tel.replace(/[]/g,"").length == 0 || password.replace(/[]/g,"").length ==0 | verify.replace(/[]/g,"").length == 0){
		alert("请完善登录信息");
	}else{
		$.post("sjLogin?tel="+tel+"&passWord="+password,
	            function(data){
					if(data.result=="success"){
						window.location.href="sjIndex";
					}else if(data.result=="fail"){
						alert(data.msg);
					}
				}
		   	)

		
	}
}