<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
    String contextPath = request.getContextPath();
    String realPath = request.getSession().getServletContext().getRealPath("/");
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + contextPath + "/";
%>
<html>
<head>
    <title>支付</title>
<script src="//cdn.bootcss.com/jquery/2.2.4/jquery.js"></script>
</head>
<body>
<div style="width: 100%;margin-top: 85px;">
	<div style="float: left;width:39%;">
		<div style="float: left;">
			<p><a href="javascript:;" onclick="wenti()" style="color: red;">常见付款问题：</a></p>
		</div>
		<br/>
		<div style="float: left;" id="wenti">
			<p style="color: red;">1：付款后什么时候可以发货？</p>
			<p><span style="color: red;">答</span>：17点前付款，当天可以发货,17点后付款第二天发货，周日休息不发货。</p>
				<br />
				<p style="color: red;">2：发货时候有没有收据或者送货单？</p>
			<p><span style="color: red;">答</span>：发货时候附送收据，但是没有送货单，需要送货单的请备注留言即可。</p>
			<br />
			<p style="color: red;">3：能否支持公司账户付款？</p>
			<input type="hidden" id="aa" name="aa" value="0">
			<p><span style="color: red;">答</span>：如果需要开普通发票或者增值税票，支持公司账户付款，一般流程是做合同，然后打款，具体的请联系客服。<a href="javascript:void(0)"
				onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=2938492659&site=qq&menu=yes');">
				<img
				src="http://www.5tu.cn/attachments/month_1008/1008250911b00da2691d5bf01a.jpg"
				style="width: 15px; height: 15px; margin: 0px 0px -3px 0px" /></a>
			</p>
		</div>
	</div>
	<div id="main" style="margin:0 auto;margin-left: 39%;">
	   <div>
	        <p style="font-size: 36px;margin-top: -20px;">请扫码向我支付:</p>
	        <p style="color: red;margin-left: 10%;">价格: ${price}</p>
	        <button type="submit" style="margin-left: 1.1%;background:#22AB39;color: red;width: 120px;height: 40px;" onclick="weixin()">微信支付</button>
	        <button type="submit" style="background:#009FE3;color: red;width: 120px;height: 40px;" onclick="zhifubao()">支付宝支付</button>
	    </div>
	    <div id="zhifubao" style="margin-left: 1.1%;">
	    	<img src="img/pays.jpg" width="240px;" style="margin-top: 10px;" height="280px;" alt="请我支付">
	    </div>
	    <div id="weixin" style="margin-left: 1.1%;">
	    	<img src="img/weixin.jpg" width="240px;" style="margin-top: 10px;" height="280px;" alt="请我支付">
	    </div>
	    <div style="margin-top: -10px;">
	    	<%-- <form action="indentdelect" method="post">
	    		<input type="hidden" id="express" name="express" value="${express }">
	    		<input type="hidden" id="status" name="status" value="5">
	    	</form> --%>
	    	<input type="hidden" id="mode" name="mode" value="2">
			<button id="chenggong" style="color: red;width: 120px;height: 40px;margin-top: 23px;float: right;margin-right: 69.1%;" onclick="Cart('${bomid }')">付款成功</button>
		</div>
	</div>
</div>
<script type="text/javascript">
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
	function saveCart(express){
		window.location.href='aa';
	}
	function Cart(express){
		var mode=$("#mode").val();
		 $.post("bomuppay?bom_id="+express+"&bom_status=6"+"&bom_mode="+mode,
            function(data){
				if(data.result=="fail"){
				}else if(data.result=="seccuss"){
					window.location.href="querybomuser";
				}
			}
	   	)
	}
</script>
</body>
</html>
