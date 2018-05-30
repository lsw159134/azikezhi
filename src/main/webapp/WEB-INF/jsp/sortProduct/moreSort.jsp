<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <jsp:include page="../../../include/moreHeader.jsp" flush="true">
		<jsp:param value="more" name="header"/>
   </jsp:include>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			body{
				font: 微软雅黑;
				font-size: 13px;
			}
			body,.div{
				width: 1200px;
			}
			.ul1{
				width: 1200px;
				margin-left: 50px;
			}
			.ul1 li{ 
            	float: left;
            	width: 285px;
            	height: 30px;
            	line-height: 40px;
            	list-style: disc;
            	color: #8B7D6B;
			}
			.ul1 li a:hover{ 
				color:red;
			}
			.ul1 li:hover{ 
				color:red;
			}
			.ul1 a{
				text-decoration: none;
				color: #8B795E;
			}
			.li1{
				background:-webkit-gradient(linear, left top, left bottom, from(white), to(#EEEED1));
				height: 30px;
				font-weight: bold;
				font-size:15px;
				list-style: none;
				padding: 0px 0px 5px 50px;
				margin-left: -50px;
			}
			.divMid{
				margin-top:30px;
				border: 1px #EEEED1 solid;
				padding-bottom: 30px;
			}
			.divMid:AFTER{
				content: "";
				display: block;
				clear: both;
			}
		</style>
	</head>
	<body>
		<div class="divTop">
			<span>当前位置 : </span><a style="font-weight: bold;"> 首页 </a><a style="font-weight: bold;"> > 全部分类</a>
			<c:forEach items="${primaryList }" var="primary">
				<div class="divMid">
					<ul class="ul1">
						<li class="li1" style="width: 1148px;list-style: none;">
							<a style="color: #FFA500;" href="javascript:void(0)">${primary.primary_name}</a>
						</li>
						<c:forEach items="${primary.secondList}" var="second" varStatus="status">
							<li >
								<c:if test="${primary.primary_name == '模块'}">
									<a  href="module?product_second=${second.second_name }">${second.second_name }</a>
								</c:if>
								<c:if test="${primary.primary_name != '模块'}">
									<a  href="shaixuanse1?primary_name=${primary.primary_name}&&product_second=${second.second_name }">${second.second_name }</a>
								</c:if>
							</li>
						</c:forEach>
					</ul>
				</div>
			</c:forEach>
		</div>
		
		<hr
			style="border: 1px solid #ff0000; margin-top: 100px;; width: 1346px; margin-left: -74px;" />
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
			<footer>
				版权所有 &copy; 2016 - 2017 在芯间 保留所有权利 | <a href="http://www.miibeian.gov.cn/"><img src="img/img/icp.png" /> 粤ICP备15008173号-2 </a>|
			</footer>
		</div>
		
		<div class="float_qq" style="top: 280px;">
			<ul>
				<li class="float_qq1">
					<a href="#">
						<img width="24" height="24" src="logo/indextop.png">
					</a>
				</li>
				<li class="float_qq2" style="left: 0px;">
					<a title="点击在线客服" href="javascript:void(0)" onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=2938492659&site=qq&menu=yes');">
						<img width="24" height="24" src="logo/indexQQ.png">在线客服
					</a>
				</li>
				<li class="float_qq3" style="left: 0px;">
					<a href="javascript:void(0)" title="拨打客服热线">
						<img width="24" height="24" src="logo/indextel.png">0755-82720040
					</a>
				</li>
				<li class="float_qq4"  style="left: 0px;">
					<a href="//shang.qq.com/wpa/qunwpa?idkey=e33dbf5666b6dd8a8a3bbe9d5420917613490e4ec21c30cd0c43a26e6a06459e" title="点击可加群">
						<img width="24" height="24" src="logo/indexqqun.png">129896199		
					</a>
				</li>
				<li class="float_qq5">
					<a title="扫码加微信" href="javascript:void(0)">
						<img width="24" height="24" src="logo/indexweixin.png">				
					</a>
					<div class="float_shwx" style="display: none;">
						<img width="188" height="188" alt="微信" src="img/img/webchat.png">				
					</div>            
				</li>
			</ul>
		</div>
	</body>
	<script type="text/javascript">
		$(function(){
			
			$.ajax({
	            type:"post",
	            url:"queryByrandomOrder",
	            async:true,
	            dataType: "json",
	            success : function(data){
	            	$('#chengjiao').html(data.msg);
	            }
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
		
		
		//右边浮动框
		$('.float_qq2').hover(function(){
			
			$(this).animate({"left":"-70px"},350)
			
			},function(){
				
				$(this).animate({"left":"0"},350)
				
				})	
		
		$('.float_qq3').hover(function(){
			
			$(this).animate({"left":"-116px"},350)
			
			},function(){
				
				$(this).animate({"left":"0"},350)
				
				})	
		
		$('.float_qq4').hover(function(){
			
			$(this).animate({"left":"-90px"},350)
			
			},function(){
				
				$(this).animate({"left":"0"},350)
				
				})
		
		
		$('.float_qq5').hover(function(){
			
			$(this).find('.float_shwx').show();
			
			},function(){
				
				$(this).find('.float_shwx').hide();
				
				})
	</script>
</html>