package com.zikezhi.service;

import java.util.List;
import java.util.Map;

import com.zikezhi.entity.Printrecord;

public interface PrintrecordService {
	
	int insertSelective(Printrecord p);
	
	int updateByPrimaryKeySelective(Printrecord p);
	
	List<Printrecord> queryAll(Map<String, Object> map);
	
	long getTotal(Map<String,Object>map);
	
	Printrecord queryByeid(String eid);
}
