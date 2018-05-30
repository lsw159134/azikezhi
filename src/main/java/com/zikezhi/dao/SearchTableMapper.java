package com.zikezhi.dao;

import java.util.List;
import java.util.Map;

import com.zikezhi.entity.SearchTable;

public interface SearchTableMapper {
    int deleteByPrimaryKey(String searchuuid);

    int insert(SearchTable record);

    int insertSelective(SearchTable record);

    SearchTable selectByPrimaryKey(String searchuuid);

    int updateByPrimaryKeySelective(SearchTable record);

    int updateByPrimaryKey(SearchTable record);
    
    List<SearchTable> select(Map<String, Object> map);

	int queryBycount(String ip);
	
	List<SearchTable> selectByIp(String ip);
}