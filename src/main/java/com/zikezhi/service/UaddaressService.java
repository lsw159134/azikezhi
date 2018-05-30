package com.zikezhi.service;

import com.zikezhi.entity.Uaddress;

public interface UaddaressService {

	int insertSelective(Uaddress uaddress);
	
	int updateByPrimaryKeySelective(Uaddress uaddress);
}
