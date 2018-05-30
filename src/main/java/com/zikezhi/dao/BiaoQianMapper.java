package com.zikezhi.dao;

import java.util.List;

import com.zikezhi.entity.BiaoQian;

public interface BiaoQianMapper {
	
	int insertSelective(BiaoQian b);
	
	int updateByPrimaryKeySelective(BiaoQian b);
	
	List<BiaoQian> queryByUid(String uid);
	
	int getTotal(String uid);
	
	BiaoQian queryByEid(String eid);
}
