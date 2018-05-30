<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%-- <jsp:include page="../../../include/materialhHeader.jsp" flush="true">
	<jsp:param value="material" name="header" />
</jsp:include> --%>
<%
	String contextPath = request.getContextPath();
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <META http-equiv="Content-Script-Type" content="text/javascript; charset=UTF-8">
    <title>在芯间电子资料</title>
    <meta name="keywords" content="电源技术,电路图,电子电路" />
    <meta name="description" content="电源技术,电子发烧友网站提供各种电子电路，电路图，原理图,IC资料，技术文章，免费下载等资料，是广大电子工程师所喜爱电子资料网站。">
    <link href="css/base.css" rel="stylesheet">
    <link href="css/data-list.css" rel="stylesheet">
	<script src="js/mobileAdapt.js"></script>
	<link rel="stylesheet" type="text/css" href="css/css/header.css" />
	<link rel="stylesheet" type="text/css" href="css/css/index.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/css/shangpinfenlei.css">
	<link rel="shortcut icon" href="<%=basePath%>tu.png" type="image/x-icon"/>
	<script type="text/javascript" charset="utf-8" src="<%=contextPath %>/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="<%=contextPath %>/ueditor/ueditor.all.min.js"> </script>
	<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
	<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
	<script type="text/javascript" charset="utf-8" src="<%=contextPath %>/ueditor/lang/zh-cn/zh-cn.js"></script>
	<script src="js/jquery-2.2.3.min.js"></script>
	<script type="text/javascript">
		function scrollLis(){
			var toTop = offs.top-$(window).scrollTop();
			if(toTop==0||toTop<0){
				var top = $(window).scrollTop()-700;
				var left= $(window).scrollLeft(); 
				$("#fixed").css({ left:left + "px", top: top + "px"}); 
				var win_height=$(window).height();
			    var doc_height=$(document).height();
			    var scroll_top=$(document).scrollTop();
			    /* if($(document).scrollTop() + $(window).height() >= $(document).height()){
		        	top = $(window).scrollTop()-4300;
		        	$("#fixed").css({ left:left + "px", top: top + "px"});
		        } */
			}else{
				document.getElementById('fixed').style.top= 0+"px";
				$("#fixed").style.position = 'relative';
			}
		}
	</script>
	<style type="text/css">
		table {
		    border-collapse: separate;
		}
		tbody {
		    display: table-row-group;
		    vertical-align: middle;
		    border-color: inherit;
		}
		tr {
		    display: table-row;
		    vertical-align: inherit;
		    border-color: inherit;
		}
	</style>
	</head>
