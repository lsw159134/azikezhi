package com.zikezhi.dao;

import java.util.List;

import com.zikezhi.entity.Subcategory;

public interface SubcategoryMapper {

	int insertSelective(Subcategory s);
	
	int updateByPrimaryKeySelective(Subcategory s);
	
	int delete(int id);
	
	List<Subcategory> queryAll(int cid);
	
	List<Subcategory> selectBySort(Subcategory s);
	
}
