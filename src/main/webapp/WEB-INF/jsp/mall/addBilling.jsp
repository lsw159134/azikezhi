<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
         contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
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
    <title>添加订单</title>
</head>
<body>
    <form action="addMallBilling" method="post">
    <table cellpadding="0" cellspacing="0">
        <tr>
            <th>产品型号</th>
            <th>用户名</th>
            <th>数量</th>
            <th>价格</th>
            <th>地址</th>
            <th>电话</th>
        </tr>
        <tr>
            <td><input type="text" placeholder="产品型号" name="product"></td>
            <td><input type="text" placeholder="用户名" name="username"></td>
            <td><input type="text" placeholder="数量" name="number"></td>
            <td><input type="text" placeholder="价格" name="price"></td>
            <td><input type="text" placeholder="地址" name="address"></td>
            <td><input type="text" placeholder="电话" name="tel"></td>
        </tr>
    </table>
        <button id="submit" style="width: 100px;height: 30px;background-color:#1a2d41;border:none;color: #fff;">提交</button>
    </form>
</body>
</html>