package com.zikezhi.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.QuerySendDetailsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.QuerySendDetailsResponse;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
/**
* 短信发送工具类
* 创建者 吴荣鹏
* 创建时间 2017年7月19日
*
*/
public class SmsUtil{
	
	/**
	 * 注册
	 * @param request
	 * @return
	 */
	public static SendSmsResponse sendSms(SendSmsRequest request){
		SendSmsResponse sendSmsResponse =null;
		try{
			IAcsClient acsClient =AliSmsConfig.getAcsClient();
			//必填:短信签名-可在短信控制台中找到
			request.setSignName(AliSmsConfig.signName);
			//必填:短信模板-可在短信控制台中找到
			request.setTemplateCode(AliSmsConfig.templateCodeZhuCe);
			sendSmsResponse =acsClient.getAcsResponse(request);
		}catch(Exception e){
		}
		return sendSmsResponse;
	}
	
	/**
	 * 收款
	 * @param request
	 * @return
	 */
	public static SendSmsResponse sendSmsPayment(SendSmsRequest request){
		SendSmsResponse sendSmsResponse =null;
		try{
			IAcsClient acsClient =AliSmsConfig.getAcsClient();
			//必填:短信签名-可在短信控制台中找到
			request.setSignName(AliSmsConfig.signName);
			//必填:短信模板-可在短信控制台中找到
			request.setTemplateCode(AliSmsConfig.templateCodePayment);
			sendSmsResponse =acsClient.getAcsResponse(request);
		}catch(Exception e){
		}
		return sendSmsResponse;
	}
	
	/**
	 *忘记密码
	 * @param request
	 * @return
	 */
	public static SendSmsResponse sendSmsPwd(SendSmsRequest request){
		SendSmsResponse sendSmsResponse =null;
		try{
			IAcsClient acsClient =AliSmsConfig.getAcsClient();
			//必填:短信签名-可在短信控制台中找到
			request.setSignName(AliSmsConfig.signName);
			//必填:短信模板-可在短信控制台中找到
			request.setTemplateCode(AliSmsConfig.templateCodePwd);
			sendSmsResponse =acsClient.getAcsResponse(request);
		}catch(Exception e){
		}
		return sendSmsResponse;
	}
	
	/**
	 *动态登陆
	 * @param request
	 * @return
	 */
	public static SendSmsResponse sendSmsLogin(SendSmsRequest request){
		SendSmsResponse sendSmsResponse =null;
		try{
			IAcsClient acsClient =AliSmsConfig.getAcsClient();
			//必填:短信签名-可在短信控制台中找到
			request.setSignName(AliSmsConfig.signName);
			//必填:短信模板-可在短信控制台中找到
			request.setTemplateCode(AliSmsConfig.templateCodeLogin);
			sendSmsResponse =acsClient.getAcsResponse(request);
		}catch(Exception e){
		}
		return sendSmsResponse;
	}
	
	/**
	 *发货通知
	 * @param request
	 * @return
	 */
	public static SendSmsResponse sendSmsStatus(SendSmsRequest request){
		SendSmsResponse sendSmsResponse =null;
		try{
			IAcsClient acsClient =AliSmsConfig.getAcsClient();
			//必填:短信签名-可在短信控制台中找到
			request.setSignName(AliSmsConfig.signName);
			//必填:短信模板-可在短信控制台中找到
			request.setTemplateCode(AliSmsConfig.templateCodeStatus);
			sendSmsResponse =acsClient.getAcsResponse(request);
		}catch(Exception e){
		}
		return sendSmsResponse;
	}
	
	/**
	 *收录通知
	 * @param request
	 * @return
	 */
	public static SendSmsResponse sendSmsQuotes(SendSmsRequest request){
		SendSmsResponse sendSmsResponse =null;
		try{
			IAcsClient acsClient =AliSmsConfig.getAcsClient();
			//必填:短信签名-可在短信控制台中找到
			request.setSignName(AliSmsConfig.signName);
			//必填:短信模板-可在短信控制台中找到
			request.setTemplateCode(AliSmsConfig.templateCodeQuotes);
			sendSmsResponse =acsClient.getAcsResponse(request);
		}catch(Exception e){
		}
		return sendSmsResponse;
	}
	
	public static String sess(String phone) throws ServerException, ClientException{
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		String dateString = formatter.format(new Date());
		IAcsClient acsClient =AliSmsConfig.getAcsClient();
        //组装请求对象
        QuerySendDetailsRequest request = new QuerySendDetailsRequest();
        //必填-号码
        request.setPhoneNumber(phone);
        //必填-短信发送的日期 支持30天内记录查询（可查其中一天的发送数据），格式yyyyMMdd
        request.setSendDate(dateString);
        //必填-页大小
        request.setPageSize(10L);
        //必填-当前页码从1开始计数
        request.setCurrentPage(1L);
        //hint 此处可能会抛出异常，注意catch
        QuerySendDetailsResponse querySendDetailsResponse = acsClient.getAcsResponse(request);
        //获取返回结果
       if(querySendDetailsResponse.getCode() != null && querySendDetailsResponse.getCode().equals("OK")){
	        //代表请求成功
    	   System.out.println("+++");
    	   System.out.println(querySendDetailsResponse.getTotalCount()+"****");
       }
       return querySendDetailsResponse.getTotalCount();
	}
}
