<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=utf-8"%>
<%@ include file="include/defined.jsp"%>
<jsp:include page="include/header.jsp" flush="true">
	<jsp:param value="404" name="header" />
</jsp:include>
<body>
	<div style="height: 70px;"></div>
	<div style="margin-top: 0px;margin-left: 400px;">
		<img style="width: 80px;height: 80px" src="<%=basePath%>img/404.png"  />
	</div>
	<div style="margin-left: 500px;margin-top: -80px">
		<h3 style="color: red; font-weight: normal;">
			抱歉，没有搜索到型号，您可以:
		</h3>
		<div id="xinghao" style="width: 360px;">
	 	
		</div>
		<p style="clear: both;"></p>
		<h4 style="color: #EEC900">没有找到想要的型号？</h4>
		<h4 style="color: #EEC900">您可以重新核对想查找的型号。</h4>
		<h4 style="color: #EEC900">自可知电子查询网期待您的加入!</h4>
	</div>
	<div id="fullbg"></div>  
    <div id="dialog" style="z-index: 9999">  
		<p class="close"> 
     	   <span style="font-weight: bold;padding-right: 120px">
     	      	用户留言
     	   </span> 
    	       <a href="javascript:;" onclick="closeBg()">
    	           <img src="logo/close.png">
    	       </a>
		</p>
		<div style="padding-left: 10px">
			<b>尊敬的自可知客户</b>
			<p style="display: block;-webkit-margin-before: 1em;-webkit-margin-after: 1em;-webkit-margin-start: 0px;-webkit-margin-end: 0px;background: white;width: 360px;">&nbsp;&nbsp;&nbsp;我们努力完善网站、商品和服务。请留下您宝贵的意见，以便我们提供更好的服务。</p>
     	</div>
		<div style="padding-left: 10px;padding-top: 20px">
     		留言内容 : 
     		<textarea id="fankuiText" style="width: 280px;height: 120px;position: absolute;overflow:hidden;margin-top: 5px;margin-left: 10px;text-align: left;word-wrap:break-word;word-break:break-all;"></textarea>
		</div>
		<div style="margin-top: 120px;margin-left: 295px">
			<input type="button" id="button2" value="提交"/>
		</div>    
	</div>
	<div id="gofullbg"></div>  
	<div id="godialog" style="z-index: 1000;border-color: #3A006F">  
		<p class="goclose" style="background: #3A006F"> 
         	   <span style="font-weight: bold;padding-right: 130px;font-size: 15px;color: white;">
         	      	我要进入
         	   </span> 
       	       <a href="javascript:;" onclick="gocloseBg();">
       	           <img src="logo/close.png">
       	       </a>
		</p>
		<div style="margin-left: 40px;">
			<button type="button" class="button3" id="gobutton1" style="width: 129px;height: 40px;background-color: #EEEEE0;font-weight: bold;border: none;">
				密码登录
			</button>
			<button type="button" class="button4" id="gobutton2" style="width: 129px;height: 40px;background-color: #EEEEE0;font-weight: bold;margin-left: 60px;border: none;">
				手机验证码登录
			</button>
		</div>
		<div id="innerDiv1" style="margin-left: 40px;">
			<form method="post" class="login form" name="submit1" id="submit1">
				<!-- 密码登录  -->
				<div  class="group" style="margin-top: 10px;">
					<div class="group-ipt" >
						<img alt="" src="logo/loginface.png" style="position: absolute;margin-top: 2px;">
						<input style="width: 239px;height: 40px;padding-left: 80px;" type="text" name="telephone" class="ipt" placeholder="手机号码" required>
					</div>
					
					<div class="group-ipt password">
						<img alt="" src="logo/loginmima.png" style="position: absolute;margin-top: 2px;">
						<input style="width: 239px;height: 40px;padding-left: 80px;" type="password" name="password" id="password" class="ipt" placeholder="输入您的登录密码" required>
					</div>
					
					<div class="group-ipt verify" >
						<img alt="" src="logo/loginyzm.png" style="position: absolute;margin-top: 2px;">
						<input style="width: 139px;height: 40px;padding-left: 80px;" type="text" name="verify" id="verify" class="ipt" placeholder="输入验证码" required>
						<img src="kaptcha.jpg" class="imgcode" style="position: absolute;height:40px;border:1px gray solid;width:97px;">
					</div>
					
					<div class="button" style="margin-top: 20px;">
						<button type="submit" class="button3" style="height: 40px;width: 199px;font-size: 15px;font-weight: bold;background: #3A006F">
							登录
						</button>
					</div>
					<div style="margin-top: 20px;font-weight: bold;font-size: 18px;margin-bottom: 30px;" >
						<a href="register" style="color: #23A8F6;margin-left: 80px;" class="zhu">没有账号，立即注册</a><br>
						<img src="logo/loginsmile.png">
						<span style="margin-left: 20px;color: #3A006F">自可知——不一样的客户体验</span>
					</div>
				</div>
			</form>
		</div>
		<div id="innerDiv2" style="margin-left: 40px;display: none;">
			<form action="Loginverification" method="post"  class="login form" name="submit2" id="submit2">
				<!-- 手机验证码登录   -->
				<div class="group" style="margin-top: 10px;">
					<div class="group-ipt" >
						<img  src="logo/loginface.png" style="position: absolute;margin-top: 2px;"><input style="width: 239px;height: 40px;padding-left: 80px;" type="text" name="telephone" id="telephonedt" class="ipt" placeholder="手机号码" required>
					</div>
					
					<div class="group-ipt verify" >
						<img  src="logo/loginyzm.png" style="position: absolute;margin-top: 2px;">
						<input style="width: 139px;height: 40px;padding-left: 80px;" type="text" name="verify" id="verifydt" class="verifydt" placeholder="输入验证码" required>
						<img src="kaptcha.jpg" class="imgcodedt" style="height:40px;border:1px #606c88 solid;width: 97px;position: absolute;">
					</div>
					
					<div class="group-ipt yanzhen">
						<img  src="logo/loginmessage.png" style="position: absolute;margin-top: 2px;">
						<input type="text" placeholder="短信验证码" id="yanzhen" name="yanzhen" class="ipt" style="width: 239px;height: 40px;padding-left: 80px;" onfocus="clearErro();" required>
 	   	     	   	    	<input type="button" id="hsbtn" value="获取验证码" onclick="time(hsbtn)" style="width: 97px;background:#CBE9CF;position: absolute;height: 40px;margin-top: 2px;margin-left: -98px;" />
					</div>
					
					<div class="button" style="margin-top: 20px;">
						<button type="submit" class="button3"  style="height: 40px;width: 199px;font-size: 15px;font-weight: bold;background: #3A006F">
							登录
						</button>
					</div>
					<div style="margin-top: 20px;font-weight: bold;font-size: 18px;margin-bottom: 30px;">
						<a href="register" style="color: #23A8F6;margin-left: 80px;"  class="zhu">没有账号，立即注册</a><br>
						<img src="logo/loginsmile.png">
						<span style="margin-left: 20px;color: #3A006F">自可知——不一样的客户体验</span>
					</div>
				</div>
			</form>
		</div>
	 </div>
	<div style="">
		<div style="width: 1185px;text-align: center;margin-bottom: -150px;margin-top: 140px;">
			<span>新手指南&#8195;</span>
			<span>|&#8195;<a href="frontLogin">注册登录</a>&#8195;</span>
			<span>|&#8195;用户协议&#8195;</span>
			<span>|&#8195;支付方式&#8195;</span>
			<span>|&#8195;在线支付&#8195;</span>
			<span>|&#8195;银行汇款&#8195;</span>
			<span>|&#8195;特色服务&#8195;</span>
			<span>|&#8195;积分返现&#8195;</span>
			<span>|&#8195;<a href="javasctipt:;" onclick="addFavorite2()" title='自可知电子查询网' rel="sidebar">加入收藏</a>&#8195;</span>
			<span>|&#8195;关于库存&#8195;</span>
			<span>|&#8195;关于免费&#8195;</span>
			<span>|&#8195;关于自可知&#8195;</span>
			<span>|&#8195;联系我们</span>
			<hr style="border: 1px solid #CC0000; margin-top: 0px;; width: 1185px;" />
		</div>
		<%@ include file="include/footer.jsp"%>
	</div>
	<script src="<%=contextPath%>/js/jquerybasic.js"></script>
	<script src='js/background.min.js' type="text/javascript"></script>
	<script src="layer/layer.js"></script>
	<script src="js/dist/jquery.validator.min.js?local=zh-CN" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		var produ='${keyword}';
		$("#proinfo").css({"display":"none"});
		$('.jiantou').html("<img src='logo/down.png'>");
		var $subblock = $(".subpage"), $head=$subblock.find('h2'), $ul = $("#proinfo"), $lis = $ul.find("li"), inter=false;
		$head.click(function(e){
			e.stopPropagation();
			if(!inter){
				$('.jiantou').html("<img style='margin-top:-7px;position:absolute;' src='logo/up.png'>");
				$ul.show();
			}else{
				$('.jiantou').html("<img src='logo/down.png'>");
				$ul.hide();
			}
			inter=!inter;
		});
			
		$ul.click(function(event){
			event.stopPropagation();
		});
			
		$(document).click(function(){
			$ul.hide();
			inter=!inter;
		});
		$lis.hover(function(){
			var primary = $(this).find('.primary').html();
			var s = '';
			$.ajax({
				  url:"indexSeleSecond",
				  type:"POST",
				  data:{
					  primary_name:primary
				  },
				  contentType:"application/x-www-form-urlencoded; charset=utf-8",
				  dataType:"json",
				  success: function(data){
					  for(var o in data) {
						  	if(o % 2 != 0){
								s+=("<span style='float: left;width:190px;height:15px;margin:-10px 0px 25px 0px;'><em><a href='search?keyword="+data[o].product.product+"'>"+data[o].product.product+"</a></em></span>");
							}else{
								s+=("<span style='float: left;width:190px;height:15px;margin:-10px 0px 25px 0px;'><em><a href='search?keyword="+data[o].product.product+"'>"+data[o].product.product+"</a></em></span>");
							}
						}
						$('.prosmore').html('');
						$('.prosmore').html(s);
				  }
				});
			if(!$(this).hasClass('nochild')){
				$(this).addClass("prosahover");
				$(this).find(".prosmore").removeClass('hide');
			}
		},function(){
			if(!$(this).hasClass('nochild')){
				if($(this).hasClass("prosahover")){
					$(this).removeClass("prosahover");
				}
				$(this).find(".prosmore").addClass('hide');
			}
		});
		$.ajax({
			  url:"mohuxinghao",
			  type:"POST",
			  data:{
				  product:produ
			  },
			  contentType:"application/x-www-form-urlencoded; charset=utf-8",
			  dataType:"json",
			  success: function(data){
				 if(data.result=="success"){
					 var xingh=data.msg;
					 $("#xinghao").append('<h3 style="color: red;font-weight: normal;float: left">下列系统匹配到的是否是您想查找的型号：</h3>');
					 for(var o in xingh){
						 $("#xinghao").append('<span style="float: left;margin-left: 20px;font-size:16px;font-weight: bold;"><a style="color: blue;" href="search?keyword='+xingh[o].product_name+'">'+xingh[o].product_name+'</a></span>&#8195;');
					 }
				 }
			  }
		});
	});
