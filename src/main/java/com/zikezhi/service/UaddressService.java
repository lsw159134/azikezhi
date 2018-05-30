package com.zikezhi.service;

import java.util.List;

import com.zikezhi.entity.Uaddress;

public interface UaddressService {

	int insertSelective(Uaddress uaddress);
	
	int updateByPrimaryKeySelective(Uaddress uaddress);
	
	int updateByAid(Uaddress uaddress);
	
	List<Uaddress> queryByUid(String uid);
	
	Uaddress queryByStatus(String uid);
	
	Uaddress queryByAid(String a_id);
	
	int deleteUaddress(String a_id);
}
