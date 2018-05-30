package com.zikezhi.serverImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.InquiryMapper;
import com.zikezhi.entity.Inquiry;
import com.zikezhi.service.InquiryService;

@Service("inquiryService")
public class InquiryServiceImpl implements InquiryService{

	@Autowired
	private InquiryMapper inquiryMapper;
	
	@Override
	public int insertSelective(Inquiry i) {
		// TODO Auto-generated method stub
		return inquiryMapper.insertSelective(i);
	}

	@Override
	public int updateByPrimaryKeySelective(Inquiry i) {
		// TODO Auto-generated method stub
		return inquiryMapper.updateByPrimaryKeySelective(i);
	}

	@Override
	public List<Inquiry> queryAll(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return inquiryMapper.queryAll(map);
	}

	@Override
	public List<Inquiry> queryByUserid(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return inquiryMapper.queryByUserid(map);
	}

	@Override
	public Inquiry queryByid(int id) {
		// TODO Auto-generated method stub
		return inquiryMapper.queryByid(id);
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return inquiryMapper.getTotal(map);
	}

}
