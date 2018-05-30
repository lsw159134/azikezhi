package com.zikezhi.serverImpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zikezhi.dao.SearchTableMapper;
import com.zikezhi.entity.SearchTable;
import com.zikezhi.service.SearchTableService;

/**
 * 
 * @author ponder
 * @version 1.0
 * @Date 2016年10月24日 
 * 
 * @ClassName SearchTableServiceImpl.java
 * 
*/

@Service("searchTableService")
public class SearchTableServiceImpl implements SearchTableService {

	@Resource
	private SearchTableMapper searchTable;

	public int deleteByPrimaryKey(String searchuuid) {
		return searchTable.deleteByPrimaryKey(searchuuid);
	}

	public int insert(SearchTable record) {
		return searchTable.insert(record);
	}

	public int insertSelective(SearchTable record) {
		return searchTable.insertSelective(record);
	}

	public SearchTable selectByPrimaryKey(String searchuuid) {
		return searchTable.selectByPrimaryKey(searchuuid);
	}

	public int updateByPrimaryKeySelective(SearchTable record) {
		return searchTable.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(SearchTable record) {
		return searchTable.updateByPrimaryKey(record);
	}

	public List<SearchTable> select(Map<String, Object> map) {
		return searchTable.select(map);
	}

	@Override
	public int queryBycount(String ip) {
		return searchTable.queryBycount(ip);
	}

	@Override
	public List<SearchTable> selectByIp(String ip) {
		return searchTable.selectByIp(ip);
	}

}
