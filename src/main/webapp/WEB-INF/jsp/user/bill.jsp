<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
    String realPath = request.getSession().getServletContext().getRealPath("/");
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + contextPath + "/";
%>

<html>
<head>
    <title>账单查询</title>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="css/bill.css">
    <link rel="stylesheet" type="text/css" href="css/css/header.css"/>
</head>
<body>
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
			<img src="img/login.png" alt=""/>
			<a href="frontLogin">登录</a>
		</span>
        <span id="register">
			<img src="img/register.png"/>
			<a href="register">注册</a>
		</span>
        <span>
			<img src="img/contactus.png" alt=""/>
			<a href="aboutus">联系我们</a>
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
                <a href="memberService">代看货</a>
                <span class="coming"></span>
            </span>
        <span>
                <a href="<%=basePath%>quanzi">圈子</a>
                <span class="icon"></span>
            </span>
        <%--<span>--%>
                <%--<a href="javascript:void(0)">技术解决中心</a>--%>
                <%--<span class="coming"></span>--%>
            <%--</span>--%>
    </div>
</header>
<div id="addBill">
    <select>
        <option value="收入">收入</option>
        <option value="支出">支出</option>
    </select>
    &nbsp;
    <input type="text" placeholder="元" id="rmb">
    <input type="text" placeholder="明细" id="detaild">
    <input type="text" placeholder="备注" id="comment">
    <button>提交</button>
</div>

<div class="statistics">
    <span class="c">总共：</span>
    <span id="count">0元</span>
</div>
<div class="statistics">
    <span class="c">总支出：</span>
    <span id="countexpend">0元</span>
</div>
<div class="statistics">
    <span class="c">总收入：</span>
    <span id="countincome">0元</span>
</div>

<div id="detail">
    <span id="type">类型</span>
    <span id="price">金额</span>
    <span id="time">时间</span>
    <span id="detailed">明细</span>
    <span id="remark">备注</span>
</div>
<div id="d">
    <c:forEach items="${bill}" var="bill">
        <div class='de'>
            <span class='deled'>${bill.detailed}</span>
            <c:if test="${bill.detailed.equals('支出')}">
                <span class='pri expend'>${bill.price}元</span>
            </c:if>
            <c:if test="${bill.detailed.equals('收入')}">
                <span class='pri income'>${bill.price}元</span>
            </c:if>
            <span class='time'>${bill.time}</span>
            <span class='detaile'>${bill.particulars}</span>
            <span class='remarks'>${bill.remarks}</span>
        </div>
    </c:forEach>
</div>
</body>
<script src="http://cdn.bootcss.com/jquery/2.0.2/jquery.min.js"></script>
<script src="//cdn.bootcss.com/layer/2.4/layer.js"></script>
<script src="js/bill.js" type="text/javascript"></script>
</html>