<body>
<header>
		<div id="div"
			style="background-color: #E5E5E5; width: 1348px; margin-left: -75px;height: 30px">
			<div style="text-align: left; margin-left: 75px;padding-top: 5px">
				<span style="font-size: 10px">客服热线:0755-82720040</span> <b>|</b>
				 <span style="font-size: 10px">交易时间：9:00-18:00</span> <b>|</b> 
				 <span style="font-size: 10px">在线客服</span>
				 <a href="javascript:void(0)"
					onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=2938492659&site=qq&menu=yes');">
					<img src="logo/indexQQ1.png"
					style="width: 15px; height: 15px; margin: 0px 0px -3px 0px" />
				</a><b>|</b>
				<span style="font-size: 10px">技术交流群:129896199</span> 
			</div>
		</div>
		<a href="index">
			<span style="margin-top: -10px" id="logo"> <img src="logo/logo.png" /> 
				<span id="title" style="color: #FFA500;font-size: 40px">
				 	在芯间 <span style="color: #FFA500" id="smallTitle">|&nbsp; 新一代的选择</span>
				</span>
			</span>
		</a>
		
			
			<%
	            if (session.getAttribute("userName") == null) {
	        %>
			<div id="regLogin"
				style="margin-top: -40px; text-align:right;width:600px">
				<span id="login"> <img src="<%=basePath%>img/login.png" alt="" />
					<a style="color: black" href="frontLogin">登录</a>
				</span> <span id="register"> <img src="<%=basePath%>img/register.png" />
					<a style="color: black" href="register">注册</a>
				</span> 
				<span> <img src="<%=basePath%>img/contactus.png" alt="" /> <a
					style="color: black" href="aboutus">联系我们</a>
				</span>
				<!-- <span><img src="logo/ruzhu.png"><a href="merchantLogin">商家入驻</a></span> --><!-- merchantLogin -->
			</div>
			<div id="right" style="margin-top: -130px;" >
				<div id="search" >
					<input id="keyword" type="text" value="${name }" name="keyword" placeholder="搜索资料">
					<input id="submit" type="submit" value="资料搜索" style="height: 49px;background: #FFA500;">
					<div style="margin-left: 875px;position: absolute;" >
							<table cellpadding="0" cellspacing="0" style="text-align: center;border: 1px #E5E5E5 solid;border-collapse:collapse;">
								<tr>
									<td width="40px" style="padding-top: 5px;border: 1px #E5E5E5 solid;">
										<a href="javascript:void(0)"
											onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=2938492659&site=qq&menu=yes');">
											<img style="width: 20px;height: 20px" alt="QQ" src="http://www.5tu.cn/attachments/month_1008/1008250911b00da2691d5bf01a.jpg">&nbsp;
										</a>
									</td>
									<td style="background-color: #FFA500;color: white;font-size: 12px;border: 1px #E5E5E5 solid;" width="100px">
										<a href="addbomQuotes"
											 style="color: white">
											BOM表报价
										</a>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="padding-top: 20px">
										<span style="font-size: 13px;">
											昨日成交订单:
										</span>
										<span id="chengjiao" style="font-weight: bold;"></span>
										<span style="font-size: 13px">
											笔
										</span>
									</td>
								</tr>
							</table>
						</div>
				</div>
			</div>
			
		<%
	        } else {
	        %>
				<div id="regLogin" style="margin-top: -40px; text-align:right;width:600px">
					<span id="userName"> <img src="<%=basePath%>img/userIcon.png" />
						<a style="color: black;" href="usersystem"><%=session.getAttribute("userName")%></a>
					</span> 
					<span>
						<img src="logo/mydingdan.png">
						<a href="express">
							我的订单
						</a>
					</span>
					<span >
						<img src="logo/mygouwuche.png">
						<a href="myCart">
							我的购物车
						</a>
					</span>
					<span> <img src="<%=basePath%>img/contactus.png" /> <a style="color: black;" href="aboutus">联系我们</a></span>
					<span><img src="logo/userout.png"><a style="color: black;" href="userOut">&nbsp;退出</a></span>	
				</div>
				<div id="right" style="margin-top: -130px">
					<div id="search">
						<input id="keyword" type="text" value="${name }" name="keyword" placeholder="搜索资料">
						<input id="submit" type="submit" value="资料搜索" style="height: 49px;background: #FFA500;">
						<div style="margin-left: 875px;position: absolute;" >
							<table cellpadding="0" cellspacing="0" style="text-align: center;border: 1px #E5E5E5 solid;border-collapse:collapse;">
								<tr>
									<td width="40px" style="padding-top: 5px;border: 1px #E5E5E5 solid;">
										<a href="javascript:void(0)"
											onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=2938492659&site=qq&menu=yes');">
											<img style="width: 20px;height: 20px" alt="QQ" src="http://www.5tu.cn/attachments/month_1008/1008250911b00da2691d5bf01a.jpg">&nbsp;
										</a>
									</td>
									<td style="background-color: #FFA500;color: white;font-size: 12px;border: 1px #E5E5E5 solid;" width="100px">
										<a href="addbomQuotes" style="color: white">
											BOM表报价
										</a>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="padding-top: 20px">
										<span style="font-size: 13px;">
											昨日成交订单:
										</span>
										<span id="chengjiao" style="font-weight: bold;"></span>
										<span style="font-size: 13px">
											笔
										</span>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				
		<%
	            }
	        %>
		
		
		<div class="header-wrap" style="margin-top: 150px">
			<div class="navwrap">
				<div id="nav">
					<div class="navbar" style="margin-left: -80px;;width: 960px" >
						<a style="margin-left: -12px" href="<%=basePath%>">首页</a>
						<a href="moreSort">产品目录</a>
						<a href="module">模块</a>
						<c:if test="${sessionScope.userName == null}">
							<a href="frontLogin">选型指导</a>
						</c:if>
						<c:if test="${sessionScope.userName != null}">
							<a  href="sortList?sort_miaoshu=ST">选型指导</a>
						</c:if>
						<a href="addbomQuotes">BOM表报价</a>
						<a id='daohangback' href="ziliao">技术支持</a>
						<a href="merchantLogin" style="margin-left: 258px;border-left: 1px #FF8C00 solid;">商家入驻</a>
					</div>
					<div class="pros subpage" style="margin-left: -111px;width: 230px;margin-top: 1px" >
						<h2 style="background-color: #00BFFF;width: 214px;text-align: center">
							全部产品分类<span class="jiantou" style="margin-left: 20px;margin-top: 8px;position: absolute;"></span>
						</h2>
						<ul class="prosul clearfix" id="proinfo">
							<c:forEach items="${sessionScope.primaryList}" var="primary">
								<li style="border-bottom: 1px #FF8C00 solid;">
									<!-- <a class="ti" href="#">美食</a>
									<a class="hot" href="#">地方菜</a> -->
									<a class="primary" href="#" style="font-size: 13px;font-weight: bold;">${primary.primary_name}</a>
									<span class="rightjiantou" style="float: right;padding-right: 10px;color: white">&gt;</span>
									<div class="prosmore hide">
									</div>
								</li>
							</c:forEach>
							<li style="border-bottom: 1px #FF8C00 solid;">
								<a href="moreSort" style="font-size: 13px;font-weight: bold;">更多</a>
								<span class="rightjiantou" style="float: right;padding-right: 10px;color: white">&gt;</span>
							</li>
							<!-- <li style="border-bottom: 1px #FF8C00 solid;">
								<a href="javascript:void(0)" style="font-size: 13px;font-weight: bold;">更多</a>
							</li> -->
						</ul>
					</div>
				</div>
			</div>
		</div>
