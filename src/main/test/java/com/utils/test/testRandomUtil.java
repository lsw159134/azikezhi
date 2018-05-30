package com.utils.test;

import com.zaixinjian.utils.RandomUtil;

/**
 * 
 * @author ponder
 * @version 1.0
 * @Date 2016年9月29日 
 * @Description: TODO(用一句话描述这个方法的作用)
 * 
 * @ClassName testRandomUtil.java
 * 
*/

public class testRandomUtil {
	
	public static void main(String[] args) {

		String str = RandomUtil.getRandomFileName();

//		String[] str = new String[10000];
//		for(int i = 0; i < 10000; i++){
//			str[i] = RandomUtil.getRandomFileName();
//		}
//		int num = 0;
//		for(int i = 1; i < 10000; i++){
//			for(int j = 0; j < i; j++){
//				if(str[i].equals(str[j])){
//					System.out.println(str[i]);
//					System.out.println(str[j]);
//					System.out.println(i + "<------>" + j);
//					num ++;
//				}
//			}
//		}
//		System.out.println(num);
	}
}
