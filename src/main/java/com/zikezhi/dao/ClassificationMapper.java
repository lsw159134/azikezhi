package com.zikezhi.dao;

import java.util.List;

import com.zikezhi.entity.Classification;

public interface ClassificationMapper {

	int insertSelective(Classification classification);
	
	int updateByclassificationKeySelective(Classification classification);
	
	List<Classification> queryAll();
	
	List<Classification> selectBySort(int sort);
	
	int queryclassificationName(Classification c);
	
	int delete(int id);
	
	List<Classification> selepassice();
}
