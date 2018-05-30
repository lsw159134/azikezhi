package com.zikezhi.serverImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.RkreportMapper;
import com.zikezhi.entity.Rkreport;
import com.zikezhi.service.RkreportService;

@Service("rkreportService")
public class RkreportServiceIml implements RkreportService{

	@Autowired
	private RkreportMapper rkreportMapper;
	
	@Override
	public int insertSelective(Rkreport r) {
		// TODO Auto-generated method stub
		return rkreportMapper.insertSelective(r);
	}

	@Override
	public List<Rkreport> queryAll(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return rkreportMapper.queryAll(map);
	}

	@Override
	public int countCart(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return rkreportMapper.countCart(map);
	}

	@Override
	public int updateByPrimaryKeySelective(Rkreport r) {
		// TODO Auto-generated method stub
		return rkreportMapper.updateByPrimaryKeySelective(r);
	}

}
