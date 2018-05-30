package com.zikezhi.dao;

import java.util.List;
import java.util.Map;

import com.zikezhi.entity.XiaoShou;

public interface XiaoShouMapper {

	int insertSelective(XiaoShou xs);
	
	int updateByPrimaryKeySelective(XiaoShou xs);
	
	List<XiaoShou> queryAll(Map<String,Object> map);
	
	int countCart(Map<String,Object> map);

	XiaoShou seleByid(String id);
}