</header>
<div class="shaixuan" style="background: #F0F8FF;padding:20px 0px 45px 250px;">
	<div style="float: left;">
		 <span class="crumb-nav" style="margin-left: -255px;margin-top: 15px;"><span style="font-size: 16px;"><b>您当前位置：</b></span><a href="http://www.zaixinjian.com">在芯间电子查询网</a> &gt; <a href="ziliaolistw">电子资料</a> &gt; 我要提问</span>
	</div>
</div>
<div style="display:none;" id="flag-new-20150514"></div>
<br>
<div id="page" class="data-channel" style="margin-top: -20px;width: 1200px;">
	<div id="header" style="padding-top: 20px;">
		<c:if test="${sessionScope.uid != null }">
			<a href="usertiwen" style="background: #00BFFF; padding-top:3px;
				 width:80px;
				 height:auto;border: 4px solid #00BFFF;
				 font-size:10pt;
				 cursor:hand;color: white;">
				 历史提问
			</a>
		</c:if>
		<c:if test="${sessionScope.uid == null }">
			<a href="javascript:;" onclick="alert('请登录查看')" style="background: #00BFFF; padding-top:3px;
				 width:80px;
				 height:auto;border: 4px solid #00BFFF;
				 font-size:10pt;
				 cursor:hand;color: white;">
				 历史提问
			</a>
		</c:if>
		<c:if test="${sessionScope.uid != null }">
			<a href="tiaozhutiwen" style="background: #00BFFF; padding-top:3px;margin-left:10px;
				 width:80px;
				 height:auto;border: 4px solid #00BFFF;
				 font-size:10pt;
				 cursor:hand;color: white;">
				 我要提问
			</a>
		</c:if>
		<c:if test="${sessionScope.uid == null }">
			<a href="javascript:;" onclick="alert('请先登录')" style="background: #00BFFF; padding-top:3px;margin-left:10px;
				 width:80px;
				 height:auto;border: 4px solid #00BFFF;
				 font-size:10pt;
				 cursor:hand;color: white;">
				 我要提问
			</a>
		</c:if>
		<c:if test="${sessionScope.uid != null }">
			<a href="#editor" style="background: #00BFFF; padding-top:3px;margin-left:10px;
				 width:80px;
				 height:auto;border: 4px solid #00BFFF;
				 font-size:10pt;
				 cursor:hand;color: white;">
				 回复
			</a>
		</c:if>
		<c:if test="${sessionScope.uid == null }">
			<a href="javascript:;" onclick="alert('请先登录')" style="background: #00BFFF; padding-top:3px;margin-left:10px;
				 width:80px;
				 height:auto;border: 4px solid #00BFFF;
				 font-size:10pt;
				 cursor:hand;color: white;">
				回复
			</a>
		</c:if>
	</div>
	<div id="content" style="margin-top: 15px;">
		<div class="column">
			<div class="col-main" style="width: 1050px;padding-left: 0px;">
				<div class="main-wrap">
