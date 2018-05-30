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
 <link rel="stylesheet" type="text/css" href="<%=basePath%>user/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>user/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>user/lib/Hui-iconfont/1.0.7/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>user/lib/icheck/icheck.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>user/static/h-ui.admin/skin/default/skin.css" id="skin" />
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

<section id="page-title" class="padding-top-15 padding-bottom-15">
	<div class="row">
    	<div class="col-sm-7">
		</div>
		<div class="col-sm-12">
   			
		</div>
	</div>
</section>
<div class="row">
	<br>
	<br>
	<div class="col-sm-12" style="margin-left: 10px;margin-top: -20px">
		<c:if test="${sessionScope.user.admin_status eq '1' || user.admin_status eq '' || user.admin_status eq null }">
			<p style="padding-bottom: 10px;padding-left: 20px">
				<span style="font-weight: bolder;font-size: 20px">质量为1和2</span> 的总数量为 : <span style="font-weight: bolder;font-size: 20px"> ${total} </span> 条
			</p>
			<div class="col-sm-1">
				<a href="<%=basePath %>1019/zai/xin/jian/queryAllProduct" class="btn btn-primary">
					产品首页
				</a>
			</div>
			<div class="col-sm-1">
				<a id="quality" href="seleQuality?kongzhi=123" class="btn btn-primary">
					质量查询
				</a>
			</div>
			<div  class="col-sm-1">
				<a id="kucun" href="seleQuality?kongzhi=123&&isgoodsinstock=123" class="btn btn-primary">
					库存排序
				</a>
			</div>
		</c:if>
		<div class="col-sm-2" style="float: right;">
			<div class="form-group">
				<div class="input-group">
					<label class="sr-only" style="color:rgb(250,0,255)" for="r_name">
						产品名称
					</label>
					<input type="search" value="${sessionScope.productQuality}" style="border:2px double rgb(250,0,255);height: 30px;" class="list-group-item list-group-item-success" placeholder="产品名称"
						id="product" name="product" />
				</div>
			</div>
		</div>
		<div class="col-sm-2" style="float: right;">
			<div class="form-group">
				<div class="input-group">
					<label class="sr-only" style="color:rgb(250,0,255)" for="r_name">
						品牌名称
					</label>
					<input type="search" value="${sessionScope.manufacturer}" style="border:2px double rgb(250,0,255);height: 30px;" class="list-group-item list-group-item-success" placeholder="品牌名称"
						id="manufacturer" name="manufacturer" />
				</div>
			</div>
		</div>
		<div class="col-sm-1" style="float: right;">
			<button onclick="searchProduct();" class="btn btn-primary">
				搜索
			</button>
		</div>
	</div>
	<br>
	<br>
	<div class="col-md-12">
		<table class="table table-striped table-hover" style="background:#CBE9CF; color:#00060B;" id="sample-table-2">
			<thead >
				<tr class="text-c">
					<th width="30px">序号</th>
					<th width="60px;">型号</th>
					<th width="80px;">供应商</th>
					<th width="40px;">厂商</th>
					<th width="40px;">批号</th>
					<th width="40px;">封装</th>
					<th width="40px;">数量</th>
					<th width="60px;">价格区间</th>
					<th width="60px;">参考价格</th>
					<th width="40px;">分类</th>
					<th width="60px;">交易说明</th>
					<th width="40px;">修改时间</th>
					<c:if test="${sessionScope.user.admin_status eq '2' || user.admin_status eq '' || user.admin_status eq null }">
						<th width="60px;">操作</th>
					</c:if>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${product}" var="product" varStatus="status">
							<tr height="60px;" class="text-c">
								<td width="30px">${status.count}</td>
								<c:if test="${product.complaintprice == 1}">
									<td width="80px;" >
										<p style="background-color: red;">
											${product.product}
										</p>
									</td>
								</c:if>
								<c:if test="${product.complaintprice == 0}">
									<td width="80px;">${product.product}</td>
								</c:if>
								<td width="80px;">
									<a href="searchSupplierResult?id=${product.supplieruuid }"
										class="supplier">${product.supplier }</a>
								</td>
								<td width="40px;">${product.manufacturer}</td>
								<td width="40px;">${product.lotnumber }</td>
								<td width="40px;">${product.encapsulation}</td>
								<td width="40px;">${product.isgoodsinstock}</td>
								<td width="60px;">
									<c:if test="${not empty product.discountList}">
										<c:forEach items="${product.discountList}" var="order" varStatus="status">
											<p>${order.discount_numbermin}
												<c:if test="${order.discount_numbermax !=0  }">
													~ ${order.discount_numbermax}<span>${order.discount_unit}</span>
												</c:if>
												<c:if test="${order.discount_numbermax ==0  }">
													<span style="color: red;">+</span>
												</c:if>
											</p>
										</c:forEach>
									</c:if>
									<c:if test="${empty product.discountList}">
										<p>1+</p>
									</c:if>
								</td>
								<td width="60px;">
									<c:if test="${ not empty product.discountList}">
										<c:forEach items="${product.discountList}" var="order" varStatus="status">
												<p>${order.discount_price}元
												</p>
										</c:forEach>
									</c:if>
									<c:if test="${empty product.discountList}">
										<p>${product.price}元</p>
									</c:if>
								</td>
								<td width="40px;">
									${product.primary.primary_name}
								</td>
								<td width="60px;">${product.description}</td>
								<td width="45px;">
									<fmt:formatDate value="${product.uptime}" pattern="yyyy/MM/dd HH:mm"/>
									<c:if test="${product.uptime == null}">
										0000-00-00 00:00:00
									</c:if>
								</td>
								<c:if test="${sessionScope.user.admin_status eq '2' || user.admin_status eq '' || user.admin_status eq null }">
									<td width="60px;">
										<p>
											<c:if test="${product.sort_miaoshu != null && product.sort_miaoshu != '' }">
												<a style="color:gray;" href="sortAdd?productuuid=${product.productuuid}&product=${product.product}&encapsulation=${product.encapsulation}">分类添加</a>
											</c:if>
											<c:if test="${product.sort_miaoshu == null || product.sort_miaoshu == '' }">
												<a style="color:blue;" href="sortAdd?productuuid=${product.productuuid}&product=${product.product}&encapsulation=${product.encapsulation}">分类添加</a>
											</c:if>
										</p>
										<br>
										<a href="seleUpdateQuality?uid=${product.productuuid}" class="exchange"
										style="padding-right: 0px;width: 20px;color: blue;">修改</a>
										
										|<a href="deleteQualityProduct?productuuid=${product.productuuid }" class="exchange"
										style="padding-right: 0px;width: 20px;color: red;" onClick="return confirm('确定删除?');">删除</a>
									</td>
								</c:if>
							</tr>
				</c:forEach>
				<tr>
					<th colspan="13">
						 当前第${page }页/共${count }页&nbsp;&nbsp;共${total }条记录&nbsp;&nbsp;
			        	<button onclick = "first()">首页</button>&nbsp;
			        	<button onclick = "previous()" <c:if test='${page == 1}'> style='opacity: 0.2;' </c:if>>上一页</button>&nbsp;
			        	<button onclick = "next()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>下一页</button>&nbsp;
			        	<button onclick = "end()">尾页</button>
			        </th>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<script type="text/javascript" src="<%=basePath%>user/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>user/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>user/lib/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=basePath%>user/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="<%=basePath%>user/static/h-ui.admin/js/H-ui.admin.js"></script>
