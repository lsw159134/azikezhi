package com.zikezhi.dao;

import java.util.List;
import java.util.Map;

import com.zikezhi.entity.Inquiry;

public interface InquiryMapper {

	int insertSelective(Inquiry i);
	
	int updateByPrimaryKeySelective(Inquiry i);
	
	List<Inquiry> queryAll(Map<String,Object> map);
	
	List<Inquiry> queryByUserid(Map<String,Object> map);
	
	Inquiry queryByid(int id);
	
	int getTotal(Map<String,Object> map);
}
