<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String contextPath = request.getContextPath();
	String realPath = request.getSession().getServletContext().getRealPath("/");
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ contextPath + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="<%=contextPath %>/user/static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=contextPath %>/user/static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="<%=contextPath %>/user/lib/Hui-iconfont/1.0.7/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="<%=contextPath %>/user/lib/icheck/icheck.css" />
	<link rel="stylesheet" type="text/css" href="<%=contextPath %>/user/static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link href="//cdn.bootcss.com/remodal/1.1.0/remodal.min.css" rel="stylesheet">
	<link href="//cdn.bootcss.com/remodal/1.1.0/remodal-default-theme.min.css" rel="stylesheet">
	<link href="//cdn.bootcss.com/Buttons/2.0.0/css/buttons.min.css" rel="stylesheet">
	<link href="//cdn.bootcss.com/webui-popover/1.2.17/jquery.webui-popover.min.css" rel="stylesheet">
	<script src="//cdn.bootcss.com/jquery/2.2.4/jquery.js"></script>
	<script src="//cdn.bootcss.com/remodal/1.1.0/remodal.min.js"></script>
	<script src="//cdn.bootcss.com/Buttons/2.0.0/js/buttons.min.js"></script>
	<script src="//cdn.bootcss.com/webui-popover/1.2.17/jquery.webui-popover.min.js"></script>
<style type="text/css">
	:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
	    color: rgb(250,0,255);  
	}
	
	::-moz-placeholder { /* Mozilla Firefox 19+ */
	    color: rgb(250,0,255);
	}
	
	input:-ms-input-placeholder,
	textarea:-ms-input-placeholder {
	    color: rgb(250,0,255);
	}
	
	input::-webkit-input-placeholder,
	textarea::-webkit-input-placeholder {
	    color: rgb(250,0,255);
	}
