/**
 * 
 */
$(document).ready(function() {
	
    $("#updateSjIndex").on("click", "#faDingRen", function(){
        $(this).html("提交");
        $(this).unbind("click");
        $(this).removeAttr().attr("id", "submit_faDingRen");
        var txt = $(this).prev();
        txt.html("<input type='text' class='sjinput' value='" + txt.html() + "'>");
    });
    $("#updateSjIndex").on("click", "#submit_faDingRen", function(){
        $(this).html("添加");
        $(this).unbind("click");
        var txt = $(this).prev().find("input").val();
        $(this).prev().html(txt);
        $(this).removeAttr().attr("id", "faDingRen");
        $.ajax({
            type:"post",
            url:"updateSjIndex",
            async:true,
            dataType: "json",
            data: {faDingRen:txt},
            success : function(data){
                layer.msg(data.msg);
            }
        });
    });

	$("#updateSjIndex").on("click", "#address", function(){
	    $(this).html("提交");
	    $(this).unbind("click");
	    $(this).removeAttr().attr("id", "submit_address");
	    var txt = $(this).prev();
	    txt.html("<input type='text' class='sjinput' value='" + txt.html() + "'>");
	});
	$("#updateSjIndex").on("click", "#submit_address", function(){
	    $(this).html("添加");
	    $(this).unbind("click");
	    var txt = $(this).prev().find("input").val();
	    $(this).prev().html(txt);
	    $(this).removeAttr().attr("id", "address");
	    $.ajax({
	        type:"post",
	        url:"updateSjIndex",
	        async:true,
	        dataType: "json",
	        data: {address:txt},
	        success : function(data){
	        	
	            layer.msg(data.msg);
	        }
	    });
	});

	$("#updateSjIndex").on("click", "#zuoJiOne", function(){
	    $(this).html("提交");
	    $(this).unbind("click");
	    $(this).removeAttr().attr("id", "submit_zuoJiOne");
	    var txt = $(this).prev();
	    txt.html("<input type='text' class='sjinput' value='" + txt.html() + "'>");
	});
	$("#updateSjIndex").on("click", "#submit_zuoJiOne", function(){
	    $(this).html("修改/添加");
	    $(this).unbind("click");
	    var txt = $(this).prev().find("input").val();
	    $(this).prev().html(txt);
	    $(this).removeAttr().attr("id", "zuoJiOne");
	    $.ajax({
	        type:"post",
	        url:"updateSjIndex",
	        async:true,
	        dataType: "json",
	        data: {zuoJiOne:txt},
	        success : function(data){	        	
	            layer.msg(data.msg);
	        }
	    });
	});
	
	$("#updateSjIndex").on("click", "#zuoJiTwo", function(){
	    $(this).html("提交");
	    $(this).unbind("click");
	    $(this).removeAttr().attr("id", "submit_zuoJiTwo");
	    var txt = $(this).prev();
	    txt.html("<input type='text' class='sjinput' value='" + txt.html() + "'>");
	});
	$("#updateSjIndex").on("click", "#submit_zuoJiTwo", function(){
	    $(this).html("修改/添加");
	    $(this).unbind("click");
	    var txt = $(this).prev().find("input").val();
	    $(this).prev().html(txt);
	    $(this).removeAttr().attr("id", "zuoJiTwo");
	    $.ajax({
	        type:"post",
	        url:"updateSjIndex",
	        async:true,
	        dataType: "json",
	        data: {zuoJiTwo:txt},
	        success : function(data){
	            layer.msg(data.msg);
	        }
	    });
	});
	
	$("#updateSjIndex").on("click", "#zuoJiThree", function(){
	    $(this).html("提交");
	    $(this).unbind("click");
	    $(this).removeAttr().attr("id", "submit_zuoJiThree");
	    var txt = $(this).prev();
	    txt.html("<input type='text' class='sjinput' value='" + txt.html() + "'>");
	});
	$("#updateSjIndex").on("click", "#submit_zuoJiThree", function(){
	    $(this).html("修改/添加");
	    $(this).unbind("click");
	    var txt = $(this).prev().find("input").val();
	    $(this).prev().html(txt);
	    $(this).removeAttr().attr("id", "zuoJiThree");
	    $.ajax({
	        type:"post",
	        url:"updateSjIndex",
	        async:true,
	        dataType: "json",
	        data: {zuoJiThree:txt},
	        success : function(data){
	            layer.msg(data.msg);
	        }
	    });
	});

	$("#updateSjIndex").on("click", "#zuoJiFour", function(){
	    $(this).html("提交");
	    $(this).unbind("click");
	    $(this).removeAttr().attr("id", "submit_zuoJiFour");
	    var txt = $(this).prev();
	    txt.html("<input type='text' class='sjinput' value='" + txt.html() + "'>");
	});
	$("#updateSjIndex").on("click", "#submit_zuoJiFour", function(){
	    $(this).html("修改/添加");
	    $(this).unbind("click");
	    var txt = $(this).prev().find("input").val();
	    $(this).prev().html(txt);
	    $(this).removeAttr().attr("id", "zuoJiFour");
	    $.ajax({
	        type:"post",
	        url:"updateSjIndex",
	        async:true,
	        dataType: "json",
	        data: {zuoJiFour:txt},
	        success : function(data){
	            layer.msg(data.msg);
	        }
	    });
	});
	
	$("#updateSjIndex").on("click", "#email", function(){
	    $(this).html("提交");
	    $(this).unbind("click");
	    $(this).removeAttr().attr("id", "submit_email");
	    var txt = $(this).prev();
	    txt.html("<input type='text' class='sjinput' value='" + txt.html() + "'>");
	});
	$("#updateSjIndex").on("click", "#submit_email", function(){
	    $(this).html("修改/添加");
	    $(this).unbind("click");
	    var txt = $(this).prev().find("input").val();
	    var testEmail = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/; 
	    if(testEmail.test(txt)){
		    $(this).prev().html(txt);
		    $(this).removeAttr().attr("id", "email");
		    $.ajax({
		        type:"post",
		        url:"updateSjIndex",
		        async:true,
		        dataType: "json",
		        data: {email:txt},
		        success : function(data){
		            layer.msg(data.msg);
		        }
		    });
	    }else{
	    	alert("请输入正确的邮箱!");
	    	return false;
	    }
	});
	
	$("#updateSjIndex").on("click", "#qq", function(){
	    $(this).html("提交");
	    $(this).unbind("click");
	    $(this).removeAttr().attr("id", "submit_qq");
	    var txt = $(this).prev();
	    txt.html("<input type='text' class='sjinput' value='" + txt.html() + "'>");
	});
	$("#updateSjIndex").on("click", "#submit_qq", function(){
	    $(this).html("修改/添加");
	    $(this).unbind("click");
	    var txt = $(this).prev().find("input").val();
	    $(this).prev().html(txt);
	    $(this).removeAttr().attr("id", "qq");
	    $.ajax({
	        type:"post",
	        url:"updateSjIndex",
	        async:true,
	        dataType: "json",
	        data: {qq:txt},
	        success : function(data){
	            layer.msg(data.msg);
	        }
	    });
	});
	
	$("#updateSjIndex").on("click", "#userName", function(){
	    $(this).html("提交");
	    $(this).unbind("click");
	    $(this).removeAttr().attr("id", "submit_userName");
	    var txt = $(this).prev();
	    txt.html("<input type='text' class='sjinput' value='" + txt.html() + "'>");
	});
	$("#updateSjIndex").on("click", "#submit_userName", function(){
	    $(this).html("修改/添加");
	    $(this).unbind("click");
	    var txt = $(this).prev().find("input").val();
	    $(this).prev().html(txt);
	    $(this).removeAttr().attr("id", "userName");
		$.post("testUserName?userName="+txt,
	            function(data){
					if(data == true){
						alert("昵称已存在,请重新修改!");						
					}else {
					    $.ajax({
					        type:"post",
					        url:"updateSjIndex",
					        async:true,
					        dataType: "json",
					        data: {userName:txt},
					        success : function(data){
					            layer.msg(data.msg);
					        }
					    });
					}
				}
		   	)
	});
	
	$("#updateSjIndex").on("click", "#passWord", function(){
	    $(this).html("提交");
	    $(this).unbind("click");
	    $(this).removeAttr().attr("id", "submit_passWord");
	    var txt = $(this).prev();
	    txt.html("<input type='password' class='sjinput' value='" + txt.html() + "'>");
	});
	$("#updateSjIndex").on("click", "#submit_passWord", function(){
	    $(this).html("修改/添加");
	    $(this).unbind("click");
	    var txt = $(this).prev().find("input").val();
	    if(txt.length < 6){
	    	alert("请至少输入6位字符");
	    }else {
		    $(this).prev().html("******");
		    $(this).removeAttr().attr("id", "passWord");
		    $.ajax({
		        type:"post",
		        url:"updateSjIndex",
		        async:true,
		        dataType: "json",
		        data: {passWord:txt,biaozi:'1'},
		        success : function(data){
		            layer.msg(data.msg);
		        }
		    });
		}

	});
	
	$("#updateSjIndex").on("click", "#chuanZhen", function(){
	    $(this).html("提交");
	    $(this).unbind("click");
	    $(this).removeAttr().attr("id", "submit_chuanZhen");
	    var txt = $(this).prev();
	    txt.html("<input type='text' class='sjinput' value='" + txt.html() + "'>");
	});
	$("#updateSjIndex").on("click", "#submit_chuanZhen", function(){
	    $(this).html("修改/添加");
	    $(this).unbind("click");
	    var txt = $(this).prev().find("input").val();
	    $(this).prev().html(txt);
	    $(this).removeAttr().attr("id", "chuanZhen");
	    $.ajax({
	        type:"post",
	        url:"updateSjIndex",
	        async:true,
	        dataType: "json",
	        data: {chuanZhen:txt},
	        success : function(data){
	            layer.msg(data.msg);
	        }
	    });
	});
	
});


function aa() {
	alert("请耐心等待，我们会在一个工作日内给你审核");
}