package com.zikezhi.dao;

import java.util.List;
import java.util.Map;

import com.zikezhi.entity.Sort;

public interface SortMapper {
	
	//添加
	int insert_Sort(Sort sort);
	
	//修改
	int update_Sort(Sort sort);
	
	//查主页
	List<Sort> select_Sort(Map<String, Object> map);
	
	//修改查询
	Sort select_SortUpdate(String sort_id);
	
	//查总数
	Long getTotal_Sort(Map<String, Object> map);
}
