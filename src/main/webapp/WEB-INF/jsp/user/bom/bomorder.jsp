<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ include file="../../../../include/defined.jsp"%>
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
    <title>结算页 -在芯间</title>
	<!--结算页面样式-->	
	<link rel="stylesheet" href="css/bankList.css">
	<link type="text/css" rel="stylesheet"  href="css/cartproduct.css"/>
	<link type="text/css" rel="stylesheet"  href="css/service.css"/>
	<link rel="shortcut icon" href="img/tu.png" type="image/x-icon"/>
	<script type="text/javascript" src="js/basePatch.js"></script>
	<script type="text/javascript" src="js/cookieTrack_v4.js"></script>
	<style type="text/css">
        table
        {
            border: black solid 1px;
            border-collapse: collapse;
        }
        tr{
        	text-align: center;
        }
        #tr1 td{
        	border:1px solid;
        }
        td
        {
            border: black solid 1px;
            padding: 3px;
           border-bottom: none;
           border-top: none;
        }
        .td_Num
        {
            text-align: center;
        }
        .td_Item
        {
            text-align: center;
        }
        .td_Oper
        {
            text-align: center;
        }
        .td_Oper span
        {
            cursor: pointer;
        }
    </style>
</head>
<body id="mainframe">
	<div class="w w1 header clearfix">
	    <div id="logo">
	 		<a href="http://www.zaixinjian.com/" class="link1" target="_blank"><img src="img/logo-201708.png" alt="在芯间电子查询网"></a>
			<!-- <a href="#none" class="link2"></a> -->
	    </div>
	    <!-- <div class="stepflex" id="#sflex03">
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
	    </div> -->
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
					<h3>收货人信息</h3>
					<div class="extra-r">
                    	<a href="chooseAddress?bid=${bom.bom_id }&fapiao=${bom.bom_invoice}&expressname=${expressname}" class="ftx-05 J_consignee_global">更换地址</a>
                        <!--<a href="#none" class="ftx-05" onclick="use_NewConsignee()" clstag="pageclick|keycount|trade_201602181|3">新增收货地址</a>-->
                    </div>
					
				</div>
				<div class="step-cont">
					<div id="consignee-addr" class="consignee-content">
						<div class="consignee-scrollbar">
							<div class="ui-scrollbar-main">
								<div class="consignee-scroll">
									<div class="consignee-cont" id="consignee1">
										<ul id="consignee-list">
											<li  class="ui-switchable-panel ui-switchable-panel-selected" style="display: list-item;cursor: pointer;"  id="consignee_index_138720929">
												<div  class="consignee-item item-selected" id="consignee_index_div_138720929" >		
													<span title="${uaddress.a_name }">${uaddress.a_name }</span><b></b>
												</div>
												<div class="addr-detail">
					 								<span class="addr-name">${uaddress.a_name }</span>
													 <span class="addr-info" >${uaddress.a_address }</span>
													 <span class="addr-tel">${uaddress.a_phone }${uaddress.a_company }</span>
												</div>
												<div class="op-btns">
													<a href="#none" class="ftx-05 edit-consignee">更换地址</a>
												</div>
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
	  							<h3>送货清单</h3>
								<div class="tips-new-white">
									<b></b><span><i></i>特别提醒：如果你需要进行公对公银行转账，请联系客服索取合同和公司账户</span>
								</div>
							</div>
							<div class="step-cont" id="skuPayAndShipment-cont">
	  							<div class="shopping-lists" id="shopping-lists"> 
	    							<div class="shopping-list ABTest">
	      								<div class="goods-list">
											<div class="goods-tit">
												<h4 class="vendor_name_h" id="0">商家：正品商城</h4>
											</div>
							                <div class="goods-items">     						        
												<div class="goods-item goods-item-extra">
													<table style="width: 600px;margin-left: 10px;">
														<thead>
													        <tr class="text-c" id="tr1">
													            <td class='td_Item' style="width: 180px;">型号</td>
													            <td class='td_Item' style="width: 120px;">封装</td>
													            <td class='td_Item'>品牌</td>
													            <td class='td_Item'>单位</td>
													            <td class='td_Item'>数量</td>
													            <td class='td_Item'>单价</td>
													            <td class='td_Item'>小计</td>
													            <td class='td_Item'>备注</td>
													        </tr>
												        </thead>
												        ${bom.bom_content}
												    </table>
													<div class="clr"></div>
												</div>
											</div>
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
													<c:if test="${expressname eq '2' }">
														<li class="mode-tab-item curr"  style="border:2px solid #e4393c;" id="sht_shipment_item" onclick="doSwithTab('2')">
															<span class="m-txt">申通(运费)10元</span><b></b>
														</li>
														<li class="mode-tab-item curr " style="border:2px solid;" id="yt_shipment_item" onclick="doSwithTab('7')">
															<span class="m-txt">圆通(运费)10元</span>
														</li>
														<c:if test="${province eq '广东省'}">
															<li class="mode-tab-item curr " style="border:2px solid;" id="sr_shipment_item" onclick="doSwithTab('6')">
																<span class="m-txt">速尔(广东省内)10元</span>
															</li>
															<li class="mode-tab-item curr " style="border:2px solid;" id="shfw_shipment_item" onclick="doSwithTab('4')">
																<span class="m-txt">顺丰(广东省内)13元</span>
															</li>
														</c:if>	
														<c:if test="${province ne '广东省'}">
															<li class="mode-tab-item curr " style="border:2px solid;" id="shfn_shipment_item" onclick="doSwithTab('3')">
																<span class="m-txt">顺丰(广东省外)23元</span>
															</li>
														</c:if>
														<li class="mode-tab-item curr " style="border:2px solid;" id="shfd_shipment_item" onclick="doSwithTab('5')">
															<span class="m-txt">顺丰(到付) 0元</span>
														</li>
													</c:if>
													<c:if test="${expressname eq '3' }">
														<li class="mode-tab-item curr"  style="border:2px solid;" id="sht_shipment_item" onclick="doSwithTab('2')">
															<span class="m-txt">申通(运费)10元</span>
														</li>
														<li class="mode-tab-item curr " style="border:2px solid;" id="yt_shipment_item" onclick="doSwithTab('7')">
															<span class="m-txt">圆通(运费)10元</span>
														</li>
														<c:if test="${province eq '广东省'}">
															<li class="mode-tab-item curr " style="border:2px solid;" id="sr_shipment_item" onclick="doSwithTab('6')">
																<span class="m-txt">速尔(广东省内)10元</span>
															</li>
															<li class="mode-tab-item curr " style="border:2px solid;" id="shfw_shipment_item" onclick="doSwithTab('4')">
																<span class="m-txt">顺丰(广东省内)13元</span>
															</li>
														</c:if>	
														<c:if test="${province ne '广东省'}">
															<li class="mode-tab-item curr " style="border:2px solid #e4393c;" id="shfn_shipment_item" onclick="doSwithTab('3')">
																<span class="m-txt">顺丰(广东省外)23元</span><b></b>
															</li>
														</c:if>
														<li class="mode-tab-item curr " style="border:2px solid;" id="shfd_shipment_item" onclick="doSwithTab('5')">
															<span class="m-txt">顺丰(到付) 0元</span>
														</li>
													</c:if>
													<c:if test="${expressname eq '4' }">
														<li class="mode-tab-item curr"  style="border:2px solid;" id="sht_shipment_item" onclick="doSwithTab('2')">
															<span class="m-txt">申通(运费)10元</span>
														</li>
														<li class="mode-tab-item curr " style="border:2px solid;" id="yt_shipment_item" onclick="doSwithTab('7')">
															<span class="m-txt">圆通(运费)10元</span>
														</li>
														<c:if test="${province eq '广东省'}">
															<li class="mode-tab-item curr " style="border:2px solid;" id="sr_shipment_item" onclick="doSwithTab('6')">
																<span class="m-txt">速尔(广东省内)10元</span>
															</li>
															<li class="mode-tab-item curr " style="border:2px solid #e4393c;" id="shfw_shipment_item" onclick="doSwithTab('4')">
																<span class="m-txt">顺丰(广东省内)13元</span><b></b>
															</li>
														</c:if>	
														<c:if test="${province ne '广东省'}">
															<li class="mode-tab-item curr " style="border:2px solid;" id="shfn_shipment_item" onclick="doSwithTab('3')">
																<span class="m-txt">顺丰(广东省外)23元</span>
															</li>
														</c:if>
														<li class="mode-tab-item curr " style="border:2px solid;" id="shfd_shipment_item" onclick="doSwithTab('5')">
															<span class="m-txt">顺丰(到付) 0元</span>
														</li>
													</c:if>
													<c:if test="${expressname eq '5' }">
														<li class="mode-tab-item curr"  style="border:2px solid;" id="sht_shipment_item" onclick="doSwithTab('2')">
															<span class="m-txt">申通(运费)10元</span>
														</li>
														<li class="mode-tab-item curr " style="border:2px solid;" id="yt_shipment_item" onclick="doSwithTab('7')">
															<span class="m-txt">圆通(运费)10元</span>
														</li>
														<c:if test="${province eq '广东省'}">
															<li class="mode-tab-item curr " style="border:2px solid;" id="sr_shipment_item" onclick="doSwithTab('6')">
																<span class="m-txt">速尔(广东省内)10元</span>
															</li>
															<li class="mode-tab-item curr " style="border:2px solid;" id="shfw_shipment_item" onclick="doSwithTab('4')">
																<span class="m-txt">顺丰(广东省内)13元</span>
															</li>
														</c:if>	
														<c:if test="${province ne '广东省'}">
															<li class="mode-tab-item curr " style="border:2px solid;" id="shfn_shipment_item" onclick="doSwithTab('3')">
																<span class="m-txt">顺丰(广东省外)23元</span>
															</li>
														</c:if>
														<li class="mode-tab-item curr " style="border:2px solid #e4393c;" id="shfd_shipment_item" onclick="doSwithTab('5')">
															<span class="m-txt">顺丰(到付) 0元</span><b></b>
														</li>
													</c:if>
													<c:if test="${expressname eq '6' }">
														<li class="mode-tab-item curr"  style="border:2px solid;" id="sht_shipment_item" onclick="doSwithTab('2')">
															<span class="m-txt">申通(运费)10元</span>
														</li>
														<li class="mode-tab-item curr " style="border:2px solid;" id="yt_shipment_item" onclick="doSwithTab('7')">
															<span class="m-txt">圆通(运费)10元</span>
														</li>
														<c:if test="${province eq '广东省'}">
															<li class="mode-tab-item curr " style="border:2px solid #e4393c;" id="sr_shipment_item" onclick="doSwithTab('6')">
																<span class="m-txt">速尔(广东省内)10元</span><b></b>
															</li>
															<li class="mode-tab-item curr " style="border:2px solid;" id="shfw_shipment_item" onclick="doSwithTab('4')">
																<span class="m-txt">顺丰(广东省内)13元</span>
															</li>
														</c:if>	
														<c:if test="${province ne '广东省'}">
															<li class="mode-tab-item curr " style="border:2px solid;" id="shfn_shipment_item" onclick="doSwithTab('3')">
																<span class="m-txt">顺丰(广东省外)23元</span>
															</li>
														</c:if>
														<li class="mode-tab-item curr " style="border:2px solid;" id="shfd_shipment_item" onclick="doSwithTab('5')">
															<span class="m-txt">顺丰(到付) 0元</span>
														</li>
													</c:if>
													<c:if test="${expressname eq '7' }">
														<li class="mode-tab-item curr"  style="border:2px solid;" id="sht_shipment_item" onclick="doSwithTab('2')">
															<span class="m-txt">申通(运费)10元</span>
														</li>
														<li class="mode-tab-item curr " style="border:2px solid #e4393c;" id="yt_shipment_item" onclick="doSwithTab('7')">
															<span class="m-txt">圆通(运费)10元</span><b></b>
														</li>
														<c:if test="${province eq '广东省'}">
															<li class="mode-tab-item curr " style="border:2px solid;" id="sr_shipment_item" onclick="doSwithTab('6')">
																<span class="m-txt">速尔(广东省内)10元</span>
															</li>
															<li class="mode-tab-item curr " style="border:2px solid;" id="shfw_shipment_item" onclick="doSwithTab('4')">
																<span class="m-txt">顺丰(广东省内)13元</span>
															</li>
														</c:if>
														<c:if test="${province ne '广东省'}">
															<li class="mode-tab-item curr " style="border:2px solid;" id="shfn_shipment_item" onclick="doSwithTab('3')">
																<span class="m-txt">顺丰(广东省外)23元</span>
															</li>
														</c:if>
														<li class="mode-tab-item curr " style="border:2px solid;" id="shfd_shipment_item" onclick="doSwithTab('5')">
															<span class="m-txt">顺丰(到付) 0元</span>
														</li>
													</c:if>
												</ul>
											</div>
											<div class="form picksite-box">
												<!-- <div class="item">
													<span class="label">：</span>
													<div class="fl">
														
														<div class="pick-more" >
															<span  class="selfpick_more_link open ftx05"  style="cursor:pointer;" onclick="open_MorePicksite(this)">展开更多<b></b></span>
														</div>
													</div>
												</div> -->
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
				<h3>发票信息</h3>
				<div class="tips-new-white">
					<b></b><span><i></i>商品价格为不含税价格</span>
				</div>    	
			</div>
			<div class="step-content">
				<div id="part-inv" class="invoice-cont">
					<c:if test="${fapiao eq '1' }">
						<span class="mr10"><input type="radio" name="fapiao" value="1" checked="checked" />不开</span>
						<span class="mr10"><input type="radio" name="fapiao" value="2"/>普通发票(6%)</span>
						<span class="mr10"><input type="radio" name="fapiao" value="3"/>增税发票(17%)</span>  
					</c:if>
					<c:if test="${fapiao eq '2' }">
						<span class="mr10"><input type="radio" name="fapiao" value="1"/>不开</span>
						<span class="mr10"><input type="radio" name="fapiao" value="2" checked="checked" />普通发票(6%)</span>
						<span class="mr10"><input type="radio" name="fapiao" value="3"/>增税发票(17%)</span>  
					</c:if>
					<c:if test="${fapiao eq '3' }">
						<span class="mr10"><input type="radio" name="fapiao" value="1"/>不开</span>
						<span class="mr10"><input type="radio" name="fapiao" value="2"/>普通发票(6%)</span>
						<span class="mr10"><input type="radio" name="fapiao" value="3" checked="checked" />增税发票(17%)</span>  
					</c:if>
	            </div>
			</div>
			<div class="step-tit" id="invoice-step">
				<h3>备注信息</h3>
				<div class="tips-new-white">
					<b></b><span><i></i>开企业抬头发票须填写纳税人识别号，以免影响报销</span>
				</div>    	
			</div>
			<div class="step-content">
				<div id="part-inv" class="invoice-cont">
					<textarea style="word-wrap:break-word;word-break:break-all;height: 70px;width: 600px;margin-top: 5px" id="beizhu1" name="beizhu" placeholder="如需开发票,请备注开票单位和税号,请输入200字以内...">${beizhu }</textarea>
	            </div>
			</div>
			<div class="clr"></div>
			<br>
		</div>
		<br>
	    <div class="order-summary">
			<div class="statistic fr">
				<div class="list">
					<span><em class="ftx-01">1</em> 件商品，总商品金额：</span>
				<em class="price" id="warePriceId">${subtotal }</em>
	            </div>
	             <div class="list">
	                <span>发票费：</span>
	                <em class="price" id="invoicePriceId"> ${fapiaofei }</em>
	            </div>
	            <div class="list">
	                <span>运费：</span>
	                <em class="price" id="freightPriceId"> ${yunfei }</em>
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
					<span class="price-num" id="sumPayPriceId">￥${bom.bom_price}</span>
				</div>
				<div class="fc-consignee-info">
					<span class="mr20" id="sendAddr">寄送至：${uaddress.a_address }</span>
					<span id="sendMobile">收货人：${uaddress.a_name }${uaddress.a_phone }</span>
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
<form action="pay" method="post" id="payForm">
	<input type="hidden" name="productuid" id="productuid">
	<input type="hidden" name="number" id="number">
	<input type="hidden" name="fapiao" id="fapiao">
	<input type="hidden" name="beizhu" id="beizhu">
	<input type="hidden" name="expressname" id="expressname">
	<input type="hidden" name="tijiao" id="tijiao">
	<input type="hidden" name="aid" id="aid" value="${uaddress.a_id}">
