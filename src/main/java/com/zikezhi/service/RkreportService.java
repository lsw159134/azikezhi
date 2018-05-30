package com.zikezhi.service;

import java.util.List;
import java.util.Map;

import com.zikezhi.entity.Rkreport;

public interface RkreportService {

	int insertSelective(Rkreport r);
	
	int updateByPrimaryKeySelective(Rkreport r);
	
	List<Rkreport> queryAll(Map<String,Object> map);
	
	int countCart(Map<String,Object> map);
}
