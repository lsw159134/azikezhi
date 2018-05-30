<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String contextPath = request.getContextPath();
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--<link rel="Bookmark" href="/favicon.ico">
		<link rel="Icon" href="/favicon.ico" />
		<link rel="Shortcut Icon" href="/favicon.ico" />-->
<link rel="stylesheet" type="text/css" href="user/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="user/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="user/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/css/style.css" />
<link href="css/bases.css" rel="stylesheet" type="text/css">
<link href="css/manager.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="vendor/jquery-file-upload/css/jquery.fileupload-ui.css">
<link rel="stylesheet" href="assets/css/plugins.css">
<link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />
<!--[if IE 6]>
		<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
		<script>DD_belatedPNG.fix('*');</script>
		<![endif]-->
<title>自可知用户系统</title>
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
	.sliderUnlockBtn{
		width: 62px;height: 27px;background: #593f4f;border: none;color: white;
	
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
	input:hover {
	    box-shadow: #ccc 1px 1px 8px;
	}
	body, button, input, select, textarea {
	    font-size: 12px;
	    font-family: "Microsoft Yahei","宋体";
	    color: #000000;
	    margin-right: 4px;
	    border: 1px solid #DED8B9;
	    height: 27px;
	}
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
	 #dialog {  
		box-shadow: #666 1px 1px 15px;
		background-color: #fff;  
        border: 1px solid #BCBFFD;  
        height: 400px;  
        left: 50%;  
        margin: -200px 0 0 -200px;  
        position: fixed !important; /* 浮动对话框 */  
        position: absolute;  
        top: 53%;  
        width: 500px;  
        z-index: 5;  
        border-radius: 5px;  
        display: none; 
      }  
      #dialog input{
      	height: 30px;border: 2px #87CEEB solid;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;text-align: center;width: 300px;
      }
      #dialog select{
      	height: 30px;border: 2px #87CEEB solid;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;text-align: center;
      }
      #dialog p {  
          display: inline-block;font-weight: bold;color: black; 
       }
       
       #updialog {  
		box-shadow: #666 1px 1px 15px;
		background-color: #fff;  
        border: 1px solid #BCBFFD;  
        height: 400px;  
        left: 50%;  
        margin: -200px 0 0 -200px;  
        position: fixed !important; /* 浮动对话框 */  
        position: absolute;  
        top: 53%;  
        width: 500px;  
        z-index: 5;  
        border-radius: 5px;  
        display: none; 
      }  
      #updialog input{
      	height: 30px;border: 2px #87CEEB solid;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;text-align: center;width: 300px;
      }
      #updialog select{
      	height: 30px;border: 2px #87CEEB solid;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;text-align: center;
      }
      #updialog p {  
          display: inline-block;font-weight: bold;color: black; 
       }
</style>
</head>

