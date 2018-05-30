<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"/>
		<title>在芯间-最专业的电子元器件查询平台</title>
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
				margin-top: 100px;
			}
			.line2_2_1{
				margin-left: -800px;
				margin-top:-380px;
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
				margin-top: 50px;
				
			}
		</style>
	</head>
	<body>
		
			
				<div class="line1_backcolor">
				</div>
				
				<div class="line1_2">
					<a href="index">
						<span><img src="logo/logo.png" style="height: 40px;width: 40px" /> 
							<span id="title" style="color: #FFA500;font-size: 30px">
							 	在芯间 <span style="color: #FFA500" id="smallTitle">|&nbsp; 新一代的选择</span>
							</span>
						</span>
					</a>
				</div>
				
				<div style="margin-left: 1050px;margin-top: -45px" >
					<table cellpadding="0" cellspacing="0" style="text-align: center;border: 1px #E5E5E5 solid;">
						<tr>
							<td width="40px" style="padding-top: 5px">
								<a href="javascript:void(0)"
									onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=2938492659&site=qq&menu=yes');">
									<img style="width: 20px;height: 20px" alt="QQ" src="http://www.5tu.cn/attachments/month_1008/1008250911b00da2691d5bf01a.jpg">&nbsp;
								</a>
							</td>
							<td style="border: 1px #E5E5E5 solid;background-color: #FFA500;color: white;font-size: 12px" width="100px">
								<a href="javascript:void(0)"
									onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=2938492659&site=qq&menu=yes');" style="color: white">
									BOM表报价
								</a>
							</td>
						</tr>
					</table>
				</div>
				
				<div class="line2_1">
					<img src="logo/login.jpg" style="width: 800px">
				</div>
				
				<div class="line2_2_1">
					<span class="sub-title">
						<img src="logo/loginwel.png">
						欢迎来到在芯间
					</span>
				</div>
				<div style="margin-left: 300px;color: #FFA500;font-size: 20px">
					<span class="sub-title">不一样的用户体验</span>
				</div>
				<div style="width: 300px;height: 40px;background-color: #5CACEE;text-align: center;font-weight: bold;margin-left: 850px;margin-top: -20px;font-size: 20px">
					供应商系统
				</div>
				<div class="line2_2_2" >
					<div class="index-tab">
						<div class="index-slide-nav" style="margin-top: 10px">
							<a href="merchantLogin" class="active">登录</a>
						<a href="mcZhuCe">注册</a>
						<div class="slide-bar"></div>
						</div>
					</div>
					<div  class="login form">
						<div class="group">
							<div class="group-ipt">
								<input type="text" name="tel" id="tele" placeholder="手机号码" required>
							</div>
							<div class="group-ipt password">
								<input type="password" name="passWord" id="password"  placeholder="输入您的登录密码" required>
							</div>
							<div class="group-ipt verify">
								<input type="text" name="verify" id="verify"  placeholder="输入验证码" required>
								<img src="kaptcha.jpg" class="imgcode">
							</div>
						</div>
						<div class="button">
							<button type="button" class="login-btn register-btn" onclick="testLogin()" id="button">登录</button>
						</div>
					</div>
				</div>
		
					<div class="remember clearfix" style="margin-left: 800px">
						<label class="remember-me"> 
							<span class="icon">
								<span class="zt"></span>
							</span>
							<input type="checkbox" name="remember-me" id="remember-me" class="remember-mecheck" checked>记住我
						</label> 
						<label  class="forgotme" style="position: absolute;margin-left: 280px">
							<a href="javascript:void(0)" style="text-decoration: none;" id="forget">忘记密码？</a>
						</label>
					</div>
					
				</div>
				
				<hr
					style="border: 1px solid #ff0000;  width: 1200px;margin-top: 40px " />
				<div
					style="text-align: center; width: 100%; background-color: #F0F0F0;">
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
					<hr class="line3_5" >
					<div class="line3_6">
						<img style="width: 50px; height: 50px" src="logo/logo.png">
						<span class="line3_6_1">在芯间</span>
						<p class="line3_6_2">ZAIXINJIAN.COM</p>
					</div>
				</div>
				<div class="line4">
						版权所有 &copy; 2017 自可知  保留所有权利 |
						<a href="http://www.miibeian.gov.cn/">
							<img src="img/img/icp.png" />
							粤ICP备17040594号-2
						</a>		
				</div>	
			
			
	</body>
	<script type="text/javascript" src="user/lib/jquery/1.9.1/jquery.min.js"></script>
	<script src="js/sjzhuce/sjLogin.js" type="text/javascript"></script>
	
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