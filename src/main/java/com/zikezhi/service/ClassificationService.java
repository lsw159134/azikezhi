package com.zikezhi.service;

import java.util.List;

import com.zikezhi.entity.Classification;

public interface ClassificationService {
	
	int insertSelective(Classification classification);
	
	int updateByclassificationKeySelective(Classification classification);
	
	List<Classification> queryAll();
	
	List<Classification> selectBySort(int sort);
	
	int queryclassificationName(Classification c);

	int delete(int id);
	
	List<Classification> selepassice();
}