</style>
</head>
<body>
<div class="page-container">
<a name="top"></a>
	<div>
		<!-- <div class="cl pd-5 bg-1 bk-gray" style="height:40px;">
			<form action="queryByInquiry" method="post">
				<input type="text" name="product" placeholder="请输入商家名称" style="height: 30px;border: 2px #87CEEB solid;-moz-border-radius:2px;-webkit-border-radius:2px;border-radius:2px;">
				<input type="submit" value="搜索" style="position: relative;padding: 4px 10px 4px 10px;font-weight: bold;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;border: 1px;">
			</form>
		</div> -->
	</div>
	<div  style="float: left;line-height: 65px;margin-left: 20px;">
	</div>
	<div class="show_iframe" >
		<div style="display: none" class="loading"></div>
		<div >
			<div class="mt-20">
				<table style="border: 1px #EEEEEE solid;border-collapse: collapse;width: 1127px;margin-left: 0px;">
					<thead  style="background: #BCBFFD">
						<tr >
							<th style="height: 40px;color: black;font-weight: bold;text-align: left;padding-left: 10px;">会员名</th>
							<th style="height: 40px;color: black;font-weight: bold;text-align: left;">供应商</th>
							<th style="height: 40px;color: black;font-weight: bold;text-align: center;">备注</th>
							<th style="height: 40px;color: black;font-weight: bold;text-align: center;">时间</th>
						</tr>
					</thead>
					<tbody >
						<c:forEach items="${remarks}" var="inquiry" varStatus="status">
							<tr style="<c:if test='${status.count%2==0 }'>background:#F3F3F3</c:if>">
								<td style="height: 40px;"><p style="padding-left: 10px;width: 140px;overflow: hidden;clear:both;text-overflow:ellipsis;white-space: nowrap;text-align: left;" title="${inquiry.user.username}">${inquiry.user.username}</p></td>
								<td style="height: 40px;" title="">
									<p style="overflow: hidden;clear:both;text-overflow:ellipsis;white-space: nowrap;" title="${inquiry.supplier.suppliername}">${inquiry.supplier.suppliername}</p>
								</td>
								<td style="height: 40px;text-align: center;" title="">
									${inquiry.remarks_contest}
								</td>
								<td style="height: 40px;text-align: center;">
									<fmt:formatDate value="${inquiry.remarks_time}" pattern="yyyy-MM-dd HH:mm"/>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<%-- <br>
				<div class="g-cf g-pagerwp g-bd-box g-plr-10 g-o-h" style="width: 1113px;margin-left: 20px;">
					<div class="g-pager g-f-r" style="visibility: visible;">
						<span>总记录数：${total }</span>  <span>页数：<c:if test="${count==0 }">0</c:if><c:if test="${count!=0 }">${page}</c:if>/${count }</span>
						<c:if test="${page<=1 || page==null}">
							<a class="no">首页</a><a class="no">上一页</a>
						</c:if>
						<c:if test="${page>1}">
							<a href="queryByInquiry">首页</a><a href="queryByInquiry?page=${page-1 }">上一页</a>
						</c:if>
						<c:if test="${page==count || count==0}">
							<a class="no">下一页</a><a class="no">尾页</a>
						</c:if>
						<c:if test="${page!=count && count!=0}">
							<a href="queryByInquiry?page=${page+1 }">下一页</a><a href="queryByInquiry?page=${count }">尾页</a>
						</c:if>
						<c:if test="${page>3}">
							<input class="g-go-page" type="text" name="page">
							<a id="">GO</a>
						</c:if>
					</div>
				</div> --%>
			</div>
			<%-- <div style="width: 100%;height: 27px;margin-top: 3px;">
		       	当前第${page }页/共${count }页&nbsp;&nbsp;共${total }条记录&nbsp;&nbsp;
		       	<input class="btn btn-success size-MINI radius" type="button" onclick = "first()" value="首页">&nbsp;
		       	<input class="btn btn-secondary size-MINI radius" type="button" onclick = "previous()" <c:if test='${page == 1}'> style='opacity: 0.2;' </c:if> value="上一页"/>&nbsp;
		       	<input size="1px;" class="btn btn-secondary size-MINI radius" onclick = "er()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>value="${page+1 }">&nbsp;
		       	<input size="1px;" class="btn btn-secondary size-MINI radius" onclick = "san()"<c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>value="${page+2 }">&nbsp;
		       	<input size="1px;" class="btn btn-secondary size-MINI radius" onclick = "si()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>value="${page+3 }">&nbsp;
		       	<input class="btn btn-secondary size-MINI radius" type="button" onclick = "next()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>value="下一页"/>&nbsp;
		       	<input class="btn btn-success size-MINI radius" type="button" onclick = "end()" value="尾页"/>
		       </div> --%>
	       
		</div>
			
	</div>
	<%-- <div style="width: 100%;height: 27px;margin-top: 3px;">
       	当前第${page }页/共${count }页&nbsp;&nbsp;共${total }条记录&nbsp;&nbsp;
       	<input class="btn btn-success size-MINI radius" type="button" onclick = "first()" value="首页">&nbsp;
       	<input class="btn btn-secondary size-MINI radius" type="button" onclick = "previous()" <c:if test='${page == 1}'> style='opacity: 0.2;' </c:if> value="上一页"/>&nbsp;
       	<input size="1px;" class="btn btn-secondary size-MINI radius" onclick = "er()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>value="${page+1 }">&nbsp;
       	<input size="1px;" class="btn btn-secondary size-MINI radius" onclick = "san()"<c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>value="${page+2 }">&nbsp;
       	<input size="1px;" class="btn btn-secondary size-MINI radius" onclick = "si()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>value="${page+3 }">&nbsp;
       	<input class="btn btn-secondary size-MINI radius" type="button" onclick = "next()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>value="下一页"/>&nbsp;
       	<input class="btn btn-success size-MINI radius" type="button" onclick = "end()" value="尾页"/>
       </div> --%>
</div>
<script type="text/javascript" src="<%=contextPath %>/user/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/lib/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="  <%=contextPath %>/user/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/static/h-ui.admin/js/H-ui.admin.js"></script>
<script>
$("table").on("click",".update", function(){
	var price = $(this).parents(".text-c").data("price");
    var h = $(this).parents(".text-c").data("beizhu");
    $(this).html("确定");
    var Enumber = $(this).siblings(".Enumber");
    var eh = '<input type="text" id="express_number" value="'+h+'" class="input-text"/>';
    $(this).addClass("sta").removeClass("update");
    var fan = $(this).siblings(".fan");
    var fh = '<input type="text" id="fan" value="'+price+'" class="input-text"/>';
    fan.html(fh);
    Enumber.html(eh);
});

$("table").on("click", ".sta", function(){
    var id = $(this).parents(".text-c").data("id");
    var fan = $("#fan").val();
    $(this).siblings(".fan").html(fan);
    var number = $("#express_number").val();
    $(this).siblings(".Enumber").html(number);
    $(this).html("修改");
    $(this).removeClass("sta").addClass("update");
    $.ajax({
        type:"post",
        url:"upInquiry",
        async:true,
        dataType: "json",
        data: {
        	inquiry_price:fan,
        	inquiry_beizhu:number,
            inquiry_id: id
        },
        success : function(data){
        	window.location.reload();
            layer.msg(data.msg);
        }
    });
});
</script>
</body>
</html>