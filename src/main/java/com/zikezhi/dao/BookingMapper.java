package com.zikezhi.dao;

import java.util.List;
import java.util.Map;

import com.zikezhi.entity.Booking;

public interface BookingMapper {

	int insertSelective(Booking record);

    int updateByPrimaryKeySelective(Booking record);
    
    List<Booking> queryByUid(Map<String,Object> map);
    
    long getTotal(Map<String,Object> map);

	List<Booking> queryAll(Map<String, Object> map);

	long getTotalAll();
	
	Booking queryById(String bid);
	
}
