package com.zikezhi.service;

import java.util.List;
import java.util.Map;

import com.zikezhi.entity.RandomText;

public interface RandomTextService {
	
	int insertSelective(RandomText r);
	
	int updateByPrimaryKey(RandomText r);

	List<RandomText> query(Map<String,Object> map);
	
	int deleterandomtext(int id);
}
