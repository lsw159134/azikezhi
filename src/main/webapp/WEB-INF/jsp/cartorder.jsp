<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" /> 
    <meta name="format-detection" content="telephone=no" />  
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" /> 
    <meta name="format-detection" content="telephone=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>购物车结算页 -自可知</title>
	<!--结算页面样式-->	
	<link rel="stylesheet" href="css/bankList.css">
	<link type="text/css" rel="stylesheet"  href="css/cartproduct.css"/>
	<link type="text/css" rel="stylesheet"  href="css/service.css"/>
	<link rel="shortcut icon" href="tu.png" type="image/x-icon"/>
	<script type="text/javascript" src="js/basePatch.js"></script>
	<script type="text/javascript" src="js/cookieTrack_v4.js"></script>
	<!-- <script type="text/javascript" src="js/jquery-1.6.4.js"></script> -->
	<!-- <script type="text/javascript" src="js/order.common.js?r=20170622"></script> -->
	<style type="text/css">
		.increment{border:1px solid #cacbcb;border-right:0;height:18px;line-height:18px;padding:1px 0;width:16px;text-align:center;color:#666;margin:0;background:#fff}
	</style>
	<script type="text/javascript">
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
</head>
<body id="mainframe">
	<div class="w w1 header clearfix">
	    <div id="logo">
	 		<a href="http://www.zikezhi.com/" class="link1" target="_blank"><img src="img/logo-201708.png" alt="自可知样品采购网"></a>
			<!-- <a href="#none" class="link2"></a> -->
	    </div>
	    <div class="stepflex" id="#sflex03">
	        <dl class="first done">
	            <dt class="s-num">1</dt>
	            <dd class="s-text">1.我的购物车<b></b></dd>
	        </dl>
	        <dl class="normal doing">
	            <dt class="s-num">2</dt>
	            <dd class="s-text">2.填写核对订单信息<b></b></dd>
	        </dl>
	        <dl class="normal last">
	            <dt class="s-num">3</dt>
	            <dd class="s-text">3.成功提交订单<b></b></dd>
	        </dl>
	    </div>
	</div>

<!-- main -->
	<div id="container">
		<div id="content" class="w">
			<div class="orderInfo-tip curr">
				<span class="wicon"></span>
				<span class="ftx-03"> 温馨提示：因可能存在系统缓存、页面更新导致价格变动异常等不确定性情况出现，商品售价以本结算页商品价格为准；如有疑问，请您立即联系销售商咨询。。</span>
				<span class="cls-btn" onclick="closeorderInfotip()">x</span>
			</div>
			<div class="checkout-tit">
				<span class="tit-txt">填写并核对订单信息</span>
			</div>
			<div class="checkout-steps">
	  			<div class="step-tit">
					<h3>取货信息</h3>
				</div>
				<div class="step-cont">
					<div id="consignee-addr" class="consignee-content">
						<div class="consignee-scrollbar">
							<div class="ui-scrollbar-main">
								<div class="consignee-scroll">
									<div class="consignee-cont" id="consignee1">
										<ul id="consignee-list">
											<li  class="ui-switchable-panel ui-switchable-panel-selected" style="display: list-item;cursor: pointer;"  id="consignee_index_138720929">
												<b style="margin-left: 30px;color: red;"><b style="color: black;">请到购买产品对应商家的取货地址取货</b>    监督电话：0755-82720040 （仅支持网上付款，不接受现金支付）
												</b>
											</li>
		                                </ul>
		                            </div>
								</div>
							</div>
						</div>
					</div>
					<!-- <div class="addr-switch switch-on" id="consigneeItemAllClick" onclick="show_ConsigneeAll()" clstag="pageclick|keycount|trade_201602181|2">
                        <span>更多地址</span><b></b>
                    </div> -->
					<br>
					<div id="shipAndSkuInfo">
						<div id="payShipAndSkuInfo">
							<div class="hr"></div>
							<div class="step-tit">
	  							<h3>货物清单</h3>
	  							<div class="tips-new-white">
									<b></b><span><i></i>特别提醒：该价格为不含税价格.</span>
								</div>
								<div class="extra-r">
								  	<!-- <a class="price-desc" id="price-desc" href="#none" data-tips="因可能存在系统缓存、页面更新导致价格变动异常等不确定性情况出现，商品售价以本结算页商品价格为准；如有疑问，请您立即联系销售商咨询。">
								  		<i></i>&nbsp;价格说明
								  	</a> -->
									<a href="myCart" id="cartRetureUrl" class="return-edit ftx-05">返回修改购物车</a>
								</div>
							</div>
							<div class="step-cont" id="skuPayAndShipment-cont">
	  							<div class="shopping-lists" id="shopping-lists"> 
	    							<div class="shopping-list ABTest">
	      								<div class="goods-list">
	      									<c:forEach items="${cartItem }" var="cartItem" varStatus="status">
												<c:if test="${status.index+1 ==1}">
													<div class="goods-items" style="width: 100%;">     						        
														<div class="goods-item goods-item-extra">
															<div class="p-img" style="width: 140px;">
																<strong class="zxj-price" style="color: #666666;">
		                                      						商品型号
		                                                         </strong>
															</div>
															<div class="goods-msg" style="width: 464px;">
					          									<div class="goods-msg-gel">			
					  												<div class="p-name">
				  					           							<strong class="zxj-price">
		                                          						封装
			                                                            </strong>
												 				      	<span class="p-num">单价</span>
														                <span id="pre-state" class="p-state">
														                </span>
					  												</div>
			                                                        <div class="p-price">
												 				      	<span class="p-num">数量</span>
												 				      	<strong class="zxj-price" style="color: #666666;">
			                                          						小计
			                                                            </strong>
														                <span id="pre-state" class="p-state">
														                	
														                </span>
																	</div>
																</div>  
															</div>
															<div class="clr"></div>
														</div>
													</div>
													<div class="goods-tit" style="width: 1200px;">
														<h4 class="vendor_name_h" id="199166">
															商家：
															<c:if test="${cartItem.supplier eq '样品商城'}">
																力芯周电子商行
															</c:if>
															<c:if test="${cartItem.supplier ne '样品商城'}">
																${cartItem.supplier}
															</c:if>
															&emsp;
															<span style="color: red;text-align: right;">
																取货地址：${cartItem.supplierlist.supplierposition }
															</span> 
														</h4>
													</div>
									                <div class="goods-items" style="width: 800px;">     						        
														<div class="goods-item goods-item-extra">
															<div class="p-img" style="width: 140px;">
																<strong class="zxj-price" style="color: #666666;width: 140px;">
		                                      						${cartItem.product }
		                                                         </strong>
															</div>
															<div class="goods-msg">
					          									<div class="goods-msg-gel">			
					  												<div class="p-name">
				  					           							<strong class="zxj-price">
		                                          						${cartItem.encapsulation }
			                                                            </strong>
												 				      	<span class="p-num">￥${cartItem.price }</span>
														                <span id="pre-state" class="p-state" >
														                </span>
					  												</div>
			                                                        <div class="p-price">
												 				      	<span class="p-num">
												 				      		<!-- <a href="javascript:void(0);" class="increment">-</a> -->
												 				      		<input onchange="tttt(this.value,'${cartItem.cart.cart_id }','${cartItem.productuuid }')" type="text" id="number" name="number" class="itxt" minnum="1" style="width: 42px;text-align: center;" value="${cartItem.cart.cart_number }">
												 				      		<!-- <a href="javascript:void(0);" clstag="clickcart|keycount|xincart|cart_num_up" class="increment" id="increment_8888_508411_1_1_0">+</a> -->
												 				      	</span>
												 				      	<strong class="zxj-price" style="color: #666666;">
			                                          						￥${cartItem.subtotal}
			                                                            </strong>
														                <!-- <span id="pre-state" class="p-state" skuId="4335710">
														                	有货
														                </span> -->
																	</div>
																</div>  
															</div>
															<div class="clr"></div>
														</div>
													</div>
               									</c:if>
               									<c:if test="${status.index+1 !=1}">
               										<div class="goods-tit">
														<h4 class="vendor_name_h" id="199166" style="width: 100%;">
															商家：
															<c:if test="${cartItem.supplier eq '样品商城'}">
																力芯周电子商行
															</c:if>
															<c:if test="${cartItem.supplier ne '样品商城'}">
																${cartItem.supplier}
															</c:if>
															&emsp;
															<span style="color: red;text-align: right;">
																取货地址：${cartItem.supplierlist.supplierposition }
															</span> 
														</h4>
													</div>
	               									<div class="goods-items" style="width: 800px;">     						        
														<div class="goods-item goods-item-extra">
															<div class="p-img" style="width: 140px;">
																<strong class="zxj-price" title="${cartItem.product }" style="color: #666666;width: 140px;">
		                                      						${cartItem.product }
		                                                         </strong>
															</div>
															<div class="goods-msg">
					          									<div class="goods-msg-gel">			
					  												<div class="p-name">
				  					           							<strong class="zxj-price">
		                                          						${cartItem.encapsulation }
			                                                            </strong>
												 				      	<span class="p-num">￥${cartItem.price }</span>
														                <span id="pre-state" class="p-state" >
														                </span>
					  												</div>
			                                                        <div class="p-price">
												 				      	<span class="p-num">
												 				      		<!-- <a href="javascript:void(0);" class="increment">-</a> -->
												 				      		<input onchange="tttt(this.value,'${cartItem.cart.cart_id }','${cartItem.productuuid }')" type="text" id="number" name="number" class="itxt" minnum="1" style="width: 42px;text-align: center;" value="${cartItem.cart.cart_number }">
												 				      		<!-- <a href="javascript:void(0);" clstag="clickcart|keycount|xincart|cart_num_up" class="increment" id="increment_8888_508411_1_1_0">+</a> -->
												 				      	</span>
												 				      	<strong class="zxj-price" style="color: #666666;">
			                                          						￥${cartItem.subtotal}
			                                                            </strong>
														                <!-- <span id="pre-state" class="p-state" skuId="4335710">
														                	有货
														                </span> -->
																	</div>
																</div>  
															</div>
															<div class="clr"></div>
														</div>
													</div>
												</c:if>
								            </c:forEach>
											<!-- <div class="goods-tit">
												<h4 class="vendor_name_h" id="199166">商家：</h4>
											</div>
											<div class="goods-items">
												<div class="goods-item goods-item-extra" goods-id="11082707632" sx-type="0">
												<div class="p-img">
													<a target="_blank" href="http://item.jd.com/11082707632.html?dist="><img src="//img14.360buyimg.com/N4/jfs/t4300/116/1483179690/355745/cdd368e9/58c26371N01286d8f.png" alt=""></a>
												</div>
												<div class="goods-msg">
													<div class="goods-msg-gel">			
														<div class="p-name">
															<a href="http://item.jd.com/11082707632.html?dist=" target="_blank">
																360N4S  全网通版 4G智能手机  双卡双待 流光金（4GRAM+32GROM）					     
															</a>
														</div>
														<div class="p-price">
	                                				    	<strong class="jd-price">￥ 1398.00</strong>
										 				    <span class="p-num">x1</span>
											                <span id="pre-state" class="p-state" skuId="11082707632">
											                	有货
											                </span>
	                                                        <span class="p-weight">0.350kg</span>
														</div>
													</div>  
												</div>
	        									<div class="clr"></div>
											</div>
										</div>      -->  
									</div>
	      							<div class="dis-modes">
										<div class="mode-item mode-tab">
											<div class="mode-item-tit">
												<h4>配送方式</h4>
											</div>
											<div class="mode-tab-nav">
												<ul>
													<li class="mode-tab-item curr"  style="border:2px solid #e4393c;" id="sht_shipment_item" onclick="doSwithTab('1')">
														<span class="m-txt">自取</span><b></b>
													</li>
												</ul>
											</div>
											<div class="form picksite-box">
											</div>
										</div>
									</div>
					 			</div><!--dis-modes 结束-->
								<div class="clr"></div>
	          				</div><!--shopping-list 结束-->
							<div class="clr"></div>
	  					</div>
					<!--shopping-lists 结束-->  
					</div>	                        
				</div>
			</div>
			<div class="hr"></div>
			<!-- 发票信息 -->
			<div class="step-tit" id="invoice-step">
				<h3>标签</h3>
				<div class="tips-new-white">
					<b></b>
				</div>    	
			</div>
			<div class="step-content" style="margin-left: 50px;">
				<div id="part-inv" class="invoice-cont" style="float:left;">
					<c:if test="${biaoqian eq '1' }">
						<div id="kao1" style="float:left;">
							<span class="mr10" style="font-size:16px;color:red"><input type="radio" name="biaoqian" value="1" checked="checked" style=""/>统一标签</span><br><br><br><br>
							<b style="font-size: 13px;color: #666;margin-left: 142px;">
								统&nbsp;一&nbsp;标&nbsp; 签&nbsp; 示&nbsp; 例&emsp;
							</b><br><br>
							<img alt="" src="img/tongyi.png" width="222px;" height="227px;" style="-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;margin-left: 120px;border: 1px solid red;">
							
						</div>
						<div id="kao2" style="float:left;margin-left:40px;">
							<span class="mr10" style="margin-left:60px;font-size:16px;"><input type="radio" name="biaoqian" value="2"style="font-size:16px;"/>定制标签</span><br>
							<div style="margin-top:7px;"><b style="font-size: 13px;color: #666;margin-left: 122px;">
								公&nbsp; 司&nbsp; 名&nbsp; 称&emsp;
							</b>
							<input  id="b_content"  type="text" style="width:225px;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;border: 1px #A9A9A9 solid;height: 25px;padding-left: 20px;"><br><br>
							<b style="font-size: 13px;color: #666;margin-left: 220px;margin-top:15px;">
								定&nbsp;制&nbsp;标&nbsp; 签&nbsp; 示&nbsp; 例&emsp;
							</b><br><br>
							<img alt="" src="img/biaoqian.png" style="-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;margin-left: 200px;border: 1px solid red;"><br></div>
						</div>
						<!-- <span class="mr10"><input type="radio" name="biaoqian" value="3"/>定制标签</span>   -->
					</c:if>
					<c:if test="${biaoqian eq '2' }">
						<div id="kao1" style="float:left;">
							<span class="mr10" style="font-size:16px;"><input type="radio" name="biaoqian" value="1"style="font-size:16px;"/>统一标签</span><br><br><br>
							<div style="margin-top:3px;"><b style="font-size: 13px;color: #666;margin-left: 102px;">
								统&nbsp;一&nbsp;标&nbsp; 签&nbsp; 示&nbsp; 例&emsp;
							</b><br><br>
							<img alt="" src="img/tongyi.png" width="222px;" height="227px;" style="-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;margin-left: 80px;border: 1px solid red;">
							</div>
						</div>
						<div id="kao2" style="float:left;margin-top:-7px;">
							<span class="mr10" style="margin-left:100px;font-size:16px;color:red"><input type="radio" name="biaoqian" value="2" checked="checked" style="font-size:16px;"/>定制标签</span><br>
							<c:if test="${ not empty biaoqianList }">
								<c:forEach items="${biaoqianList }" var="klist" begin="0" end="0" varStatus="status" >
									<c:if test="${status.count == 1 }">
										<b style="font-size: 13px;color: #666;margin-left: 182px;">
											公&nbsp; 司&nbsp; 名&nbsp; 称&emsp;
										</b>
										<input id="b_content" value="${klist.b_content }" type="text" style="width:225px;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;border: 1px #A9A9A9 solid;height: 25px;padding-left: 20px;"><br><br>
										<b style="font-size: 13px;color: #666;margin-left: 280px;margin-top:15px;">
											定&nbsp;制&nbsp;标&nbsp; 签&nbsp; 示&nbsp; 例&emsp;
										</b><br><br>
										<img alt="" src="img/biaoqian.png" style="-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;margin-left: 260px;border: 1px solid red;">
								
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${empty biaoqianList }">
								<b style="font-size: 13px;color: #666;margin-left: 182px;">
									公&nbsp; 司&nbsp; 名&nbsp; 称&emsp;
								</b>
								<input  id="b_content"  type="text" style="width:225px;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;border: 1px #A9A9A9 solid;height: 25px;padding-left: 20px;"><br><br>
								<b style="font-size: 13px;color: #666;margin-left: 280px;margin-top:20px;">
									定&nbsp;制&nbsp;标&nbsp; 签&nbsp; 示&nbsp; 例&emsp;
								</b><br><br>
								<img alt="" src="img/biaoqian.png" style="-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;margin-left: 260px;border: 1px solid red;">
							</c:if><br>
						</div>
						<!-- <span class="mr10"><input type="radio" name="biaoqian" value="3"/>定制标签</span>   -->
					</c:if>
	            </div>
		
			</div>
	        <div class="hr" style="clear:both"></div>
			<div class="step-tit" id="invoice-step">
				<h3>备注信息</h3>
			</div>
			<div class="step-content">
				<div id="part-inv" class="invoice-cont">
					<textarea style="word-wrap:break-word;word-break:break-all;height: 70px;width: 600px;margin-top: 5px" id="beizhu1" name="beizhu" placeholder="请输入200字以内...">${beizhu }</textarea>
	            </div>
			</div>
			<div class="clr"></div>
			<br>
		</div>
		<br>
	    <div class="order-summary">
			<div class="statistic fr">
				<div class="list">
					<span><em class="ftx-01">${fn:length(cartItem)}</em> 件商品，总商品金额：</span>
				<em class="price" id="warePriceId">${subtotal }</em>
	            </div>
			</div>
			<div class="clr"></div>
		</div>
		<div class="trade-foot">
			<div id="plusInfoByFreight" class="hide"></div>
			<div id="plusInfo" class="hide"></div>
			<div class="trade-foot-detail-com">
				<div class="fc-price-info">
	 				<span class="price-tit">应付总额：</span>
					<span class="price-num" id="sumPayPriceId">${total }</span>
				</div>
			</div>
			<div>
				<div class="ui-ceilinglamp checkout-buttons">
					<div class="sticky-placeholder hide" style="display: none;">
					</div>
					<div class="sticky-wrap">
						<div class="inner">
							<button class="checkout-submit"
								onclick="saveOrder();" >
								提交订单<b></b>
							</button>
							<span id="checkCodeDiv"></span>
							<div class="checkout-submit-tip" id="changeAreaAndPrice" style="display: none;">
								 由于价格可能发生变化，请核对后再提交订单
							</div>
						</div>
						<span id="submit_message" style="display:none" class="submit-error"></span>
						<div class="submit-check-info" id="submit_check_info_message" style="display:none"></div>
					</div>
	            </div>
	        </div>
		</div>
		<div id="backpanel">
		    <div id="backpanel-inner" class="hide switchOn">
		        <div class="bp-item bp-item-backtop" data-top="0">
		            <a href="#none" class="backtop" target="_self">返回顶部</a>
		        </div>
		    </div>
		</div>
	</div>
</div>
<script type="text/javascript" src="user/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="js/backpanel.js"></script>
<script type="text/javascript">
function closeorderInfotip(){
	$(".orderInfo-tip").hide();
}
    $('.J_picksite_disable_info').hover(function() {
        $(this).next('.picksite-nosuport-box').show().css({
            left: $(this).offset().left - 17,
            top: $(this).offset().top + 28
        });
    });
                
                //$('.picksite-nosuport-box').mouseleave(function(event) {
                 //   $(this).hide();
                //});
                $('.picksite-nosuport-cont').mouseleave(function(event) {
                    $('.picksite-nosuport-box').hide();
                });
                
</script>

<div class="w">
	<p><a href="javascript:;" onclick="weixin()" style="color: red;">常见问题：</a></p>
	<p style="color: red;">1：付款后什么时候可以发货？</p>
	<p><span style="color: red;">答</span>：本站所有商品均为自取。取货地址：以订单取货地址为标准；如需发送快递，请把个人信息填写到备注，快递默认为顺丰。监督电话：0755-82720040</p>
		<br />
		<p style="color: red;">2：有没有收据或者送货单？</p>
	<p><span style="color: red;">答</span>：附送收据，但是没有送货单，需要送货单的请备注留言即可。</p>
	<br />
	<input type="hidden" id="mode" name="mode" value="0">
	<footer style="text-align: center;">
		版权所有 &copy; 2017 - 2018 自可知 保留所有权利 | <a href="http://www.miibeian.gov.cn/"><img src="img/img/icp.png" /> 粤ICP备17040594号-2 </a>|
	</footer>
</div>
<form action="myCartSettlement" method="post" id="cartForm">
	<input type="hidden" name="beizhu" id="beizhu">
	<input type="hidden" name="biaoqian" id="biaoqian">
</form>
<form action="saveOrder" method="post" id="savecartForm">
	<input type="hidden" name="beizhu" id="savebeizhu">
	<input type="hidden" name="b_content" id="b_content1">
	<input type="hidden" name="biaoqian" id="biaoqian1">
	<input type="hidden" name="panduan" value="${panduan}">
</form>
	<!--/ /widget/footer-2015/footer-2015.tpl -->
	<script type="text/javascript">
	var fapiao = $('input:radio:checked').val();
	if(fapiao != 1){
		$('#kao1').css('display','block');
		$('#kao2').css('display','block');
	}
	function tttt(obj,pid,id){
		if(parseInt(obj)==0){
			alert("请输入正确数字 ");
		}else if(!/^\d+$/.test(obj)){
			alert("请输入正确数字 ");
		}else if(parseInt(obj)>200){
			alert("一次只能购买200个");
			return;
		}else{
			$.post("queryCartOrdercount?pid="+id,
				function(data){
					if(parseInt(obj)>parseInt(data.count)){
						alert("库存不足 ");
						$("#number").val(parseInt(data.count));
						$.post("upCart?pid="+pid+"&count="+data.count,
							function(data){
								if(data.result=="fail"){
								}else if(data.result=="seccuss"){
									$("#beizhu").val(beizhu);
								    $("#biaoqian").val(biaoqian)
									document.getElementById('cartForm').submit();
									/* window.location.href="myCartSettlement?expressname="+expressname+"&beizhu="+beizhu+"&aid="+aid+"&fapiao="+fapiao; */
								}
							}
					   	) 
					}else{
						$.post("upCart?pid="+pid+"&count="+obj,
							function(data){
								if(data.result=="fail"){
								}else if(data.result=="seccuss"){
									var biaoqian =$('input:radio:checked').val();
								    var beizhu = document.getElementById("beizhu1").value;
								    $("#beizhu").val(beizhu);
								    $("#biaoqian").val(biaoqian)
									document.getElementById('cartForm').submit();
									/* window.location.href="myCartSettlement?expressname="+expressname+"&beizhu="+beizhu+"&aid="+aid+"&fapiao="+fapiao; */
								}
							}
					   	) 
					}
				}
		   	) 
		}
	}
	$(":radio").click(function(){
	    var beizhu = document.getElementById("beizhu1").value;
		var biaoqian = $(this).val();
    	$("#biaoqian").val(biaoqian);
    	$("#beizhu").val(beizhu);
    	document.getElementById('cartForm').submit();
		/* window.location.href="pay?expressname="+expressname+"&beizhu="+beizhu+"&aid="+aid+"&fapiao="+fapiao+"&productuid="+pid+'&number='+expressnumber; */
	});
	function saveOrder(){
		var biaoqian =$('input:radio:checked').val();
	    if(biaoqian=="2"){
			var b_content = document.getElementById("b_content").value;
			if(b_content==null || b_content==''){
				alert("请输入公司名称");
				return false;
			}else{
				$("#b_content1").val(b_content);
			}
		}
		$('.checkout-submit').attr('onclick','javascript:void();');//改变提交按钮上的文字并将按钮设置为不可点击
	    var beizhu = document.getElementById("beizhu1").value;
	    $("#savebeizhu").val(beizhu);
		$("#biaoqian1").val(biaoqian);
		document.getElementById('savecartForm').submit();
	}
	var couponToggle = (function(){
		var obj = $('[data-bind="coupon"]'),
			tObj = obj.find(".item");

		var init = function(){
			tObj.each(function(){
				var that = $(this);
				var toggler = $(this).find(".toggler");
				var toggled = false;

				toggler.bind("click", function(e){
					e.preventDefault();
					toggled = !toggled;

					toggler.parent().parent()[toggled ? "addClass" : "removeClass"]("toggle-active");

					that.find(".toggle-wrap")[toggled ? "removeClass" : "addClass"]("hide").css("display", toggled ? "block" : "none");
				});
			});
		};

		return {
			init: init
		};
	})();


	var invoiceMore = (function(){
		var expandHolder = $("#invoice-list"),
			expandHandle = $("#invoice-more-btn"),
			item = expandHolder.find(".item-fore");
			expand = false;

		var init = function(){
			expandHandle.bind("click", function(){
				expand = !expand;

				item[expand ? "removeClass" : "addClass"]("hide").css("display", expand ? "block" : "none");


				expandHandle.removeClass(expand ? "select-expand" : "select-collapse").addClass(expand ? "select-collapse" : "select-expand").find("span").html(expand ? "\u6536\u8D77" : "\u66F4\u591A\u5E38\u7528\u5730\u5740");

				if(expand) {

				} else {

				}
			});
		};

		return {
			init: init
		};
	})();
	$(function(){
		$("input.textbox").focus(function(){
			$(this).addClass("focus");
		}).blur(function(){
			$(this).removeClass("focus");
		});

		couponToggle.init();

		invoiceMore.init();

		$(".step-action a").bind("click", function(){
			$("#step-3").expose();
		});
		
	});
	//]]>
	
	//防止窗口变换，弹窗错位
	$(window).resize(function(){
           var obj=$("#freightSpan");
           if($("#transport").html()!=null){
	           $("#transport").css({
					position:"absolute",
					top:obj.offset().top+"px",
					left:(obj.offset().left-345)+"px"
	           })
           }
	});
	</script>	
	</body>
</html>