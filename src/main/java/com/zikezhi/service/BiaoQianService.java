package com.zikezhi.service;

import java.util.List;

import com.zikezhi.entity.BiaoQian;

public interface BiaoQianService {
	
	int insertSelective(BiaoQian b);
	
	int updateByPrimaryKeySelective(BiaoQian b);
	
	List<BiaoQian> queryByUid(String uid);
	
	int getTotal(String uid);
	
	BiaoQian queryEid(String eid);
}
