package com.zikezhi.dao;

import java.util.List;
import java.util.Map;

import com.zikezhi.entity.Quote;

public interface QuoteMapper {
	
	int insertSelective(Quote q);
	
	int updateByPrimaryKeySelective(Quote q);
	
	List<Quote> queryByUser(Map<String,Object> map);
	
	int getTotal(Map<String,Object> map);
	
	List<Quote> queryAll(Map<String,Object> map);
	
}
