package com.zikezhi.dao;

import java.util.List;
import java.util.Map;

import com.zikezhi.entity.BomOrder;


public interface BomOrderMapper {

	int insertSelective(BomOrder bom);
	
	int updateByPrimaryKeySelective(BomOrder cart);
	
	List<BomOrder> queryAll(Map<String, Object> map);
	
	BomOrder selectByid(int id);

	int queryByDateCount(String edate);
	
	List<BomOrder> querybomuserphone(String uid);
	
	Float queryByfanUserBom(String uid);

	List<String> queryByTotalExpress();

	List<String> queryByStatus();

	long getTotalAll(Map<String, Object> map);
	
}
