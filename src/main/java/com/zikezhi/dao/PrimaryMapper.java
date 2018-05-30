package com.zikezhi.dao;

import java.util.List;

import com.zikezhi.entity.Primary;

public interface PrimaryMapper {

	int insertSelective(Primary pry);
	
	int updateByPrimaryKeySelective(Primary cart);
	
	List<Primary> queryAll();
	
	Primary selectByid(int id);

	int queryByDateCount(String edate);
	
	List<Primary> querybomuserphone(String uid);
	
	int deletePrimary(int id);

	int queryPrimaryName(Primary p);
	
	//查询一级分类名称
	List<Primary> select_primary_name(String primary_id);
	
	List<Primary> indexseleprimary();
	
	//更多一级分类的查询
	List<Primary> moreSort();

}
