package com.zikezhi.service;

import java.util.List;
import java.util.Map;

import com.zikezhi.entity.SearchTable;

/**
 * 
 * @author ponder
 * @version 1.0
 * @Date 2016年10月24日 
 * 
 * @ClassName SearchTable.java
 * 
*/

public interface SearchTableService {
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
