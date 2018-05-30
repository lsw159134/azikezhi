package com.zikezhi.serverImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zikezhi.dao.PImgMapper;
import com.zikezhi.entity.PImg;
import com.zikezhi.service.PImgService;

@Service("pimgService")
public class PImgServiceImpl implements PImgService {
	
	@Resource
	private PImgMapper pimgMapper;
	
	
	//查询对应产品id的所有图片
	@Override
	public List<PImg> selectPimg(String p_imgpid) {
		// TODO Auto-generated method stub
		return pimgMapper.selectPimg(p_imgpid);
	}

	//添加对应产品id的图片
	@Override
	public int insertPimg(PImg pimg) {
		// TODO Auto-generated method stub
		return pimgMapper.insertPimg(pimg);
	}

	@Override
	public Long selectPimgCount(String p_imgpid) {
		// TODO Auto-generated method stub
		return pimgMapper.selectPimgCount(p_imgpid);
	}

	@Override
	public int updatePimgById(PImg pimg) {
		// TODO Auto-generated method stub
		return pimgMapper.updatePimgById(pimg);
	}

	
}
