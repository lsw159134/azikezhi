package com.zikezhi.dao;

import java.util.List;
import java.util.Map;

import com.zikezhi.entity.Purchase;

public interface PurchaseMapper {

	int insertSelective(Purchase p);
	
	int updateByPrimaryKeySelective(Purchase p);
	
	List<Purchase> queryAll(Map<String ,Object> map);
	
	int queryTotal(Map<String ,Object> map);
}