</script>
	<script type="text/javascript">
		$(function(){
			$("#submit1").validator({
				timely : 2,
				fields : {
					telephone : "required;mobile",
					password : "required;length(6~16)",
				},
				valid : function(form) {
					$.post("userLogin", $(form).serialize()).done(function(d) {
						if(d.code != -1 && d.code != -2){
							window.location.href="index";
						}else{
							alert(d.msg);
						}
					});
				}
			});	
		});
		
	   $('.goLogin').click(function(){
           $("#gofullbg").show;  
           $("#godialog").show();  
      });
      //关闭灰色 jQuery 遮罩   
      function gocloseBg() {  
          $("#gofullbg,#godialog").hide();  
      }
	function showBg() {
		$('#button2').click(function(){
			var fankuiText = document.getElementById('fankuiText').value;
			if(fankuiText.replace(/[]/g,"").length == 0){
				alert("请先填写反馈内容");
			}else{
				$.post("messageAdd?message_content="+encodeURIComponent(fankuiText),
       	            function(data){
       					if(data.result=="success"){
       						alert(data.msg);
       						$("#fullbg").hide(); 
       						$("#dialog").hide(); 
       						document.getElementById('fankuiText').value = "";
       					}else if(data.result=="fail"){
       						alert(data.msg);
       					}
       				}
       		   	)
       		}
       		
       	});
        $("#fullbg").css({  
            display: "block"  
        });  
		$("#dialog").show();  
	}  
      //关闭灰色 jQuery 遮罩   
      function closeBg() {  
          $("#fullbg,#dialog").hide();  
      }
      //验证码
      $('.imgcode').hover(function() {
			layer.tips("看不清？点击更换", '.imgcode', {
				time : 6000,
				tips : [ 2, "#3c3c3c" ]
			})
		}, function() {
			layer.closeAll('tips');
		}).click(
				function() {
					$(this).attr('src',
							'kaptcha.jpg?' + Math.floor(Math.random() * 100));
				});
      
      $('.imgcodedt').hover(function() {
			layer.tips("看不清？点击更换", '.imgcodedt', {
				time : 6000,
				tips : [ 2, "#3c3c3c" ]
			})
		}, function() {
			layer.closeAll('tips');
		}).click(
				function() {
					$(this).attr('src',
							'kaptcha.jpg?' + Math.floor(Math.random() * 100));
				});
      $('#gobutton2').click(function(){
    	  $('#innerDiv1').hide();
    	  $('#innerDiv2').show();
    	  
    	  $('#gobutton1').removeClass('button3');
    	  $('#gobutton1').removeClass('button4');
    	  $('#gobutton1').addClass('button4');
    	  
    	  $('#gobutton2').removeClass('button3');
    	  $('#gobutton2').removeClass('button4');
		  $('#gobutton2').addClass('button3');
      });
      $('#gobutton1').click(function(){
    	  $('#innerDiv1').show();
    	  $('#innerDiv2').hide();
    	  
    	  $('#gobutton1').removeClass('button3');
    	  $('#gobutton1').removeClass('button4');
		  $('#gobutton1').addClass('button3');
		  
    	  $('#gobutton2').removeClass('button3');
    	  $('#gobutton2').removeClass('button4');
		  $('#gobutton2').addClass('button4');
      });

		
		$("#telephonedt").on("input propertychange", function() { 
			$("#erro").html("");
			var phone = document.getElementById("telephonedt").value;
			if(!(/^1[34578]\d{9}$/.test(phone))){
		    	return false; 
		    }else{
		    	$.post("1019/zai/xin/jian/queryByPhone?phone="+phone,
			        function(data){
						if(data.result=="fail"){
							$("#telephonedt").val("");
							alert("请先注册该号码");
							window.location.href="register";
						}else if(data.result=="seccuss"){
						}
					}
			   	) 
		    }
		});
		$(document).ready(function() {
			$("#submit2").validator({
				timely : 2,
				fields : {
					telephone : "required;mobile",
					password : "required;length(6~16)",
				},
				valid : function(form) {
					var yan=$("#yanzhen").val();
					if(yan==null||yan==''){
						layer.msg("请输入短信验证码");
						return false;
					}
					$.post("Loginverification", $(form).serialize()).done(function(d) {
						if(d.code != -1 && d.code != -2){
							window.location.href="index";
						}else{
							alert(d.msg);
						}
					});
				}
			});
			
		});
	</script>
	<script type="text/javascript">
	
		var wait = 60;
		function time(btn) {
			var verify = document.getElementById('verifydt').value;
		  	var phone = document.getElementById('telephonedt').value;
		    if(phone == null || phone == "" ){
		    	layer.msg("请输入手机号码");
		        return false; 
		    }else if(!(/^1[34578]\d{9}$/.test(phone))){
		    	layer.msg("手机号码有误，请重填");
		    	return false; 
		    }else if(verify == null || verify == "" ){
		    	layer.msg("请输入图形验证码");
		    	return false; 
		    }else{
			    if (wait == 60) {
			        btn.value = "获取验证码";
			        var phone = $("#telephonedt").val(); 
				    phone = $.trim(phone); 
				    $.post("verification",{'phone':phone,'login':'login'},function(index){ 
				    },"json") 
			        btn.removeAttribute("disabled"); 
			    }else if(wait == 0){
			    	dj(btn);
			    }
			    btn.setAttribute("disabled", true); 
			    btn.value ="("+ wait + ")重新获取"; 
			    wait--; 
			    setTimeout(function () { 
			    	if(wait==0){
			    		dj(btn);
			    		clearTimeout();
			    	}else{
			            time(btn); 	
			    	}
			    },1000)
		    }
		}
		
		function dj(btn){
		    btn.value = "获取验证码";
		    btn.removeAttribute("disabled"); 
		    wait = 60;
		}
		function clearErro(){
			$("#erro").html("");
		}
	</script>
<script>
$('.zhu').hover(function(){
	$(this).css('color','red');			
},function(){
	$(this).css('color','#23A8F6');	
});
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?973a46004763863d10483eab2f1ae9b2";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
    $(function () { 
	    var td = $(".sort_table .index_tr1 td");  
	    td.mouseover(function () {  
	        $(this).css("background-color", "#AEF2E5");  
	    }).mouseout(function () {  
	        $(this).css("background-color", "#FFFFFF");  
	    });
	});
	function cutStr(len){ 
        var obj = $(".sort_table .index_tr1 a") ; 
        for ( i=0 ; i < obj.length ; i++){
        	if(obj[i].innerHTML.length > 13){
        		 obj[i].innerHTML=obj[i].innerHTML.substring(0,len)+'…'; 
        	}
        }
 	}
</script>
</body>
</html>