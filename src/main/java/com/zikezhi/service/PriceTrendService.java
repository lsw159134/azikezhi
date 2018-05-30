package com.zikezhi.service;

import java.util.List;

import com.zikezhi.entity.PriceTrend;

public interface PriceTrendService {

	int insertSelective(PriceTrend pt);
	
	List<PriceTrend> queryByPid(String pid);
}
