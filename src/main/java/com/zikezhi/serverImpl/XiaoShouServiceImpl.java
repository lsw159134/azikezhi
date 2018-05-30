package com.zikezhi.serverImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.XiaoShouMapper;
import com.zikezhi.entity.XiaoShou;
import com.zikezhi.service.XiaoShouService;

@Service("xiaoShouService")
public class XiaoShouServiceImpl implements XiaoShouService {

	@Autowired
	private XiaoShouMapper xiaoShouMapper;
	
	@Override
	public int insertSelective(XiaoShou xs) {
		// TODO Auto-generated method stub
		return xiaoShouMapper.insertSelective(xs);
	}

	@Override
	public List<XiaoShou> queryAll(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return xiaoShouMapper.queryAll(map);
	}

	@Override
	public int countCart(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return xiaoShouMapper.countCart(map);
	}

	@Override
	public XiaoShou seleByid(String id) {
		// TODO Auto-generated method stub
		return xiaoShouMapper.seleByid(id);
	}

	@Override
	public int updateByPrimaryKeySelective(XiaoShou xs) {
		// TODO Auto-generated method stub
		return xiaoShouMapper.updateByPrimaryKeySelective(xs);
	}

}