<script>
function first(){
	window.location.href='seleQuality?page=${1}&&rows=${pageSize }&manufacturer=${sessionScope.manufacturer}&product=${sessionScope.product}&&isgoodsinstock=123';
}
function end(){
	var supplier = $("#supplier").val();
	var search = $("#search").val();
	window.location.href='seleQuality?page=${count == 0 ? 1:count }&&rows=${pageSize }&manufacturer=${sessionScope.manufacturer}&product=${sessionScope.product}&&isgoodsinstock=123';
}
function previous(){
	var page=${page == 1};
	var supplier = $("#supplier").val();
	var search = $("#search").val();
	if(page){
		return false;
	}else{
		window.location.href='seleQuality?page=${page-1}&&rows=${pageSize }&manufacturer=${sessionScope.manufacturer}&product=${sessionScope.product}&&isgoodsinstock=123';
	}
}
function next(){
	var page=${count <= page};
	if(page){
		return false;
	}else{
		window.location.href='seleQuality?page=${page+1}&&rows=${pageSize }&manufacturer=${sessionScope.manufacturer}&product=${sessionScope.product}&&isgoodsinstock=123';
	}
}
//搜索
function searchProduct() {
	var product = $("#product").val();
	var manufacturer = $("#manufacturer").val();
	var url = 'seleQuality?manufacturer=' + manufacturer+'&productQuality='+product;
	window.location = url;
};

</script>
<script type="text/javascript">
	
	$(function(){
		var kucun = '${kucun}';
		if(kucun == ''){
			$('#quality').css('background','green');
			$('#kucun').css('background','');
		}else{
			$('#kucun').css('background','green');
			$('#quality').css('background','');
		}
	});
</script>
</body>
</html>