</form>
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
	<p><span style="color: red;">答</span>：17点前付款，当天可以发货,17点后付款第二天发货，周日休息不发货。</p>
		<br />
		<p style="color: red;">2：发货时候有没有收据或者送货单？</p>
	<p><span style="color: red;">答</span>：发货时候附送收据，但是没有送货单，需要送货单的请备注留言即可。</p>
	<br />
	<p style="color: red;">3：能否支持公司账户付款？</p>
	<input type="hidden" id="mode" name="mode" value="0">
	<p><span style="color: red;">答</span>：如果需要开普通发票或者增值税票，支持公司账户付款，一般流程是做合同，然后打款，具体的请联系客服<a href="javascript:void(0)"
		onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=2938492659&site=qq&menu=yes');">
		<img
		src="http://www.5tu.cn/attachments/month_1008/1008250911b00da2691d5bf01a.jpg"
		style="width: 15px; height: 15px; margin: 0px 0px -3px 0px" /></a>
	</p>
	<br>
	<footer style="text-align: center;">
		版权所有 &copy; 2016 - 2017 在芯间 保留所有权利 | <a href="http://www.miibeian.gov.cn/"><img src="img/img/icp.png" /> 粤ICP备15008173号-2 </a>|
	</footer>
</div>
	<!--/ /widget/footer-2015/footer-2015.tpl -->
