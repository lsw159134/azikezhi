package com.zikezhi.serverImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.WithdrawALMapper;
import com.zikezhi.entity.WithdrawAL;
import com.zikezhi.service.WithdrawALService;

@Service("withdrawALService")
public class WithdrawALServiceImpl implements WithdrawALService {
	
	@Autowired
    private WithdrawALMapper withdrawALMapper;
	
	@Override
	public int insertSelective(WithdrawAL withdrawAL) {
		// TODO Auto-generated method stub
		return withdrawALMapper.insertSelective(withdrawAL);
	}

	@Override
	public int updateByPrimaryKeySelective(WithdrawAL withdrawAL) {
		// TODO Auto-generated method stub
		return withdrawALMapper.updateByPrimaryKeySelective(withdrawAL);
	}

	@Override
	public Float queryByUidAndWprice(String uid) {
		// TODO Auto-generated method stub
		return withdrawALMapper.queryByUidAndWprice(uid);
	}

	@Override
	public List<WithdrawAL> queryAll(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return withdrawALMapper.queryAll(map);
	}

	@Override
	public long getTotal() {
		// TODO Auto-generated method stub
		return withdrawALMapper.getTotal();
	}

}
