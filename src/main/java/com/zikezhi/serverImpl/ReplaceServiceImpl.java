package com.zikezhi.serverImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.ReplaceMapper;
import com.zikezhi.entity.Replace;
import com.zikezhi.service.ReplaceService;

@Service("replaceService")
public class ReplaceServiceImpl implements ReplaceService {

	@Autowired
	private ReplaceMapper replaceMapper;

	@Override
	public int insertService(Replace r) {
		// TODO Auto-generated method stub
		return replaceMapper.insertService(r);
	}

	@Override
	public int updateService(Replace r) {
		// TODO Auto-generated method stub
		return replaceMapper.updateService(r);
	}

	@Override
	public List<Replace> selereplace(String product) {
		// TODO Auto-generated method stub
		return replaceMapper.selereplace(product);
	}

	@Override
	public List<Replace> selereplaceAdmin(String product) {
		// TODO Auto-generated method stub
		return replaceMapper.selereplaceAdmin(product);
	}

	@Override
	public List<Replace> selereplaceBy2(String product) {
		// TODO Auto-generated method stub
		return replaceMapper.selereplaceBy2(product);
	}

	@Override
	public int deletet(String id) {
		// TODO Auto-generated method stub
		return replaceMapper.deletet(id);
	}
}
