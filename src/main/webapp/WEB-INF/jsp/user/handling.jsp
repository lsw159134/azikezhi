<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
         contentType="text/html; charset=utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String contextPath = request.getContextPath();
    String realPath = request.getSession().getServletContext().getRealPath("/");
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + contextPath + "/";
%>
<!DOCTYPE html>
<html lang="lang=zh-cmn-Hans">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <head>
        <meta charset="utf-8"/>
        <title>在芯间-最专业的电子元器件查询平台</title>
        <link rel="stylesheet" type="text/css" href="<%=basePath%>css/css/header.css"/>
        <link rel="stylesheet" type="text/css" href="<%=basePath%>css/css/handling.css" />
        <script src="//cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
        <script src="//cdn.bootcss.com/layer/2.4/layer.js"></script>
    </head>

    <header>
        <span id="logo">
                <img src="<%=basePath%>img/logo.png"/>
                <span id="title">
                    在芯间-
                    <span id="smallTitle">最专业的电子元器件查询平台</span>
                </span>
        </span>
        <div id="regLogin">
            <span id="login">
                <img src="<%=basePath%>img/login.png" alt=""/>
                <a href="frontLogin">登录</a>
            </span>
            <span id="register">
               <img src="<%=basePath%>img/register.png"/>
               <a href="register">注册</a>
            </span>
            <span>
              <img src="<%=basePath%>img/contactus.png" alt=""/>
              <a href="aboutus">联系我们</a>
            </span>
            <span>
                <img src="<%=basePath%>img/study.png" alt=""/>
                <a href="english">英语学习</a>
            </span>
        </div>
        <div id="banner">
            <span>
                    <a href="<%=basePath%>">首页</a>
            </span>
            <span>
                <a href="<%=basePath%>supplierindex">供应商点评</a>
            </span>
            <span>
                <a href="<%=basePath%>quanzi">圈子</a>
            </span>
            <span>
                <a href="memberService">代看货</a>
                <span class="icon"></span>
            </span>
            <%--<span>
                <a href="javascript:void(0)">技术解决中心</a>
                <span class="coming"></span>
            </span>--%>
        </div>
    </header>
<div>
    <div id="s">
        <span class="showProduct">产品:${members.product}</span>
        <span class="showNumber">数量:${members.number}</span>
        <span class="showEncapsulation">封装:${members.encapsulation}</span>
        <span class="showSupplier">供应商${members.supplier}</span>
    </div>
    <hr>
    <div>
        <form action="submitHandlingMember" method="post" enctype="multipart/form-data">
            <input type="hidden" value="${members.memberserviceuid}" name="memberserviceuid">
            <textarea rows="4" cols="50" placeholder="请输入文本" name="resultRemark"></textarea>
            <input type="file" accept="image/gif,image/jpeg"  name="img">
            <br>
            <input type="submit" value="提交" id="submit">
        </form>
    </div>
</div>