<script type="text/javascript">
	$(function(){
		$("#fapiao").val("");
		$("#beizhu").val("");
		$("#number").val("");
		$("#tijiao").val("");
		$("#productuid").val("");
		$("#expressname").val("");
	})
	var id = '${bom.bom_id}';
	var pid = '${product.productuuid}';
	var isgoodsinstock='${product.isgoodsinstock}';
	$("#beizhu1").on("input propertychange", function() {  
	    var $this = $(this),  
	        _val = $this.val(),  
	        count = "";  
	    if (_val.length > 200) {  
	        $this.val(_val.substring(0, 200));  
	    }  
	    count = 200 - $this.val().length;  
	    $("#text-count").text(count);  
	});
	function saveOrder(){
		var expressname = '${expressname}';
	    var beizhu = document.getElementById("beizhu1").value;
		var fapiao =$('input:radio:checked').val();
		var aid='${uaddress.a_id}';
		var province='${province}';
		if(province=='广东省' && expressname==3){
			var expressname=2;
		}
		if(aid.replace(/(^s*)|(s*$)/g, "").length ==0){
	    	alert("请完善收货信息");
	    }else{
	    	if(fapiao!=1){
	    		if(beizhu.replace(/(^s*)|(s*$)/g, "").length ==0){
	    			alert("请备注开票单位");
	    		}else{
	    			window.location.href='bomOrderPay?id='+id+'&fapiao='+fapiao+'&expressname='+expressname+'&beizhu='+encodeURI(beizhu)+'&aid='+aid+"&tijiao=queren";
	    		}
	    	}else{
	    		window.location.href='bomOrderPay?id='+id+'&fapiao='+fapiao+'&expressname='+expressname+'&beizhu='+encodeURI(beizhu)+'&aid='+aid+"&tijiao=queren";
	    		/* window.location.href='pay?productuid='+pid+'&number='+expressnumber+'&fapiao='+fapiao+'&expressname='+expressname+'&beizhu='+beizhu+'&tijiao=queren'+'&aid='+aid; */
	    	}
	    }
	}
	function doSwithTab(expressname){
		var beizhu = document.getElementById("beizhu1").value;
		var fapiao = $('input:radio:checked').val();
		var aid='${uaddress.a_id}';
		window.location.href='bomOrderPay?id='+id+'&fapiao='+fapiao+'&expressname='+expressname+'&beizhu='+beizhu+'&aid='+aid;
		/* window.location.href="pay?expressname="+expressname+"&beizhu="+beizhu+"&aid="+aid+"&fapiao="+fapiao+"&productuid="+pid+'&number='+expressnumber; */
	}
	$(":radio").click(function(){
		var expressname = '${expressname}';
	    var beizhu = document.getElementById("beizhu1").value;
		var fapiao = $(this).val();
		var aid='${uaddress.a_id}';
		window.location.href='bomOrderPay?id='+id+'&fapiao='+fapiao+'&expressname='+expressname+'&beizhu='+beizhu+'&aid='+aid;
	});
	//<![CDATA[
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
	</body>
</html>