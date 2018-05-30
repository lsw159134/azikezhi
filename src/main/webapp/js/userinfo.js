$(document).ready(function() {
    $("#userinfo").on("click", "#realaddress", function(){
        $(this).html("提交");
        $(this).unbind("click");
        $(this).removeAttr().attr("id", "submit_realaddress");
        var txt = $(this).prev();
        txt.html("<input type='text' class='input-text' value='" + txt.html() + "'>");
    });
    $("#userinfo").on("click", "#submit_realaddress", function(){
        $(this).html("修改");
        $(this).unbind("click");
        var txt = $(this).prev().find("input").val();
        $(this).prev().html(txt);
        $(this).removeAttr().attr("id", "realaddress");
        $.ajax({
            type:"post",
            url:"updaterealaddress",
            async:true,
            dataType: "json",
            data: {realaddress:txt},
            success : function(data){
                layer.msg(data.msg);
            }
        });
    });

	$("#userinfo").on("click", "#realtelphone", function(){
        $(this).html("提交");
        $(this).unbind("click");
        $(this).removeAttr().attr("id", "submit_realtelphone");
        var txt = $(this).prev();
        txt.html("<input type='text' class='input-text' value='" + txt.html() + "'>");
	});
    $("#userinfo").on("click", "#submit_realtelphone", function(){
        $(this).html("修改");
        $(this).unbind("click");
        var txt = $(this).prev().find("input").val();
        $(this).prev().html(txt);
        $(this).removeAttr().attr("id", "realtelphone");
        $.ajax({
            type:"post",
            url:"updaterealtelphone",
            async:true,
            dataType: "json",
            data: {realtelphone:txt},
            success : function(data){
                layer.msg(data.msg);
            }
        });
    });

	$("#userinfo").on("click", "#realname", function(){
        $(this).html("提交");
        $(this).unbind("click");
        $(this).removeAttr().attr("id", "submit_realname");
        var txt = $(this).prev();
        txt.html("<input type='text' class='input-text' value='" + txt.html() + "'>");
	});

	$("#userinfo").on("click", "#submit_realname", function(){
        $(this).html("修改");
        $(this).unbind("click");
        var txt = $(this).prev().find("input").val();
        $(this).prev().html(txt);
        $(this).removeAttr().attr("id", "realname");
        $.ajax({
            type:"post",
            url:"updaterealname",
            async:true,
            dataType: "json",
            data: {realname:txt},
            success : function(data){
                layer.msg(data.msg);
            }
        });
	});

	$("#userinfo").on("click", "#username", function() {
		var txt = $(this).prev();
		txt.html('<input type="text" class="input-text" onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,\'\')" onpaste="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,\'\')" oncontextmenu = "value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,\'\')" value="' + txt.html() + '">');
		$(this).html("<a href='javascript:;'>提交</a>");
		$(this).unbind();
		$(this).removeAttr().attr("id", "submit");
	});

	$("#userinfo").on("click", "#submit", function() {
		var txt = $(this).prev().find("input").val();
		var reg = "[^a-zA-Z0-9\u4E00-\u9FA5]+";
		if(txt.match(reg)){
			layer.msg("请输入中文、英文和数字");
			return false;
		}
		if(txt.length < 4 || txt.length > 10) {
			layer.msg("输入的字符请在4到10个字符以内");
			return false;
		}
		$.ajax({
			type:"post",
			url:"updateusername",
			async:true,
			dataType: "json",
			data: {username:txt},
			success : function(data){
				if(data.result=="login"){
					window.location.href="frontLogin";
				}else if(data.result=="fail"){
					layer.msg(data.msg);
					$("#nameu").html(data.name);
				}else if(data.result=="seccuss"){
					layer.msg(data.msg);
					$("#nameu").html(txt);
				}
			}
		});
		$(this).unbind();
		$(this).html("修改");
		$(this).removeAttr().attr("id", "username");
		//		$(this).removeClass().addClass("change");
	});

	$("#userinfo").on("click", "#password", function() {
		var txt = $(this).prev();
		txt.html("<input type='text' class='input-text' value='" + txt.html() + "'>");
		$(this).html("提交");
		$(this).unbind("click");
		$(this).removeAttr().attr("id", "submitpasswd");
		//		$(this).removeClass().addClass("submitpasswd");
	});

	$("#userinfo").on("click", "#submitpasswd", function() {
		var txt = $(this).prev().find("input").val();
		var uid = $("#uid").val();
		if(txt.length < 6 || txt.length > 16) {
			layer.msg("输入的字符请在6到16个字符以内");
			return false;
		}
		$.ajax({
			type:"post",
			url:"updatepassword",
			async:true,
			dataType: "json",
			data: {password:txt, useruid:uid},
			success : function(data){
				layer.msg(data.msg);
			}
		});
		$(this).prev().html("********");
		$(this).unbind();
		$(this).html("修改");
		$(this).removeAttr().attr("id", "password")
			//		$(this).removeClass().addClass("changepasswd");
	});

//	$("#userinfo").on("click", "#company", function() {
//		var txt = $(this).prev();
//		txt.html("<input type='text' class='input-text' value='" + txt.html() + "'>");
//		$(this).html("提交");
//		$(this).unbind("click");
//		$(this).removeAttr().attr("id", "submitcompany");
//	});
//
//	$("#userinfo").on("click", "#submitcompany", function() {
//		var txt = $(this).prev().find("input").val();
//		if(txt.length < 1 || txt.length > 40) {
//			layer.msg("请输入公司名,请不要为空提交");
//			return false;
//		}
//		$(this).prev().html(txt);
//		$(this).unbind();
//		$(this).html("修改");
//		$(this).removeAttr().attr("id", "company")
//			//		$(this).removeClass().addClass("changepasswd");
//	});

	$("#userinfo").on("click", "#sex", function() {
		var txt = $(this).prev();
		txt.html("<input type='text' class='input-text' value='" + txt.html() + "'>");
		$(this).unbind("click");
		$(this).html("提交");
		$(this).removeAttr().attr("id", "subsex");
	});

	$("#userinfo").on("click", "#subsex", function() {
		var txt = $(this).prev().find("input").val();
		if(txt != '男' && txt != '女') {
			layer.msg("请输入性别:男,女");
			return false;
		}
		$.ajax({
			type:"post",
			url:"updatesex",
			async:true,
			dataType: "json",
			data: {sex:txt},
			success : function(data){
				layer.msg(data.msg);
			}
		});
		$(this).prev().html(txt);
		$(this).unbind();
		$(this).html("修改");
		$(this).removeAttr().attr("id", "sex")
	});


    $("#userinfo").on("click", "#alipay", function() {
        var txt = $(this).prev();
        txt.html("<input type='text' class='input-text' value='" + txt.html() + "'>");
        $(this).html("提交");
        $(this).unbind("click");
        $(this).removeAttr().attr("id", "subalipay");
    });

	$("#userinfo").on("click", "#subalipay", function(){
		var txt = $(this).prev().find("input").val();
		$.ajax({
			type:"post",
			url:"updatealipay",
			dataType:"json",
			data:{alipay:txt},
			success:function (data) {
				layer.msg(data.msg);
            }
		});
		$(this).prev().html(txt);
		$(this).unbind();
		$(this).html("修改");
		$(this).removeAttr().attr("id", "alipay");
	});

    $("#userinfo").on("click", "#qq", function() {
		var txt = $(this).prev();
		txt.html("<input type='text' class='input-text' value='" + txt.html() + "'>");
		$(this).html("提交");
		$(this).unbind("click");
		$(this).removeAttr().attr("id", "subqq");
	});
	$("#userinfo").on("click", "#subqq", function() {
		var txt = $(this).prev().find("input").val();
		console.log(txt.length);
		if(txt.length < 5 || txt.length > 13) {
			layer.msg("您输入的QQ号不正确,请重新输入");
			return false;
		}
		for(var i = 0; i < txt.length; i++) {
			console.log(txt[i]);
			if(!(txt[i] >= 0 && txt[i] <= 9)) {
				layer.msg("您输入的QQ号不正确,请重新输入");
				return false;
			}
		}
		$.ajax({
			type:"post",
			url:"updateqq",
			async:true,
			dataType: "json",
			data: {qq:txt},
			success : function(data){
				layer.msg("QQ更新成功!");
			}
		});
		$(this).prev().html(txt);
		$(this).unbind();
		$(this).html("修改");
		$(this).removeAttr().attr("id", "qq")
	});

	$("#userinfo").on("click", "#mail", function() {
		var txt = $(this).prev();
		txt.html("<input type='text' class='input-text' value='" + txt.html() + "'>");
		$(this).html("提交");
		$(this).unbind("click");
		$(this).removeAttr().attr("id", "submail");
	});

	$("#userinfo").on("click", "#submail", function() {
		var txt = $(this).prev().find("input").val();
		var reg = "^[A-Za-z0-9]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$";
		if(!txt.match(reg)){
			layer.msg("您输入的邮箱不正确");
			return false;
		}
		$.ajax({
			type:"post",
			url:"updatemail",
			async:true,
			dataType: "json",
			data: {mail:txt},
			success : function(data){
				layer.msg("邮箱更新成功!");
			}
		});
		$(this).prev().html(txt);
		$(this).unbind();
		$(this).html("修改");
		$(this).removeAttr().attr("id", "mail")
	});
});