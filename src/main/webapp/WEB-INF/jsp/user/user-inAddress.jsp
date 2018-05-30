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
<META http-equiv="Content-Script-Type" content="text/javascript; charset=UTF-8">
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
</head>

<body>
	<header class="navbar-wrapper" >
		<div class="navbar navbar-fixed-top" style="background-color: #FFA500">
			<div class="container-fluid cl" >
				<span class="logo navbar-logo f-l mr-10 hidden-xs">&nbsp;&nbsp;&nbsp;&nbsp;在芯间用户系统&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
				<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
				<nav class="nav navbar-nav">
					<ul class="cl">
						<li class="dropDown dropDown_hover"><a href="<%=basePath%>">首页</a></li>
						<%--<li class="dropDown dropDown_hover"><a href="mall" class="dropDown_D" target="_blank">样品商城</a></li>--%>
						<%--<li class="dropDown dropDown_hover"><a href="javascript:;" class="dropDown_E">技术解决中心</a></li>--%>
						<%--<li class="dropDown dropDown_hover">--%>
					</ul>
				</nav>
				<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
					<ul class="cl">
						<li class="dropDown dropDown_hover"><a href="#" class="dropDown_A">${user.username}<i class="Hui-iconfont">&#xe6d5;</i>
							</a>
							<ul class="dropDown-menu menu radius box-shadow">
								<li><a href="frontLogin">切换账户</a></li>
								<li><a href="userOut">退出</a></li>
							</ul></li>
						<!--<li id="Hui-msg">
								<a href="#" title="消息"><span class="badge badge-danger">1</span><i class="Hui-iconfont" style="font-size:18px">&#xe68a;</i></a>
							</li>-->
						<li id="Hui-skin" class="dropDown right dropDown_hover"><a href="javascript:;" class="dropDown_A" title="换肤">
								<i class="Hui-iconfont" style="font-size: 18px">&#xe62a;</i>
							</a>
							<ul class="dropDown-menu menu radius box-shadow">
								<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
								<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
								<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
								<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
								<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
								<li><a href="javascript:;" data-val="orange" title="绿色">橙色</a></li>
							</ul></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<aside class="Hui-aside">
		<input type="hidden"  id="supplieruid" value=""/>
		<div class="menu_dropdown bk_2">
			<dl id="menu_1">
				<dt>
					<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="usersystem" data-title="我的购物车" >个人中心</a>
				</dt>
			</dl>
			<dl id="menu_2">
				<dt>
					<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="express" data-title="我的订单" href="javascript:;">我的订单</a>
				</dt>
				<!-- <dd>
					<ul>
						<li><a _href="product-history" data-title="添加订单" href="javascript:;">添加订单</a></li>
						<li><a _href="express" data-title="我的订单" href="javascript:;">我的订单</a></li>
					</ul>
				</dd> -->
			</dl>
			<!-- <dl id="menu_3">
				<dt>
					<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="querybomuser" data-title="bom表订单" >bom表订单</a>
				</dt>
			</dl> -->
			<dl id="menu_4">
				<dt>
					<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="myCart" data-title="我的购物车" href="javascript:;">我的购物车</a>
				</dt>
			</dl>
			 <dl id="menu_5">
				<dt>
					<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="MyAddress" data-title="地址" href="javascript:;">地址管理</a>
				</dt>
			</dl> 
			<!-- <dl id="menu_6">
				<dt>
					<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="cashback" data-title="会员返现" href="javascript:;">会员返现</a>
				</dt>
			</dl> -->
			<dl id="menu-admin">
				<dt>
					<i class="Hui-iconfont">&#xe60d;</i> &nbsp;<a href="booking" data-title="库存寄售" href="javascript:;">库存寄售</a>
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
		<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
			<div class="Hui-tabNav-wp">
				<ul id="min_title_list" class="acrossTab cl">
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
						<li class="active"><span title="修改地址" data-href="MyAddress">修改地址</span><em></em></li>
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
				<nav class="breadcrumb">
				    <i class="Hui-iconfont">&#xe67f;</i><a href="usersystem" class="dropDown_A" target="_blank" style="margin-right: 10px;"> 首页 </a>
				    <span class="c-gray en">&gt;</span>
				   添加地址
				  
				    <a class="btn btn-success radius r" style="line-height: 1.6em; margin-top: 3px" href="javascript:location.replace(location.href);" title="刷新">
				        <i class="Hui-iconfont">&#xe68f;</i>
				    </a>
				</nav>
				<div class="page-container">
				    <div class="row">
						<form class="form-login" id="Form" action="" style="width: 1158px;">
							<fieldset style="background:#CBE9CF; color:#00060B">
								<div class="row" style="height: 40px;">
									<div class="col-md-4" >
										<div class="form-group" style="width: 400px">
											<input type="hidden" id="eid" name="eid" value="${eid }" />
											<input type="hidden" id="pid" name="pid" value="${pid }" />
											<label class="control-label" for="lastName">
												收货人姓名：
											</label>
											<input onblur="id1()" type="text" style="height: 27px;"  class="form-control" id="a_name" name="a_name" placeholder="收货人姓名">
											<span  id="s" style="color: red;"></span>
										</div>
									</div>
									<div class="col-md-8" style="" >
										<div class="form-group">
											<label class="control-label" for="lastName">
												 手机号码：
											</label>
											<input onblur="id2()" style="height: 27px;width: 220px;" type="text" class="form-control" id="a_phone" name="a_phone" placeholder="手机号码">
											<span id="phone" style="color: red;"></span><br>
											<label class="control-label" for="lastName">
												 固定电话：
											</label>
											<input onblur="id5()" style="height: 27px;width: 220px;" type="text" class="form-control" id="a_gudingtel" name="a_gudingtel" placeholder="固定电话（选填）">
											<span id="phoneg" style="color: red;"></span>
										</div>
									</div>
								</div>
								<br>
								<div class="row" style="height: 40px;margin-left: 0px;">
									<div class="col-md-12" >
										<div class="form-group" >
											<label class="control-label" for="lastName">
												公司名称：
											</label>
											<input type="text" style="width: 340px;height: 27px;" class="form-control" id="a_company" name="a_company" placeholder="公司名称">
											<span id="s" style="color: red;">（选填）</span>
										</div>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-12" >
						                 <div data-toggle="distpicker" id="demo">
									        <div class="col-md-12" >
									        	<label class="control-label" for="lastName">
													收货地址：
												</label>
												<fieldset style="width: 75%;margin-left: 80px;margin-top: -30px;">
									        	<div class="form-group">
													<label class="control-label" for="lastName">
														省份：
													</label>
												    <select class="form-control" style="height: 30px;" name="province" id="province">
												    </select>
											    </div>
											    &nbsp;&nbsp;
											    <div class="form-group">
												    <label class="control-label" for="lastName">
														城市：
													</label>
										        	<select class="form-control" style="height: 30px;" name="city" id="city">
												    </select>	
											    </div>
											    &nbsp;&nbsp;
											    <div class="form-group">
												    <label class="control-label" for="lastName">
														 详细地址：
													</label>
										        	<input onblur="id3()" style="width: 400px;height: 27px;" type="text" name="xiangxi" id="xiangxi">
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
										<button type="button" id="submitForm" style="margin-right: 550px;float: right;" class="btn btn-primary pull-right">
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
		var str ="/^0?1[3|4|5|8][0-9]\d{8}$/";
		var eid=document.getElementById("eid").value;
		var pid=document.getElementById("pid").value;
		var bid='${bid}';
		var name=document.getElementById("a_name").value;
		var phone=document.getElementById("a_phone").value;
		var phoneg=document.getElementById("a_gudingtel").value;
		var xiangxi=document.getElementById("xiangxi").value;
		var a_company=document.getElementById("a_company").value;
		var city=$("#city").val();
		var province=$("#province").val();
		if(name==""){
			layer.alert("请填写收货人姓名", {icon : 5})
		}else if(phone=="" && phoneg == ""){
			layer.alert("至少填写一个联系方式", {icon : 5})
		}else if(xiangxi == ""){
			layer.alert("请填写详细地址", {icon : 5})
		}else{
			$.ajaxSetup({
				contentType: "application/x-www-form-urlencoded; charset=utf-8"
			});
			$.post("inAddress?a_name="+encodeURI(encodeURI(name))+"&a_phone="+encodeURIComponent(phone)+"&a_gudingtel="+encodeURI(phoneg)+"&xiangxi="+encodeURI(encodeURI(xiangxi))+"&province="+encodeURI(encodeURI(province))+"&city="+encodeURI(encodeURI(city))+"&a_company="+encodeURI(a_company),
	            function(data){
					if(data.result=="fail"){
					}else if(data.result=="seccuss"){
						if(pid!=null && pid!= ""){
							window.location.href="chooseAddress?pid=${pid }&expressname=${expressname}&number=${number }&fapiao=${fapiao}";
						}else if(eid!=null && eid!= ""){
							window.location.href="chooseAddress?eid=${eid }";
						}else if(bid!=null && bid!=""){
							window.location.href="chooseAddress?bid=${bid }&expressname=${expressname}&fapiao=${fapiao}";
						}else{
							window.location.href="MyAddress";
						}
						
					}
				}
		   	)
		}
		
	})
</script>
</body>
</html>