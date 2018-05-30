package com.zikezhi.service;

import java.util.List;
import java.util.Map;

import com.zikezhi.entity.OrderItme;

public interface OrderItmeService {
	int insertSelective(OrderItme record);

    int updateByPrimaryKeySelective(OrderItme record);

	List<OrderItme> selectAll(Map<String, Object> map);

	long getTotal();

	List<OrderItme> queryByEid(String eid);

}
