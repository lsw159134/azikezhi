	<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
		contentType="text/html; charset=utf-8"%>
	<%@ include file="../../../include/defined.jsp"%>
	<jsp:include page="../../../include/sortHeader.jsp" flush="true">
		<jsp:param value="moduleList" name="header" />
	</jsp:include>
	<body >
		<div style="width: 100%;text-align: center;margin-top: 50px">
			<a href="javascript:window.location='cont'">
				<button class="button1" style="width: 100px;font-size: 15px;height: 50px">首页</button>
			</a>
			<a href="addModule">
				<button class="button1" style="width: 100px;font-size: 15px;height: 50px">添加</button>
			</a>
		</div>
		<div style="width: 100%;margin-top: 50px">
	       	当前第 <span style="font-weight:bold">${page }</span> 页 / 共 <span style="font-weight:bold">${count}</span> 页&nbsp;&nbsp; 共 <span style="font-weight:bold">${total}</span> 条记录&nbsp;&nbsp;
	       	<button class="button1" style="width: 40px;font-size: 13px;height: 20px" onclick = "first()">首页</button>&nbsp;
	       	<c:if test="${count > 1}">
	       		<button class="button1" style="width: 50px;font-size: 13px;height: 20px" onclick = "previous()" <c:if test='${page == 1}'> style='opacity: 0.2;' </c:if>>上一页</button>&nbsp;
	       		<button class="button2"  onclick = "er()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>${page+1 }</button>&nbsp;
	       		<button class="button2"  onclick = "san()" <c:if test='${count <= page+1}'> style='opacity: 0.2;' </c:if>>${page+2 }</button>&nbsp;
	       		<button class="button2"  onclick = "si()" <c:if test='${count <= page+2}'> style='opacity: 0.2;' </c:if>>${page+3 }</button>&nbsp;
	       	</c:if>
	       	<button class="button1" style="width: 50px;font-size: 13px;height: 20px" onclick = "next()" <c:if test='${count <= page}'> style='opacity: 0.2;' </c:if>>下一页</button>&nbsp;
	       	<button class="button1" style="width: 40px;font-size: 13px;height: 20px" onclick = "end()">尾页</button>
	       	<input style="margin-left: 300px" type="text" id="product" value="${product}" /><input style="width: 60px;height: 25px" type="button" id="sousuo" class="button1" value="搜索" />
     	</div>
		<div class="div2" >
			<table id="table2" class="table2" cellpadding="2" cellspacing="2" border="1px">
				<tr style="background-color: #C7C7C7;font-weight: bold;">
					<td style="width: 40px">序号</td>
					<td style="width: 150px">图片</td>
					<td style="width: 180px">型号</td>
					<td style="width: 60px;">库存</td>
					<td style="width: 140px">描述</td>
					<td style="width: 140px">一级</td>
					<td style="width: 140px">二级</td>
					<td style="width: 140px">区间</td>
					<td style="width: 140px">价格</td>
					<td style="width: 70px">操作</td>
				</tr>
			</table>
			<table id="table3" cellpadding="2" cellspacing="2" border="1px" >
				<c:forEach items="${moduleList}" var="moduleList" varStatus="status">
					<tr class="zxc">
						<td style="width: 40px;font-weight: bold;">${status.count}</td>
						<td style="width: 150px">
							<c:forEach items="${moduleList.pimgList}" var="order" varStatus="status">
								<c:if test="${order.p_imgstauts == '1'}">
									<a class="apreview" href="#">
										<img  style="width: 40px;height: 40px;" src="<%=basePath%>upload/${order.p_imgname}">
									</a>
									<input type="hidden" class="p_imgname" value="${order.p_imgname}" />
								</c:if>
							</c:forEach>
						</td>
						<td style="width: 180px;word-wrap:break-word;word-break:break-all;">
							<a title="${moduleList.product}" href="javascript:window.open('<%=basePath%>module?product_primary=${product_primary}&&product_second=${product_second}&&product=${product}')">
								${moduleList.product}
							</a>
						</td>
						<td style="width: 60px;">${moduleList.lotnumber}</td>
						<td style="width: 140px">${moduleList.product_miaoshu}</td>
						<td style="width: 140px">${moduleList.primary.primary_name}</td>
						<td style="width: 140px">${moduleList.second.second_name}</td>
						<td style="width: 140px">
							<c:forEach items="${moduleList.discountList}" var="order" varStatus="status">
								<c:if test="${moduleList.productuuid eq order.discount_pid }">
									<p >
										${order.discount_numbermin}
										<c:if test="${order.discount_numbermax !=0  }">
											~${order.discount_numbermax}
										</c:if>
										<c:if test="${order.discount_numbermax ==0  }">
											<span style="color: red;">
												+
											</span>
										</c:if>
										${order.discount_unit}
									</p>
								</c:if>
							</c:forEach>
						</td>
						<td style="width: 140px">
							<c:forEach items="${moduleList.discountList}" var="order" varStatus="status">
								<c:if test="${moduleList.productuuid eq order.discount_pid }">
									<p >
										${order.discount_price}元
									</p>
								</c:if>
							</c:forEach>
						</td>
						<td style="width: 70px"><a href="select_updateModule?productuuid=${moduleList.productuuid}">修改</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div style="margin-top: 50px">
			<%@ include file="../../../include/footer.jsp"%>
		</div>
		<script type="text/javascript">
		/* imagePreview = function () {
            xOffset = 200;  
            yOffset = 200;  
            $(".apreview").hover(function (e) {
            	var $target=$(e.target);
            	var src = $target.attr("src");
               t = $('.img_product').val();//显示在图片下的标题  
                title = "";  
                var c = (t != "") ? "<br/>" + t : "";   
                 $("body").append("<p id='preview'><img src='"+src+"'" +"style='height:200px;width:200px;'"+ "/>" + c+ "</p>"); 
                 $("body").append("<div id='preview'><img src='"+src+"'" +"style='height:200px;width:200px;'"+ "/>" + "</div>");
                $("#preview").css({ 
                	 "margin-left":(e.pageX - xOffset)+"px",
                	"margin-top":(e.pageY - yOffset)+"px" 
                	 "top":(e.pageY - yOffset) + "px",
                	"left":(e.pageX + xOffset) + "px" 
                 }).fadeIn("fast");   
            },  
            function () {  
                 title = t;
                 $("#preview").remove();  
            });  
            $(".apreview").mousemove(function (e) {  
            	 $("#preview").css({
                 	"top":(e.pageY - yOffset) + "px",
                 	"left":(e.pageX + xOffset) + "px"
                 });  
            });  
        };
        $(document).ready(function () {  
            imagePreview();  
        }); */
			$(function () {
				$('#sousuo').click(function(){
					var product = document.getElementById('product').value;
					window.location.href="moduleList?product="+product;
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
				window.location.href='moduleList?product_primary=${product_primary}&&product=${product}&&page=${1}&&rows=${pageSize}';
			}
			function end(){
				window.location.href='moduleList?product_primary=${product_primary}&&product=${product}&&page=${count == 0 ? 1:count}&&rows=${pageSize}';
			}
			function er(){
				var page=${page+1 };
				var count=${count };
				if(page > count){
					return false;
				}else{
					window.location.href='moduleList?product_primary=${product_primary}&&product=${product}&&page=${page+1}&&rows=${pageSize }';
				}
			}
			function san(){
				var page=${page+2 };
				var count=${count };
				if(parseInt(page) > parseInt(count)){
					return false;
				}else{
					window.location.href='moduleList?product_primary=${product_primary}&&product=${product}&&page=${page+2}&&rows=${pageSize }';
				}
			}
			function si(){
				var page=${page+3 };
				var count=${count };
				if(parseInt(page) > parseInt(count)){
					return false;
				}else{
					window.location.href='moduleList?product_primary=${product_primary}&&product=${product}&&page=${page+3}&&rows=${pageSize }';
				}
			}
			function previous(){
				var page=${page == 1};
				if(page){
					return false;
				}else{
					window.location.href='moduleList?product_primary=${product_primary}&&product=${product}&&page=${page-1}&&rows=${pageSize }';
				}
			}
			function next(){
				var page=${count <= page};
				if(page){
					return false;
				}else{
					window.location.href='moduleList?product_primary=${product_primary}&&product=${product}&&page=${page+1}&&rows=${pageSize }';
				}
			}
		</script>
	</body>
</html>