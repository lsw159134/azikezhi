package com.zikezhi.service;

import java.util.List;

import com.zikezhi.entity.Second;

public interface SecondService {

	int insertSelective(Second pry);
	
	int updateByPrimaryKeySelective(Second cart);
	
	List<Second> queryAll(int id);
	
	Second selectByid(int id);

	int queryByDateCount(String edate);
	
	List<Second> querybomuserphone(String uid);
	
	int deleteSecond(int id);

	int querySecondName(Second p);
	
	List<Second> select_second_name(String primary_name);
	
	String detail_second_name(int second_id);
}
