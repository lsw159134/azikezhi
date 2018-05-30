<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextPath = request.getContextPath();
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>商家审核</title>
		<style type="text/css">
			h1{
				text-align: center;
			}
			table{
				text-align:center;
				border: 1px solid;
			}
			td{
				
				border: 1px solid;
			}
			center {
				background-color: #B0E0E6;
			}
		
		</style>
	</head>
	<body>
		<h1>商家审核</h1>
		<center>
			<%-- <form action="<%=basePath%>1019/zai/xin/jian/shenHe" id="form" method="post"> --%>
				<table  cellpadding="0" cellspacing="0">
					
						<tr>
							<td>序号</td>
							<td>id</td>
							<td>公司名称</td>
							<td>手机号</td>
							<td>昵称</td>
							<td>密码</td>
							<td>shiro</td>
							<td>操作</td>
						</tr>
						<c:forEach items="${sjShenHe}" var="sjShenHe" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${sjShenHe.id}</td>
							<td>${sjShenHe.comPany}</td>
							<td>${sjShenHe.tel}</td>
							<td>${sjShenHe.userName}</td>
							<td>${sjShenHe.passWord}</td>
							<td>
								${sjShenHe.shiro}
							</td>
							<td >
								<input type="button" value="点击审核" onclick="shenHe('${sjShenHe.id}')" />
							</td>				
						</tr>
					</c:forEach>							
				</table>
			<!-- </form> -->
		</center>
		
		<script type="text/javascript" src="<%=contextPath%>/user/lib/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript" src="user/lib/layer/2.1/layer.js"></script>
		<script type="text/javascript" src="user/static/h-ui/js/H-ui.js"></script>
		<script type="text/javascript" src="user/static/h-ui.admin/js/H-ui.admin.js"></script>
		<script src="<%=contextPath%>/js/sjzhuce/sjShenHe.js" type="text/javascript"></script>
		
		<script type="text/javascript">
			function shenHe(obj){
				var realShiro = 2;
				if(confirm("你确定提交审核吗？")){
					$.post("shiroShenHe?id="+obj+"&shiro="+realShiro,
				            function(data){
								 if(data.result=="success"){
									 window.location.reload();
								 }
							}
					   	  )
					   	  
				}
			} 
		</script>
	</body>
</html>