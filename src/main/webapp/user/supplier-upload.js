
$(document).ready(function () {
    $(".input-text").blur(function () {
    	var name = $("#name").val();
        var position = $("#position").val();
        var tel = $("#tel").val();
        var cellphone = $("#cellphone").val();
        var email = $("#email").val();
        var fax = $("#fax").val();
        var qq = $("#qq").val();
        if (name.length > 5 && position.length > 3 && tel.length > 9 && cellphone.length > 9 && email.length > 6 && qq.length > 6) {
            $("#submit").attr("disabled", false);
        }
    });

	$("#submit").on("click", function(){
		var name = $("#name").val();
		var position = $("#position").val();
		var tel = $("#tel").val();
		var tel1 = $("#tel1").val();
		var tel2 = $("#tel2").val();
		var tel3 = $("#tel3").val();
		var tel4 = $("#tel4").val();
		var cellphone = $("#cellphone").val();
		var fax = $("#fax").val();
		var email = $("#email").val();
		var qq = $("#qq").val();
		var qq1 = $("#qq1").val();
// if(tel1 == undefined){tel1=''}
		$.ajax({
			url: "supplierUpload",
			type: 'post',
			dataType: "json",
			async: true,
			data: {
				suppliername: name,
				supplierposition: position,
				telphone: tel,
				telphone1: tel1,
				telphone2: tel2,
				telphone3: tel3,
				telphone4: tel4,
				cellphone: cellphone,
				fax: fax,
				email: email,
				qq: qq,
				qq1: qq1
			},
			success: function(data) {
				layer.msg(data.result);
                var t=setTimeout("",5000)
                window.location.reload();
                window.parent.window.location.reload();
//				parent.frmTop.location.reload();
			}
		});

	});
});
// $(document).ready(function() {
//
// 	var addTel = 0;
// 	$("#addTel").on("click", function() {
// 		addTel++;
// 		if(addTel > 4) {
// 			layer.msg("添加的电话不能超过5个!");
// 			$(this).unbind("click");
// 			return false;
// 		}
// 		$(this).parents("tr").before("<tr><td>电话:</td><td><input type='text' class='input-text' placeholder='请输入电话号码' id='telphone"+addTel+"' name='telphone" + addTel + "'/></td><td class='left-border'></td></tr>");
// 	});
//
// 	var addQQ = 0;
// 	$("#addQQ").on("click", function() {
// 		addQQ++;
// 		if(addQQ > 1) {
// 			layer.msg("添加的QQ号不能超过2个!");
// 			$(this).unbind("click");
// 			return false;
// 		}
// 		$(this).parents("tr").before("<tr><td>QQ:</td><td><input type='text' class='input-text' placeholder='请输入QQ' id='qq"+addQQ+"' name='qq" + addQQ + "'/></td><td class='left-border'></td></tr>");
// 	});
//
// 	$("#email").on("blur",function(){
// 		var name = $("#name").val();
// 		var position = $("#position").val();
// 		var tel = $("#tel").val();
// 		var tel1 = $("#tel1").val();
// 		var tel2 = $("#tel2").val();
// 		var tel3 = $("#tel3").val();
// 		var tel4 = $("#tel4").val();
// 		var cellphone = $("#cellphone").val();
// 		var fax = $("#fax").val();
// 		var email = $("#email").val();
// 		var qq = $("#qq").val();
// 		var qq1 = $("#qq1").val();
// 		if(name != undefined && position != undefined && tel != undefined && cellphone != undefined && fax != undefined && isNaN(tel)){
// 			$("#submit").attr("disabled", false);
// 		}
// 	});
//
// 	$("#submit").on("click", function(){
// 		var name = $("#name").val();
// 		var position = $("#position").val();
// 		var tel = $("#tel").val();
// 		var tel1 = $("#tel1").val();
// 		var tel2 = $("#tel2").val();
// 		var tel3 = $("#tel3").val();
// 		var tel4 = $("#tel4").val();
// 		var cellphone = $("#cellphone").val();
// 		var fax = $("#fax").val();
// 		var email = $("#email").val();
// 		var qq = $("#qq").val();
// 		var qq1 = $("#qq1").val();
// // if(tel1 == undefined){tel1=''}
// 		$.ajax({
// 			url: "supplierUpload",
// 			type: 'post',
// 			dataType: "json",
// 			async: true,
// 			data: {
// 				suppliername: name,
// 				supplierposition: position,
// 				telphone: tel,
// 				telphone1: tel1,
// 				telphone2: tel2,
// 				telphone3: tel3,
// 				telphone4: tel4,
// 				cellphone: cellphone,
// 				fax: fax,
// 				email: email,
// 				qq: qq,
// 				qq1: qq1
// 			},
// 			success: function(data) {
// 				layer.msg(data.result);
// 				console.log(data.path);
//                 window.location.href=data.path;
// //				parent.frmTop.location.reload();
// 			}
// 		});
//
// 	});
// });