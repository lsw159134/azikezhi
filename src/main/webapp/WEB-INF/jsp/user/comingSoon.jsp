<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String contextPath = request.getContextPath();
    String realPath = request.getSession().getServletContext().getRealPath("/");
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + contextPath + "/";
%>
<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="js/dist/jquery.validator.css"/>
    <link rel="stylesheet" type="text/css" href="user/static/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css" href="user/lib/Hui-iconfont/1.0.7/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="user/lib/icheck/icheck.css"/>
    <link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/skin/default/skin.css" id="skin"/>
    <link href="//cdn.bootcss.com/layer/2.4/skin/layer.min.css" rel="stylesheet">
    <link href="//cdn.bootcss.com/Buttons/2.0.0/css/buttons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="user/user-tips.css">
    <title>提示</title>
</head>
<body>


<span id="coming">
    <h3 style="text-align: center">收费会员专享......</h3>
</span>

<script type="text/javascript" src="user/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="user/static/h-ui/js/H-ui.js"></script>
<script src="//cdn.bootcss.com/layer/2.4/layer.min.js"></script>
<script src="//cdn.bootcss.com/Buttons/2.0.0/js/buttons.min.js"></script>
<script src="js/dist/jquery.validator.min.js?local=zh-CN" type="text/javascript" charset="utf-8"></script>
</body>
</html>