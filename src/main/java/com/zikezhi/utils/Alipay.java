package com.zikezhi.utils;

import java.util.List;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
public class Alipay {

	public  static String  pay(List<String> list,String totalPrice,String obj,String panduan){
    AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
	//设置请求参数
	AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
	alipayRequest.setReturnUrl(AlipayConfig.return_url);
	alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
	
	//商户订单号，商户网站订单系统中唯一订单号，必填
	String out_trade_no = null;
	//付款金额，必填
	String total_amount = null;
	//订单名称，必填
	String subject = null;
	//商品描述，可空
	String body = null;
	String str="";
	for (String string : list) {
		str+=string;
	}
/*	out_trade_no = new String(str.getBytes("ISO-8859-1"),"UTF-8");
	total_amount = new String(totalPrice.getBytes("ISO-8859-1"),"UTF-8");
	subject = new String(panduan.getBytes("ISO-8859-1"),"UTF-8");
	body = new String(panduan.getBytes("ISO-8859-1"),"UTF-8");*/
	out_trade_no = str;
	total_amount = totalPrice;
	subject = panduan;
	body = panduan;
	
	alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
			+ "\"total_amount\":\""+ total_amount +"\"," 
			+ "\"subject\":\""+ subject +"\"," 
			+ "\"body\":\""+ body +"\"," 
			+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
	
	//若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
	//alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
	//		+ "\"total_amount\":\""+ total_amount +"\"," 
	//		+ "\"subject\":\""+ subject +"\"," 
	//		+ "\"body\":\""+ body +"\"," 
	//		+ "\"timeout_express\":\"10m\"," 
	//		+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
	//请求参数可查阅【电脑网站支付的API文档-alipay.trade.page.pay-请求参数】章节
	
	//请求
	String result = null;
	try {
		result = alipayClient.pageExecute(alipayRequest).getBody();
	} catch (AlipayApiException e) {
		e.printStackTrace();
	}
	
	return result;
	}
}
