<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
    String contextPath = request.getContextPath();
    String realPath = request.getSession().getServletContext().getRealPath("/");
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + contextPath + "/";
%>
<!DOCTYPE HTML>
<html>
	<head>
	    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	    <!--[if lt IE 9]>
	    <script type="text/javascript" src="lib/html5.js"></script>
	    <script type="text/javascript" src="lib/respond.min.js"></script>
	    <script type="t11ext/javascript" src="lib/PIE_IE678.js"></script>
	    <![endif]-->
	    <link rel="stylesheet" type="text/css" href="user/static/h-ui/css/H-ui.min.css" />
	    <link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/css/H-ui.admin.css" />
	    <link rel="stylesheet" type="text/css" href="user/lib/Hui-iconfont/1.0.7/iconfont.css" />
	    <link rel="stylesheet" type="text/css" href="user/lib/icheck/icheck.css" />
	    <link rel="stylesheet" type="text/css" href="user/static/h-ui.admin/skin/default/skin.css" id="skin" />
	    <!--[if IE 6]>
	    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
	    <script>DD_belatedPNG.fix('*');</script>
	    <![endif]-->
	    <title>购买记录/快递单号</title>
	    <style type="text/css">
	    	a:hover{
	    		text-decoration: none;
	    		color: red;
	    	}
	    	span,a,div,p,td{
	    		color:#666;
	    		font-size: 13px;
	    		font:微软雅黑;
	    	}
	    	td{
	    		padding-left: 20px;
	    	}
	    	.backup:HOVER{
	    		text-decoration: underline;
	    	}
	    </style>
	</head>
	
	<body style="width: 1200px;margin:0 auto;">
		<div style="background-color: #E5E5E5;height: 30px;width: 1368px;margin-left: -84px;">
			<div style="text-align: left; margin-left: 84px;padding-top: 4px">
				<span style="font-size: 10px">客服热线:0755-82720040</span> <b>|</b>
				 <span style="font-size: 10px">交易时间：9:00-18:00</span> <b>|</b> 
				 <span style="font-size: 10px">在线客服</span>
				 <a href="javascript:void(0)"
					onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=2829795872&site=qq&menu=yes');">
					<img src="<%=basePath %>/logo/indexQQ1.png"
					style="width: 15px; height: 15px; margin: 0px 0px -3px 0px" />
				</a><b>|</b>
				<span style="font-size: 10px;">采购交流群:337260650</span> 
			</div>
			<div style="text-align:right;margin-top: -20px;margin-right: 84px;">
				<span id="userName"> <img style="width: 15px; height: 15px" src="<%=basePath%>img/userIcon.png" />
					<a style="font-size: 10px" href="usersystem"><%=session.getAttribute("userName")%></a>
				</span> 
				<span>
					<img src="logo/mydingdan.png">
					<a style="font-size: 10px" href="express">
						我的订单
					</a>
				</span>
				<span >
					<img src="logo/mygouwuche.png">
					<a style="font-size: 10px" href="myCart">
						我的购物车
					</a>
				</span>
				<span><img style="width: 15px; height: 15px" src="logo/userout.png"><a style="font-size: 10px;" href="userOut">&nbsp退出</a></span>	
			</div>
		</div>
		<div style="margin-top: 30px;">
			<a href="index">
				<img style="margin-top: -8px;" src="logo/logo.png" /> 
				<span style="color:#FFA500;font-size: 25px; ">自可知</span>	 
				<span style="color: #FFA500;font-size: 18px;" id="smallTitle">&nbsp;|&nbsp; 专注华强北样品服务</span>
			</a>
		</div>
		
		<div style="height: 1px;background:#FFA500 ;margin-top: 20px;margin-bottom: 10px;"></div>
		<div style="text-align: left;width: 300px;display: inline-block;">
			<span>您当前的位置 : </span>
			<a href="usersystem">首页 > </a>
		    <a href="express">我的订单 > </a>
	        <h style="font-weight: bold;font-size:13px;">订单详情</h>
		</div>
		<div style="width: 870px;text-align: right;display: inline-block;">
			<span style="font-weight: bold;font-size: 15px;color:#FFA500 ">订单时间 : </span>
			<span style="font-weight: bold;color: black;">
				<fmt:formatDate value="${express.edate}" pattern="yyyy/MM/dd HH:mm"/>
			</span>
			
		</div>
		<div style="margin-top: 20px;">
			<table cellpadding="0" cellspacing="0" style="width: 1200px;border: 1px #DDDDDD solid;" border="1">
				<tr>
					<td style="width: 260px;height: 30px;background: #F3F3F3;padding-left: 20px;font-weight: bold;" >
						订单信息
					</td>
					<td rowspan="5" style="padding:30px 0px 40px 30px;">
						<c:if test="${express.status == 1}"><img src="<%=basePath%>/logo/gantan2.png"></c:if>
                        <c:if test="${express.status == 2}"><img src="<%=basePath%>/logo/gantan3.png"></c:if>
                        <c:if test="${express.status == 3}"><img src="<%=basePath%>/logo/gantan4.png"></c:if>
                        <c:if test="${express.status == 4}"><img src="<%=basePath%>/logo/gantan5.png"></c:if>
                        <c:if test="${express.status == 5}"><img src="<%=basePath%>/logo/gantan1.png"></c:if>
                        <c:if test="${express.status == 6}"><img src="<%=basePath%>/logo/gantan6.png"></c:if>
						<span style="font-size: 14px;font-weight: bold;color: black;">
							订单状态 : <c:if test="${express.status == 1}">未付款</c:if>
			                        <c:if test="${express.status == 2}">已付款</c:if>
			                        <c:if test="${express.status == 3}">已收货</c:if>
			                        <c:if test="${express.status == 4}">已完成</c:if>
			                        <c:if test="${express.status == 5}">交易关闭</c:if>
			                        <c:if test="${express.status == 6}">审核中</c:if>
						</span>&nbsp;&nbsp;&nbsp;
						
						<div style="margin-left: 250px;margin-top: -47px;">
					`	 <br/>
					<a class="backup" href="express" style="color: red;font-weight: bold;">
							返回上一页>>
						</a>
					
						</div>
					</td>
				</tr>
				<tr>
					<td style="height: 75px;padding-top: 10px;" valign="top">
						<p style="display: inline-block;width: 60px;line-height: 20px;vertical-align: top;">
							取货地址 :
						</p>
						<p style="display: inline-block;width: 190px;line-height: 20px;">
							<b style="color: black;">请到购买产品对应商家的取货地址取货</b>
						</p>
						<p style="display: inline-block;width: 190px;line-height: 20px;">
							监督电话：0755-82720040 
						</p>
					</td>
				</tr>
				<tr>
					<td style="height: 40px;padding-top: 10px;">
						<p style="display: inline-block;width: 60px;line-height: 20px;vertical-align: top;">
							买家留言 :
						</p>
						<p style="display: inline-block;width: 190px;line-height: 20px;">
							<c:if test="${express.beizhu != null }">
								${express.beizhu }
							</c:if>
							<c:if test="${express.beizhu == null }">
								暂无更新
							</c:if>
						</p>
					</td>
				</tr>
			</table>
		</div>
		<div style="margin-top: 30px;">
			<table cellpadding="0" cellspacing="0" style="text-align: center;height: 50px;border: 1px #AED8FF solid;border-bottom: none;" >
	    		<tr >
	    			<td style="width: 400px;padding-left: 0px;color: black;font-weight: bold;">商品</td>
	    			<td style="width: 150px;padding-left: 0px;color: black;font-weight: bold;">单价</td>
	    			<td style="width: 150px;padding-left: 0px;color: black;font-weight: bold;">数量</td>
	    			<td style="width: 150px;padding-left: 0px;color: black;font-weight: bold;">优惠</td>
	    			<td style="width: 350px;padding-left: 0px;color: black;font-weight: bold;">状态</td>
	    		</tr>
	    	</table>
		</div>
		<c:if test="${express.productuid == null}">
           		<table cellpadding="0" cellspacing="0" style="text-align: center;border: 1px #AED8FF solid;border-collapse:collapse; " border="1">
           			<c:forEach items="${order}" var="order" varStatus="status">
	              		<tr>
	              			<td style="padding-top: 15px;padding-left: 0px;padding-right: 0px;width: 850px;">
	              				<div style="width: 100px;height: 100px;">
	               				<c:if test="${not empty order.p.pimgList}">
									<c:forEach items="${order.p.pimgList}" var="img" varStatus="status">
										<c:if test="${img.p_imgstauts == '1'}">
											<a  href="search?keyword=${order.o_product}&amp;value=product&amp;page=1">
												<img style="width: 60px;height: 60px;" src="<%=basePath%>upload/${img.p_imgname}">
											</a>
										</c:if>
									</c:forEach>
								</c:if>
								<c:if test="${ empty order.p.pimgList}">
									<a href="search?keyword=${order.o_product}&amp;value=product&amp;page=1">
										<img style="width: 60px;height: 60px;" src="<%=basePath%>logo/nulltupian.png">
									</a>
								</c:if>
								<p  title="${order.o_product}"
									style="width: 80px;height: 40px;line-height: 40px;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;padding-left: 10px;">
									<a href="search?keyword=${order.o_product}&amp;value=product&amp;page=1">
										${order.o_product}
									</a>
								</p>
							</div>
							<div style="margin-left: 100px;height: 100px;margin-top: -100px;width: 300px;">
								<p style="width: 100px;display: inline-block;">
		    						<b>公司 : </b>
		    					</p>
		    					<p style="width: 190px;display: inline-block;text-align: left;">
		    						<c:if test="${order.p.supplier eq '样品商城'}">
		    							深圳市力芯周电子商行
		    						</c:if>
		    						<c:if test="${order.p.supplier ne '样品商城'}">
		    							${order.p.supplier}
		    						</c:if>
		    					</p>
		    					<p  style="width: 100px;display: inline-block;">
		    						<b>封装 : </b>
		    					</p>
		    					<p style="width: 190px;display: inline-block;text-align: left;">
		    						${order.p.encapsulation}
		    					</p>
		    					<p  style="width: 100px;float:left;">
		    						<b>取货地址 : </b>
		    					</p>
		    					<p  style="width: 190px;display: inline-block;text-align: left;">
		    						${order.supplier.supplierposition}
		    					</p>
							</div>
							<div style="height: 100px;width: 300px;margin-left: 400px;margin-top: -100px;">
								<p style="display: inline-block;width: 148px;">
									${order.o_one}
								</p>
								<p style="display: inline-block;width: 148px;">
									${order.o_number}
								</p>
							</div>
							<div style="height: 100px;width: 150px;margin-left: 700px;margin-top: -100px;">
	    						<c:if test="${express.discountdescription != null}">￥${express.discountdescription}</c:if>
							</div>
	              			</td>
	              			<td style="padding-left: 0px;padding-top: 15px;padding-right: 0px;width: 350px;">
	              				<div style="height: 100px;width: 347px;">
	              					<c:if test="${express.status == 1}">未付款</c:if>
			    				<c:if test="${express.status == 2}">已付款</c:if>
			    				<c:if test="${express.status == 3}">已收货</c:if>
			    				<c:if test="${express.status == 4}">已完成</c:if>
			    				<c:if test="${express.status == 5}">已取消</c:if>
			    				<c:if test="${express.status == 6}">审核中</c:if>
	              				</div>
	              				
	              			</td>
	              		</tr>
             		</c:forEach>
           		</table>
        </c:if>
        <c:if test="${express.productuid != null}">
           		<table cellpadding="0" cellspacing="0" style="text-align: center;border: 1px #AED8FF solid;border-collapse:collapse; " border="1">
              		<tr>
              			<td style="padding-top: 15px;padding-left: 0px;padding-right: 0px;width: 850px;">
              				<div style="width: 100px;height: 100px;">
               				<c:if test="${not empty product.pimgList}">
								<c:forEach items="${product.pimgList}" var="img" varStatus="status">
									<c:if test="${img.p_imgstauts == '1'}">
										<a  href="search?keyword=${product.product}&amp;value=product&amp;page=1">
											<img style="width: 60px;height: 60px;" src="<%=basePath%>upload/${img.p_imgname}">
										</a>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${ empty product.pimgList}">
								<a href="search?keyword=${product.product}&amp;value=product&amp;page=1">
									<img style="width: 60px;height: 60px;" src="<%=basePath%>logo/nulltupian.png">
								</a>
							</c:if>
							<p  title="${product.product}"
								style="width: 80px;height: 40px;line-height: 40px;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;padding-left: 10px;">
								<a href="search?keyword=${express.product}&amp;value=product&amp;page=1">
									${express.product}
								</a>
							</p>
						</div>
						<div style="margin-left: 100px;height: 100px;margin-top: -100px;width: 300px;">
							<p style="width: 100px;display: inline-block;">
	    						<b>公司 : </b>
	    					</p>
	    					<p style="width: 190px;display: inline-block;text-align: left;">
	    						<c:if test="${product.supplier eq '样品商城'}">
	    							深圳市力芯周电子商行
	    						</c:if>
	    						<c:if test="${product.supplier ne '样品商城'}">
	    							${product.supplier}
	    						</c:if>
	    					</p>
	    					<p  style="width: 100px;display: inline-block;">
	    						<b>封装 : </b>
	    					</p>
	    					<p style="width: 190px;display: inline-block;text-align: left;">
	    						${express.express_package}
	    					</p>
	    					<p  style="width: 100px;float:left;">
	    						<b>取货地址 : </b>
	    					</p>
	    					<p  style="width: 190px;display: inline-block;text-align: left;">
	    						${product.supplierlist.supplierposition}
	    					</p>
						</div>
						<div style="height: 100px;width: 300px;margin-left: 400px;margin-top: -100px;">
							<p style="display: inline-block;width: 148px;">
								${express.one}
							</p>
							<p style="display: inline-block;width: 148px;">
								${express.expressnumber}
							</p>
						</div>
						<div style="height: 100px;width: 150px;margin-left: 700px;margin-top: -100px;">
    						<c:if test="${express.discountdescription != null}">￥${express.discountdescription}</c:if>
						</div>
              			</td>
              			<td style="padding-left: 0px;padding-top: 15px;padding-right: 0px;width: 350px;">
              				<div style="height: 100px;width: 347px;">
              					<c:if test="${express.status == 1}">未付款</c:if>
			    				<c:if test="${express.status == 2}">已付款</c:if>
			    				<c:if test="${express.status == 3}">已收货</c:if>
			    				<c:if test="${express.status == 4}">已完成</c:if>
			    				<c:if test="${express.status == 5}">已取消</c:if>
			    				<c:if test="${express.status == 6}">审核中</c:if>
              				</div>
              				
              			</td>
              		</tr>
           		</table>
        </c:if>
        <div style="height:130px;background: #F3F3F3;margin-top: 20px;padding-top: 30px;width:1200px;">
           			<div style="width: 300px;height: 130px;display: inline-block;vertical-align:top;margin-left: 30px;">
           			</div>
           			<div style="width: 860px;display: inline-block;height: 130px;vertical-align:top;">
           				<div style="width: 300px;height: 130px;margin-left: 680px;">
	           				<input type="hidden" id="pe" value="${express.eprice }">
	      					<input type="hidden" id="fapiao" value="${express.e_invoice }">
							<p style="display: inline-block;font-weight: bold;color: black;font-size: 15px;width: 80px;text-align: right;">
								总金额 : 
							</p>
							<p id="effectivePrice" style="color: red;display: inline-block;width: 200px;text-align: left;font-weight: bold;">
								&nbsp;&nbsp;&nbsp;￥${express.eprice }
								<c:if test="${express.expressname == '申通' }">
									（含运费10元）
								</c:if>
								<c:if test="${express.expressname == '顺丰(省内)' }">
									（含运费13元）
								</c:if>
								<c:if test="${express.expressname == '顺丰(省外)' }">
									（含运费23元）
								</c:if>
							</p>
							</br>
							<p style="display: inline-block;font-weight: bold;color: black;font-size: 15px;width: 80px;text-align: right">
								返利金额 : 
							</p>
							<p id="effectivePrice" style="color: red;display: inline-block;width: 200px;text-align: left;font-weight: bold;">
								&nbsp;&nbsp;&nbsp;
								<c:if test="${express.fan != null}">
									￥${express.fan }元
								</c:if>
				                <c:if test="${express.fan == null}">
				                 	审核中
				                </c:if>
							</p></br>
							<p style="display: inline-block;font-weight: bold;color: black;font-size: 15px;width: 80px;text-align: right;">
								支付方式 : 
							</p>
							<p style="color: red;display: inline-block;width: 200px;text-align: left;font-weight: bold;">
								&nbsp;&nbsp;&nbsp;
								<%-- <c:if test="${express.mode != null}">
									${express.mode}
								</c:if>
								<c:if test="${express.mode == null}">
									暂无更新
								</c:if> --%>
								支付宝
							</p>
           			</div>
           		</div>
	    </div>
	<div  style="text-align: center;margin-top: 50px;">
	        <p>
	            版权所有 &copy; 2016 自可知 保留所有权利 |
	            <a href="http://www.miibeian.gov.cn/">
	                <img src="img/img/icp.png" />
	                粤ICP备15008173号-2
	            </a>
	            |
	        </p>
	</div>
	<style type="text/css">
	    #update{
	        width: 100px;
	        height: 25px;
	    }
	    #update:hover{
	        color: darkred;
	    }
	</style>
	<script type="text/javascript" src="user/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="user/lib/layer/2.1/layer.js"></script>
	<script type="text/javascript" src="user/lib/datatables/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="user/static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript" src="user/static/h-ui.admin/js/H-ui.admin.js"></script>
	<script type="text/javascript">
	    $('.table-sort').dataTable({
	        //				"aaSorting": [
	        //					[1, "desc"]
	        //				], //默认第几个排序
	        //				"iDisplayLength": 10,
	        //				"bStateSave": true, //状态保存
	        //				"aoColumnDefs": [
	        //					//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
	        //					{
	        //						"orderable": false,
	        //						"aTargets": [0, 8]
	        //					} // 不参与排序的列
	        //				]
	    });
	</script>
	</body>

</html>