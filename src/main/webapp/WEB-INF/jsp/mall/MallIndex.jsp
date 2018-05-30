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
    <meta content="width=1200,initial-scale=1.0,maximum-scale=1.0,user-scalable=0;" name="viewport">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="mall/css/MallIndex.css">
    <script src="//cdn.bootcss.com/jquery/2.2.4/jquery.js"></script>
    <script src="//cdn.bootcss.com/layer/3.0.1/layer.min.js"></script>
    <script src="mall/js/MallIndex.js"></script>
    <title>在芯间-样品商城</title>
</head>

<body>

    <header>
        <img src="mall/Image/logo.png" alt="">
        <span id="logo">
            <span id="title">在芯间-
            <span id="smallTitle">样品商城</span>
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
        <span id="searchProduct">
            <form action="productMallResult" method="get">
                <input type="text" placeholder="请输入样品型号" name="product">
                <button>查询</button>
            </form>
        </span>
        <div id="main_nav">
            <a href="<%=basePath%>"><span>首页</span></a>
            <a href="<%=basePath%>pc"><span>被动元器件</span></a>
            <a href="<%=basePath%>supplierindex"><span>供应商点评</span></a>
            <a href="<%=basePath%>mall"><span id="active">样品商城</span></a>
            <a href="memberService"><span>代看货</span></a>
            <a href="<%=basePath%>quanzi"><span>圈子</span></a>
            <%--<a href="javascript:void(0)"><span>技术解决中心</span></a>--%>
        </div>
    </header>

    <div id="content">

        <div id="container">
            <div id="left">
                <span>品牌分类</span>
                <span>ATMEL(爱特梅尔)</span>
                <span>MICROCHIP(微芯)</span>
                <span>TI(德州仪器)</span>
                <span>InvenSense(应美盛)</span>
                <span>ST(意法半导体)</span>
                <span>ADI(亚德诺)</span>
                <span>NXP(恩智浦)</span>
                <span>CYPRESS(赛普拉斯)</span>
                <span>BOSCH(博世)</span>
                <span>SILICONLABS(芯科)</span>
                <span>MAXIM(美信)</span>
                <span>WCH(沁恒)</span>
                <span>TOSHIBA(东芝)</span>
            </div>
            <div id="center">
                <img src="mall/Image/MallIndex_1.png" alt="">
            </div>
            <div id="right">
                <div id="idea">
                    <span>公司理念</span>
                    <span>样品也可以享受批量价格，解决市场痛点，用真心为中小贸易商服务。支持看货，拍照，锁货。</span>
                </div>
                <%--<div id="translate">--%>
                    <%--<span>不</span>--%>
                    <%--<span>拍</span>--%>
                    <%--<span>看</span>--%>
                    <%--<span>锁</span>--%>
                    <%--<span>限</span>--%>
                <%--</div>--%>
                <div style="margin-top: 10px;margin-left: 10px;">
                    <img src="img/不.png" style="width: 60px;height: 60px;">
                    <img src="img/拍.png" style="width: 60px;height: 60px;">
                    <img src="img/看.png" style="width: 60px;height: 60px;">
                    <img src="img/锁.png" style="width: 60px;height: 60px;">
                    <img src="img/限.png" style="width: 60px;height: 60px;">
                </div>
                <div id="stocking">
                    你添加型号,我们进行备货
                </div>
                <div id="product">
                    <input type="text" placeholder="请输入型号" id="inputproduct">
                    <button>提交</button>
                </div>
            </div>
        </div>

        <div id="ad">
            <div id="hotSell">
                <span class="show">热卖</span>
                <div>
                    <span class="product">型号</span>
                    <span class="encapsulation">封装</span>
                    <span class="price">价格</span>
                </div>
                <div class="scroll1">
                    <ul class="list1">
                        <c:forEach items="${hotmall}" var="pro" varStatus="hotmall">
                            <c:if test="${hotmall.count%2==0}">
                        <li>
                            <div class="dark">
                                <span class="product">${pro.product}</span>
                                <span class="encapsulation">${pro.encapsulation}</span>
                                <span class="price">${pro.price}元</span>
                            </div>
                        </li>
                            </c:if>
                            <c:if test="${hotmall.count%2==1}">
                        <li>
                            <div>
                                <span class="product">${pro.product}</span>
                                <span class="encapsulation">${pro.encapsulation}</span>
                                <span class="price">${pro.price}元</span>
                            </div>
                        </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div id="new">
                <span class="show">最新</span>
                <div>
                    <span class="product">型号</span>
                    <span class="encapsulation">封装</span>
                    <span class="price">价格</span>
                </div>
                <div class="scroll2">
                    <ul class="list2">
                        <c:forEach items="${productmall}" var="pro" varStatus="productmall">
                            <c:if test="${productmall.count%2==0}">
                                <li>
                                    <div class="dark">
                                        <a href="<%=basePath%>productMallResult?product=${pro.productnamemall}"><span class="product">${pro.productnamemall}</span></a>
                                        <span class="encapsulation">${pro.productencapsulationmall}</span>
                                        <span class="price">${pro.productpricemall}</span>
                                    </div>
                                </li>
                            </c:if>
                            <c:if test="${productmall.count%2==1}">
                                <li>
                                    <div>
                                        <a href="<%=basePath%>productMallResult?product=${pro.productnamemall}"><span class="product">${pro.productnamemall}</span></a>
                                        <span class="encapsulation">${pro.productencapsulationmall}</span>
                                        <span class="price">${pro.productpricemall}</span>
                                    </div>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div id="orders">
                <span class="show">实时成交订单</span>
                <div>
                    <span class="product">型号</span>
                    <span class="number">数量</span>
                    <span class="price">价格</span>
                </div>
                <div class="scroll3">
                    <ul class="list3">
                        <c:forEach items="${mallbilling}" var="billing" varStatus="mallbilling">
                            <c:if test="${mallbilling.count%2==0}">
                                <li>
                                    <div class="dark">
                                        <a href="<%=basePath%>productMallResult?product=${billing.product}"><span class="product">${billing.product}</span></a>
                                        <span class="encapsulation">${billing.number}</span>
                                        <span class="price">${billing.price}</span>
                                    </div>
                                </li>
                            </c:if>
                            <c:if test="${mallbilling.count%2==1}">
                                <li>
                                    <div>
                                        <a href="<%=basePath%>productMallResult?product=${billing.product}"><span class="product">${billing.product}</span></a>
                                        <span class="encapsulation">${billing.number}</span>
                                        <span class="price">${billing.price}</span>
                                    </div>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>

        <div id="footer">
            <div id="leave">
                <div id="netuser">
                    网友留言
                </div>
                <div class="scroll4">
                    <ul class="list4">
                        <li>
                            <div class="comment">样品价格真的很便宜,买了10个328P-AU，居然比市场批量价格便宜一毛钱</div>
                            <div class="user">龙华采购</div>
                            <div class="time">2017-01-15</div>
                        </li>
                        <li>
                            <div class="comment">锁货功能真的很好用,我在根客户谈单的时候,就可以先把相关的货物锁住,这样就不用担心被放鸽子了</div>
                            <div class="user">quinti</div>
                            <div class="time">2017-01-17</div>
                        </li>
                        <li>
                            <div class="comment">支持拍照,很多公司都不让拍照的,这里拍照态度很好</div>
                            <div class="user">百滴水</div>
                            <div class="time">2017-01-15</div>
                        </li>
                        <li>
                            <div class="comment">样品真的很便宜!!!!!!</div>
                            <div class="user">白的采购</div>
                            <div class="time">2017-01-20</div>
                        </li>
                        <li>
                            <div class="comment">锁货功能以前没有见过,还是挺新颖的</div>
                            <div class="user">乌龟在跑</div>
                            <div class="time">2017-01-21</div>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="join">
                <div>如何成为我们的供应商</div>
                <div>
                    1.必须是做全新原装货，是正规进货渠道。<br>
                    2.产品需要有价格优势，低于市场价格。<br>
                    3.有技术支持的厂家优先考虑。<br>
                    4.我们承诺不吃差价，你卖我们多少钱，我们就售价同样价格。<br>
                    5.每天上千单成交量，值得选择 <br>
                </div>
                <div>
                    电话热线 <br>
                        <img src="mall/Image/tel.png"> <br>
                    0755-82720040
                </div>
            </div>
        </div>
    </div>


    <%@include file="../../../include/footer.jsp" %>

</body>
</html>


