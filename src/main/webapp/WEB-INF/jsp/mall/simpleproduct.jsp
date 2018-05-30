<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
         contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String contextPath = request.getContextPath();
    String realPath = request.getSession().getServletContext().getRealPath("/");
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + contextPath + "/";
%>
<!doctype html>
<html lang="Hans">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>查看用户添加的备货</title>
</head>
<body>
<style>
    *{
        font-size: 15px;
    }
    table{
        margin: 0px auto;
    }
    th,td{
        padding: 10px;
    }
</style>
<table cellpadding="0" cellspacing="0" border="1" >
    <tr>
        <th>型号</th>
        <th>数量</th>
        <th>提交时间</th>
        <th>用户名</th>
    </tr>
    <c:forEach var="var" varStatus="status" items="${list}">
        <tr>
            <td>${var.product}</td>
            <td>${var.number}</td>
            <td>  <fmt:formatDate value="${var.time}" pattern="yyyy/MM/dd  HH:mm:ss" /> </td>
            <td>${var.username}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>