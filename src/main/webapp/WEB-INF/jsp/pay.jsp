<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
    String contextPath = request.getContextPath();
    String realPath = request.getSession().getServletContext().getRealPath("/");
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + contextPath + "/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>自可知-收银台</title>
	<script src="//cdn.bootcss.com/jquery/2.2.4/jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="shortcut icon" href="<%=basePath%>tu.png" type="image/x-icon"/>
</head>
<body>
<div id="no-ie">
    <div class="w">
        <i class="ni-icon"></i>您的浏览器版本过低，为了您的账户安全和支付体验，建议您升级<a target="_blank" href="http://windows.microsoft.com/zh-cn/internet-explorer/download-ie">IE浏览器</a>；您也可使用最新版本<a target="_blank" href="http://www.firefox.com.cn/">火狐浏览器</a>或<a target="_blank" href="http://www.google.cn/intl/zh-CN/chrome/browser/desktop/index.html">谷歌浏览器</a>完成支付！<span onclick="document.getElementById('no-ie').style.display='none'" class="ni-close"></span>
    </div>
</div>

<!-- shortcut -->
 <div class="shortcut">
    <div class="w">
        <span><a class="s-logo" href="//www.zikezhi.com" target="_blank">
            <img width="170" height="28" alt="自可知收银台" src="img/logo-201709.png">
        </a></span>
        <span style="float: right;margin-top: 25px;">
    		<img style="width: 18px;height: 18px;" src="img/userIcon.png">
  			<a style="color: #999;font-size: 10px;" href="usersystem">
  				${sessionScope.userName }
  			</a>
  			<b style="color: #F2F2F2"> | </b>
  			<img src="img/mydingdan.png">
  			<a href="express">
  				我的订单
  			</a>
  			<b style="color: #F2F2F2"> | </b>
  			<img style="height: 18px;width: 18px;" src="logo/userout.png">
  			<a href="userOut">
  				退出
  			</a>
        </span>
    </div>
</div>
    <div class="main">
		<div class="w">
		<div class="order clearfix">
			<div class="o-qrcode o-qrcode-enhance">
				<a class="oq-img" href="javascript:;">
		        	<img src="img/ma.png" alt="">
		    	</a>
		    </div>
		    <div class="o-left" style="margin-top: -10px;"><h3 class="o-title" style="font-size: 16px;">订单提交成功，请尽快付款！订单号：${ordernumber }</h3>
		<br>
		        <p class="o-tips" id="deleteOrderTip" style="font-size: 16px;">
		                           请您在24小时内完成支付，否则订单会被自动取消(库存紧俏订单请参见详情页时限)
		                    </p>
		    </div>
		    <!-- 订单信息 end --><!-- 订单金额 -->
		    <div class="o-right">
		        <div class="o-price" style="margin-right: 60px;margin-top: -13px;"><em>应付金额</em><strong>${price }</strong><em>元</em></div>
		            </div>
		    <!-- 订单金额 end -->
		    <div class="o-list j_orderList" id="listPayOrderInfo"><!-- 单笔订单 -->
		
		        <!-- 多笔订单 end -->
		    </div>
	</div>
	<div class="payment pay-load">
	    <div class="jp-logo-wrap" style="margin-top: -5px;margin-left: 2px;">
	        <span class="jp-logo" style="width:132px;height:35px;position:absolute;left:-35px;top:0;background:url(img/zkzpay-icon.png) no-repeat"></span>
	    </div>
	    <div class="jp-notice" style="width: 990px;margin-left: -30px;height: 50px;margin-top: -13px;">
	    	<div class="jp-tips" style="margin-top: 15px;margin-left: 140px;">
    			<a class="fukuan1" onclick="zhifubao()" href="javascript:void(0)" style="margin-left: 10px; color: white; position: relative; background: rgb(18, 150, 219); padding: 6px 14px; font-weight: bold; border-radius: 5px;">支付宝支付</a>
	    	</div>
	    </div>
	    <div id="payChanel" class="pay-channel animate-enter animate-enter-active">
	    	<div style="margin-left: 350px;">
		        <p style="font-size: 16px;margin-top: -5px;margin-left: -160px;">本站所有商品均为自取。取货地址：请以订单上面的地址为标准；联系电话：0755-82720040</p>
		        <br><p style="color: red;margin-left: 5%;font-size: 24px;">付款金额: ${price }元</p>
		       <!--  <button type="submit" style="margin-left: 1.1%;background:#22AB39;color: red;width: 120px;height: 40px;" onclick="weixin()">微信支付</button>
		        <button type="submit" style="background:#009FE3;color: red;width: 120px;height: 40px;" onclick="zhifubao()">支付宝支付</button> -->
		    </div>
		    <div id="zhifubao" style="margin-left: 330px;margin-top: 20px;">
		    	<img src="img/pays.png" width="260px;" style="margin-top: 10px;" height="280px;" alt="请我支付">
		    </div>
		    <div style="margin-top: 20px;margin-left: 330px;">
		    <input type="hidden" id="panduan" name="panduan" value="${panduan }">
		    	<%-- <form action="indentdelect" method="post">
		    		<input type="hidden" id="express" name="express" value="${express }">
		    		<input type="hidden" id="status" name="status" value="5">
		    	</form> --%>
		    	<a class="fu" onclick="saveCart('${eid }','${bdeid}')" href="javascript:void(0)" style="color: white; position: relative; background: #ADADAD; padding: 9px 26px; font-weight: bold; border-radius: 5px;width: 100px;height: 28px;">稍后支付</a>
				<a class="fu1" onclick="Cart('${eid }','${bdeid }')" href="javascript:void(0)" style="margin-left: 10px; color: white; position: relative; background: #FF2D2D; padding: 9px 26px; font-weight: bold; border-radius: 5px;margin-left:56px;">付款成功</a>
			</div>
		</div>
		<br><br><br>
	</div>
	<div id="payPlats">
	<footer style="text-align: center;margin-top: 60px;">
		版权所有 &copy; 2017 - 2018 自可知 保留所有权利 | <a href="http://www.miibeian.gov.cn/"><img src="img/img/icp.png" /> 粤ICP备17040594号-2 </a>
	</footer>
	</div>
    </div>
