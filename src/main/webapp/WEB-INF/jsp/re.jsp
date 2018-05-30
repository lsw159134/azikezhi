<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"/>
		<title>Insert title here</title>
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
				font-weight: bolder; 
				font-size: 30px;
				color: #9400D3;
				font-family: STXingkai;
				width: 100px;
				margin-left: 100px;
				margin-top: -30px;
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
				margin-left: 800px;
				margin-top:-380px;
				text-align: center;
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
				background-color: #BFBFBF;
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
				margin-top: -180px;
				border-right: lime 1px dashed; 
				border-top: lime 1px dashed; 
				left: 150px; BORDER-LEFT: lime 1px dashed;
				WIDTH: 1px; BORDER-BOTTOM: lime 1px dashed;
				TOP: 100px; HEIGHT: 199px;
			}
			.line3_6{
				margin-left: 830px;
				margin-top: -140px;
				
			}
			.line3_6_1{
				font-size: 20px;				
			}
			.line3_6_2{
				font-size: 15px;				
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
				margin-top: 50px;
				
			}
		</style>
	</head>
	<body>
		
			<div class="line">
			</div>
				<div class="line1_backcolor">
				</div>
				<div class="line1_1">
					<img style="width: 40px; height: 40px;" src="logo/logo.png">
				</div>
				
				<div class="line1_2">
					在芯间
				</div>
				
				<div id="search">
					<input id="keyword" type="text" name="keyword"
						placeholder="请输入芯片、IC、二三极管等产品型号"> <input id="submit"
						type="button" onclick="search()" value="搜索">
				</div>
				
				<div class="line1_3">
					<p >
						<a class="line1_3_1" href="index">在芯间</a>
					</p>
					<p >
						<a class="line1_3_2" href="index">ZAIXINJIAN.COM</a>
					</p>
				</div>
				
				<div class="line2_1">
					<img src="logo/login.jpg">
				</div>
				
				<div class="line2_2_1">
					<h2 class="sub-title">最专业的电子元器件查询平台</h2>
				</div>
				<div class="line2_2_2" >
					<div class="index-tab">
						<div class="index-slide-nav" style="margin-top: 10px">
							<a href="frontLogin">登录</a>
							<a href="register" class="active">注册</a>
							<div class="slide-bar slide-bar1"></div>
						</div>
					</div>
					<form action="javascript:void(0)" method="post" class="login form">
						<div class="group">
							<div class="group-ipt">
								<input type="text" name="telephone" id="telphone" class="ipt" placeholder="手机号码" required>
							</div>
							<div class="group-ipt user">
								<input type="text" name="username" id="user" class="ipt" placeholder="输入一个昵称" required>
							</div>
							<div class="group-ipt password">
								<input type="password" name="password" id="password" class="ipt" placeholder="设置登录密码" required>
							</div>
							<div class="group-ipt password1">
								<input type="password" name="password1" id="password1" class="ipt" placeholder="重复密码" required>
							</div>
							<div class="group-ipt verify">
								<input type="text" name="verify" id="verify" class="ipt" placeholder="输入验证码" required>
								<img src="kaptcha.jpg" class="imgcode">
							</div>
						</div>
						<div class="button">
							<input type="submit" class="login-btn register-btn" id="button" value="注册">
						</div>
					</form>
				</div>
				
				<hr
					style="border: 1px solid #ff0000;  width: 1200px;margin-top: 40px " />
				<div
					style="text-align: center; width: 100%; background-color: #F0F0F0;mar">
					<img src="logo/renzheng.jpg">
				</div>
				<div class="line3">
				
					<div class="line3_1">
						<p >商家入驻</p>
						<p >
							<a href="javascript:void(0)">入驻须知</a>
						</p>
						<p >
							<a href="javascript:void(0)">入驻流程</a>
						</p>
						<p >
							<a href="javascript:void(0)">入驻协议</a>
						</p>
					</div>
					<div class="line3_2">
						<p style="display: inline;">配送方式</p>
						<p class="sp">
							<a href="javascript:void(0)">国内交货</a>
						</p>
						<p class="sp">
							<a href="javascript:void(0)">香港交货</a>
						</p>
						<p class="sp">
							<a href="javascript:void(0)">上门自提</a>
						</p>
						<p class="sp">
							<a href="javascript:void(0)">验货签收</a>
						</p>
					</div>
					<div class="line3_3">
						<p style="display: inline;">支付方式</p>
						<p class="sp">
							<a href="javascript:void(0)">在线支付</a>
						</p>
						<p class="sp">
							<a href="javascript:void(0)">银行汇款</a>
						</p>
						<p class="sp">
							<a href="javascript:void(0)">预付款服务</a>
						</p>
						<p class="sp">
							<a href="javascript:void(0)">支付安全</a>
						</p>
					</div>
					<div class="line3_4">
						<p style="display: inline;">特色服务</p>
						<p class="sp">
							<a href="javascript:void(0)">积分返现</a>
						</p>
					</div>
					<div class="line3_7">
						<img style="width: 100px; height: 100px" src="img/img/webchat.png" />
						<p class="line3_7_1">微信</p>
					</div>
					<hr class="line3_5" style="">
					<div class="line3_6">
						<img style="width: 50px; height: 50px" src="logo/logo.png">
						<span class="line3_6_1">在芯间</span>
						<p class="line3_6_2">ZAIXINJIAN.COM</p>
					</div>
				</div>
				<div class="line4">
						版权所有 &copy; 2016 在芯间 保留所有权利 |
						<a href="http://www.miibeian.gov.cn/">
							<img src="img/img/icp.png" />
							粤ICP备15008173号-2
						</a>		
				</div>	
			
			
	</body>
	<script src="//cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
	<script src="//cdn.bootcss.com/particles.js/2.0.0/particles.min.js"></script>
	<script src='js/background.min.js' type="text/javascript"></script>
	<script src="//cdn.bootcss.com/layer/2.4/layer.js"></script>
	<script src="js/dist/jquery.validator.min.js?local=zh-CN" type="text/javascript" charset="utf-8"></script>
	<script src="js/register.min.js" type="text/javascript" charset="utf-8"></script>
	
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
		}).click(
				function() {
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