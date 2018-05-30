	<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
		contentType="text/html; charset=utf-8"%>
	<%@ include file="../../../include/defined.jsp"%>
	<jsp:include page="../../../include/header.jsp" flush="true">
		<jsp:param value="module" name="header" />
	</jsp:include>
	<body >
		<div style="border: 1px solid #DDDDDD;margin-top: 20px">
			<div style="background-color: #DDDDDD;height:30px;margin-top: -5px">
				<p style="font-size: 15px;margin-left: 20px;padding-top: 5px">
					您当前的位置 : 首页  
					<c:if test="${product_primary != null}">
						<a href="module?product_primary=${product_primary}">
							<span style="font-weight: bold;color: blue;">> ${product_primary} </span>
						</a>
					</c:if>
					<c:if test="${product_second != null}">
						<a href="module?product_second=${product_second}">
							<span style="font-weight: bold;color: blue;">> ${product_second} </span>
						</a>
					</c:if>
				</p>
			</div>
			<div style="background-color: #F3F3F3;height:40px;margin-top: -5px">
				<p style="font-size: 15px;margin-left: 20px;padding-top: 10px">
					商品筛选共 : <span style="font-weight: bold;"> ${total} </span> 件
				</p>
			</div>
			<div style="background-color: #EEE9E9;height:40px;margin-top: -5px">
				<p style="font-size: 15px;margin-left: 20px;padding-top: 10px">
					您已选择 : <span style="font-weight: bold;"> ${product_second} </span>
				</p>
			</div>
			<div style="height:80px;margin-top: -5px">
				<p style="font-size: 15px;margin-left: 20px;padding-top: 10px">
					分类 : <c:forEach items="${secondList}" var="secondList" varStatus="status">
						<a href="module?product_second=${secondList.second_name}">
							<span style="font-weight: bold;color: blue;"> ${secondList.second_name} </span>
						</a>
					 </c:forEach>
				</p>
			</div>
		</div>
		<div style="width: 100%;margin-top: 30px;margin-bottom: 20px">
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
	       	<input style="margin-left: 300px" type="text" id="module_product" value="${product}" /><input style="width: 60px;height: 25px" type="button" id="sousuo" class="button1" value="搜索" />
     	</div>
		<div class="div_table">
			<table class="table1" cellpadding="0" cellspacing="0">
				<tr>
					<c:forEach items="${moduleList}" var="moduleList" varStatus="status">
						<td style="border-bottom :1px #FFA500 solid;">
							<a href="module_detail?productuuid=${moduleList.productuuid}&&module_product=${moduleList.product}&&product_primary=${product_primary}&&product_second=${product_second}"><!-- module_detail?productuuid=${moduleList.productuuid}&&module_product=${moduleList.product}&&product_primary=${product_primary}&&product_second=${product_second} -->
								<c:forEach items="${moduleList.pimgList}" var="order" >
									<c:if test="${order.p_imgstauts == '1'}">
										<p style="width: 180px;margin-left: 60px;text-align: center;">
											<img style="width: 180px;height: 180px" src="<%=basePath%>upload/${order.p_imgname}">
										</p>
									</c:if>
								</c:forEach>	
							</a>
							<p style="width: 180px;margin-left: 60px;text-align: center;">
								${moduleList.product} 
							</p>
							<p title="${moduleList.product_miaoshu}" style="width: 180px;margin-left: 60px;text-align: center;text-overflow: -o-ellipsis-lastline;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;height: 40px">
								${moduleList.product_miaoshu}
							</p>
							<c:forEach items="${moduleList.discountList}" var="order">
								<c:if test="${order.discount_status == '3'}">
									<p style="font-weight: bold;color:red;width: 180px;margin-left: 60px;text-align: center;">
										￥ ${order.discount_price}
									</p>
								</c:if>
							</c:forEach>
							<p style="width: 180px;margin-left: 60px;text-align: center;">
								<a href="pay?productuid=${moduleList.productuuid}&number=1&fapiao=1&expressname=2">
									<img style="width:70px;height:25px;" src="logo/goumai.png" alt="立即购买">
								</a>
								<a href="javascript:void(0);" class="xuanzhe" data-remodal-target="xuanzheli" data-price="${moduleList.price}"  data-uid="${moduleList.productuuid}" data-product="${moduleList.product}">
									<img style="width:70px;height:25px;" src="logo/gouwuche.png" />
								</a>
							</p>
						</td>
						<c:if test="${status.count%4 == 0}">
							</tr>
							<tr>
						</c:if>
					</c:forEach>
				</tr>			
			</table>
		</div>
		<div style="width: 100%;margin-top: 30px">
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
     	</div>
		<hr
			style="border: 1px solid #ff0000; margin-top: 30px;; width: 1346px; margin-left: -75px;" />
		<div
			style="text-align: center; width: 1346px; margin-left: -73px; background-color: #F0F0F0">
			<img src="logo/renzheng.jpg">
		</div>
	
		<div
			style="background-color: #87CEFA; width: 1346px; margin-left: -73px;height: 200px">
			<div style="margin: 50px 0px 0px 75px; position: absolute;">
				<p style="display: inline;">新手指南</p>
				<p class="sp">
					<a href="javascript:void(0)">注册登录</a>
				</p>
				<p class="sp">
					<a href="javascript:void(0)">用户协议</a>
				</p>
				<p class="sp">
					<a href="javascript:void(0)">发票须知</a>
				</p>
				<p class="sp">
					<a href="javascript:void(0)">退换货说明</a>
				</p>
			</div>
	
			<div style="margin: 50px 0px 0px 250px; position: absolute;">
				<p style="display: inline;">商家入驻</p>
				<p class="sp">
					<a href="javascript:void(0)">入驻须知</a>
				</p>
				<p class="sp">
					<a href="javascript:void(0)">入驻流程</a>
				</p>
				<p class="sp">
					<a href="javascript:void(0)">入驻协议</a>
				</p>
			</div>
			<div style="margin: 50px 0px 0px 425px; position: absolute;">
				<p style="display: inline;">配送方式</p>
				<p class="sp">
					<a href="javascript:void(0)">国内交货</a>
				</p>
				<p class="sp">
					<a href="javascript:void(0)">香港交货</a>
				</p>
				<p class="sp">
					<a href="javascript:void(0)">上门自提</a>
				</p>
				<p class="sp">
					<a href="javascript:void(0)">验货签收</a>
				</p>
			</div>
			<div style="margin: 50px 0px 0px 600px; position: absolute;">
				<p style="display: inline;">支付方式</p>
				<p class="sp">
					<a href="javascript:void(0)">在线支付</a>
				</p>
				<p class="sp">
					<a href="javascript:void(0)">银行汇款</a>
				</p>
				<p class="sp">
					<a href="javascript:void(0)">预付款服务</a>
				</p>
				<p class="sp">
					<a href="javascript:void(0)">支付安全</a>
				</p>
			</div>
			<div style="margin: 50px 0px 0px 775px; position: absolute;">
				<p style="display: inline;">特色服务</p>
				<p class="sp">
					<a href="javascript:void(0)">积分返现</a>
				</p>
			</div>
			<div style="margin: 50px 0px 0px 1100px; position: absolute;">
				<img style="width: 100px; height: 100px" src="img/img/webchat.png" />
			</div>
			<div style="margin: 150px 0px 0px 1135px; position: absolute;">微信</div>
			<hr style="border-right: lime 1px dashed; border-top: lime 1px dashed; left: 150px; BORDER-LEFT: lime 1px dashed; WIDTH: 1px; BORDER-BOTTOM: lime 1px dashed; TOP: 100px; HEIGHT: 199px; margin-left: 900px">
			<div style="margin: -150px 0px 0px 909px;">
				<img style="width: 50px; height: 50px" src="logo/logo.png">
			</div>
			<div
				style="margin: -30px 0px 0px 970px; font-weight: bolder; font-size: 17px; color: #EE7600">
				在芯间</div>
			<div
				style="margin: 10px 0px 0px 920px; font-weight: bolder; font-size: 17px;">ZAIXINJIAN.COM</div>
		</div>
		<div style="margin-top: -100px">
			<%@ include file="../../../include/footer.jsp"%>
		</div>
	</body>
	<script type="text/javascript">
		$(function () {
			$.ajax({
	            type:"post",
	            url:"queryByrandomOrder",
	            async:true,
	            dataType: "json",
	            success : function(data){
	            	$('#chengjiao').html(data.msg);
	            }
	        });
			
			$('#sousuo').click(function(){
				var product = document.getElementById('module_product').value;
				window.location.href='module?product_primary=${product_primary}&&product_second=${product_second}&&product='+product;
			});
			
			 $(".xuanzhe").on("click", function(){
				 p_uid = $(this).data("uid");
				 $.post("addCart?pid="+p_uid,
		            function(data){
						if(data.result=="fail"){
							swal({
								title: "系统提示",
								text: data.errorMsg,
								type: "success",
								confirmButtonColor: "#007AFF"
							});
						}else if(data.result=="seccuss"){
							window.location.href="myCart";
						}
					}
			   	)
	       });
		});
	</script>
	<script>
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
			window.location.href='module?product_primary=${product_primary}&&product_second=${product_second}&&product=${product}&&page=${1}&&rows=${pageSize}';
		}
		function end(){
			window.location.href='module?product_primary=${product_primary}&&product_second=${product_second}&&product=${product}&&page=${count == 0 ? 1:count}&&rows=${pageSize}';
		}
		function er(){
			var page=${page+1 };
			var count=${count };
			if(page > count){
				return false;
			}else{
				window.location.href='module?product_primary=${product_primary}&&product_second=${product_second}&&product=${product}&&page=${page+1}&&rows=${pageSize }';
			}
		}
		function san(){
			var page=${page+2 };
			var count=${count };
			if(parseInt(page) > parseInt(count)){
				return false;
			}else{
				window.location.href='module?product_primary=${product_primary}&&product_second=${product_second}&&product=${product}&&page=${page+2}&&rows=${pageSize }';
			}
		}
		function si(){
			var page=${page+3 };
			var count=${count };
			if(parseInt(page) > parseInt(count)){
				return false;
			}else{
				window.location.href='module?product_primary=${product_primary}&&product_second=${product_second}&&product=${product}&&page=${page+3}&&rows=${pageSize }';
			}
		}
		function previous(){
			var page=${page == 1};
			if(page){
				return false;
			}else{
				window.location.href='module?product_primary=${product_primary}&&product_second=${product_second}&&product=${product}&&page=${page-1}&&rows=${pageSize }';
			}
		}
		function next(){
			var page=${count <= page};
			if(page){
				return false;
			}else{
				window.location.href='module?product_primary=${product_primary}&&product_second=${product_second}&&product=${product}&&page=${page+1}&&rows=${pageSize }';
			}
		}
	</script>
	<script type="text/javascript">
		$(function(){
			$('.jiantou').html("<img src='logo/down.png'>");
			var $subblock = $(".subpage"), $head=$subblock.find('h2'), $ul = $("#proinfo"), $lis = $ul.find("li"), inter=false;
			$head.click(function(e){
				e.stopPropagation();
				if(!inter){
					$('.jiantou').html("<img style='margin-top:-7px;position:absolute;' src='logo/up.png'>");
					$ul.show();
				}else{
					$('.jiantou').html("<img src='logo/down.png'>");
					$ul.hide();
				}
				inter=!inter;
			});
			
			$ul.click(function(event){
				event.stopPropagation();
			});
			
			$(document).click(function(){
				$ul.hide();
				inter=!inter;
			});
	
			$lis.hover(function(){
				var primary = $(this).find('.primary').html();
				var s = '';
				$.ajax({
					  url:"indexSeleSecond",
					  type:"POST",
					  data:{
						  primary_name:primary
					  },
					  contentType:"application/x-www-form-urlencoded; charset=utf-8",
					  dataType:"json",
					  success: function(data){
						  for(var o in data) {
								if(o % 2 != 0){
									s+=("<span><em><a style='margin-left:90px' href='shaixuanse1?primary_name="+primary+"&&product_second="+data[o].second_name+"'>"+data[o].second_name+"</a></em></span></br>");
								}else{
									s+=("<span><em><a href='shaixuanse1?primary_name="+primary+"&&product_second="+data[o].second_name+"'>"+data[o].second_name+"</a></em></span>");
								}
							}
							$('.prosmore').html('');
							$('.prosmore').html(s);
					  }
					});
				if(!$(this).hasClass('nochild')){
					$(this).addClass("prosahover");
					$(this).find(".prosmore").removeClass('hide');
				}
			},function(){
				if(!$(this).hasClass('nochild')){
					if($(this).hasClass("prosahover")){
						$(this).removeClass("prosahover");
					}
					$(this).find(".prosmore").addClass('hide');
				}
			});
			
		});
	</script>
</html>