<table border="0" cellspacing="0" cellpadding="0" style="width: 100%;margin: 0 0 8px 0;border: 1px solid #A9CBEE;" data-is-topic-locked="false">
	<colgroup><col width="180"><col></colgroup>
	<tbody>
		<tr>
			<td rowspan="2" valign="top" style="text-align: center;max-width: 180px;background: #eff4fb;border-right: 1px solid #A9CBEE;">
				<dl style="margin: 0 auto;padding: 10px 0px;text-align: center;">
          			<dt style="font-weight: normal;line-height: 24px;">
            			<img alt="gansiwei" src="img/lou.png" style="mix-width: 160px;_width: 160px; mix-height: 160px; _height: 160px; padding: 1px; border: solid 1px #ccc;">
					</dt>
					<dd class="username">
			            <span title="${material.user.username }">${material.user.username }</span>
			          </dd>
        		</dl>
			</td>
			<td valign="top" style="list-style: none;margin: 0;padding: 0;border: none;outline: 0 none;" data-floor="2">
				<div style="font-size: 14px;word-wrap: break-word;overflow: hidden;padding: 10px;min-height: 100px;">
					${material.material_content }
	        	</div>
			</td>
	    </tr>
    	<tr>
      		<td valign="bottom" style="list-style: none;margin: 0;padding: 0;border: none;outline: 0 none;">
				<div style="height: 28px;background: #eff4fb;border-top: 1px solid #A9CBEE;padding: 0 10px;line-height: 28px;">
  					<span class="time">
						楼主 &nbsp;&nbsp;发表于：
						<fmt:formatDate value="${material.material_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</span>
  					<div class="fr" style="margin-left:50px;">
				        <a href="javascript:void(0);" onclick="post_digg('${material.material_id}')" class="red digg">删除</a>
  					</div>
    				<span class="return_time">回复次数：${fn:length(replay) }</span>
				</div>
      		</td>
 		</tr>
	</tbody>
</table>
<c:forEach items="${replay}" var="replay" varStatus="status">
	<table border="0" cellspacing="0" cellpadding="0" style="width: 100%;margin: 0 0 8px 0;border: 1px solid #A9CBEE;" data-is-topic-locked="false">
		<colgroup><col width="180"><col></colgroup>
		<tbody>
			<tr>
				<td rowspan="2" valign="top" style="text-align: center;max-width: 180px;background: #eff4fb;border-right: 1px solid #A9CBEE;">
					<dl style="margin: 0 auto;padding: 10px 0px;text-align: center;">
	          			<dt style="font-weight: normal;line-height: 24px;">
	            			<img alt="gansiwei" src="img/hui.png" style="mix-width: 160px;_width: 160px; mix-height: 160px; _height: 160px; padding: 1px; border: solid 1px #ccc;">
						</dt>
						<dd class="username">
				            <span title="${replay.user.username }">${replay.user.username }</span>
				          </dd>
	        		</dl>
				</td>
				<td valign="top" style="list-style: none;margin: 0;padding: 0;border: none;outline: 0 none;" data-floor="2">
					<div style="font-size: 14px;word-wrap: break-word;overflow: hidden;padding: 10px;min-height: 100px;">
						${replay.replaycontent }
		        	</div>
				</td>
		    </tr>
	    	<tr>
	      		<td valign="bottom" style="list-style: none;margin: 0;padding: 0;border: none;outline: 0 none;">
					<div style="height: 28px;background: #eff4fb;border-top: 1px solid #A9CBEE;padding: 0 10px;line-height: 28px;">
	  					<span class="time">
	              			回复人：
	              			${replay.user.username }
	  					</span>
	            		<span class="fr" style="margin-left:50px;">
	              			<a href="javascript:;" onclick="deleteid('${replay.replayid }');" class="red digg" data-method="put" data-remote="true" rel="nofollow">删除</a>
	            		</span>
	    				<div id="post-forum-bulletin-2" style="float: left;" data-mod="popu_9"></div>
						<div class="fr">
							回复于：
	    					<fmt:formatDate value="${replay.replayTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
	 					</div>
					</div>
	      		</td>
	 		</tr>
		</tbody>
	</table>
