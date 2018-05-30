<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
    String contextPath = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + contextPath + "/";
%>
<span style="padding:5px 5px;background-color:#368399;display: block;color: #ffffff; font-size: 25px;width: 100%;text-align: center;font-family: 'Microsoft Yahei'">以下内容仅供参考</span>
<span style="word-wrap:break-word;font-size: 18px;display:block;width:100%;font-family:'Microsoft YaHei'">
${members.resultRemark}
</span>
<hr>
<div style="width: 650px;height: 370px;">
    <img src="<%=basePath%>${members.img}" style="width:100%;height:auto;">
</div>