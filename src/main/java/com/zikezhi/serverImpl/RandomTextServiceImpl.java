package com.zikezhi.serverImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.RandomTextMapper;
import com.zikezhi.entity.RandomText;
import com.zikezhi.service.RandomTextService;

@Service("randomTextService")
public class RandomTextServiceImpl implements RandomTextService {

	@Autowired
	private RandomTextMapper randomTextMapper;

	@Override
	public int updateByPrimaryKey(RandomText r) {
		// TODO Auto-generated method stub
		return randomTextMapper.updateByPrimaryKey(r);
	}

	@Override
	public List<RandomText> query(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return randomTextMapper.query(map);
	}

	@Override
	public int insertSelective(RandomText r) {
		// TODO Auto-generated method stub
		return randomTextMapper.insertSelective(r);
	}

	@Override
	public int deleterandomtext(int id) {
		// TODO Auto-generated method stub
		return randomTextMapper.deleterandomtext(id);
	}
	
}
