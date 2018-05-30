package com.zikezhi.service;

import java.util.List;

import com.zikezhi.entity.PImg;


public interface PImgService {
	List<PImg> selectPimg(String p_imgpid);
	int insertPimg(PImg pimg);
	int updatePimgById(PImg pimg);
	Long selectPimgCount(String p_imgpid);
}
