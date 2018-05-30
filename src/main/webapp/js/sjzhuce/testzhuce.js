/**
 * 
 */

function hide() {
	var aa = document.getElementById("one").style.display="none";
	var bb = document.getElementById("two").style.display="none";
	var cc = document.getElementById("three").style.display="none";
	var dd = document.getElementById("four").style.display="none";
	var ee = document.getElementById("five").style.display="none";
	var ff = document.getElementById("six").style.display="none";
	var bbtwo = document.getElementById("twobb").style.display="none";
	var ddfour = document.getElementById("fourdd").style.display="none";
	var eesix = document.getElementById("sixee").style.display="none";
	var aaone = document.getElementById("aone").style.display="none";
	var cctwo = document.getElementById("twocc").style.display="none";
	var ccthree = document.getElementById("threecc").style.display="none";
}
function one(){
	var company = document.getElementById("company").value.replace(/[]/g,"");//把所有空格去掉
	var aa = document.getElementById("one");
	var bb = document.getElementById("aone");
	if(company.length == 0){
		aa.style.display="";
	}else {		
		$.ajax({
			async:true,  
			url:'testCompany',
			type:'post',
			data:{
				comPany:company
			},
			success:function(data){								
				if(data == false){
					aa.style.display="none";
					bb.style.display="none";
				}else{
					aa.style.display="none";
					bb.style.display="";
				}
			},				
		});
	}
}
function two() {
	var tel = document.getElementById('tel').value.replace(/[]/g,"");
	var bb = document.getElementById("two");
	var bbtwo = document.getElementById("twobb");
	var cctwo = document.getElementById("twocc")
	if(tel.length == 0){
		bb.style.display="";
		bbtwo.style.display="none";
		cctwo.style.display="none";
	}else{
		if(!(/^1[34578]\d{9}$/.test(tel))){
			cctwo.style.display="none";
			bb.style.display="none";
			bbtwo.style.display="";
		}else{
			$.ajax({
				async:true,  
				url:'testTel',
				type:'post',
				data:{
					tel:tel
				},
				success:function(data){								
					if(data == false){
						bb.style.display="none";
						bbtwo.style.display="none";
						cctwo.style.display="none";
					}else{
						bb.style.display="none";
						bbtwo.style.display="none";
						cctwo.style.display="";
					}
				},				
			});
		}
	}
}
function three() {
	var userName = document.getElementById('username').value.replace(/[]/g,"");
	var cc = document.getElementById("three");
	var ccthree = document.getElementById("threecc");
	if(userName.length == 0){
		cc.style.display="";
		ccthree.style.display="none";
	}else{
		$.ajax({
			async:true,  
			url:'testUserName',
			type:'post',
			data:{
				userName:userName
			},
			success:function(data){								
				if(data == false){
					cc.style.display="none";
					ccthree.style.display="none";
				}else{
					cc.style.display="none";
					ccthree.style.display="";
				}
			},				
		});
	}
}
function four() {
	var passWord = document.getElementById('password').value;
	var dd = document.getElementById("four");
	var ddfour = document.getElementById("fourdd");
	if(passWord.replace(/[]/g,"").length == 0){
		dd.style.display="";
		ddfour.style.display="none";
	}else{
		if(passWord.length < 6){
			dd.style.display="none";
			ddfour.style.display="";
		}else{
			dd.style.display="none";
			ddfour.style.display="none";
		}
		
	}
}
function five() {
	var passWord = document.getElementById('password').value;
	var passWord1 = document.getElementById('password1').value;
	var ee = document.getElementById("five");
	if(passWord1 != passWord){
		ee.style.display="";
	}else{
		ee.style.display="none";
	}
}

function six(){
	var verify = document.getElementById('verify').value.replace(/[]/g,"");
	var ff = document.getElementById("six");
	var ffsix = document.getElementById("sixee");
	if(verify.length == 0){
		ff.style.display="";
		ffsix.style.display="none";
	}else{
		$.ajax({
			async:true,  
			url:'testYzm',
			type:'post',
			data:{
				verify:verify
			},
			success:function(data){								
				if(data == true){
					ff.style.display="none";
					ffsix.style.display="none";
				}else{
					ff.style.display="none";
					ffsix.style.display="";
				}
			},				
		});
	}
}

function tiJiao(){
	var aa = document.getElementById("one").style.display;
	var bb = document.getElementById("two").style.display;
	var cc = document.getElementById("three").style.display;
	var dd = document.getElementById("four").style.display;
	var ee = document.getElementById("five").style.display;
	var ff = document.getElementById("six").style.display;
	var bbtwo = document.getElementById("twobb").style.display;
	var ddfour = document.getElementById("fourdd").style.display;
	var eesix = document.getElementById("sixee").style.display;
	var aaone = document.getElementById("aone").style.display;
	var cctwo = document.getElementById("twocc").style.display;
	var ccthree = document.getElementById("threecc").style.display;
	var company = document.getElementById("company").value.replace(/[]/g,"").length;
	var tel = document.getElementById("tel").value.replace(/[]/g,"").length;
	var username = document.getElementById("username").value.replace(/[]/g,"").length;
	var password = document.getElementById("password").value.replace(/[]/g,"").length;
	var verify = document.getElementById("verify").value.replace(/[]/g,"").length;
	if(company != 0 & tel != 0 & username != 0 & password != 0 & verify != 0 
			& aa == "none" & bb == "none" & cc == "none" & dd == "none" & ee == "none" & ff == "none" 
				& bbtwo == "none" & ddfour == "none" & eesix == "none" & aaone == "none" & cctwo == "none" & ccthree == "none"	){
				document.getElementById("form").submit();
				alert("注册成功，请登陆!");	
	}else{
		alert("请核查您填写的信息");
	}
}












