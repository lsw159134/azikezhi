package com.zikezhi.dao;

import java.util.List;

import com.zikezhi.entity.Brand;

public interface BrandMapper {
	
	int insertSelective(Brand b);
	
	int updateByPrimaryKeySelective(Brand b);
	
	int deleteByid(int id);
	
	List<Brand> queryAll();
	
	List<Brand> queryBydesc();
	
	int getTotal();

	List<Brand> queryByname();

	int queryBy(String name);

	int seleSort();
	
}
