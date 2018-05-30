package com.zikezhi.utils;

import java.util.UUID;

/**
 * 
 * @author ponder
 * @version 1.0
 * @Date 2016年9月1日 
 * @Description: 生成UUID
 * 
 * @ClassName UIDGenerator.java
 * 
*/

public class UIDGenerator {
	
	/**
	 * 随机UUID
	 */
	public static synchronized String getUUID(){
		UUID uuid = UUID.randomUUID();
		String uuidStr = uuid.toString().replace("-", "");
		return uuidStr;
	}
	
	/**
	 * 字符串生成UUID
	 */
	public static synchronized String getUUID(String name){
		UUID uuid = UUID.nameUUIDFromBytes(name.getBytes());
		String uuidStr = uuid.toString().replace("-", "");
		return uuidStr;
	}
	
	private static synchronized int compare(String str, String target)
    {
        int d[][];              // 矩阵
        int n = str.length();
        int m = target.length();
        int i;                  // 遍历str的
        int j;                  // 遍历target的
        char ch1;               // str的
        char ch2;               // target的
        int temp;               // 记录相同字符,在某个矩阵位置值的增量,不是0就是1
        if (n == 0) { return m; }
        if (m == 0) { return n; }
        d = new int[n + 1][m + 1];
        for (i = 0; i <= n; i++)
        {                       // 初始化第一列
            d[i][0] = i;
        }

        for (j = 0; j <= m; j++)
        {                       // 初始化第一行
            d[0][j] = j;
        }

        for (i = 1; i <= n; i++)
        {                       // 遍历str
            ch1 = str.charAt(i - 1);
            // 去匹配target
            for (j = 1; j <= m; j++)
            {
                ch2 = target.charAt(j - 1);
                if (ch1 == ch2 || ch1 == ch2+32 || ch1+32 == ch2)
                {
                    temp = 0;
                } else
                {
                    temp = 1;
                }
                // 左边+1,上边+1, 左上角+temp取最小
                d[i][j] = min(d[i - 1][j] + 1, d[i][j - 1] + 1, d[i - 1][j - 1] + temp);
            }
        }
        return d[n][m];
    }

    private static synchronized int min(int one, int two, int three)
    {
        return (one = one < two ? one : two) < three ? one : three;
    }

    /**
     * 获取两字符串的相似度
     */

    public static synchronized float getSimilarityRatio(String str, String target)
    {
        return 1 - (float) compare(str, target) / Math.max(str.length(), target.length());
    }

 /*public static void main(String[] args)
    {
       
        System.out.println("similarityRatio=" + UIDGenerator.getUUID("样品商城"));
    }*/
   /* 
    public static void fun(){
        for(int i=0; i<10; i++){
            if(i==5){
            	continue;
            }
            System.out.print(i+" ");
        }
        System.out.println("hello");
    }*/
   /* public static void main(String[] args) {
        for(int i=0;i<2822;i++){
        	System.out.println(getUUID());
        }
    }*/
}