package com.zikezhi.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 
 * @author ponder
 * @version 1.0
 * @Date 2016年12月3日
 * @Description: TODO(用一句话描述这个方法的作用)
 * 
 * @ClassName MD5Generator.java
 * 
 */

public class MD5Generator {

	public static synchronized String getMD5(String password, String salt) {
		String str = password + salt;
		StringBuffer sb = new StringBuffer();
		try {
			MessageDigest md = MessageDigest.getInstance("md5");
			md.update(str.getBytes());
			byte b[] = md.digest();
			int i;
			for (int offset = 0; offset < b.length; offset++) {
				i = b[offset];
				if (i < 0) {
					i += 256;
				}
				if (i < 16) {
					sb.append("0");
				}
				sb.append(Integer.toHexString(i));
			}

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return sb.toString();
	}
	public static synchronized String getMD5(String password) {
		StringBuffer sb = new StringBuffer();
		try {
			MessageDigest md = MessageDigest.getInstance("md5");
			md.update(password.getBytes());
			byte b[] = md.digest();
			int i;
			for (int offset = 0; offset < b.length; offset++) {
				i = b[offset];
				if (i < 0) {
					i += 256;
				}
				if (i < 16) {
					sb.append("0");
				}
				sb.append(Integer.toHexString(i));
			}

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return sb.toString();
	}
	
	/*public static void main(String[] args) throws UnsupportedEncodingException {
		String x="%E4%B8%8A%E6%B5%B7%E5%B0%8F%E6%8C%81";
		String s="[object HTMLSpanElement]";
		System.out.println(URLDecoder.decode(x,"UTF-8"));
		System.out.println(URLDecoder.decode(s,"UTF-8"));
		//System.out.println(getMD5("zhangxiaoru"));
	}*/

}
