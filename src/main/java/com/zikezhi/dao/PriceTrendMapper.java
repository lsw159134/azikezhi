package com.zikezhi.dao;

import java.util.List;

import com.zikezhi.entity.PriceTrend;

public interface PriceTrendMapper {

	int insertSelective(PriceTrend pt);
	
	List<PriceTrend> queryByPid(String pid);
	
	/*int deleteByPid();*/
}
