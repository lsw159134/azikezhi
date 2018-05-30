package com.zikezhi.serverImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.PriceTrendMapper;
import com.zikezhi.entity.PriceTrend;
import com.zikezhi.service.PriceTrendService;

@Service("priceTrendService")
public class PriceTrendServiceImpl implements PriceTrendService {

	@Autowired
	private PriceTrendMapper priceTrendMapper;
	
	@Override
	public int insertSelective(PriceTrend pt) {
		// TODO Auto-generated method stub
		return priceTrendMapper.insertSelective(pt);
	}

	@Override
	public List<PriceTrend> queryByPid(String pid) {
		// TODO Auto-generated method stub
		return priceTrendMapper.queryByPid(pid);
	}

}
