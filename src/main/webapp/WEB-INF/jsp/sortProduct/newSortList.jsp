	<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
		contentType="text/html; charset=utf-8"%>
	<%@ include file="../../../include/defined.jsp"%>
	<jsp:include page="../../../include/sortHeader.jsp" flush="true">
		<jsp:param value="newSortList" name="header" />
	</jsp:include>
	<body >
		<div style="width: 100%;text-align: center;">
			<a href="javascript:window.location='cont'">
				<button class="button1" style="width: 100px;font-size: 15px;height: 50px">首页</button>
			</a>
			<a href="newSortAdd">
				<button class="button1" style="width: 100px;font-size: 15px;height: 50px">添加</button>
			</a>
		</div>
		<div style="width: 100%;margin-top: 80px">
	       	当前第 <span style="font-weight:bold">${page }</span> 页 / 共 <span style="font-weight:bold">${count}</span> 页&nbsp;&nbsp; 共 <span style="font-weight:bold">${total}</span> 条记录&nbsp;&nbsp;
	       	<button class="button1" style="width: 40px;font-size: 13px;height: 20px" onclick = "first()">首页</button>&nbsp;
	       	<c:if test="${count > 1}">
	       		<button class="button1" style="width: 50px;font-size: 13px;height: 20px" onclick = "previous()" <c:if test='${page == 1}'> style='opacity: 0.2;' </c:if>>上一页</button>&nbsp;
	       		<button class="button2" onclick = "er()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>${page+1 }</button>&nbsp;
	       		<button class="button2" onclick = "san()" <c:if test='${count <= page+1}'> style='opacity: 0.2;' </c:if>>${page+2 }</button>&nbsp;
	       		<button class="button2" onclick = "si()" <c:if test='${count <= page+2}'> style='opacity: 0.2;' </c:if>>${page+3 }</button>&nbsp;
	       	</c:if>
	       	<button class="button1" style="width: 50px;font-size: 13px;height: 20px" onclick = "next()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>下一页</button>&nbsp;
	       	<button class="button1" style="width: 40px;font-size: 13px;height: 20px" onclick = "end()">尾页</button>
	       	<input style="margin-left: 300px" type="text" id="sortProduct" value="${sort_product}" /><input style="width: 60px;height: 25px" type="button" id="sousuo" class="button1" value="搜索" />
     	</div>
		<div class="div2" >
			<table id="table2" class="table2" cellpadding="2" cellspacing="2" border="1px">
				<tr style="background-color: #C7C7C7;font-weight: bold;">
					<td style="width: 40px">序号</td>
					<td style="width: 150px">型号</td>
					<td style="width: 120px;">描述</td>
					<td style="width: 50px">封装</td>
					<td style="width: 200px">连接性</td>
					<td style="width: 180px">外设</td>
					<td style="width: 40px">IO</td>
					<td style="width: 70px">RAM</td>
					<td style="width: 150px">数据转换</td>
					<td style="width: 70px">电压</td>
					<td style="width: 65px">温度</td>
					<td style="width: 65px">操作</td>
				</tr>
			</table>
			<table id="table3" cellpadding="2" cellspacing="2" border="1px" >
				<c:forEach items="${sortList}" var="sortList" varStatus="status">
					<tr class="zxc">
						<td style="width: 40px;font-weight: bold;">${status.count}</td>
						<td style="width: 150px;">
							<a title="${sortList.sort_product}" href="javascript:window.open('search?keyword=${sortList.sort_product}&amp;value=product&amp;page=1')">
								${sortList.sort_product}
							</a>
						</td>
						<td style="width: 120px;">${sortList.sort_miaoshu}</td>
						<td style="width: 50px">${sortList.sort_encapsulation}</td>
						<td style="width: 200px">${sortList.sort_lianjie}</td>
						<td style="width: 180px">${sortList.sort_waishe}</td>
						<td style="width: 40px">${sortList.sort_io}</td>
						<td style="width: 70px">${sortList.sort_ram}</td>
						<td style="width: 150px">${sortList.sort_shujuzhuanhuan}</td>
						<td style="width: 70px">${sortList.sort_dianya}</td>
						<td style="width: 65px">${sortList.sort_wendu}</td>
						<td style="width: 65px"><a href="select_SortUpdate?sort_id=${sortList.sort_id}">修改</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div style="margin-top: -100px">
			<%@ include file="../../../include/footer.jsp"%>
		</div>
		
		<script type="text/javascript">
			$(function () {
				
				$('#sousuo').click(function(){
					var sort_product = document.getElementById('sortProduct').value;
					window.location.href="newSortList?sort_product="+sort_product;
				});
				
			    var tr = $("#table3 tr");  
			    tr.mouseover(function () {  
			        $(this).children("td").css("background-color", "#AEF2E5");  
			    }).mouseout(function () {  
			        $(this).children("td").css("background-color", "#FFFFFF");  
			    }); 
			    
			});
			window.onbeforeunload = function(){
			    var scrollPos;    
			    if (typeof window.pageYOffset != 'undefined') {
			        scrollPos = window.pageYOffset;
			    }
			    else if (typeof document.compatMode != 'undefined' &&
			        document.compatMode != 'BackCompat') {
			        scrollPos = document.documentElement.scrollTop;
			    }
			    else if (typeof document.body != 'undefined') {
			        scrollPos = document.body.scrollTop;
			    }
			    document.cookie="scrollTop="+scrollPos; //存储滚动条位置到cookies中
			}

			window.onload = function()
			{ 
			    if(document.cookie.match(/scrollTop=([^;]+)(;|$)/)!=null){
			        var arr=document.cookie.match(/scrollTop=([^;]+)(;|$)/); //cookies中不为空，则读取滚动条位置
			        document.documentElement.scrollTop=parseInt(arr[1]);
			        document.body.scrollTop=parseInt(arr[1]);
			    }
			}
		</script>
		<script type="text/javascript">
			function first(){
				window.location.href='newSortList?sort_miaoshu=${sort_miaoshu}&&page=${1}&&rows=${pageSize}';
			}
			function end(){
				window.location.href='newSortList?sort_miaoshu=${sort_miaoshu}&&page=${count == 0 ? 1:count}&&rows=${pageSize}';
			}
			function er(){
				var page=${page+1 };
				var count=${count };
				if(page > count){
					return false;
				}else{
					window.location.href='newSortList?sort_miaoshu=${sort_miaoshu}&&page=${page+1}&&rows=${pageSize }';
				}
			}
			function san(){
				var page=${page+2 };
				var count=${count };
				if(parseInt(page) > parseInt(count)){
					return false;
				}else{
					window.location.href='newSortList?sort_miaoshu=${sort_miaoshu}&&page=${page+2}&&rows=${pageSize }';
				}
			}
			function si(){
				var page=${page+3 };
				var count=${count };
				if(parseInt(page) > parseInt(count)){
					return false;
				}else{
					window.location.href='newSortList?sort_miaoshu=${sort_miaoshu}&&page=${page+3}&&rows=${pageSize }';
				}
			}
			function previous(){
				var page=${page == 1};
				if(page){
					return false;
				}else{
					window.location.href='newSortList?sort_miaoshu=${sort_miaoshu}&&page=${page-1}&&rows=${pageSize }';
				}
			}
			function next(){
				var page=${count <= page};
				if(page){
					return false;
				}else{
					window.location.href='newSortList?sort_miaoshu=${sort_miaoshu}&&page=${page+1}&&rows=${pageSize }';
				}
			}
		</script>
	</body>
</html>