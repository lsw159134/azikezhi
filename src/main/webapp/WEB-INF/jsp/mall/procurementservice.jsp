<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
         contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <script src="//cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/layer/3.0.1/layer.min.js"></script>
    <script src="//cdn.bootcss.com/Buttons/2.0.0/js/buttons.min.js"></script>
    <link href="//cdn.bootcss.com/Buttons/2.0.0/css/buttons.min.css" rel="stylesheet">
    <script type="text/javascript" src="user/lib/datatables/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/procurementservice.js"></script>
    <link rel="stylesheet" type="text/css" href="user/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" href="css/procurementservice.css">
    <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?973a46004763863d10483eab2f1ae9b2";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>
    <title>在芯间 - 代购</title>
</head>
<body>
<header>
    <img src="mall/Image/logo.png" alt="">
    <span id="logo">
                <span id="title">在芯间-
                <span id="smallTitle">最专业的电子元器件查询平台</span>
                </span>
            </span>
    <span id="wapper">
                <%
                    if (session.getAttribute("userName") == null) {
                %>
                <a href="frontLogin"><span id="login"><img src="mall/Image/login.png">登录</span></a>
                <a href="register"><span id="reg"><img src="mall/Image/register.png">注册</span></a>
                <a href="aboutus"><span id="aboutus"><img src="mall/Image/contactus.png">联系我们</span></a>
                <a href="english"><span id="studyEnglish"><img src="mall/Image/study.png">英语学习</span></a>
                <%
                } else {
                %>
                <div id="regLogin">
                <span id="userName">
                    <img src="<%=basePath%>img/userIcon.png"/>
                    <a href="usersystem"><%=session.getAttribute("userName")%></a>
                </span>
                    <span>
                    <img src="<%=basePath%>img/contactus.png" alt=""/>
                    <a href="aboutus">联系我们</a>
                </span>
     
                </div>
                <%
                    }
                %>
            </span>
    <div id="main_nav">
        <a href="<%=basePath%>"><span>首页</span></a>
        <a href="<%=basePath%>pc"><span>被动元器件</span></a>
        <a href="<%=basePath%>supplierindex"><span>供应商点评</span></a>
        <%--<a href="<%=basePath%>mall"><span>样品商城</span></a>--%>
        <a href="<%=basePath%>ps"><span id="active">闪电代购</span></a>
        <a href="memberService"><span>代看货</span></a>
        <%--<a href="javascript:void(0)"><span>技术解决中心</span></a>--%>
    </div>
</header>
<div id="submitproduct">
    1.专业的采购团队,为你质量和价格把关!<br>
    2.承诺无差价代购,我们采购多少钱就报价多少钱!
        <fieldset id="flow">
            <legend>购买流程</legend>
            <div class="newRirght" style="margin-top: 5px;">
                <span>提交代购</span> --&gt; <span>电话报价</span> --&gt; <span>支付货款</span> --&gt; <span>送货发货</span>
            </div>
        </fieldset>
    <div id="producttable">
        <table border="1" cellspacing="0" cellpadding="0">
            <tr style="background: #c1e2b3;">
                <th class="product">型号</th>
                <th class="brand">品牌</th>
                <th class="encapsulation">封装</th>
                <th class="number">数量</th>
                <th class="tel">我的联系电话</th>
                <th class="address">我的地址</th>
                <th class="year">年份要求</th>
                <th class="quality">质量要求</th>
                <th><input type="hidden" value="${sessionScope.uid}" id="uid"></th>
            </tr>
            <tr>
                <td><input type="text" name="product" class="product" placeholder="型号"></td>
                <td><input type="text" name="brand" class="brand" placeholder="品牌"></td>
                <td><input type="text" name="encapsulation" class="encapsulation" placeholder="封装"></td>
                <td><input type="text" name="number" class="number" placeholder="数量"></td>
                <td><input type="text" name="tel" class="tel" placeholder="联系电话"></td>
                <td><input type="text" name="address" class="address" placeholder="地址"></td>
                <td>
                    <select name="year" class="year">
                        <option value="1年内">1年内</option>
                        <option value="2年内">2年内</option>
                        <option value="无要求">无要求</option>
                    </select>
                </td>
                <td>
                    <select name="quality" class="quality">
                        <option value="原装">一定原装</option>
                        <option value="散新/翻新">散新/翻新</option>
                        <option value="国产仿制">国产仿制</option>
                    </select>
                </td>
                <td><input type="submit" value="提交" id="submit"></td>
            </tr>
            <span style="color: red">温馨提示:华强北客户代购成功后直接送货,超出华强北范围内的,都统一以快递方式.</span>
        </table>
    </div>
    <hr style="height:1px;border:none;border-top:1px dashed #0066CC;margin-top:10px;">
    <div>
        <table cellpadding="0" cellspacing="0" border="1px" style="border:1px solid #ddd" id="resultTable">
            <thead style="background: #c1e2b3;">
            <tr>
                <th class="productN">型号</th>
                <th class="brandN">品牌</th>
                <th class="encapsulationN">封装</th>
                <th class="numberN">数量</th>
                <th class="yearN">年份要求</th>
                <th class="qualityN">质量要求</th>
                <th class="priceN">价格</th>
                <th class="tureYear">年份</th>
                <th class="stateN">状态</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${ps}" var="ps" varStatus="status">
            <tr>
                <td>${ps.product}</td>
                <td>${ps.brand}</td>
                <td>${ps.encapsulation}</td>
                <td>${ps.number}</td>
                <td>${ps.year}</td>
                <td>${ps.quality}</td>
                <td><c:if test="${sessionScope.userName==null}">未登录</c:if><c:if test="${sessionScope.userName!=null}">${ps.price}</c:if></td>
                <td>${ps.realyear}</td>
                <td>${ps.state}</td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div id="hotbuy" class="right">
        热卖代购
        <div class="scroll">
        <table cellpadding="0" cellspacing="0" border="1px" style="width: 250px;height: 400px;overflow: hidden;display: inline-block;border: 1px solid #ddd;" id="hothelpbuy">
            <thead style="background: #c1e2b3;">
            <tr>
                <th>型号</th>
                <th>价格</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${hothelpBuys}" var="hothelpBuys" varStatus="status">
                <tr>
                    <td>${hothelpBuys.product}</td>
                    <td>${hothelpBuys.price}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        </div>
    </div>
</div>
<div id="why">
    <b>
    为何选择我们：<br>
    <span style="text-align: left;display: inline-block;">
    1.专业的采购团队,从业电子采购工作超过12年，经验靠谱。<br>
    2.我们和5家一级代理商，302家原装贸易商达成代购合作关系，样品也可以享受低价，价格靠谱。<br>
    3.我们对于采购金额超过5千元的订单，直接公开代购渠道，让你无量大后顾之忧，做事靠谱。<br>
    4.我们坚守无差价代购，我们采购价格和出货价格一致，可以申请公开进货收据，做人靠谱。<br>
    </span>
</div>

<footer class="footer mt-20" style="clear: both">
    <div class="container" style="text-align: center">
        <p>
            版权所有 &copy; 2016 在芯间 保留所有权利 |
            <a href="http://www.miibeian.gov.cn/"><img src="img/img/icp.png"  /> 粤ICP备15008173号-2 </a>|
        </p>
    </div>
</footer>
<script type="text/javascript">
    $("#resultTable").dataTable({
        "order":  [[ 8, "asc" ]],
        "searching": false,
        "lengthChange": false,
        "iDisplayLength": 20
    });
</script>

</body>
</html>