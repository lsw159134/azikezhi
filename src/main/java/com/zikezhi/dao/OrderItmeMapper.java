package com.zikezhi.dao;

import java.util.List;

import com.zikezhi.entity.OrderItme;

public interface OrderItmeMapper {

    int insertSelective(OrderItme record);

    int updateByPrimaryKeySelective(OrderItme record);

	List<OrderItme> queryByEid(String eid);

	/*List<OrderItme> selectAll(Map<String, Object> map);

	long getTotal();*/

}