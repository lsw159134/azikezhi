package com.zikezhi.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * 
 * @author ponder
 * @version 1.0
 * @Date 2016年9月29日
 * @Description: 根据当前年月日 + 五位随机数
 * 
 * @ClassName RandomUtil.java
 * 
 */

public class RandomUtil {

	public static String getRandomFileName() {
		SimpleDateFormat simpleDateFormat;
		simpleDateFormat = new SimpleDateFormat("yyMMddHHmmss");
		Date date = new Date();
		String str = simpleDateFormat.format(date);// 当前时间
		Random random = new Random();
		int rannum = (int) (random.nextDouble() * (999999 - 100000 + 1)) + 100000;// 获取6位随机数
		return str + rannum;
	}
	
}
