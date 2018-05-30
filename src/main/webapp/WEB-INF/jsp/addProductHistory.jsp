<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ include file="../../include/defined.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../../include/searchHeader.jsp" flush="true">
    <jsp:param value="productSearchResult" name="header" />
</jsp:include>
<script>
    $(document).ready(function(){
        $("#keyword").val('${param.keyword}')
    });
</script>
<div id="navigationBar">
    <ul>
        <li class="model">型号</li>
        <li class="supplier">供应商</li>
        <li class="manufacturer">厂商</li>
        <li class="batchNumber">批号</li>
        <li class="encapsulation">封装</li>
        <li class="storehouse">现货</li>
        <li class="price">参考价格</li>
        <li class="appraise">质量</li>
        <li class="exchange">交易说明</li>
        <li class="complaint">投诉</li>
        <li class="QQ">QQ</li>
    </ul>
</div>
<div id="article">
    <!--搜索结果-->
    <c:forEach items="${product}" var="product" varStatus="status">
        <c:if test="${status.count%2==0}">
            <ul id="bgColor">
                <li class="model"><a href="javascript:void(0)">
                        ${product.product}
                    <c:if test="${product.quality == 2}">
                        <img src="<%=basePath%>img/tuijian2.gif" />
                    </c:if>
                    <c:if test="${product.quality == 3}">
                        <img src="<%=basePath%>img/tuijian3.gif" />
                    </c:if>
                </a></li>
                <li class="supplier">
                    <a href="<%=basePath%>searchSupplierResult?id=${product.supplieruuid}" data-uid="${product.supplieruuid}" title="${product.supplier}" data-qq="${product.qq}" data-tel1="${supplier[status.index].telphone}"
                       data-tel2="${supplier[status.index].telphone1}" data-address="${supplier[status.index].supplierposition}">${product.supplier}
                    </a>
                    <input type="hidden" class="newCont1" value="<c:if test="${!empty comments[status.index]}">${comments[status.index].get(0)}</c:if>" />
                        <%--
                        <input type="hidden" class="newCont2" value="<c:if test="${!empty comments[status.index]}">${comments[status.index].get(1)}</c:if>" />
                        <input type="hidden" class="newCont3" value="<c:if test="${!empty comments[status.index]}">${comments[status.index].get(2)}</c:if>" />
                        --%>
                </li>
                <li class="manufacturer"><a href="javascript:void(0)">${product.manufacturer}</a></li>
                <li class="batchNumber"><a href="javascript:void(0)">${product.lotnumber}</a></li>
                <li class="encapsulation"><a href="javascript:void(0)">${product.encapsulation}</a></li>
                <li class="storehouse"><a href="javascript:void(0)">
                    <c:if test="${product.isgoodsinstock=='0'}">否</c:if>
                    <c:if test="${product.isgoodsinstock=='1'}">是</c:if>
                </a></li>
                <li class="price"><a href="javascript:void(0)">${product.price}元</a></li>
                <li class="appraise"><a href="javascript:void(0)">
                    <c:if test="${product.quality >= 1 && product.quality <= 10}">原装</c:if>
                    <c:if test="${product.quality >= 10 && product.quality <= 20}">国产</c:if>
                    <c:if test="${product.quality >= 21 && product.quality <= 30}">散新</c:if>
                </a></li>
                <li class="exchange"><a href="javascript:void(0)">${product.description}</a></li>
                <li class="complaint" data-complaintPrice="${product.complaintprice}" data-complaintActuals="${product.complaintactuals}" data-complaintOriginal="${product.complaintoriginal}"
                    data-supplierUid="${product.productuuid}"><a href="#modal">
                    <img src="img/complaint.png" />
                </a></li>
                <li class="QQ"><a href="http://wpa.qq.com/msgrd?v=3&uin=${product.qq}&site=qq&menu=yes" target="_blank">
                    <img border="0" src="http://pub.idqqimg.com/qconn/wpa/button/button_121.gif" alt="点击这里给我发消息" title="点击这里给我发消息" />
                </a></li>
            </ul>
        </c:if>
        <c:if test="${status.count%2!=0}">
            <ul id="bgColor1">
                <li class="model"><a href="javascript:void(0)">
                        ${product.product}
                    <c:if test="${product.quality == 2}">
                        <img src="<%=basePath%>img/tuijian2.gif" />
                    </c:if>
                    <c:if test="${product.quality == 3}">
                        <img src="<%=basePath%>img/tuijian3.gif" />
                    </c:if>
                </a></li>
                <li class="supplier"><a href="<%=basePath%>searchSupplierResult?id=${product.supplieruuid }" data-uid="${product.supplieruuid}"  title="${product.supplier}" data-qq="${product.qq}" data-tel1="${supplier[status.index].telphone}"
                                        data-tel2="${supplier[status.index].telphone1}" data-address="${supplier[status.index].supplierposition}"> ${product.supplier} </a>
                    <input type="hidden" class="newCont1" value="<c:if test="${!empty comments[status.index]}">${comments[status.index].get(0)}</c:if>" />
                        <%--
                        <input type="hidden" class="newCont2" value="<c:if test="${!empty comments[status.index]}">${comments[status.index].get(1)}</c:if>" />
                        <input type="hidden" class="newCont3" value="<c:if test="${!empty comments[status.index]}">${comments[status.index].get(2)}</c:if>" />
                        --%>
                </li>
                <li class="manufacturer"><a href="javascript:void(0)">${product.manufacturer}</a></li>
                <li class="batchNumber"><a href="javascript:void(0)">${product.lotnumber}</a></li>
                <li class="encapsulation"><a href="javascript:void(0)">${product.encapsulation}</a></li>
                <li class="storehouse"><a href="javascript:void(0)">
                    <c:if test="${product.isgoodsinstock=='0'}">否</c:if>
                    <c:if test="${product.isgoodsinstock=='1'}">是</c:if>
                </a></li>
                <li class="price"><a href="javascript:void(0)">${product.price}元</a></li>
                <li class="appraise"><a href="javascript:void(0)">
                    <c:if test="${product.quality >= 1 && product.quality <= 10}">原装</c:if>
                    <c:if test="${product.quality >= 10 && product.quality <= 20}">国产</c:if>
                    <c:if test="${product.quality >= 21 && product.quality <= 30}">散新</c:if>
                </a></li>
                <li class="exchange"><a href="javascript:void(0)">${product.description}</a></li>
                <li class="complaint" data-complaintPrice="${product.complaintprice}" data-complaintActuals="${product.complaintactuals}" data-complaintOriginal="${product.complaintoriginal}"
                    data-supplierUid="${product.productuuid}"><a href="#modal">
                    <img src="img/complaint.png" />
                </a></li>
                <li class="QQ"><a href="http://wpa.qq.com/msgrd?v=3&uin=${product.qq}&site=qq&menu=yes" target="_blank">
                    <img border="0" src="http://pub.idqqimg.com/qconn/wpa/button/button_121.gif" alt="点击这里给我发消息" title="点击这里给我发消息" />
                </a> </a></li>
            </ul>
        </c:if>
    </c:forEach>
</div>

<div class="remodal" data-remodal-id="modal">
    <button data-remodal-action="close" class="remodal-close"></button>
    <div class="madelTitle">请点击你要投诉的内容:</div>
    <hr />
    <div class="madelButton">
        <button class="button button-royal  button-small button-rounded" id="price">
            价格不真实X
            <span id="complaintPrice"></span>
        </button>
        <button class="button button-royal  button-small button-rounded" id="actuals">
            没有现货X
            <span id="complaintActuals"></span>
        </button>
        <button class="button button-royal  button-small button-rounded" id="original">
            非原装报原装货X
            <span id="complaintOriginal"></span>
        </button>
        <input type="hidden" id="uid" />
    </div>
    <br /> <input type="submit" data-remodal-action="confirm" class="remodal-confirm" />
</div>

<%@include file="../../include/footer.jsp"%>
</body>

</html>