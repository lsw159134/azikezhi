/**
 * 
 */
function add() {
	var aa = document.getElementById("aa").value.replace(/[]/g,"").length;
	var bb = document.getElementById("bb").value.replace(/[]/g,"").length;
	var cc = document.getElementById("cc").value.replace(/[]/g,"").length;
	var dd = document.getElementById("dd").value.replace(/[]/g,"").length;
	var ee = document.getElementById("ee").value.replace(/[]/g,"").length;
	var ff = document.getElementById("ff").value.replace(/[]/g,"").length;
	var gg = document.getElementById("gg").value.replace(/[]/g,"").length;
	
	if( aa != 0 & bb != 0 & cc != 0 & dd != 0 & ee != 0 & ff != 0 & gg != 0 ){		
		document.getElementById("form").submit();
		alert("添加成功");
	}else{
		alert("请完善产品信息");
	}	
}