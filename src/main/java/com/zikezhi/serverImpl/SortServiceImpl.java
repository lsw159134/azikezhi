package com.zikezhi.serverImpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zikezhi.dao.SortMapper;
import com.zikezhi.entity.Sort;
import com.zikezhi.service.SortService;

@Service("sortService")
public class SortServiceImpl implements SortService {
	
	@Resource
	private  SortMapper sortMapper;

	@Override
	public int insert_Sort(Sort sort) {
		// TODO Auto-generated method stub
		return sortMapper.insert_Sort(sort);
	}

	@Override
	public int update_Sort(Sort sort) {
		// TODO Auto-generated method stub
		return sortMapper.update_Sort(sort);
	}

	@Override
	public List<Sort> select_Sort(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sortMapper.select_Sort(map);
	}

	@Override
	public Sort select_SortUpdate(String sort_id) {
		// TODO Auto-generated method stub
		return sortMapper.select_SortUpdate(sort_id);
	}

	@Override
	public Long getTotal_Sort(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sortMapper.getTotal_Sort(map);
	}

}
