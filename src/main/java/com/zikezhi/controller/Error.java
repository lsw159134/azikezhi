package com.zikezhi.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @author ponder
 * @version 1.0
 * @Date 2016年9月2日
 * @Description: 服务器错误页面，404和500错误
 * 
 * @ClassName Error.java
 * 
 */

@Controller
public class Error {
	private Logger logger = Logger.getLogger(AddProduct.class);

	@RequestMapping(value = { "/404.jsp", "404", "404.html" })
	public String pageNotFound() {
		logger.info("com.zikezhi.controller.Error.pageNotFound start");
		return "404";
	}

	@RequestMapping(value = { "/500.jsp", "500", "500.html" })
	public String serverError() {
		logger.info("com.zikezhi.controller.Error.serverError start");
		return "500";
	}

}
