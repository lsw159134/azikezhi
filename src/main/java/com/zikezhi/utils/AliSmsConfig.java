package com.zikezhi.utils;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;

/**
 * AcsClient单例实现，所有的参数都在这个类中配置。
 * @author wrp
 *
 */
public class AliSmsConfig{
	private AliSmsConfig(){};
	static final String signName ="自可知电子采购网";//签名Payment
	static final String templateCodeZhuCe ="SMS_76596080";//注册模版
	static final String templateCodeLogin ="SMS_76596080";//动态登录模版
	static final String templateCodePwd ="SMS_76596080";//忘记密码模版
	static final String templateCodePayment ="SMS_117511825";//收款模版
	static final String templateCodeStatus ="SMS_80205056";//发货通知模版
	static final String templateCodeQuotes ="SMS_117516835";//收录通知模版
	static final String product ="Dysmsapi";
	static final String domain ="dysmsapi.aliyuncs.com";
	static final String accessKeyId ="LTAIiGnjistyYRhB";//此处私钥 填写自己的
	static final String accessKeySecret ="Q2w9UdYNHEmkstMtCVMPvp6vXIuHbC";//此处私钥 填写自己的
	static final IClientProfile profile =DefaultProfile.getProfile("cn-hangzhou",accessKeyId,accessKeySecret);
	static{
		try{
			System.setProperty("sun.net.client.defaultConnectTimeout","10000");
			System.setProperty("sun.net.client.defaultReadTimeout","10000");
			DefaultProfile.addEndpoint("cn-hangzhou","cn-hangzhou",product,domain);
		}catch(ClientException e){
			e.printStackTrace();
		}
	}
	/**
	* 类级的内部类，也就是静态的成员式内部类，该内部类的实例与外部类的实例
	* 没有绑定关系，而且只有被调用到才会装载，从而实现了延迟加载
	*/
	private static class SingletonHolder{
		/**
		* 静态初始化器，由JVM来保证线程安全
		*/
		private static IAcsClient acsClient =new DefaultAcsClient(profile);
	}
	
	public static IAcsClient getAcsClient(){
		return	SingletonHolder.acsClient;
	}
}

