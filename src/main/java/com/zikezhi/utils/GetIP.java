package com.zikezhi.utils;

import javax.servlet.http.HttpServletRequest;

/**
 * 
 * @author ponder
 * @version 1.0
 * @Date 2016年10月24日 
 * 
 * @ClassName SaveIP.java
 * 
*/

public class GetIP {
	
	public static String getIP(HttpServletRequest req){
		String ip = req.getHeader("x-forwarded-for"); 
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
			ip = req.getHeader("Proxy-Client-IP"); 
		} 
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
			ip = req.getHeader("WL-Proxy-Client-IP"); 
		} 
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
			ip = req.getRemoteAddr(); 
		}
		return ip;
	}
	
}
