<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=utf-8"%>
	

<%@ include file="../../../include/defined.jsp"%>
	<jsp:include page="../../../include/header.jsp" flush="true">
		<jsp:param value="module_detail" name="header" />
	</jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>在芯间-最专业的电子元器件查询平台</title>
		<style >
			#documenttable{
				border-collapse:collapse;
				text-align: center;
			}
			#documenttable td{
				border:1px #DDDDDD solid;
				padding: 2px 2px 2px 2px;
				width: 600px;
			}
		</style>
	</head>
		<script>
			$.ajax({
	            type:"post",
	            url:"queryByrandomOrder",
	            async:true,
	            dataType: "json",
	            success : function(data){
	            	$('#chengjiao').html(data.msg);
	            }
	        });
		</script>
	<body>
		<div style="border: 1px solid #DDDDDD;margin-top: 20px;width: 1200px">
			<div style="background-color: #DDDDDD;height:30px;margin-top: -5px">
				<p style="font-size: 15px;margin-left: 20px;padding-top: 5px">
					您当前的位置 : 首页  
					<c:if test="${product_primary != null && product_primary != ''}">
						<a href="module?product_primary=${product_primary}">
							<span style="font-weight: bold;color: blue;">> ${product_primary} </span>
						</a>
					</c:if>
					<c:if test="${product_second != null && product_second != ''}">
						<a href="module?product_second=${product_second}">
							<span style="font-weight: bold;color: blue;">> ${product_second} </span>
						</a>
					</c:if>
					<c:if test="${module_product != null && module_product != ''}">
						<a href="module?product_second=${module_product}">
							<span style="font-weight: bold;color: blue;">> ${module_product} </span>
						</a>
					</c:if>
				</p>
			</div>
			<div style="background-color: #F3F3F3;height:40px;margin-top: -5px">
				<p style="font-size: 15px;margin-left: 20px;padding-top: 10px">
					您已选择 : <span style="font-weight: bold;"> ${product_second} </span>
				</p>
			</div>
		</div>
			<div>
				<h1 style="color: #979693;font-size: 20px;margin-top: 20px;margin-bottom: 20px">
					${product.product_miaoshu}
				</h1>
			</div>
		<div class="lanrenzhijia">
			<!-- 大图begin -->
			<div id="preview" class="spec-preview"> 
				<span class="jqzoom">
					<c:forEach items="${product.pimgList}" var="order">
						<c:if test="${order.p_imgstauts == '1'}">
							<img jqimg="<%=basePath%>upload/${order.p_imgname}" src="<%=basePath%>upload/${order.p_imgname}" />
						</c:if>
					</c:forEach>
				</span> 
			</div>
			<!-- 大图end -->
			<!-- 缩略图begin -->
			<div class="spec-scroll"> 
			  <a class="prev">&lt;</a> 
			  <a class="next">&gt;</a>
			  <div class="items">
			    <ul>
			       <c:forEach items="${product.pimgList}" var="order" >
			      		<li>
							<c:if test="${order.p_imgstauts == '1'}">
								<img  bimg="<%=basePath%>upload/${order.p_imgname}" src="<%=basePath%>upload/${order.p_imgname}" onmousemove="preview(this);">
							</c:if>
				 	 	</li>
				 	 	<li>
							<c:if test="${order.p_imgstauts == '2'}">
								<img  bimg="<%=basePath%>upload/${order.p_imgname}" src="<%=basePath%>upload/${order.p_imgname}" onmousemove="preview(this);">
							</c:if>
				 	 	</li>
				 	 	<li>
							<c:if test="${order.p_imgstauts == '3'}">
								<img  bimg="<%=basePath%>upload/${order.p_imgname}" src="<%=basePath%>upload/${order.p_imgname}" onmousemove="preview(this);">
							</c:if>
				 	 	</li>
				   </c:forEach>
			    </ul>
			  </div>
			</div>
			<!-- 缩略图end -->
		</div>
		<div style="margin-left: 400px;margin-top: -415px">
			<h1 style="font-size: 20px">
				${product_primary}/${module_product}
			</h1>
			<div style="background-color: #F3F3F3">
				<p style="padding-left: 20px;padding-top: 20px">商品价格 : </p>
				<div style="margin-left: 100px;">
					<c:forEach items="${product.discountList}" var="order" varStatus="status">
						<c:if test="${product.productuuid eq order.discount_pid }">
							<p style="margin-top: 10px;font-weight: bold;color: blue">
								${order.discount_numbermin}
								<c:if test="${order.discount_numbermax !=0  }">
									~${order.discount_numbermax}
								</c:if>
								<c:if test="${order.discount_numbermax ==0  }">
									<span style="color: red;">
										+
									</span>
								</c:if>
								${order.discount_unit} : 
							</p>
						</c:if>
					</c:forEach>
				</div>
				<div style="margin-left: 230px;margin-top: -95px">
					<c:forEach items="${product.discountList}" var="order" varStatus="status">
						<c:if test="${product.productuuid eq order.discount_pid }">
							<p style="margin-top: 10px;font-weight: bold;color: red">
								￥ ${order.discount_price}元
							</p>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<p>库存数量  : ${product.isgoodsinstock}</p>
			<p>商品类别  : ${product_primary}</p>
			<p>商品类型  : ${product.product_second}</p>
			<p>当前浏览量  : ${ran} 次</p>
			<p style="color: white;width: 150px;font-size: 20px;background-color: #FFA500;text-align: center;padding-bottom: 15px;padding-top: 15px;">
				<a class="xuanzhe" href="javascript:void(0)" style="color: white;">加入购物车</a>
			</p>
		</div>
		<div style="margin-top: 110px;">
			<div>
				<button id="button1">商品详情</button>
			</div>
			<textarea id="textarea" style="line-height: 30px;padding-top: 10px;border: none;outline:none;width: 100%;overflow:hidden; resize:none;font-size: 15px;font-weight: bold;color: blue;" readonly="readonly">${product.document}</textarea>
			<div class="div" style="display:inline-block;*display:inline;*zoom:1;line-height: 30px;display:none;">
				<c:forEach items="${documentList}" var="documentList" varStatus="status">
						<p style="font-size: 16px;color: blue;font-weight: bold;">${documentList}</p>
				</c:forEach>
			</div>
			<%-- <div style="text-align: center;background-color: #EEEEEE;padding-top: 15px;padding-bottom: 15px;">
				<span style="font-weight: bold;color: #979693;">所属分类   :  </span>
				<span style="font-weight: bold;color: #FFA500;">
					<a href="module?product_second=${product_second}">
						<span style="font-weight: bold;"> ${product_second} </span>
					</a>
				</span>
			</div>
			<div >
				<c:if test="${product.document != null}">
					<table id="documenttable" cellpadding="0" cellspacing="0">
						<tr style="background-color: #4a5775">
							<td colspan="2" style="padding-top: 10px;padding-bottom: 10px;color: white">
								产品文档
							</td>
						</tr>
						<tr>
							<c:forEach items="${documentList}" var="documentList" varStatus="status">
								<td>
									${documentList}
								</td>
								<c:if test="${status.count%2 == 0}">
									</tr>
									<tr>
								</c:if>
							</c:forEach>
						</tr>
					</table>
				</c:if>
			</div>
		</div> --%>
		
		<hr
			style="border: 1px solid #ff0000; margin-top: 30px;; width: 1346px; margin-left: -75px;" />
		<div
			style="text-align: center; width: 1346px; margin-left: -75px; background-color: #F0F0F0">
			<img src="logo/renzheng.jpg">
		</div>
	
		<div
			style="background-color: #87CEFA; width: 1346px; margin-left: -75px;height: 200px">
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
		$(function(){
			$(".xuanzhe").on("click", function(){
				 p_uid = '${product.productuuid}';
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
		var textareaHeight = $('.div').height();
		$("#textarea").css({
			"height":textareaHeight-30
		});
		
	</script>
</html>
	