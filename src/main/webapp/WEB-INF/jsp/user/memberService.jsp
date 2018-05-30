<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8" %>
<%@ include file="../../../include/defined.jsp" %>
<jsp:include page="../../../include/header.jsp" flush="true">
    <jsp:param value="handmemberService" name="header"/>
</jsp:include>

<div id="content-all">

        <%--<select>--%>
        <%--<option value="型号">型号</option>--%>
        <%--<option value="商家">商家</option>--%>
        <%--</select>--%>
        <%--<span class="imput">--%>
            <%--<input type="text" placeholder="型号" id="comment"/>--%>
            <%--<input type="text" placeholder="需求数量" id="comment"/>--%>
            <%--<input type="text" placeholder="封装" id="comment"/>--%>
            <%--<input type="text" placeholder="供应商名称" id="comment"/>--%>
            <%--<input type="text" placeholder="供应商地址" id="comment"/>--%>
        <%--</span>--%>
<button id="submit" <c:if test="${sessionScope.userName==null}">disabled="disabled"</c:if>>提交</button>
<div>
    <div id="show">
        <span class="showProduct">型号</span>
        <span class="showNumber">需求数量</span>
        <span class="showEncapsulation">封装</span>
        <span class="showSupplier">供应商名</span>
        <span class="supplierposition">地址</span>
        <span class="showYear">年份</span>
        <span class="showTime">提交时间</span>
        <span class="showResult">查看结果</span>
    </div>
    <div id="s">
        <c:forEach var="members" items="${members}">
            <div>
                <span class="showProduct">${members.product}</span>
                <span class="showNumber">${members.number}</span>
                <span class="showEncapsulation">${members.encapsulation}</span>
                <span class="showSupplier">${members.supplier}</span>
                <span class="supplierposition">${members.supplieraddress}</span>
                <span class="showYear" style="width: 130px">${members.year}</span>
                <%--<span class="showTime">${members.submittime}</span>--%>
                <span>${members.submittime}</span>
                <span class="showResult"><a target="_blank" href="handlingMemberService?uid=${members.memberserviceuid}">处理</a></span>
            </div>
        </c:forEach>
    </div>
</div>
<script type="text/javascript">
    (function () {
        var showTime = $(".showTime");
        for(var i = 1; i < showTime.length; i++){
            showTime.eq(i).html(showTime.eq(i).html().substr(0, 10));

        }
    })()
</script>
<jsp:include page="../../../include/footer.jsp"/>