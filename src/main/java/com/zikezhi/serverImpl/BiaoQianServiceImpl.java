package com.zikezhi.serverImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.BiaoQianMapper;
import com.zikezhi.entity.BiaoQian;
import com.zikezhi.service.BiaoQianService;

@Service("biaoQianService")
public class BiaoQianServiceImpl implements BiaoQianService {

	@Autowired
	private BiaoQianMapper biaoQianMapper;
	
	@Override
	public int insertSelective(BiaoQian b) {
		return biaoQianMapper.insertSelective(b);
	}

	@Override
	public int updateByPrimaryKeySelective(BiaoQian b) {
		return biaoQianMapper.updateByPrimaryKeySelective(b);
	}

	@Override
	public List<BiaoQian> queryByUid(String uid) {
		return biaoQianMapper.queryByUid(uid);
	}

	@Override
	public int getTotal(String uid) {
		return biaoQianMapper.getTotal(uid);
	}

	@Override
	public BiaoQian queryEid(String eid) {
		// TODO Auto-generated method stub
		return biaoQianMapper.queryByEid(eid);
	}

}
