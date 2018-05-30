package com.zikezhi.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zikezhi.entity.Productdistinct;

public interface ProductdistinctMapper {
	
	int deleterandomtext();
	
	List<Productdistinct> query(@Param("product")String product);
	
}
