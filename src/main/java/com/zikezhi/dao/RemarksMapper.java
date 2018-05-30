package com.zikezhi.dao;

import java.util.List;

import com.zikezhi.entity.Remarks;

public interface RemarksMapper {

	int insertSelective(Remarks r);
	
	int updateByPrimaryKeySelective(Remarks r);
	
	Remarks queryByPid(String suid,String userid);

	List<Remarks> queryAll();
	
}
