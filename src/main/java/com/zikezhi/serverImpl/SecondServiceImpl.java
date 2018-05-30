package com.zikezhi.serverImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.SecondMapper;
import com.zikezhi.entity.Second;
import com.zikezhi.service.SecondService;

@Service("secondService")
public class SecondServiceImpl implements SecondService {

	@Autowired
	private SecondMapper secondMapper;
	
	@Override
	public int insertSelective(Second pry) {
		// TODO Auto-generated method stub
		return secondMapper.insertSelective(pry);
	}

	@Override
	public int updateByPrimaryKeySelective(Second cart) {
		// TODO Auto-generated method stub
		return secondMapper.updateByPrimaryKeySelective(cart);
	}

	@Override
	public List<Second> queryAll(int id) {
		// TODO Auto-generated method stub
		return secondMapper.queryAll(id);
	}

	@Override
	public Second selectByid(int id) {
		// TODO Auto-generated method stub
		return secondMapper.selectByid(id);
	}

	@Override
	public int queryByDateCount(String edate) {
		// TODO Auto-generated method stub
		return secondMapper.queryByDateCount(edate);
	}

	@Override
	public List<Second> querybomuserphone(String uid) {
		// TODO Auto-generated method stub
		return secondMapper.querybomuserphone(uid);
	}

	@Override
	public int deleteSecond(int id) {
		// TODO Auto-generated method stub
		return secondMapper.deleteSecond(id);
	}

	@Override
	public int querySecondName(Second p) {
		// TODO Auto-generated method stub
		return secondMapper.querySecondName(p);
	}

	@Override
	public List<Second> select_second_name(String primary_name) {
		// TODO Auto-generated method stub
		return secondMapper.select_second_name(primary_name);
	}

	@Override
	public String detail_second_name(int second_id) {
		// TODO Auto-generated method stub
		return secondMapper.detail_second_name(second_id);
	}

}
