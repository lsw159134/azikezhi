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
    <link rel="stylesheet" type="text/css" href="<%=basePath%>user/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" href="<%=basePath%>css/editprocurementservice.css">
   <script src="<%=basePath%>js/editprocurementservice.js"></script>
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
        <a href="<%=basePath%>pc"><span id="active">被动元器件</span></a>
        <a href="<%=basePath%>supplierindex"><span>供应商点评</span></a>
        <%--<a href="<%=basePath%>mall"><span>样品商城</span></a>--%>
        <a href="memberService"><span>代看货</span></a>
        <%--<a href="javascript:void(0)"><span>技术解决中心</span></a>--%>
    </div>
</header>
<div id="submitproduct">
    <hr style="height:1px;border:none;border-top:1px dashed #0066CC;margin-top:10px;">
    <div>
        <table cellpadding="0" cellspacing="0" border="1px" id="resultTable">
            <thead>
            <tr>
                <th class="productN">型号</th>
                <th class="brandN">品牌</th>
                <th class="encapsulationN">封装</th>
                <th class="numberN">数量</th>
                <th class="addressN">地址</th>
                <th class="telN">电话</th>
                <th class="yearN">年份要求</th>
                <th class="qualityN">质量要求</th>
                <th class="priceN">价格</th>
                <th class="tureYear">年份</th>
                <th class="stateN">状态</th>
                <td></td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${ps}" var="ps" varStatus="status">
                <tr><input type="hidden" value="${ps.procurementserviceuid}" class="uid">
                    <td><input type="text" value="${ps.product}" name="product" class="product"></td>
                    <td><input type="text" value="${ps.brand}" name="brand" class="brand"></td>
                    <td><input type="text" value="${ps.encapsulation}" name="encapsulation" class="encapsulation"></td>
                    <td><input type="text" value="${ps.number}" name="number" class="number"></td>
                    <td><input type="text" value="${ps.address}" name="address" class="address"></td>
                    <td><input type="text" value="${ps.tel}" name="tel" class="tel"></td>
                    <td>
                        <select name="quality" class="quality">
                            <option value="原装" <c:if test="${ps.quality == '原装'}">selected</c:if>>一定原装</option>
                            <option value="散新/翻新"<c:if test="${ps.quality == '散新/翻新'}">selected</c:if>>散新/翻新</option>
                            <option value="国产仿制"<c:if test="${ps.quality == '国产仿制'}">selected</c:if>>国产仿制</option>
                        </select>
                    </td>
                    <td>
                        <select name="year" class="year">
                            <option value="1年内" <c:if test="${ps.year == '1年内'}">selected</c:if>>1年内</option>
                            <option value="2年内" <c:if test="${ps.year == '2年内'}">selected</c:if>>2年内</option>
                            <option value="无要求" <c:if test="${ps.year == '无要求'}">selected</c:if>>无要求</option>
                        </select>
                    </td>
                    <td><input type="text" value="${ps.price}" name="price" class="price"></td>
                    <td><input type="text" value="${ps.realyear}" name="realyear" class="realyear"></td>
                    <td>
                        <select name="state" class="state">
                            <option value="代购中" <c:if test="${ps.state == '代购中'}">selected</c:if>>代购中</option>
                            <option value="代购成功" <c:if test="${ps.state == '代购成功'}">selected</c:if>>代购成功</option>
                            <option value="代购失败" <c:if test="${ps.state == '代购失败'}">selected</c:if>>代购失败</option>
                        </select>
                    </td>
                    <td><button style="width:50px;height:30px;" class="submit">提交</button></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div id="hotbuy" class="right">
        热卖代购
        <table cellpadding="0" cellspacing="0" border="1px" style="width: 250px">
            <tr>
                <th>型号</th>
                <th>价格</th>
            </tr>
            <tr>
                <td>asdf</td>
                <td>adsfasdf</td>
            </tr>
        </table>
    </div>
</div>

</body>
</html>