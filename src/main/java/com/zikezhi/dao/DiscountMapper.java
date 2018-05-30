package com.zikezhi.dao;

import java.util.List;

import com.zikezhi.entity.Discount;

public interface DiscountMapper {

	int insertSelective(Discount record);

    int updateByPrimaryKeySelective(Discount record);

	List<Discount> queryByPid(String pid);

	List<Discount> queryByMin(Discount discount);
    
   /* List<Booking> queryByUid(Map<String,Object> map);
    
    long getTotal(Map<String,Object> map);

	List<Booking> queryAll(Map<String, Object> map);

	long getTotalAll();*/
	
}
