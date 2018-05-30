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
			<form action="queryUserInfoAll" method="get">
				<div class="col-sm-2" style="float: left;">
					<div class="form-group">
						<div class="input-group">
							<label class="sr-only" style="color:rgb(250,0,255)" for="r_name">
								会员名称或手机
							</label>
							<input type="text" style="border:2px double rgb(250,0,255);height: 27px;" class="list-group-item list-group-item-success" placeholder="会员名称或手机"
								id="product" name="product" />
						</div>
					</div>
				</div>
				<div class="col-sm-1" style="float: left;">
					<button type="submit" class="btn btn-primary">
						搜索
					</button>
				</div>
			</form>
		</div>
	</div>
	<div class="mt-20" style="background:#CBE9CF; color:#00060B">
		<table class="table table-striped table-hover" id="sample-table-2">
			<thead>
				<tr class="text-c">
					<th>会员名称</th>
					<th>电话</th>
					<th>qq</th>
					<th>注册时间</th>
					<th>注册IP</th>
					<th>上次登录时间</th>
					<th>登录IP</th>
					<th>搜索次数</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${user}" var="user" varStatus="status">
					<tr height="60px;" class="text-c">
						<td>${user.username}</td>
						<td>${user.telephone}</td>
						<td>${user.qq}</td>
						<td><fmt:formatDate value="${user.regtime}" pattern="yyyy-MM-dd HH:mm"/></td>
						<td class="fan">${user.regip}</td>
						<td>
							<fmt:formatDate value="${user.lasttime}" pattern="yyyy-MM-dd HH:mm"/>
						</td>
						<td align="center">
							${user.lastip}
						</td>
						<td align="center">
							${user.countsearch}
						</td>
						<td align="center">
							<c:if test="${sessionScope.user.admin_jurisdiction == 1 }">
								<a href="javascript:;" onclick="main('${user.useruid}')">设为在线购</a><br>
							</c:if>
							<c:if test="${sessionScope.user.admin_jurisdiction == 7 }">
								<c:if test="${fn:contains(sessionScope.user.admin_shrio, 'h')}">
									<a href="javascript:;" onclick="main('${user.useruid}')">设为在线购</a><br>
								</c:if>
							</c:if>
							<a href="javascript:;" onclick="mima('${user.useruid}')">密码重置</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div style="width: 100%;height: 27px;margin-top: 3px;">
       	当前第${page }页/共${count }页&nbsp;&nbsp;共${total }条记录&nbsp;&nbsp;
       	<input class="btn btn-success size-MINI radius" type="button" onclick = "first()" value="首页">&nbsp;
       	<input class="btn btn-secondary size-MINI radius" type="button" onclick = "previous()" <c:if test='${page == 1}'> style='opacity: 0.2;' </c:if> value="上一页"/>&nbsp;
       	<input size="1px;" class="btn btn-secondary size-MINI radius" onclick = "er()" <c:if test='${count <= page+1}'> style='opacity: 0.2;' </c:if>value="${page+1 }">&nbsp;
       	<input size="1px;" class="btn btn-secondary size-MINI radius" onclick = "san()"<c:if test='${count <= page+2}'> style='opacity: 0.2;' </c:if>value="${page+2 }">&nbsp;
       	<input size="1px;" class="btn btn-secondary size-MINI radius" onclick = "si()" <c:if test='${count <= page+3}'> style='opacity: 0.2;' </c:if>value="${page+3 }">&nbsp;
       	<input class="btn btn-secondary size-MINI radius" type="button" onclick = "next()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>value="下一页"/>&nbsp;
       	<input class="btn btn-success size-MINI radius" type="button" onclick = "end()" value="尾页"/>
       </div>
</div>
<script type="text/javascript" src="<%=contextPath %>/user/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/lib/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="  <%=contextPath %>/user/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="<%=contextPath %>/user/static/h-ui.admin/js/H-ui.admin.js"></script>
<script>
function mima(uid) {
    $.ajax({
        type: 'post',
        async: 'true',
        url: 'updateUserPasswd',
        dataType: 'json',
        contentType:'application/x-www-form-urlencoded;charset=utf-8',
        data:{
            uid: uid
        },
        success: function (data){
            layer.msg(data.msg);
        },
        error: function(data){
            layer.msg("失败!");
            return false;
        }
    });
}
function main(uid){
	$.ajax({
        type: 'post',
        async: 'true',
        url: 'updateUserSupplierOnline',
        dataType: 'json',
        contentType:'application/x-www-form-urlencoded;charset=utf-8',
        data:{
            uid: uid
        },
        success: function (data){
            layer.msg("设置成功");
        },
        error: function(data){
            layer.msg("失败!");
            return false;
        }
    });
}
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
function search(){
	var product=$("#product").val();
	window.location.href='queryUserInfoAll?product='+product;
}
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
function first(){
	window.location.href='queryUserInfoAll?page=${1}&&rows=${pageSize }';
}
function end(){
	window.location.href='queryUserInfoAll?page=${count == 0 ? 1:count }&&rows=${pageSize }';
}
function er(){
	var page=${page+1 };
	var count=${count };
	if(page > count){
		return false;
	}else{
		window.location.href='queryUserInfoAll?page=${page+1}&&rows=${pageSize }';
	}
}
function san(){
	var page=${page+2 };
	var count=${count };
	if(page > count){
		return false;
	}else{
		window.location.href='queryUserInfoAll?page=${page+2}&&rows=${pageSize }';
	}
}
function si(){
	var page=${page+3 };
	var count=${count };
	if(page > count){
		return false;
	}else{
		window.location.href='queryUserInfoAll?page=${page+3}&&rows=${pageSize }';
	}
}
function previous(){
	var page=${page == 1};
	if(page){
		return false;
	}else{
		window.location.href='queryUserInfoAll?page=${page-1}&&rows=${pageSize }';
	}
}
function next(){
	var page=${count <= page};
	if(page){
		return false;
	}else{
		window.location.href='queryUserInfoAll?page=${page+1}&&rows=${pageSize }';
	}
}
</script>
</body>
</html>