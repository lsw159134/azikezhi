<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String contextPath = request.getContextPath();
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
%>
<%
	if(session.getAttribute("uid") == null){
		response.sendRedirect("frontLogin");
	}
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="user/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="user/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="user/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/css/style.css" />
<link rel="stylesheet" type="text/css" href="css/css/productSearchResult.css" />
<link href="//cdn.bootcss.com/remodal/1.1.0/remodal.min.css" rel="stylesheet">
<link href="//cdn.bootcss.com/remodal/1.1.0/remodal-default-theme.min.css" rel="stylesheet">
<link href="css/bases.css" rel="stylesheet" type="text/css">
<link href="css/manager.css" rel="stylesheet" type="text/css">
<script src="//cdn.bootcss.com/jquery/2.2.4/jquery.js"></script>
<script src="//cdn.bootcss.com/remodal/1.1.0/remodal.min.js"></script>
<script src="//cdn.bootcss.com/Buttons/2.0.0/js/buttons.min.js"></script>
<script src="//cdn.bootcss.com/webui-popover/1.2.17/jquery.webui-popover.min.js"></script>
<style type="text/css">
html{
	font: 微软雅黑;
}
.stepflex{display:inline-block;display:block;border-top:5px solid #ccc;text-align:center;margin:10px 30px 0;float:right;}
.stepflex:after{content:".";display:block;height:0;clear:both;visibility:hidden}
* html .stepflex{height:1%}*+html .stepflex{min-height:1%}
.stepflex dl{float:left;position:relative;width:160px;top:-5px;border-top:5px solid #ccc}
.stepflex dl.doing{border-top-color:#7abd54}.stepflex dl.doing .s-num{background-position:-23px 0}
.stepflex dl.doing .s-text{color:#7abd54}.stepflex dl.done{border-top-color:#caecb6}
.stepflex dl.done .s-num{background-position:-46px 0}.stepflex dl.done .s-text{color:#caecb6}
.stepflex .doing b,.stepflex .doing s,.stepflex .first s,.stepflex .last b{width:5px;height:5px;position:absolute;line-height:0;font-size:0;top:-5px;background-image:url(css/img/step2013.png);overflow:hidden}
.stepflex .s-num{position:relative;margin:-15px auto 0;color:#fff;font-weight:700;width:23px;height:23px;background-image:url(css/img/step2013.png);line-height:23px}
.stepflex .s-text{color:#ccc}.stepflex s{left:0}.stepflex b{right:0}
.stepflex .first s{background-position:0 -24px;background-color:#fff}
.stepflex .last b{background-position:-5px -24px;background-color:#fff}
.stepflex .doing s{background-position:-23px -24px}
.stepflex .doing b{background-position:-28px -24px;background-color:#ccc}
.stepflex .doing.last s,.stepflex .doing.normal s{background-color:#caecb6}
.stepflex .doing.last b{background-color:#fff}.stepflex .done s{background-position:-46px -24px}
.stepflex .done b{background-position:-51px -24px}
.stepflex .doing.last .s-num{background-position:-91px 0}#sflex01{width:160px}
#sflex02{width:320px}#sflex03{width:480px}#sflex04{width:640px}#sflex05{width:800px}
#sflex06{width:960px}
.message{height:98px;padding-left:341px;background:url(img/no-login-icon.png) 250px 22px no-repeat;margin-top: 150px;margin-left: 140px;}
.message ul{padding-top:23px}
.message li{line-height:26px}
.message .txt{font-size:14px}
.ftx-05{color:#005ea7;}
.ftx-05:hover{color:#e4393c}
.delete:hover{
	color:red;
}
#tr22 td{
	height: 50px;
	border-bottom: 1px #EEE0E5 solid;
}
#gojiesuan{
	margin-top: 30px;margin-bottom: 50px;border: 1px #EEE0E5 solid;height: 55px;width: 716px;margin-left: 197px;text-align: right;display: inline-block;
}
#gojiesuan p{
	display: inline-block;height: 56px;line-height: 20px;position: absolute;
}
a{
	text-decoration: none;
}
.submit-btn,.clear{
	margin-top: 30px;position: absolute;padding:10px 30px;background: #e4393c;border: 1px solid #e4393c;color: #fff;font-weight: bold;height: 34px;line-height: 36px;font-size: 16px;vertical-align: middle;
}
.zznav {
		position: relative;
		z-index: 1;
		padding-left: 1em;
	}
	
	.zznav > a {
		position: relative;
		display: inline-block;
		padding: .3em 1em 0;
		color: inherit;
		text-decoration: none;
		margin: 0 -.3em;
	} 
	
	.zznav > a::before,
	
	.zznav a::before {
		content: ''; /* To generate the box */
		position: absolute;
		top: 0; right: 0; bottom: 0; left: 0;
		z-index: -1;
		border-bottom: none;
		border-radius: .5em .5em 0 0;
		background: #A5C9CE linear-gradient(hsla(0,0%,100%,.6), hsla(0,0%,100%,0));
		box-shadow: 0 .15em white inset;
		transform: scale(1.1, 1.3) perspective(.5em) rotateX(5deg);
		transform-origin: bottom;
	}
	
	.zznav a.selected { z-index: 2;}
	
	.zznav a.selected::before {
		background-color: #CDC8B1;
		margin-bottom: -.08em;
	}
	.zznav.left > a::before {
		transform: scale(1.2, 1.3) perspective(.5em) rotateX(5deg);
		transform-origin: bottom left;
	}
	
	.zznav.right { padding-left: 2em; }
	
	.zznav.right > a::before {
		transform: scale(1.2, 1.3) perspective(.5em) rotateX(5deg);
		transform-origin: bottom right;
	}
	
	.zznav a:hover {
		color:white;
	}
</style>
<title>自可知用户系统</title>
<link rel="shortcut icon" href="<%=basePath%>tu.png" type="image/x-icon"/>
</head>

<body>
	<header class="navbar-wrapper" >
		<div class="navbar navbar-fixed-top" style="background-color: #222222">
			<div class="container-fluid cl" >
				<div style="display: inline-block;background: #222222;width: 200px;margin-left: -15px;height: 50px;position: absolute;text-align: center;line-height: 50px;font-size: 16px;font-weight: bold;margin-top: -1px;">
					<a href="index" style="color: white;">
						自可知用户系统
					</a>
				</div>
				<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
				<div style="display: inline-block;margin-left: 800px;">
					<nav class="nav navbar-nav">
						<ul class="cl">
							<li style="min-width: 500px;">
							会员星级 : <c:if test="${sessionScope.star == 0 }">
										(星级随着订单交易完成的数量成长)	
									</c:if>
									<c:if test="${sessionScope.star == 1 }">
										<img src="<%=basePath%>logo/user_xingji.png">	
									</c:if>
									<c:if test="${sessionScope.star==2 }">
										<img src="<%=basePath%>logo/user_xingji.png">
										<img src="<%=basePath%>logo/user_xingji.png">
									</c:if>
									<c:if test="${sessionScope.star>=3 && sessionScope.star<=10}">
										<img src="<%=basePath%>logo/user_xingji.png">
										<img src="<%=basePath%>logo/user_xingji.png">
										<img src="<%=basePath%>logo/user_xingji.png">
									</c:if>
									<c:if test="${sessionScope.star>10 && sessionScope.star<=50}">
										<img src="<%=basePath%>logo/user_xingji.png">
										<img src="<%=basePath%>logo/user_xingji.png">
										<img src="<%=basePath%>logo/user_xingji.png">
										<img src="<%=basePath%>logo/user_xingji.png">
									</c:if>
									<c:if test="${sessionScope.star>50}">
										<img src="<%=basePath%>logo/user_xingji.png">
										<img src="<%=basePath%>logo/user_xingji.png">
										<img src="<%=basePath%>logo/user_xingji.png">
										<img src="<%=basePath%>logo/user_xingji.png">
										<img src="<%=basePath%>logo/user_xingji.png">
									</c:if>
							</li>
						</ul>
					</nav>
				</div>
				
				<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
					<ul class="cl">
						<li class="dropDown dropDown_hover"><a href="#" class="dropDown_A">${user.username}<i class="Hui-iconfont">&#xe6d5;</i>
							</a>
							<ul class="dropDown-menu menu radius box-shadow">
								<li><a href="frontLogin">切换账户</a></li>
								<li><a href="userOut">退出</a></li>
							</ul></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<aside class="Hui-aside" style="background: white;">
		<input type="hidden"  id="supplieruid" value=""/>
		<div class="menu_dropdown bk_2">
			<dl id="menu_1">
				<dt style="background: #CDB38B;">
					<img src="<%=basePath%>logo/user_geren.png">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="usersystem" data-title="个人中心" style="font-weight: bold;" >
						用户信息
					</a>
					<i class="Hui-iconfont menu_dropdown-arrow" style="color: black;">&#xe6d5;</i>
				</dt>
				<dd style="display: block;">
					<ul>
					<li>
							<a href="usersystem" style="margin-left: -25px" data-title="主动元器件订单">
								&emsp;&emsp;个人中心
							</a>
						</li>
						<li style="background: #D0DFEF;">
							<a href="myCart" style="margin-left: -25px" data-title="我的购物车">
								<img style="position: absolute;margin-top: 8px;" src="<%=basePath%>logo/yuan.png?3214">&emsp;&emsp;我的购物车
							</a>
						</li>
						
						<li>
							<a href="express" style="margin-left: -25px" data-title="主动元器件订单">
								&emsp;&emsp;主动元器件订单 
								  <c:if test="${not empty zdCountNoPay}">
								<font size="1px" color="red">未付款(${zdCountNoPay})</font>
								</c:if>
							</a>
						</li>
						<li>
							<a href="beidongExpress"  style="margin-left: -25px" data-title="被动元器件订单">&emsp;&emsp;被动元器件订单  
						        <c:if test="${not empty bdCountNoPay}">
								<font size="1px" color="red">未付款(${bdCountNoPay})</font>
								</c:if>
							</a>
						</li>
						<li>
							<a href="MyAddress" style="margin-left: -25px" data-title="地址">&emsp;&emsp;我的地址</a>
						</li>
						<!-- <li>
							<a href="cashback" data-title="订单返现">&emsp;&emsp;订单返现</a>
						</li> -->
					</ul>
				</dd>
			</dl>
			<dl id="menu-admin">
				<dt>
					<img src="<%=basePath%>logo/user-kucun.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a data-title="库存管理" href="javascript:;" style="font-weight: bold;">上传库存</a><i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a href="supplierIn" data-title="公司信息" >&emsp;&emsp;公司资料</a></li>
						<li>
							<a href="javascript:;" onclick="usersupplier()" data-title="库存管理" >
								&emsp;&emsp;优势库存
							</a>
						</li>
						<li><a href="javascript:;" onclick="usersupplierpt();" data-title="公司信息" >&emsp;&emsp;普通库存</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu_2">
				<dt>
					<img src="<%=basePath%>logo/jilu.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a data-title="库存管理" href="javascript:;" style="font-weight: bold;">资源管理</a><i class="Hui-iconfont menu_dropdown-arrow" style="color: black;">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li>
							<a href="queryByInquiryUserid" data-title="询价记录" >
								&emsp;&emsp;询价记录（采购记录）
							</a>
						</li>
						<li><a href="quoteAllByUser" data-title="报价记录">&emsp;&emsp;报价记录</a></li>
						<li>
							<a href="stockAll" data-title="库存管理">
								&emsp;&emsp;库存管理（销售订单）
							</a>
						</li>
					</ul>
				</dd>
			</dl>
			<c:if test="${sessionScope.supplieruid==1 }">
				<dl id="menu_7">
					<dt>
						<img src="<%=basePath%>logo/zaixiang.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a data-title="库存管理" href="javascript:;" style="font-weight: bold;">在线购</a><i class="Hui-iconfont menu_dropdown-arrow" style="color: black;">&#xe6d5;</i>
					</dt>
					<dd>
						<ul>
							<li>
								<a href="seleonlineProduct" data-title="在线购库存" >
									&emsp;&emsp;在线购库存
								</a>
							</li>
							<li><a href="seleOnlineExpress" data-title="在线购订单">&emsp;&emsp;在线购订单</a></li>
						</ul>
					</dd>
				</dl>
			</c:if>
		</div>
	</aside>
	<section class="Hui-article-box">
		<div id="Hui-tabNav" class="Hui-tabNav hidden-xs" style="background: white;border-bottom: 1px #E5E5E5 solid;">
			<div class="Hui-tabNav-wp">
				<ul id="min_title_list" >
					<li >
						<nav class="zznav" style="margin-top: 11px;margin-left: 10px;">
							<a href="index">首页</a>
							<a href="myCart" class="selected">我的购物车</a>
						</nav>
					</li>
				</ul>
			</div>
		</div>
		<div id="iframe_box" class="Hui-article">
			<div class="show_iframe">
				<div style="display: none" class="loading"></div>
				<div class="page-container" style="margin-top: 30px;">
					<c:if test="${cartItem.size() != 0 }">
						<div class="stepflex" id="#sflex01" style="margin-left: 575px;position: absolute;width: 480px">
					        <dl class="normal doing">
					            <dt class="s-num">1</dt>
					            <dd class="s-text">1.我的购物车<b></b></dd>
					        </dl>
					        <dl class="first done">
					            <dt class="s-num">2</dt>
					            <dd class="s-text">2.填写核对订单信息<b></b></dd>
					        </dl>
					        <dl class="normal last">
					            <dt class="s-num">3</dt>
					            <dd class="s-text">3.成功提交订单<b></b></dd>
					        </dl>
					    </div>
					    <div>
					        <table class="table" style="width:1000px;margin-left: 55px;margin-top: 50px;">
					            <thead>
					            <tr class="text-c" style="background: #F3F3F3">
					                <th width="70px;">商品型号</th>
					                <th width="30px;">商品价格</th>
					                <th width="30px;">封装</th>
					                <th width="30px;">库存</th>
					                <th width="50px;">商品数量</th>
					                <th width="70px;">小计</th>
					                <th width="50px;">操作</th>
					            </tr>
					            </thead>
					            <tbody>
					            <c:forEach items="${cartItem }" var="cartItem" varStatus="status">
					                <tr id="tr22" class="text-c" style="background: #FFF4E8">
					                    <td width="70px;">
					                    	${cartItem.product }
					                    </td>
					                    <td width="50px;">￥${cartItem.price }</td>
					                    <c:if test="${cartItem.encapsulation == null}">
					                   		<td width="50px;">模块</td>
					                    </c:if>
					                    <c:if test="${cartItem.encapsulation != null}">
					                   		<td width="50px;">${cartItem.encapsulation }</td>
					                    </c:if>
					                    <td width="50px;">${cartItem.isgoodsinstock }</td>
					                    <td width="70px;" >
					                    	<input style="text-align: center;" onchange="tttt(this.value,'${cartItem.cart.cart_id }','${cartItem.productuuid }')" type="number" id="number" name="number" value="${cartItem.cart.cart_number }"></td>
					                    <td width="70px;">￥${cartItem.subtotal} </td>
					                    <td width="50px;"><a href="removeCart.action?pid=${cartItem.cart.cart_id }" class="delete">删除</a></td>
					                </tr>
					            </c:forEach>
					            </tbody>
					        </table>
					        	<div>
					        		<a href="clearCart" id="clear" class="clear" style="margin-left: 55px;" >清空购物车</a>
									<div id="gojiesuan">
										<p style="margin-left: -180px;margin-top: 18px;">总金额 : </p><p id="effectivePrice" style="font-size: 16px;color: #e4393c;font-weight: 700;margin-left: -120px;margin-top: 18px;">￥${total }</p>
									</div>
									<a href="javascript:;" onclick="doSwithTab()" class="submit-btn">去结算 &nbsp;&nbsp;&nbsp;></a>
					        	</div>
								
								
					    </div>
					    </c:if>
						<c:if test="${cartItem.size() == 0 }">
							<div class="message">
								<ul>
									<li class="txt">
										购物车空空的哦~，去看看其他的商品吧~
									</li>
									<li class="mt10">
										<a href="//www.zikezhi.com/" class="ftx-05">
											去购物&gt;
										</a>
									</li>
								</ul>
							</div>	
						</c:if>
					</div>
					<div style="margin-top: 50px;text-align: center;margin-bottom: 30px;">
						<%@include file="../../../../include/footer.jsp"%>
					</div>
					<form action="myCartSettlement" method="post" id="cartForm">
						<input type="hidden" name="fapiao" id="fapiao">
						<input type="hidden" name="expressname" id="expressname">
						<input type="hidden" name="panduan" value="${panduan}">
					</form>
	<script type="text/javascript">
	function doSwithTab(pid){
		/* var p_panduan  =  document.getElementById('panduan').value();
		alert(p_panduan)
		$("#panduan").val(p_panduan); */
		$("#expressname").val("2");
    	$("#fapiao").val("1");
    	document.getElementById('cartForm').submit();
		/* window.location.href="pay?expressname="+expressname+"&beizhu="+beizhu+"&aid="+aid+"&fapiao="+fapiao+"&productuid="+pid+'&number='+expressnumber; */
	}
	function usersupplier(){
		$.post("supplierseleuser",
			function(data){
				if(data.result=="fail"){
					layer.alert('请先添加公司信息');   
					setTimeout(function(){window.location.href="supplierIn";},1000);
				}else if(data.result=="seccuss"){
					window.location.href="userSupplierProduct";
				}else if(data.result=="login"){
					window.location.href="frontLogin";
				}
			}
		)
	}
	function usersupplierpt(){
		$.post("supplierseleuser",
	        function(data){
				if(data.result=="fail"){
					layer.alert('请先添加公司信息');   
					setTimeout(function(){window.location.href="supplierIn";},1000);
				}else if(data.result=="seccuss"){
					window.location.href="putong";
				}else if(data.result=="login"){
					window.location.href="frontLogin";
				}
			}
	   	)
	}
	function tttt(obj,pid,isgoodsinstock){
		if(parseInt(obj)==0){
			layer.alert("请输入正确数字 ");
		}else if(!/^\d+$/.test(obj)){
			layer.alert("请输入正确数字 ");
		}else if(parseInt(obj)>200){
			layer.alert("一次只能购买200个");
			return;
		}else{
			$.post("queryCartOrdercount?pid="+isgoodsinstock,
				function(data){
					if(parseInt(obj)>parseInt(data.count)){
						layer.alert("库存不足 ");
						$("#number").val(parseInt(data.count));
						$.post("upCart?pid="+pid+"&count="+data.count,
							function(data){
								if(data.result=="fail"){
								}else if(data.result=="seccuss"){
									window.location.href="myCart";
									/* window.location.href="myCartSettlement?expressname="+expressname+"&beizhu="+beizhu+"&aid="+aid+"&fapiao="+fapiao; */
								}
							}
					   	) 
					}else{
						$.post("upCart?pid="+pid+"&count="+obj,
							function(data){
								if(data.result=="fail"){
								}else if(data.result=="seccuss"){
									window.location.href="myCart";
									/* window.location.href="myCartSettlement?expressname="+expressname+"&beizhu="+beizhu+"&aid="+aid+"&fapiao="+fapiao; */
								}
							}
					   	) 
					}
				}
		   	) 
		}
	}
	$("#pay").on("click", function(){
	 	var expressname=$("#expressname").val();
	 	var name=$("#name").val();
	 	var fapiao=$("#fapiao").val();
	 	var phone=$("#phone").val();
	 	var address=$("#address").val();
		var beizhu=$("#beizhu").val();
		if(beizhu==null){
			beizhu='';
		}
		if(phone.replace(/(^s*)|(s*$)/g, "").length ==0){
			layer.alert("请完善收货信息");
	    }else if(name.replace(/(^s*)|(s*$)/g, "").length ==0){
	    	layer.alert("请完善收货信息");
	    }else if(address.replace(/(^s*)|(s*$)/g, "").length ==0){
	    	layer.alert("请完善收货信息");
	    }else{
	    	if(fapiao!=1){
	    		if(beizhu.replace(/(^s*)|(s*$)/g, "").length ==0){
	    			layer.alert("请备注开票单位");
	    		}else{
	    			window.location.href="saveOrder?expressname="+expressname+"&beizhu="+beizhu+"&name="+name+"&phone="+phone+"&address="+address+"&fapiao="+fapiao;
	    		}
	    	}else{
	    		window.location.href="saveOrder?expressname="+expressname+"&beizhu="+beizhu+"&name="+name+"&phone="+phone+"&address="+address+"&fapiao="+fapiao;
	    	}
	    }
	});
	$(".submit-btn").hover(function(){
	    $(".submit-btn").css("background","red");
	    $(".submit-btn").css("color","white");
	    $(".submit-btn").css("text-decoration","none");
	},function(){
	    $(".submit-btn").css("background","#E64346");
	    $(".submit-btn").css("color","white");
	});
	$(".clear").hover(function(){
	    $(".clear").css("background","red");
	    $(".clear").css("color","white");
	    $(".clear").css("text-decoration","none");
	},function(){
	    $(".clear").css("background","#E64346");
	    $(".clear").css("color","white");
	});
	
	</script>
			
			</div>
		</div>
	</section>
	<script type="text/javascript" src="user/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="user/lib/layer/2.1/layer.js"></script>
	<script type="text/javascript" src="user/static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript" src="user/static/h-ui.admin/js/H-ui.admin.js"></script>
</body>
</html>