<body>
	<header class="navbar-wrapper" >
		<div class="navbar navbar-fixed-top" style="background-color: #222222">
			<div class="container-fluid cl" >
				<div style="display: inline-block;background: #222222;width: 200px;margin-left: -15px;height: 50px;position: absolute;text-align: center;line-height: 50px;font-size: 16px;font-weight: bold;">
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
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">	
									</c:if>
									<c:if test="${sessionScope.star==2 }">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
									</c:if>
									<c:if test="${sessionScope.star>=3 && sessionScope.star<=10}">
										<img src="<%=basePath%>logo/user_xingji.png"  style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png"  style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png"  style="margin-top: 10px;">
									</c:if>
									<c:if test="${sessionScope.star>10 && sessionScope.star<=50}">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
									</c:if>
									<c:if test="${sessionScope.star>50}">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
										<img src="<%=basePath%>logo/user_xingji.png" style="margin-top: 10px;">
									</c:if>
							</li>
						</ul>
					</nav>
				</div>
				
				<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
					<ul class="cl">
						<li class="dropDown dropDown_hover"><a href="#" class="dropDown_A">${sessionScope.userName}<i class="Hui-iconfont">&#xe6d5;</i>
							</a>
							<ul class="dropDown-menu menu radius box-shadow">
								<li><a href="frontLogin">切换账户</a></li>
								<li><a href="userOut">退出</a></li>
							</ul>
						</li>
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
					<img src="<%=basePath%>logo/user_geren.png">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="usersystem" data-title="个人中心" style="font-weight: bold;" >
						个人中心
					</a>
					<i class="Hui-iconfont menu_dropdown-arrow" style="color: black;">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li>
							<a href="myCart" data-title="我的购物车">
								&emsp;&emsp;我的购物车
							</a>
						</li>
						<li>
							<a href="express" data-title="我的订单">
								&emsp;&emsp;我的订单
							</a>
						</li>
						<li>
							<a href="MyAddress" data-title="地址">&emsp;&emsp;我的地址</a>
						</li>
						<li>
							<a href="cashback" data-title="订单返现">&emsp;&emsp;订单返现</a>
						</li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-admin">
				<dt style="background: #CDB38B;">
					<img src="<%=basePath%>logo/user-kucun.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a data-title="产品上传" href="javascript:;" style="font-weight: bold;">上传库存</a><i class="Hui-iconfont menu_dropdown-arrow" style="color: black;">&#xe6d5;</i>
				</dt>
				<dt style="border: none;">
					<ul>
						<li style="background: #D0DFEF;">
							<a href="supplierIn" data-title="公司信息" style="font-weight: normal;" >
								&emsp;&emsp;公司资料
							</a>
						</li>
						<li>
							<a href="userSupplierProduct" style="font-weight: normal;" data-title="库存管理" >
								&emsp;&emsp;优势库存
							</a>
						</li>
						<li><a href="putong" data-title="公司信息" style="font-weight: normal;"><img style="position: absolute;margin-top: 13px;" src="<%=basePath%>logo/yuan.png">&emsp;&emsp;普通库存</a></li>
					</ul>
				</dt>
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
						<nav class="zznav" style="margin-top: 9px;margin-left: 13px;">
							<a href="index">首页</a>
							<a href="uploadExecl" class="selected">Execl导入</a>
						</nav>
					</li>
				</ul>
			</div>
		</div>
		<div id="iframe_box" class="Hui-article">
			<div class="show_iframe">
				<div style="display: none" class="loading"></div>
				<div id="g-bd" class="g-bd">
					<div id="g-con">
						<table class="g-table" id="upload">
				<tbody>
					<tr>
						<td style="width: 50%;" valign="top"><div class="upload">
								<ul>
									<li class="g-tips g-mh20" style="height: 40px;">温馨提示：上传须几分钟，请耐心等待！
									</li>
								</ul>
								<div>
									<label
										for="rdoSystem" class="pointer">导入的库存与现有的库存的型号、品牌、封装、年份一致时替换网上的旧库存，并添加网上没有的新库存。</label>
								</div>
								<div class="g-mb-10">
									<div class="g-uploadfile">
										<div id="FileUpload10_file" class="file"></div>
										<div class="btn">
											<a id="FileUpload10_btn" class="g-btn g-mr-5" href="javascript:;">
												<em>
													<form id="upload_form" enctype="multipart/form-data">
														<input id="material_name" onchange="fileChange(this);" style="width: 160px;" name="files" type="file" accept=".xls">
													</form>
												</em><b></b>
											</a>
											<a id="FileUpload10_del" class="g-btn g-mr-5" href="javascript:;" onclick='dele()'><em>删除</em><b></b></a>
										</div>
									</div>
									<script type="text/javascript">
										if (window.location.href.indexOf("/tms/") < 0)
											init_upload();
									</script>
								</div>
								<div>
									<a title="" href="javascript:;" class="g-btn g-mr-5"
										onclick="AddAUIFileLog()"><em>确定</em><b></b></a>
								</div>
							</div></td>
						<td><div>
								<ul>
									<li><span class="g-fw-b">操作说明：</span></li>
									<li>1. 如果您库存变化不是很大 , 建议您<a href="javascript:;">直接在网站上修改库存</a>,
										这样修改后的库存可马上在网站显示；
									</li>
									<li><b>2. 只接受扩展名为 xls的EXCEL
											文件，且仅支持Office2003和Office2007版本，文件大小不能超过2M！；</b></li>
									<li>3.当型号、厂商、批号、封装、仓库位置这5列内容完全相同时，此类库存默认为相同库存；</li>
									<li>4. 在此上载库存文件将采用程序自动处理，文件内容严格按照标准格式，否则转换时可能产生错误。</li>
									<li>5. EXCEL表格的格式必须与下图相同，其中库存列必须为数字；</li>
									<li><img src="logo/yangban.png"></li>
									<li style="height: 30px;margin-top: 5px;"><img src="UploadFileNoProgress_data/iccor.gif">&nbsp;<a
											href="daorumobandownload" style="border: 1px solid;font-size: 14px;"
											title="我要下载标准格式的Excel文件范本">点此下载标准格式的Excel文件范本</a></li>
								</ul>
							</div></td>
					</tr>
				</tbody>
			</table>
					</div>
				</div>
				<div style="margin-top: 50px;text-align: center;margin-bottom: 30px;">
					<%@include file="../../../../include/footer.jsp"%>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript" src="user/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="user/lib/layer/2.1/layer.js"></script>
	<script type="text/javascript" src="user/static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript" src="user/static/h-ui.admin/js/H-ui.admin.js"></script>
	<script type="text/javascript" src="js/userinfo.js"></script>
	<script type="text/javascript">
		/* $("form").button(function(){
		  alert($("input[name=product]").val())
		 alert($("input[name=description]").val())
		}) */
		function AddAUIFileLog(){
			var formData = new FormData($("#upload_form")[0]);
			if(document.getElementById("material_name").value==""){
			   return false;	
			}
			$.ajax({  
				url: 'indaoruproduct' ,  
				type: 'POST',  
				data: formData,  
				dataType:"json",
				async: true,  
				cache: false,  
				contentType: false,  
				processData: false,
				beforeSend:function()
	            { //触发ajax请求开始时执行
					layer.msg('上传成功，系统处理	中', {
						  icon: 1,
						  time: 1200 //2秒关闭（如果不配置，默认是3秒）
						}, function(){
						  //do something
						}); /* layer.msg("文件上传中请等待！"); */
	            $('.checkout-submit').attr('onclick','javascript:void();');//改变提交按钮上的文字并将按钮设置为不可点击
	            }, 
				success: function (data) {  
					if(data.result=='success'){
						layer.alert("成功："+data.chengong+"\n失败："+data.shibai+"\n重复："+data.chongfu+"<br>数量、单价栏必须为数字，其他栏不得为空", {icon : 6});
					}else if(data.result=='fail'){
						layer.alert("成功："+data.chenggong+"<br>"+data.msg, {icon : 6});
					}else if(data.result=='login'){
						window.location.href="frontLogin";
					}
				}  
			});  	
		}
		function dele(){
			$("#material_name").val("");
		}
		function ShowNewStock(){
			$(".adddemo").attr("id","demo");
			$(".addprovince").attr("id","province");
			$(".addcity").attr("id","city");
			$("#fullbg").css({  
	        	display: "block"  
	        });  
	        $("#dialog").show();
		}
		
		function EditStock(pid,pname,manufacturer,lotnumber,isgoodsinstock,description,encapsulation){
			$("#productuuid").val(pid);
			$("#upa_name").val(pname);
			$("#upa_phone").val(manufacturer);
			$("#upa_gudingtel").val(lotnumber);
			$("#upisgoodsinstock").val(isgoodsinstock);
			$("#upxiangxi").val(description);
			$("#upencapsulation").val(encapsulation);
			$("#upfullbg").css({  
	            display: "block"  
	         });  
	         $("#updialog").show();
		}
		
		function closeAdd(){
			window.location.href="putong"
		}
		$("#submitForm").click(function(){
			var name=document.getElementById("a_name").value;
			var phone=document.getElementById("a_phone").value;
			var phoneg=document.getElementById("a_gudingtel").value;
			var xiangxi=document.getElementById("xiangxi").value;
			var isgoodsinstock=document.getElementById("isgoodsinstock").value;
			var encapsulation=document.getElementById("encapsulation").value;
			if(name=="" && phone=="" && phoneg == ""){
				layer.alert("请填写完整型号信息", {icon : 5})
			}else if(xiangxi==null && xiangxi == "" && isgoodsinstock == null && isgoodsinstock==""  && encapsulation=="" && encapsulation == null){
				layer.alert("请填写完整型号信息", {icon : 5})
				return false;
			}else{
				$.ajax({
		             type:"post",
		             url:"inproductputong",
		             async:true,
		             dataType: "json",
		             data: $('#Form').serialize(),
		            success : function(data){
		            	if(data.result=="login"){
		            		window.location.href="frontLogin"
		            	}else if(data.result=="success"){
		            		document.getElementById("a_name").value="";
		        			document.getElementById("a_phone").value="";
		        			document.getElementById("a_gudingtel").value="";
		        			document.getElementById("xiangxi").value="";
		        			document.getElementById("isgoodsinstock").value="";
		        			document.getElementById("encapsulation").value="";
		        			window.location.href="putong";
		            	}
		             }
		         });
				
			}
			
		})
		function fileChange(target) {
			var isIE = /msie/i.test(navigator.userAgent) && !window.opera; 
			var fileSize = 0;         
		    if (isIE && !target.files) {     
				var filePath = target.value;     
		       	var fileSystem = new ActiveXObject("Scripting.FileSystemObject");        
		       	var file = fileSystem.GetFile (filePath);     
		       	fileSize = file.Size;    
		    } else {    
				fileSize = target.files[0].size;     
		    }   
		    var size = fileSize / 1024;    
			if(size>2000){  
				layer.alert("附件不能大于2M");
				target.value="";
				return
			}
			var name=target.value;
			var fileName = name.substring(name.lastIndexOf(".")+1).toLowerCase();
		    if(fileName !="xls" && fileName !="xlsx"){
		    	layer.alert("请选择execl格式文件上传！");
				target.value="";
				return
			}
		} 

		$("#impro").on("input propertychange", function() {  
		    var $this = $(this),  
		        _val = $this.val(),  
		        count = "";  
		    if (_val.length > 2000) {  
		        $this.val(_val.substring(0, 2000));  
		    }  
		    count = 2000 - $this.val().length;  
		    $("#impro_num").text(count);  
		});
		$("#suppliername").on("input propertychange", function() { 
		    var $this = $(this);
		    var expressnumber = $this.val();
		    $(function () {  
			    var objectout = $("#suppliername");  
			    objectout.mouseout(function () {
			    	$.ajax({
			             type:"post",
			             url:"paduansupplier",
			             async:true,
			             dataType: "json",
			             data: {
			            	 suppliername:expressnumber
			            },
			            success : function(data){
			            	if(data.result=="fail"){
			            		for(var o in data.s){
			            			if(data.s[o].suppliername!=suppliername){
			            				layer.alert("该公司名已被添加!");
				            		}
									$("#suppliername").val(data.s[o].suppliername);
			            		}
			            	}else if(data.result=="login"){
			            		alert("请重新登录");
			            	}else{
			            		
			            		//window.location.href="houfu?eid="+data.eid+"&price="+data.price+"&ordernumber="+data.ordernumber;
			            	}
			             }
			         });
			    	/* window.location.href='pay?productuid='+pid+'&number='+expressnumber+'&fapiao='+fapiao+'&expressname='+expressname+'&beizhu='+beizhu+'&aid='+aid; */
			    });
			});
		});
		 $(function () {
		    var objectout = $("#telphone1");  
		    objectout.mouseout(function () {
		    	var expressnumber = $("#telphone1").val();
		    	var str =/(^(\d{3,4}-)?\d{7,8})$|(0?1[3|4|5|7|8][0-9]\d{8})/;
		    	if(expressnumber!=null&& expressnumber!=''){
		    		if(!(str.test(expressnumber))){
				    	alert("请输入正确的固定电话");
				    	$("#telphone1").val("");
			    	}else if(expressnumber!='${supplier.telphone1}'){
			    		$.ajax({
				             type:"post",
				             url:"paduansupplier",
				             async:true,
				             dataType: "json",
				             data: {
				            	 telphone1:expressnumber
				            },
				            success : function(data){
				            	if(data.result=="fail"){
				            		for(var o in data.s){
				            			if(data.s[o].telphone1!=expressnumber){
				            				alert("该号码已被添加!");
					            		}
										$("#telphone1").val(data.s[o].telphone1);
				            		}
				            	}else if(data.result=="login"){
				            		alert("请重新登录");
				            	}else{
				            		//window.location.href="houfu?eid="+data.eid+"&price="+data.price+"&ordernumber="+data.ordernumber;
				            	}
				             }
				         });
			    	}
		    	}
		    	/* window.location.href='pay?productuid='+pid+'&number='+expressnumber+'&fapiao='+fapiao+'&expressname='+expressname+'&beizhu='+beizhu+'&aid='+aid; */
		    });
		    var objectout = $("#telphone2");  
		    objectout.mouseout(function () {
		    	var expressnumber = $("#telphone2").val();
		    	var str =/(^(\d{3,4}-)?\d{7,8})$|(0?1[3|4|5|7|8][0-9]\d{8})/;
		    	if(expressnumber!=null&& expressnumber!=''){
			    	if(!(str.test(expressnumber))){
				    	alert("请输入正确的固定电话");
				    	$("#telphone2").val("");
			    	}else{
			    		$.ajax({
				             type:"post",
				             url:"paduansupplier",
				             async:true,
				             dataType: "json",
				             data: {
				            	 telphone2:expressnumber
				            },
				            success : function(data){
				            	if(data.result=="fail"){
				            		for(var o in data.s){
				            			if(data.s[o].telphone2!=expressnumber){
				            				alert("该号码已被添加!");
					            		}
										$("#telphone2").val(data.s[o].telphone2);
				            		}
				            	}else if(data.result=="login"){
				            		alert("请重新登录");
				            	}else{
				            		
				            		//window.location.href="houfu?eid="+data.eid+"&price="+data.price+"&ordernumber="+data.ordernumber;
				            	}
				             }
				         });
			    	}
		    	}
		    	/* window.location.href='pay?productuid='+pid+'&number='+expressnumber+'&fapiao='+fapiao+'&expressname='+expressname+'&beizhu='+beizhu+'&aid='+aid; */
		    });
		    var objectout = $("#telphone3");  
		    objectout.mouseout(function () {
		    	var expressnumber = $("#telphone3").val();
		    	var str =/(^(\d{3,4}-)?\d{7,8})$|(0?1[3|4|5|7|8][0-9]\d{8})/;
		    	if(expressnumber!=null&& expressnumber!=''){
			    	if(!(str.test(expressnumber))){
				    	alert("请输入正确的固定电话");
				    	$("#telphone3").val("");
			    	}else{
			    		$.ajax({
				             type:"post",
				             url:"paduansupplier",
				             async:true,
				             dataType: "json",
				             data: {
				            	 telphone3:expressnumber
				            },
				            success : function(data){
				            	if(data.result=="login"){
				            		alert("请重新登录");
				            	}else if(data.result=="fail"){
				            		for(var o in data.s){
				            			if(data.s[o].telphone3!=expressnumber){
				            				alert("该号码已被添加!");
					            		}
										$("#telphone3").val(data.s[o].telphone3);
				            		}
				            		//window.location.href="houfu?eid="+data.eid+"&price="+data.price+"&ordernumber="+data.ordernumber;
				            	}
				             }
				         });
			    	}
		    	}
		    	/* window.location.href='pay?productuid='+pid+'&number='+expressnumber+'&fapiao='+fapiao+'&expressname='+expressname+'&beizhu='+beizhu+'&aid='+aid; */
		    });
		    var objectout = $("#cellphone");  
		    objectout.mouseout(function () {
		    	var expressnumber = $("#cellphone").val();
		    	var str =/(^(\d{3,4}-)?\d{7,8})$|(0?1[3|4|5|7|8][0-9]\d{8})/;
		    	if(expressnumber!=null && expressnumber!=''){
			    	if(!(str.test(expressnumber))){
				    	alert("请输入正确的手机号码");
				    	$("#cellphone").val("");
			    	}else if(expressnumber!='${supplier.cellphone}'){
			    		$.ajax({
				             type:"post",
				             url:"paduansupplier",
				             async:true,
				             dataType: "json",
				             data: {
				            	 cellphone:expressnumber
				            },
				            success : function(data){
				            	if(data.result=="login"){
				            		alert("请重新登录");
				            	}else if(data.result=="fail"){
				            		for(var o in data.s){
				            			if(data.s[o].cellphone!=expressnumber){
				            				alert("该号码已被添加!");
					            		}
										$("#suppliername").val(data.s[o].cellphone);
				            		}
				            		//window.location.href="houfu?eid="+data.eid+"&price="+data.price+"&ordernumber="+data.ordernumber;
				            	}
				             }
				         });
			    	}
		    	}
		    	/* window.location.href='pay?productuid='+pid+'&number='+expressnumber+'&fapiao='+fapiao+'&expressname='+expressname+'&beizhu='+beizhu+'&aid='+aid; */
		    });
		    var objectout = $("#supplierposition");  
		    objectout.mouseout(function () {
		    	var expressnumber = $("#supplierposition").val();
		    	if(expressnumber!=null&& expressnumber!=''){
		    		var str=/([^\x00-\xff]|[A-Za-z0-9_])+/;
		    		if(!(str.test(expressnumber))){
				    	alert("请输入正确的地址");
				    	$("#supplierposition").val('${supplier.supplierposition}');
			    	}else if(expressnumber!='${supplier.supplierposition}'){
			    		$.ajax({
				             type:"post",
				             url:"paduansupplier",
				             async:true,
				             dataType: "json",
				             data: {
				            	 supplierposition:expressnumber
				            },
				            success : function(data){
				            	if(data.result=="fail"){
			            			alert("该地址已被添加!");
									$("#supplierposition").val("");
				            	}else if(data.result=="login"){
				            		alert("请重新登录");
				            	}else{
				            		//window.location.href="houfu?eid="+data.eid+"&price="+data.price+"&ordernumber="+data.ordernumber;
				            	}
				             }
				         });
			    	}
		    	}
		    	/* window.location.href='pay?productuid='+pid+'&number='+expressnumber+'&fapiao='+fapiao+'&expressname='+expressname+'&beizhu='+beizhu+'&aid='+aid; */
		    });
		    var objectout = $("#repoposition");  
		    objectout.mouseout(function () {
		    	var expressnumber = $("#repoposition").val();
		    	if(expressnumber!=null&& expressnumber!=''){
		    		var str=/([^\x00-\xff]|[A-Za-z0-9_])+/;
		    		if(!(str.test(expressnumber))){
				    	alert("请输入正确的地址");
				    	$("#repoposition").val('${supplier.repoposition}');
			    	}else if(expressnumber!='${supplier.repoposition}'){
			    		$.ajax({
				             type:"post",
				             url:"paduansupplier",
				             async:true,
				             dataType: "json",
				             data: {
				            	 repoposition:expressnumber
				            },
				            success : function(data){
				            	if(data.result=="fail"){
			            			alert("该地址已被添加!");
									$("#repoposition").val("");
				            	}else if(data.result=="login"){
				            		alert("请重新登录");
				            	}else{
				            		//window.location.href="houfu?eid="+data.eid+"&price="+data.price+"&ordernumber="+data.ordernumber;
				            	}
				             }
				         });
			    	}
		    	}
		    	/* window.location.href='pay?productuid='+pid+'&number='+expressnumber+'&fapiao='+fapiao+'&expressname='+expressname+'&beizhu='+beizhu+'&aid='+aid; */
		    });
		});
	</script>
</body>

</html>