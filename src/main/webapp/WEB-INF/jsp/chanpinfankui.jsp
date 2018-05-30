<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String contextPath = request.getContextPath();
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
%>
<!DOCTYPE html>
<html lang="lang=zh-cmn-Hans">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>在芯间-最专业的电子元器件查询平台</title>
	</head>
	<body>
		<table cellpadding="0" cellspacing="0" border="1px solid" style="text-align: center;">
			<tr>
				<td>序号</td>
				<td>产品型号</td>
				<td>产品id</td>
				<td>反馈内容</td>
				<td>创建时间</td>
				<td>操作</td>
			</tr>
		<c:forEach items="${fankuiList}" var="fankuiList" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td>${fankuiList.fankui_product}</td>
				<td>${fankuiList.fankui_pid}</td>
				<td>${fankuiList.fankuitext}</td>
				<td>${fankuiList.fankui_time}</td>
				<td><a href="javascript:onclick(fankuidele('${fankuiList.fankuiid}'))">删除</a></td>
			</tr>
		</c:forEach>
		</table>
	</body>
	<script src="//cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript">
		function fankuidele(id){
			if(confirm("你确定要删除吗？")){
				$.post("fankuidele?fankuiid="+id,
		            function(data){
						 if(data.result=="success"){
							 window.location.reload();
						 }
					}
			   	  )
			}
		}
	</script>
</html>