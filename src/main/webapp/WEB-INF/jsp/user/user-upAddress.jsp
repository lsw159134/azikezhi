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
<html lang="lang=zh-cmn-Hans">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="user/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="user/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="user/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/css/style.css" />
<link rel="stylesheet" type="text/css" href="css/css/productSearchResult.css" />
<link href="//cdn.bootcss.com/layer/2.4/skin/layer.min.css" rel="stylesheet">
    <link href="//cdn.bootcss.com/Buttons/2.0.0/css/buttons.min.css" rel="stylesheet">
<title>在芯间用户系统</title>
<link rel="shortcut icon" href="<%=basePath%>tu.png" type="image/x-icon"/>
<style type="text/css">
	html{
		font: 微软雅黑;
	}
	.fix-div{ 
	    margin: 0 auto;
	    position: fixed;
	    width: 80%; 
	    top: 0;     
	    left: 0; 
	    right: 0;
	    z-index: 99999;
	}
	.fukuan:hover{
		text-decoration: none;
	}
	.quxiao:hover{
		text-decoration: none;
		color: red;
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
		background: #CDB38B linear-gradient(hsla(0,0%,100%,.6), hsla(0,0%,100%,0));
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
</head>

<body>
	<header class="navbar-wrapper" >
		<div class="navbar navbar-fixed-top" style="background-color: #87CEEB">
			<div class="container-fluid cl" >
				<div style="display: inline-block;background: #FFA500;width: 200px;margin-left: -15px;height: 50px;position: absolute;text-align: center;line-height: 50px;font-size: 16px;font-weight: bold;">
					<a href="index" style="color: white;">
						在芯间用户系统
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
				<dt>
					<img src="<%=basePath%>logo/user_geren.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="usersystem" data-title="个人中心" style="font-weight: bold;" >个人中心</a>
				</dt>
			</dl>
			<dl id="menu_2">
				<dt >
					<img src="<%=basePath%>logo/user_dingdan.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="express" data-title="我的订单" style="font-weight: bold;">我的订单</a>
				</dt>
			</dl>
			<%-- <dl id="menu_3">
				<dt>
					<img src="<%=basePath%>logo/user_bom.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="querybomuser" data-title="bom表订单" style="font-weight: bold;">bom表订单</a>
				</dt>
			</dl> --%>
			<dl id="menu_4">
				<dt>
					<img src="<%=basePath%>logo/user_gouwu.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="myCart" data-title="我的购物车" style="font-weight: bold;">我的购物车</a>
				</dt>
			</dl>
			 <dl id="menu_5">
				<dt style="background: #CDB38B;">
					<img src="<%=basePath%>logo/user_dizhi.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="MyAddress" data-title="地址" style="font-weight: bold;">地址管理</a>
				</dt>
			</dl> 
			<%-- <dl id="menu_6">
				<dt>
					<img src="<%=basePath%>logo/user_fanxian.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="cashback" data-title="会员返现" style="font-weight: bold;">会员返现</a>
				</dt>
			</dl> --%>
			<dl id="menu-admin">
				<dt>
					<img src="<%=basePath%>logo/user_jishou.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="booking" data-title="库存寄售" style="font-weight: bold;">库存寄售</a>
				</dt>
			</dl>
			<!-- <dl id="menu-admin">
				<dt>
					<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="QuotesByuser" data-title="bom订单" href="javascript:;">bom表询价</a>
				</dt>
			</dl> -->
			<dl id="menu-admin">
				<dt>
					<img src="<%=basePath%>logo/user_xunjia.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a data-title="询价记录" href="javascript:;" style="font-weight: bold;">上传产品</a><i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<!-- <li><a href="queryByInquiryUserid" data-title="普通询价" >上传型号</a></li> -->
						<li><a href="supplierIn" data-title="公司信息" >公司信息</a></li>
					</ul>
				</dd>
			</dl>
		</div>
	</aside>
	<div class="dislpayArrow hidden-xs">
		<a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a>
	</div>
	<section class="Hui-article-box">
		<div id="Hui-tabNav" class="Hui-tabNav hidden-xs" style="background: white;border-bottom: 1px #E5E5E5 solid;">
			<div class="Hui-tabNav-wp">
				<ul id="min_title_list" >
					<c:if test="${biaozi==2 }">
						<li class="active"><span title="个人信息" data-href="userinfo">个人信息</span><em></em></li>
					</c:if>
					<c:if test="${biaozi==1 }">
						<li class="active"><span title="我的订单" data-href="express">我的订单</span><em></em></li>
					</c:if>
					<c:if test="${biaozi==3 }">
						<li class="active"><span title="我的购物车" data-href="myCart">我的购物车</span><em></em></li>
					</c:if>
					<c:if test="${biaozi==4 }">
						<li class="active"><span title="收货地址" data-href="MyAddress">地址管理</span><em></em></li>
					</c:if>
					<c:if test="${biaozi==5 }">
						<li class="active"><span title="添加地址" data-href="MyAddress">添加地址</span><em></em></li>
					</c:if>
					<c:if test="${upaddress eq 'upaddress' }">
						<li >
							<nav class="zznav" style="margin-top: 9px;margin-left: 13px;">
								<a href="usersystem">首页</a>
								<a href="#" class="selected">修改地址</a>
								<a target="blank" href="aboutus">关于我们</a>
							</nav>
						</li>
					</c:if>
					<c:if test="${cashback eq 'cashback' }">
						<li class="active"><span title="会员返现" data-href="cashback">会员返现</span><em></em></li>
					</c:if>
					<c:if test="${booking eq 'booking' }">
						<li class="active"><span title="库存寄售" data-href="cashback">库存寄售</span><em></em></li>
					</c:if>
					<c:if test="${addbooking eq 'addbooking' }">
						<li class="active"><span title="添加代售" data-href="cashback">添加代售</span><em></em></li>
					</c:if>
					<c:if test="${bomuserAll eq 'bomuserAll' }">
						<li class="active"><span title="bom表订单" data-href="querybomuser">bom订单</span><em></em></li>
					</c:if>
					<c:if test="${inquiryAll eq 'inquiryAll' }">
						<li class="active"><span title="询价记录" data-href="cashback">询价记录</span><em></em></li>
					</c:if>
					<c:if test="${quotesAll eq 'quotesAll' }">
						<c:if test="${bomuserAll eq 'bomuserAll' }">
							<li class="active"><span title="bom表询价" data-href="QuotesByuser">bom表询价</span><em></em></li>
						</c:if>
					</c:if>
				</ul>
			</div>
			<div class="Hui-tabNav-more btn-group">
				<a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;">
					<i class="Hui-iconfont">&#xe6d4;</i>
				</a>
				<a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;">
					<i class="Hui-iconfont">&#xe6d7;</i>
				</a>
			</div>
		</div>
		<div id="iframe_box" class="Hui-article">
			<div class="show_iframe">
				<div style="display: none" class="loading"></div>
				<div class="page-container">
				    <div class="row">
						<form class="form-login" id="Form" action="" style="width: 1158px;">
							<fieldset style="background:#CBE9CF; color:#00060B">
								<div class="row" style="height: 40px;">
									<div class="col-md-5" >
										<div class="form-group">
											<input type="hidden" id="a_id" name="a_id" value="${uaddress.a_id }" />
											<label class="control-label" for="lastName">
												收货人姓名：
											</label>
											<input onblur="id1()" value="${uaddress.a_name }" style="height: 27px;" type="text" class="form-control" id="a_name" name="a_name" placeholder="收货人姓名">
											<span id="s" style="color: red;"></span>
										</div>
									</div>
									<div class="col-md-6" style="width: 600px">
										<div class="form-group">
											<label class="control-label" for="lastName">
												 手机号码：
											</label>
											<input onblur="id2()" value="${uaddress.a_phone }" style="height: 27px;width: 220px;" type="text" class="form-control" id="a_phone" name="a_phone" placeholder="收货人电话">
											<span id="phone" style="color: red;"></span>
											<br>
											<label class="control-label" for="lastName">
												 固定电话：
											</label>
											<input onblur="id5()" value="${uaddress.a_gudingtel }" style="height: 27px;width: 220px;" type="text" class="form-control" id="a_gudingtel" name="a_gudingtel" placeholder="收货人电话">
											<span id="phoneg" style="color: red;"></span>
										</div>
									</div>
								</div>
								<br>
								<div class="row" style="height: 40px;margin-left: 0px;">
									<div class="col-md-12" >
										<div class="form-group">
											<label class="control-label" for="lastName">
												公司名称：
											</label>
											<input type="text" class="form-control" style="width: 400px;height: 27px;" id="a_company" name="a_company" value="${uaddress.a_company }" placeholder="公司名称">
											<span id="s" style="color: red;">（选填）</span>
										</div>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-12" >
										<div data-toggle="distpicker" id="distpicker3">
									        <div class="col-md-12" >
									        	<label class="control-label" for="lastName">
													收货地址：
												</label>
									        	<fieldset style="width: 78%;margin-left: 80px;margin-top: -30px;">
									        	<div class="form-group">
													<label class="control-label" for="lastName">
														省份：
													</label>
												    <select class="form-control" style="height: 30px;" name="province" id="province">
												    </select>
											    </div>
											    <div class="form-group" style="margin-left: 20px;">
												    <label class="control-label" for="lastName">
														城市：
													</label>
										        	<select class="form-control" style="height: 30px;" name="city" id="city">
												    </select>	
											    </div>
											    <div class="form-group" style="margin-left: 20px;">
												    <label class="control-label" for="lastName">
														 详细地址：
													</label>
										        	<input onblur="id3()" style="width: 400px;height: 27px;" type="text" value="${xiangxi }" name="xiangxi" id="xiangxi">
											    	<span id="s2" style="color: red;"></span>
											    </div>
											    </fieldset>
											</div>
									    </div>
									</div>
								</div>
								<br><br><br>
								<div class="row">
									<div class="col-md-12" >
										<button type="button" id="submitForm" style="margin-right: 480px;float: right;" class="btn btn-primary pull-right">
											提交 <i class="fa fa-arrow-circle-right"></i>
										</button>
										<button type="button" onclick="quxiao();" style="margin-right: 20px;float: right;" class="btn btn-primary pull-right">
											取消 
										</button>
									</div>
								</div>
								
							</fieldset>
						</form>
					</div>
				</div>
			
			</div>
		</div>
	</section>
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="user/lib/layer/2.1/layer.js"></script>
	<script type="text/javascript" src="user/static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript" src="user/static/h-ui.admin/js/H-ui.admin.js"></script>
	<script type="text/javascript" src="js/userinfo.js"></script>
	<script src="//cdn.bootcss.com/layer/2.4/layer.min.js"></script>
<script src="//cdn.bootcss.com/Buttons/2.0.0/js/buttons.min.js"></script>
<script src="js/demo/distpicker.data.js"></script>
<script src="js/demo/distpicker.js"></script>
<script src="js/demo/main.js"></script>
<script type="text/javascript">
$("#distpicker3").distpicker({
		province: '${province}',
		  city: '${city}'
  });
function id1() {
    var id = document.getElementById("a_name").value;
    if (id == "") {
        //alert("ID不能为空");
        document.getElementById("s").innerHTML = "姓名不能为空";
    }else{
    	document.getElementById("s").innerHTML = "";
    }
}
function id2() {
    var id = document.getElementById("a_phone").value;
    var idg = document.getElementById("a_gudingtel").value;
    var str =/(^(\d{3,4}-)?\d{7,8})$|(0?1[3|4|5|7|8][0-9]\d{8})/;
    if(id != ""){
    	if(!(str.test(id))){
    		document.getElementById("phone").innerHTML = "请输入正确的手机号码";
    	}else{
    		document.getElementById("phone").innerHTML = "";
    	}
    }else{
    	document.getElementById("phone").innerHTML = "";
    }
}
function id5() {
	var id = document.getElementById("a_phone").value;
	var idg = document.getElementById("a_gudingtel").value;
    var str =/(^(\d{3,4}-)?\d{7,8})$|(0?1[3|4|5|7|8][0-9]\d{8})/;
    
    if(idg != ''){
    	if(!(str.test(idg))){
	    	document.getElementById("phoneg").innerHTML = "请输入正确的固定电话";
    	}else{
	    	document.getElementById("phoneg").innerHTML = "";
    	}
    }else{
    	document.getElementById("phoneg").innerHTML = "";
    }
}
function id3() {
    var id = document.getElementById("xiangxi").value;
    if (id == "") {
        //alert("ID不能为空");
        document.getElementById("s2").innerHTML = "请填写详细地址";
    }else{
    	document.getElementById("s2").innerHTML = "";
    }
}
function quxiao(){
	window.location.href="MyAddress";
}
$("#submitForm").click(function(){
	var aid=document.getElementById("a_id").value;
	var name=document.getElementById("a_name").value;
	var phone=document.getElementById("a_phone").value;
	var xiangxi=document.getElementById("xiangxi").value;
	var a_company=document.getElementById("a_company").value;
	var a_gudingtel=document.getElementById("a_gudingtel").value;
	var city=$("#city").val();
	alert(xiangxi);
	var province=$("#province").val();
	if(name==""){
		layer.alert("请正确填写信息", {icon : 5})
	}else if(phone=="" && phoneg == ""){
		layer.alert("至少填写一个联系方式", {icon : 5})
	}else if(xiangxi == ""){
		layer.alert("请正确填写信息", {icon : 5})
	}else{
		$.ajaxSetup({
			contentType: "application/x-www-form-urlencoded; charset=utf-8"
		});
		$.post("upAddress?a_name="+encodeURI(encodeURI(name))+"&a_phone="+encodeURIComponent(phone)+"&a_gudingtel="+encodeURI(a_gudingtel)+"&xiangxi="+encodeURI(encodeURI(xiangxi))+"&province="+encodeURI(encodeURI(province))+"&city="+encodeURI(encodeURI(city))+"&a_company="+encodeURI(a_company)+"&a_id="+aid,
            function(data){
				if(data.result=="fail"){
					swal({
						title: "系统提示",
						text: data.errorMsg,
						type: "success",
						confirmButtonColor: "#007AFF"
					});
				}else if(data.result=="seccuss"){
					window.location.href="MyAddress";
				}
			}
	   	)
	}
	
})
</script>
</body>
</html>