</div>
<script type="text/javascript">
$('.fukuan').hover(function(){
	$(this).css('background','green');			
},function(){
	$(this).css('background','#1AFA29');	
});
	$('.fukuan1').hover(function(){
	$(this).css('background','blue');			
},function(){
	$(this).css('background','#1296DB');	
});
	$('.fu').hover(function(){
		$(this).css('background','#6C6C6C');			
	},function(){
		$(this).css('background','#ADADAD');	
	});
	$('.fu1').hover(function(){
		$(this).css('background','#EA0000');			
	},function(){
		$(this).css('background','#FF2D2D');	
	});
	$(function(){
		document.getElementById('weixin').style.display = 'none';
		document.getElementById('wenti').style.display = 'none';
	})
	function wenti(){
		var i=$("#aa").val();
		if(i==0){
			document.getElementById('wenti').style.display = 'block';
			$("#aa").val("1");
			return false;
		}else if(i==1){
			document.getElementById('wenti').style.display = 'none';
			$("#aa").val("0");
			return false;
		}
	}
	function weixin(){
		document.getElementById('weixin').style.display = 'block'
		$("#mode").val("1");
		document.getElementById('zhifubao').style.display = 'none';
	}
	function zhifubao(){
		document.getElementById('zhifubao').style.display = 'block'
		$("#mode").val("2");
		document.getElementById('weixin').style.display = 'none';
	}
	function saveCart(express,panduan){
		if(panduan!=""){
			window.location.href='beidongExpress';
		}else{
		window.location.href='express';
		}
	}
	function Cart(zdexpress,bdexpress){
		 $.post("indentdelect",{zdexpress:zdexpress,biaozi:2,bdexpress:bdexpress},
            function(data){
				if(data.result=="fail"){
				}else if(data.result=="seccuss"){
					if(bdexpress!=""){
						window.location.href='beidongExpress';
					}else{
					window.location.href="express";
					}
				}
			}
	   	)
	}
</script>
</body>

</html>