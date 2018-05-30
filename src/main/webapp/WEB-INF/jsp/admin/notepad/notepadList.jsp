<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		<div class="cl pd-5 bg-1 bk-gray" style="height:40px;">
			<form action="queryAllnotepad" method="post">
				<div class="col-sm-3" style="float: left;">
					<div class="form-group">
						<div class="input-group">
							<label class="sr-only" style="color:rgb(250,0,255)" for="r_name">
								
							</label>
							<textarea rows="" cols="" id="connet" name="connet" style="height: 30px;width: 200px;font-size:14px;"></textarea>
						</div>
					</div>
				</div>
				<div class="col-sm-1" style="float: left;">
					<button type="submit" class="btn btn-primary">
						搜索
					</button>
				</div>
			</form>
			<div class="col-sm-1" style="float: left;">
				<button id="yiji" class="btn btn-primary">
					添加记事
				</button>
			</div>
		</div>
		<div id="tianjia" class="cl pd-5 bg-1 bk-gray" style="background:#CBE9CF; color:#00060B">
			<form action="addNotepad" method="post">
				<textarea rows="" cols="" id="addnotepad_connet" name="notepad_connet" required="required" style="height: 70px;width: 800px;font-size:14px;"></textarea>
				<input class="btn btn-danger radius" id="addquxiao" value="取消" style="float: right;margin-right: 240px;width: 55px;">
				<input class="btn btn-success radius" type="submit" id="addpurchase" style="float: right;margin-right: -55px;margin-top: 35px;" value="确定">
			</form>
		</div>
		<div id="uppurchaseText" class="cl pd-5 bg-1 bk-gray" style="background:#CBE9CF; color:#00060B">
			<form action="upNotepad" method="post">
				<input type="hidden" id="upnotepad_id" name="notepad_id">
				<textarea rows="" cols="" id="upnotepad_connet" name="notepad_connet" required="required" style="height: 70px;width: 800px;font-size:14px;"></textarea>
				<input class="btn btn-danger radius" id="upquxiao" value="取消" style="float: right;margin-right: 240px;width: 55px;">
				<input class="btn btn-success radius" type="submit" id="uppurchase" style="float: right;margin-right: -55px;margin-top: 35px;" value="确定">
			</form>
		</div>
	</div>
	<div class="mt-20" style="background:#CBE9CF; color:#00060B">
		<table class="table table-striped table-hover" id="sample-table-2">
			<thead>
				<tr class="text-c">
					<th width="160px;">内容</th>
					<th width="45px;">时间</th>
					<th width="60px;">记事人</th>
					<th width="60px;">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${notepad}" var="notepad" varStatus="status">
					<tr height="60px;" class="text-c" data-id="${notepad.notepad_id}" data-connet="${notepad.notepad_connet}">
						<c:if test="${connet ==null || connet=='' }">
							<td width="160px;">${notepad.notepad_connet}</td>
						</c:if>
						<c:if test="${connet !=null && connet!='' }">
							<td width="160px;">${fn:replace(notepad.notepad_connet,connet, connets)}</td>
						</c:if>
						<td><fmt:formatDate value="${notepad.notepad_date}" pattern="yyyy-MM-dd"/></td>
						<td>${notepad.name}</td>
						<td width="60px;">
                    		<a href="#top" class="update" style="color: red;">修改</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
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
$("#upquxiao").on("click",function(){
	$("#upnotepad_id").val("");
	$("#upnotepad_connet").val("");
	document.getElementById('uppurchaseText').style.display = 'none';
})
/* function edit(id,model){
	$("#upnotepad_id").val(id);
	$("#upnotepad_connet").val(model);
	document.getElementById('uppurchaseText').style.display = 'block';
	document.getElementById('tianjia').style.display = 'none';
} */
$("table").on("click",".update", function(){
	var f = $(this).parents(".text-c").data("id");
    var h = $(this).parents(".text-c").data("connet");
    $("#upnotepad_id").val(f);
	$("#upnotepad_connet").val(h);
	document.getElementById('uppurchaseText').style.display = 'block';
	document.getElementById('tianjia').style.display = 'none';
});
$(function(){
	document.getElementById('tianjia').style.display = 'none';
	document.getElementById('uppurchaseText').style.display = 'none';
})
$("#addquxiao").on("click",function(){
	$("#addnotepad_connet").val("");
	document.getElementById('tianjia').style.display = 'none';
})
$("#yiji").on("click",function(){
	document.getElementById('tianjia').style.display = 'block';
	document.getElementById('uppurchaseText').style.display = 'none';
})
</script>
</body>
</html>