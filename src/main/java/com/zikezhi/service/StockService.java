package com.zikezhi.service;

import java.util.List;
import java.util.Map;

import com.zikezhi.entity.Stock;

public interface StockService {

	int insertSelective(Stock s);
	
	int updateByPrimaryKeySelective(Stock s);
	
	Stock queryByPid(String product,String uid);
	
	List<Stock> queryAll(Map<String ,Object> map);
	
	int countCart(Map<String ,Object> map);
	
	Stock seleByxiangtong(Stock s);
	
	List<Stock> seleBycount(String product);
	
	Stock seleByid(String id);
	
	List<Stock> seleByXiaoshou(String product,String uid);
}
