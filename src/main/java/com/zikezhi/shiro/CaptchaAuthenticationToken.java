package com.zikezhi.shiro;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * @author ponder
 * @version 1.0
 * @Date 2016年8月23日
 * @Description: 扩展登录UsernamePasswordToken，加入kaptcha字段
 * 
 * @ClassName CaptchaAuthenticationToken.java
 * 
 */

public class CaptchaAuthenticationToken extends UsernamePasswordToken {

	private static final long serialVersionUID = 1L;
	private String captcha;

	public CaptchaAuthenticationToken() {
		super();
	}

	public CaptchaAuthenticationToken(String username, char[] password,
			boolean rememberMe, String host, String captcha) {
		super(username, password, rememberMe, host);
		this.captcha = captcha;
	}

	public String getCaptcha() {
		return captcha;
	}

	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}

}
