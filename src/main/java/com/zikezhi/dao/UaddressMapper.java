package com.zikezhi.dao;

import java.util.List;

import com.zikezhi.entity.Uaddress;

public interface UaddressMapper {
	int insertSelective(Uaddress uaddress);
	
	int updateByPrimaryKeySelective(Uaddress uaddress);
	
	int updateByAid(Uaddress uaddress);
	
	List<Uaddress> queryByUid(String uid);
	
	Uaddress queryByStatus(String uid);
	
	Uaddress queryByAid(String a_id);
	
	int deleteUaddress(String a_id);
}
