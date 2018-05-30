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
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="mall/css/ProductMallResult.css">
    <link href="//cdn.bootcss.com/layer/3.0.1/skin/default/layer.css" rel="stylesheet">
    <title>样品商城</title>
</head>
<body>
    <header>
        <img src="mall/Image/logo.png" alt="">
        <span id="logo">
                <a href="<%=basePath%>">
                    <span id="title">在芯间-
                    <span id="smallTitle">样品商城</span>
                    </span>
                </a>
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
            <a href="<%=basePath%>supplierindex"><span>供应商点评</span></a>
            <%--<a href="<%=basePath%>mall"><span id="active">样品商城</span></a>--%>
            <a href="<%=basePath%>ps"><span>闪电代购</span></a>
            <a href="memberService"><span>代看货</span></a>
            <%--<a href="javascript:void(0)"><span>技术解决中心</span></a>--%>
        </div>
    </header>

    <div>
        <div id="left">
            <div>
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

        </div>
        <div id="right">
            <div id="product">
                <div>
                    <span id="pro" class="r_p">型号:</span>
                    <span id="proN" class="r_p">${list[0].productnamemall} <c:if test="${sessionScope.user == 'SHT10'}"><a href="<%=basePath%>1019/zai/xin/jian/updateProductMall?product=${list[0].productnamemall}">修改</a></c:if></span>
                    <span id="pri" class="r_p">价格:</span>
                    <span id="priN" class="r_p">${list[0].productpricemall}元</span>
                    <span id="num" class="r_p">数量:</span>
                    <span id="numN" class=" r_p">${list[0].productcountmall}</span>
                    <span id="year" class="r_p">年份:</span>
                    <span id="yearN" class=" r_p">${list[0].year}</span>
                </div>
                <div>
                    <span id="bra" class="r_p">品牌:</span>
                    <span id="braN" class="r_p">${list[0].brand}</span>
                    <span id="tel" class="r_p">电话:</span>
                    <span id="tel1N" class="r_p">0755-82720040</span>
                </div>
                <div>
                    <span id="enc" class="r_p">封装:</span>
                    <span id="encN" class="r_p">${list[0].productencapsulationmall}</span>
                    <span id="qq" class="r_p">客服:
                        <a href="http://wpa.qq.com/msgrd?v=3&uin=2938492659&site=qq&menu=yes" target="_blank">
						    <img border="0" src="http://pub.idqqimg.com/qconn/wpa/button/button_121.gif" alt="点击这里给我发消息" title="点击这里给我发消息" />
					    </a>
                    </span>
                    <span id="rec" class="r_p">最近销售:</span>
                    <span id="recN" class="r_p">${sale[0]}笔</span>
                </div>
                <div id="desc">
                    <span id="addr" class="r_p addr">购买地址</span>
                    <div>

                        <c:if test="${list[0].productoriginalpricemall != 0 && not empty list[0].productoriginalpricemall}">
                            <span class="t_dontinc r_p lo" data-title="样品不加价">不</span>
                        </c:if>
                        <c:if test="${list[0].supportseethegoodsmall !=0 && not empty list[0].supportseethegoodsmall}">
                            <span class="t_look r_p lo" data-title="可以看货">看</span>
                        </c:if>
                        <c:if test="${list[0].supporttackingpicturesmall != 0 && not empty list[0].supporttackingpicturesmall}">
                            <span class="t_photo r_p lo" data-title="可以拍照">拍</span>
                        </c:if>
                        <c:if test="${list[0].supportlockgoodsmall != 0 && not empty list[0].supportlockgoodsmall}">
                            <span class="t_lock r_p lo" data-title="可以锁货">锁</span>
                        </c:if>
                        <c:if test="${list[0].productpurchaselimitmall != 0 && not empty list[0].productpurchaselimitmall}">
                            <span class="t_timepanic r_p lo" data-title="限量购买">限</span>
                        </c:if>
                    </div>
                </div>
            </div>
            <c:if test="${fn:length(list)>1}">
            <div id="aboutproduct">相关型号</div>
            <c:forEach items="${list}" begin="1" varStatus="status" var="l">
                <div class="t_product">
                    <div>
                        <span class="t_pro r_p">型号:</span>
                        <span class="t_proN r_p">${l.productnamemall}</span>
                        <span class="t_pri r_p">价格:</span>
                        <span class="t_priN r_p">${l.productpricemall}元</span>
                        <span class="t_num r_p">数量:</span>
                        <span class="t_numN r_p">${l.productcountmall}</span>
                        <span id="year" class="r_p">年份:</span>
                        <span id="yearN" class=" r_p">${list[0].year}</span>
                    </div>
                    <div>
                        <span class="t_bra r_p">品牌:</span>
                        <span class="t_braN r_p">${l.brand}</span>
                        <span class="t_tel r_p">电话:</span>
                        <span class="t_tel1N r_p">0755-82720040</span>
                    </div>
                    <div>
                        <span class="t_enc r_p">封装:</span>
                        <span class="t_encN r_p">${l.productencapsulationmall}</span>
                        <span class="t_qq r_p">客服:
                        <a href="http://wpa.qq.com/msgrd?v=3&uin=${l.customerserviceqqmall}&site=qq&menu=yes" target="_blank">
						    <img border="0" src="http://pub.idqqimg.com/qconn/wpa/button/button_121.gif" alt="点击这里给我发消息" title="点击这里给我发消息" />
					    </a>
                    </span>
                        <span class="t_rec r_p">最近销售:</span>
                        <span class="t_recN r_p">${sale[status.index]}笔</span>
                    </div>
                    <div class="t_desc">
                        <span class="t_addr r_p addr">购买地址</span>
                        <div>
                            <c:if test="${l.productoriginalpricemall != 0}">
                            <span class="t_dontinc r_p lo" data-title="样品不加价">不</span>
                            </c:if>
                            <c:if test="${l.supportseethegoodsmall !=0}">
                            <span class="t_look r_p lo" data-title="可以看货">看</span>
                            </c:if>
                            <c:if test="${l.supporttackingpicturesmall != 0}">
                            <span class="t_photo r_p lo" data-title="可以拍照">拍</span>
                            </c:if>
                            <c:if test="${l.supportlockgoodsmall != 0}">
                            <span class="t_lock r_p lo" data-title="可以锁货">锁</span>
                            </c:if>
                            <c:if test="${l.productpurchaselimitmall != 0}">
                            <span class="t_timepanic r_p lo" data-title="限量购买">限</span>
                            </c:if>
                        </div>
                    </div>
                </div>
            </c:forEach>
            </c:if>
            <div id="noProduct">
                没有我要的型号,帮我代购
                <input type="text" placeholder="请输入型号" id="addproduct">
                <input type="text" placeholder="请输入数量" id="addnumber">
                <button>提交</button>
            </div>

        </div>
    </div>

    <script src="//cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/layer/3.0.1/layer.min.js"></script>
    <script src="mall/js/ProductMallResult.js"></script>
</body>

<%@include file="../../../include/footer.jsp" %>
</html>