</c:forEach>

			<div style="display: none;" id="as"></div>
			<div class="col-main" style="width: 1050px;padding-left: 0px;margin-top: 10px;">
				<script id="editor" type="text/plain"></script>
				<button onclick="getContent()" style="background: #00BFFF; margin-top:8px;margin-left:680px;
 width:80px;
 height:auto;border: 4px solid #00BFFF;color: white;">发布提问</button>
			</div>
				</div>
			</div>
			<div class="col-sub" style="width: 300px;padding-left: 50px;">
				<div class="s-panel site-notice"></div>
				
				<div class="s-panel" style="width: 350px;">
					<div class="hd" style="background: #00BFFF;">
						<h3 class="hd-tit" style="color: white;">热门资料</h3>
					</div>
					<div class="bd">
						<ul class="textList">
							<c:forEach items="${rand}" var="material" varStatus="status">
								<li>
									<c:if test="${material.material_content!=null && material_content ne '' }">
										<span class="ico wen"></span>
									</c:if>
									<c:if test="${material.material_content==null || material_content eq'' }">
										<span class="ico ${fn:substringAfter(material.material_name, '.')}"></span>
									</c:if>
									<c:if test="${material.material_content!=null && material_content ne '' }">
										<c:if test="${material.material_name !=null && material_name ne ''}">
											<a href="ziliaowen?material_id=${material.material_id }" title="${material.material_name}" target="_blank">${material.material_name}</a>
										</c:if>
										<c:if test="${material.material_name ==null || material_name eq ''}">
											<a href="tiwenchak?material_id=${material.material_id }" target="_blank">${material.material_content}</a>
										</c:if>
									</c:if>
									<c:if test="${material.material_content==null || material_content eq'' }">
										<c:choose>
											<c:when test="${fn:contains(material.material_name, 'pdf')  }">  
												<a href="<%=basePath%>material/${material.material_name}" target="_blank" style="float:left;max-width:180px;_width:180px;" title="${material.material_name}" onclick="name_id('${material.material_name}','${material.material_id}')"><span style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;width: 200px;">${material.material_name}</span></a>  
											</c:when>
											<c:otherwise> 
												<a href="<%=basePath%>materialxiazai?material_name=${material.material_name}&material_id=${material.material_id}" style="float:left;max-width:180px;_width:180px;" title="${material.material_name}">${material.material_name}</a>
											</c:otherwise>
										</c:choose>
									</c:if>
								</li>		
							</c:forEach>
						</ul>                                        
					</div>
				</div>
				<div class="s-panel" style="width: 350px;" id="fixed">
					<div class="hd" style="background: #00BFFF">
						<h3 class="hd-tit" style="color: white;">下载排行</h3>
					</div>
					<div class="bd">
						<ul class="textList">
							<c:forEach items="${desc}" var="material" varStatus="status">
								<li>
									<c:if test="${material.material_content!=null && material_content ne '' }">
										<span class="ico wen"></span>
									</c:if>
									<c:if test="${material.material_content==null || material_content eq'' }">
										<span class="ico ${fn:substringAfter(material.material_name, '.')}"></span>
									</c:if>
									<c:if test="${material.material_content!=null && material_content ne '' }">
										<c:if test="${material.material_name !=null && material_name ne ''}">
											<a href="ziliaowen?material_id=${material.material_id }" title="${material.material_name}" target="_blank">${material.material_name}</a>
										</c:if>
										<c:if test="${material.material_name ==null || material_name eq ''}">
											<a href="tiwenchak?material_id=${material.material_id }" target="_blank">${material.material_content}</a>
										</c:if>
									</c:if>
									<c:if test="${material.material_content==null || material_content eq'' }">
										<c:choose>
											<c:when test="${fn:contains(material.material_name, 'pdf')  }">  
												<a href="<%=basePath%>material/${material.material_name}" title="${material.material_name}" style="float:left;max-width:180px;_width:180px;" target="_blank"  onclick="name_id('${material.material_name}','${material.material_id}')"><span style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;width: 200px;">${material.material_name}</span></a>  
											</c:when>
											<c:otherwise> 
												<a href="<%=basePath%>materialxiazai?material_name=${material.material_name}&material_id=${material.material_id}" style="float:left;max-width:180px;_width:180px;"title="${material.material_name}" style="float:left;max-width:180px;_width:180px;">${material.material_name}</a>
											</c:otherwise>
										</c:choose>
									</c:if>
								</li>		
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				var offs=$('#fixed').offset();
				$(window).scroll(function(){
					scrollLis();
				});
			</script>
		</div> <!-- .column End -->
	</div>
	<!-- #content End -->
	<div id="footer">
		<p>Copyright &copy; 2016 - 2017 <strong class="domain">www.zaixinjian.com</strong>.All Rights Reserved</p>
		<p><a href="http://www.elecfans.com/">在芯间电子查询网</a>  粤ICP备15008173号-2</p>
	</div><!-- #footer End --> 
