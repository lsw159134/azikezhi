package com.zikezhi.utils;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

/**
 * 
 * @author ponder
 * @version 1.0
 * @Date 2016年8月31日 
 * @Description: TODO(用一句话描述这个方法的作用)
 * 
 * @ClassName Upload.java
 * 
*/

public class Upload {
	
	/**
	 * 
	 * 
	 * @code HttpServletRequest req
	 * @param String uuid  文件的唯一的UUID
	 * @param 文件 file
	 * @param 路径 path
	 * @Title Upload
	 * @return 路径  例    product/images/b0eb8efd090041dda2a5628a5472184c.gif
	 *
	 */
	public static String uploadFile(HttpServletRequest req, String uuid, MultipartFile file, String path){
		File f = new File(path);
		if(!f.exists()){
			f.mkdirs();
		}
		File destination =  new File(path, uuid + getExtention(file.getOriginalFilename()));
		if (!file.isEmpty()) {
			try {
				 FileUtils.copyInputStreamToFile(file.getInputStream(), destination);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//去掉服务器路径，路径 + uuid + 扩展名  整个文件夹唯一 
		//例    product/images/b0eb8efd090041dda2a5628a5472184c.gif
		return path.substring(req.getSession().getServletContext().getRealPath("/").toString().length()) + "/" + uuid + getExtention(file.getOriginalFilename());
	}
	
	
	public static String getExtention(String fileName){
		if(fileName != null && fileName.length() > 0  && fileName.lastIndexOf(".") > -1){
			return fileName.substring(fileName.lastIndexOf("."));
		}
		return "";
	}
}
