package com.zikezhi.dao;

import java.util.List;
import java.util.Map;

import com.zikezhi.entity.RandomText;

public interface RandomTextMapper {
	
	int insertSelective(RandomText r);
	
	int updateByPrimaryKey(RandomText r);

	List<RandomText> query(Map<String,Object> map);
	
	int deleterandomtext(int id);
}
