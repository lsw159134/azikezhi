package com.zikezhi.dao;

import java.util.List;
import java.util.Map;

import com.zikezhi.entity.WithdrawAL;

public interface WithdrawALMapper {
	
	int insertSelective(WithdrawAL withdrawAL);

    int updateByPrimaryKeySelective(WithdrawAL withdrawAL);

	Float queryByUidAndWprice(String uid);

	List<WithdrawAL> queryAll(Map<String,Object> map);
	
	long getTotal();
	//List<WithdrawAL> queryByEid(String eid);
}