</div><!-- #page End -->
<script src="js/jquery-1.8.0.js"></script>
<script src="js/jquery-plugins-min.js"></script>
<script type="text/javascript">

	//实例化编辑器
	//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
	var ue = UE.getEditor('editor',{
		 toolbars: [[
	            'bold', 'italic', 'underline','forecolor', 'cleardoc', 
	            'fontfamily', 'fontsize',
	            'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|',
	            'simpleupload',
	        ]], //两端对齐
	        initialFrameWidth:760,
	        initialFrameHeight:220,
			autoHeightEnabled:true,
			autoFloatEnabled:true,
			topOffset:0,
	});
	function post_digg(id){
		$.ajax({
			url:"deleteMaterial",
			type:"POST",
			data:{
				material_id:id,
			},
			contentType:"application/x-www-form-urlencoded; charset=utf-8",
			dataType:"json",
			success: function(data){
				if(data.result=='seccuss'){
					window.location.href="ziliao";
				}else if(data.result=='fail'){
					alert("您没有权限删除");
				}else if(data.result=='login'){
					alert("请先登录");
				}
			}
		});
	}
	function deleteid(id){
		$.ajax({
			url:"deleteReplay",
			type:"POST",
			data:{
				replayid:id,
			},
			contentType:"application/x-www-form-urlencoded; charset=utf-8",
			dataType:"json",
			success: function(data){
				if(data.result=='seccuss'){
					window.location.reload();
				}else if(data.result=='fail'){
					alert("您没有权限删除");
				}else if(data.result=='login'){
					alert("请先登录");
				}
			}
		});
	}
	function getContent() {
		var s=UE.getEditor('editor').getContent();
		var id='${material.material_id}';
		if(s==null || s==""){
			alert("请输入回复内容");
			return false
		}
		$.ajax({
			url:"addReplay",
			type:"POST",
			data:{
				replaycontent:s,
				replay_materialid:id
			},
			contentType:"application/x-www-form-urlencoded; charset=utf-8",
			dataType:"json",
			success: function(data){
				if(data.result=='seccuss'){
					window.location.reload();
				}else if(data.result=='fail'){
					layer.msg(data.msg);
				}else if(data.result=='login'){
					alert("请先登录");
				}
			}
		});
	}
</script>
<script>
$(function () {  
    var td = $(".sort_table .index_tr1 td");  
    td.mouseover(function () {  
        $(this).css("background-color", "#AEF2E5");  
    }).mouseout(function () {  
        $(this).css("background-color", "#FFFFFF");  
    });
    
    var weltd = $(".weltable td");  
    weltd.mouseover(function () {
        $(this).css("background-color", "#AEF2E5");  
    }).mouseout(function () {  
        $(this).css("background-color", "#FFFFFF");  
    });
    $.ajax({
        type:"post",
        url:"queryByrandomOrder",
        async:true,
        dataType: "json",
        success : function(data){
        	$('#chengjiao').html(data.msg);
        }
    });
});
$("#submit").click(function(){  
	var val=$("#keyword").val();
	if(val ==undefined || val == null || val.length<=0) { 
		alert("请填写搜索信息!"); 
		return false;
	}else{
		window.location.href="ziliao?name="+val;
	} 
});
function name_id(name,id){  
	$.ajax({
		  url:"materialdownload",
		  type:"POST",
		  data:{
			  material_id:id
		  },
		  contentType:"application/x-www-form-urlencoded; charset=utf-8",
		  dataType:"json",
		  success: function(data){
			  if(data.result=="seccuss"){
				  window.location.reload()
			  }
		  }
	})
}
</script>
<script type="text/javascript">
	$(function(){
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
							s+=("<span><em><a style='margin-left:90px' href='shaixuanse1?primary_name="+primary+"&&product_second="+data[o].second_name+"'>"+data[o].second_name+"</a></em></span></br>");
						}else{
							s+=("<span><em><a href='shaixuanse1?primary_name="+primary+"&&product_second="+data[o].second_name+"'>"+data[o].second_name+"</a></em></span>");
						}
					}
					$('.prosmore').html('');
					$('.prosmore').html(s);
				}
			})
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
	});
</script>

</body>
</html>