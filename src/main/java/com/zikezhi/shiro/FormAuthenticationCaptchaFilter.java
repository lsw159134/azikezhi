package com.zikezhi.shiro;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;

/**
 * @author ponder
 * @version 1.0
 * @Date 2016年8月23日
 * @Description: 扩展FormAuthenticationFilter类，检验用户输入验证码
 * 
 * @ClassName FormAuthenticationCaptchaFilter.java
 * 
 */

public class FormAuthenticationCaptchaFilter extends FormAuthenticationFilter {

	private String captchaParam = "captcha";

	public String getCaptchaParam() {
		return captchaParam;
	}

	public void setCaptchaParam(String captchaParam) {
		this.captchaParam = captchaParam;
	}

	protected String getCaptcha(ServletRequest request) {
		return WebUtils.getCleanParam(request, getCaptchaParam());
	}

	@Override
	protected AuthenticationToken createToken(ServletRequest request,
			ServletResponse response) {
		String username = getUsername(request);
		String password = getPassword(request);
		String captcha = getCaptcha(request);
		boolean rememberMe = isRememberMe(request);
		String host = getHost(request);
		return new CaptchaAuthenticationToken(username,
				password != null ? password.toCharArray() : null, rememberMe,
				host, captcha);
	}

	// 验证码校验
	protected void doCaptchaValidate(HttpServletRequest req,
			CaptchaAuthenticationToken token) {
		String captcha = (String) req.getSession().getAttribute(
				com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		if (captcha != null && !captcha.equalsIgnoreCase(token.getCaptcha())) {
			throw new IncorrectCredentialsException("验证码错误!");
		}
	}
	
	//认证
//	protected boolean executeLogin(ServletRequest req, 
//			ServletResponse resp) throw Exception{
//		try{
//			doCaptchaValidate(req, token);
//			Subject subject = getSubject(req, resp);
//			subject.login(token);
//			return onLoginSuccess(token, subject, req, resp);
//		}catch(AuthenticationException e){
//			return onLoginFailure(token, e, req, resp);
//		}
//	}

}
