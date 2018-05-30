<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%
    String contextPath = request.getContextPath();
    String realPath = request.getSession().getServletContext().getRealPath("/");
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + contextPath + "/";
%>
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"/>
		<title>自可知-电子元器件采购网</title>
		<link rel="shortcut icon" href="tu.png" type="image/x-icon"/>
		<link rel="stylesheet" type="text/css" href="css/register-login.css">
		<link rel="stylesheet" type="text/css" href="css/css/frontLogin.css">
		<link rel="stylesheet" type="text/css" href="js/dist/jquery.validator.css" />
		<style type="text/css">
			body {
				width: 1200px;
				margin: 0 auto;
			}
			.line{
				background-color: #CDC9A5;
				width: 1200px;
				height:70px;
				position: absolute;
				z-index: -1;
			}
			.line1_1{
				width: 40px;
				height: 40px;
				padding-top: 20px;
				margin-left: 50px;
			}
			.line1_2{
				
			}
			#search{
				margin-left: 300px;
				margin-top: -65px;
			}
			.line1_3{
				margin-left: 900px;
				margin-top: -80px;
			}
			.line1_3_1{
				color:red;
				font-size:20px;
				margin-left: 80px;
				font-weight: bold;
			}
			.line1_3_2{
				color:red;
				font-size:20px;
				margin-left: 30px;
				font-weight: bold;
			}
			.line2_1{
				margin-top: 80px;
			}
			.line2_2_1{
				margin-left: 690px;
				margin-top:-360px;
				text-align: center;
				color:  #FFA500;
				font-size: 20px
			}
			.line2_2_2{
				margin-left: 800px;
				text-align: center;
			}
			.remember-me{
				margin-left: 50px;
			}
			.forgotme{
				margin-right: -130px;
			}
			.line3{
				background-color:#87CEFA;
				margin-top:-50px;
				height: 235px;
			}
			.line3_1{
				margin-left: 100px;
				padding-top: 80px;
			}
			.line3_2{
				margin-left: 300px;
				margin-top: -100px;
			}
			.line3_3{
				margin-left: 500px;
				margin-top: -125px;
			}
			.line3_4{
				margin-left: 700px;
				margin-top: -125px;
			}
			.line3_5{
				margin-left: 770px;
				margin-top: -175px;
				border-right: #FFA500 1px dashed; 
				border-top: #FFA500 1px dashed; 
				BORDER-LEFT: #FFA500 1px dashed;
				BORDER-BOTTOM: #FFA500 1px dashed;
				left: 150px;
				WIDTH: 1px; 
				TOP: 100px; 
				HEIGHT: 185px;
			}
			.line3_6{
				margin-left: 830px;
				margin-top: -160px;
				color: #EE7600;
			}
			.line3_6_1{
				font-size: 17px;	
				color: #EE7600;	
				font-weight: bold;		
			}
			.line3_6_2{
				font-size: 17px;	
				font-weight: bold;			
			}
			.line3_7{
				margin-left: 1000px;
				margin-top: -50px;
				
			}
			.line3_7_1{
				padding-left: 35px;
			}
			.line4{
				text-align:center;
				margin-top: 0px;
				
			}
		</style>
	</head>
	<body>
		<div class="line1_backcolor">
		</div>
		<div class="line1_2">
			<a href="index">
				<span style="margin-top: -10px" id="logo"> <img src="<%=contextPath%>/logo/logo.png" /> 
					<span id="title" style="color: #7BA8AB;font-size: 36px">
					 	自可知 <span style="color: #7BA8AB" id="smallTitle">|&nbsp; 电子采购网</span>
					</span>
				</span>
			</a>
			
		</div>
		<div class="line2_1">
			<img src="logo/login.jpg" style="width: 800px;height: 320px;">
		</div>
		<div class="line2_2_1">
			<span class="sub-title">
				<img src="logo/loginwel.png">
				欢迎来到自可知
			</span>
		</div>
		<div style="margin-left: 950px;color: #FFA500;font-size: 20px">
			<span class="sub-title">专注华强北样品采购</span>
		</div>
		<div class="line2_2_2">
			<div class="index-tab">
				<div class="index-slide-nav">
					<a href="frontLogin" class="active" style="margin-left: 0px">用户登录</a>
					<a href="Logindynamic" style="margin-left: 40px;" >动态登录</a>
					<a href="register" style="margin-left: 40px;">用户注册</a>
					<div class="slide-bar"></div>
				</div>
			</div>
			<form action="userLogin" method="post" class="login form">
				<div class="group">
					<div class="group-ipt">
						<input type="text" name="telephone" class="ipt" placeholder="手机号码" required>
					</div>
					<div class="group-ipt password">
						<input type="password" name="password" id="password" class="ipt" placeholder="输入您的登录密码" required>
					</div>
					<div class="group-ipt verify">
						<input type="text" name="verify" id="verify" class="ipt" placeholder="输入验证码" required>
						<img src="kaptcha.jpg" class="imgcode">
					</div>
				</div>
				<br>
				<div class="button">
					<button type="submit" class="login-btn register-btn" id="button">登录</button>
				</div>
			</form>
		</div>
		<div style="width: 1185px;margin-top: 100px;text-align: center;font-size: 13px;">
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
			<span>|&#8195;联系我们&#8195;</span>
			<span>|&#8195;<a href="javascript:showBg();">在线留言</a></span>
			<hr style="border: 1px solid #3A006F; margin-top: 0px;; width: 1185px;" />
		</div>
		<div class="line4">
			版权所有 &copy; 2017 自可知 保留所有权利 |
			<a href="http://www.miibeian.gov.cn/">
				<img src="img/img/icp.png" />
				粤ICP备17040594号-2
			</a>		
		</div>	
	</body>
	<script type="text/javascript" src="<%=basePath %>js/jquerybasic.js"></script>
	<script src='js/background.min.js' type="text/javascript"></script>
	<script src="layer/layer.js"></script>
	<script src="js/dist/jquery.validator.min.js?local=zh-CN" type="text/javascript" charset="utf-8"></script>
	<script src="js/login.min.js" type="text/javascript" charset="utf-8"></script>
	<script>
		function search(){
			var keyword = document.getElementById("keyword").value;
			window.location.href="search?keyword="+keyword;
		}
		$('.imgcode').hover(function() {
			layer.tips("看不清？点击更换", '.verify', {
				time : 6000,
				tips : [ 2, "#3c3c3c" ]
			})
		}, function() {
			layer.closeAll('tips');
		}).click(function() {
			$(this).attr('src',
					'kaptcha.jpg?' + Math.floor(Math.random() * 100));
		});
		$("#remember-me").click(function() {
			var n = document.getElementById("remember-me").checked;
			if (n) {
				$(".zt").hide();
			} else {
				$(".zt").show();
			}
		});
	</script>
</html>