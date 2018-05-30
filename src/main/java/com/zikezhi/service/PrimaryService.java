package com.zikezhi.service;

import java.util.List;

import com.zikezhi.entity.Primary;

public interface PrimaryService {

	int insertSelective(Primary bom);
	
	int updateByPrimaryKeySelective(Primary cart);
	
	List<Primary> queryAll();
	
	Primary selectByid(int id);

	int queryByDateCount(String edate);
	
	List<Primary> querybomuserphone(String uid);
	
	int deletePrimary(int id);

	int queryPrimaryName(Primary p);
	
	List<Primary> select_primary_name(String primary_id);
	
	List<Primary> indexseleprimary();
	
	List<Primary> moreSort();

}
