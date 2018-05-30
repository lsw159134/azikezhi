package com.zikezhi.serverImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.UaddressMapper;
import com.zikezhi.entity.Uaddress;
import com.zikezhi.service.UaddressService;

@Service("uaddressService")
public class UaddressServiceImpl implements UaddressService{

	@Autowired
	private UaddressMapper uaddressMapper;
	
	@Override
	public int insertSelective(Uaddress uaddress) {
		// TODO Auto-generated method stub
		return uaddressMapper.insertSelective(uaddress);
	}

	@Override
	public int updateByPrimaryKeySelective(Uaddress uaddress) {
		// TODO Auto-generated method stub
		return uaddressMapper.updateByPrimaryKeySelective(uaddress);
	}

	@Override
	public List<Uaddress> queryByUid(String uid) {
		// TODO Auto-generated method stub
		return uaddressMapper.queryByUid(uid);
	}

	@Override
	public Uaddress queryByStatus(String uid) {
		// TODO Auto-generated method stub
		return uaddressMapper.queryByStatus(uid);
	}

	@Override
	public Uaddress queryByAid(String a_id) {
		// TODO Auto-generated method stub
		return uaddressMapper.queryByAid(a_id);
	}

	@Override
	public int updateByAid(Uaddress uaddress) {
		// TODO Auto-generated method stub
		return uaddressMapper.updateByAid(uaddress);
	}

	@Override
	public int deleteUaddress(String a_id) {
		// TODO Auto-generated method stub
		return uaddressMapper.deleteUaddress(a_id);
	}

}
