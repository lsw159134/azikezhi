package com.zikezhi.service;

import java.util.List;
import java.util.Map;

import com.zikezhi.entity.Booking;

public interface BookingService {
	
	int insertSelective(Booking record);

    int updateByPrimaryKeySelective(Booking record);
    
    List<Booking> queryByUid(Map<String,Object> map);
    
    long getTotal(Map<String,Object> map);

	List<Booking> queryAll(Map<String, Object> map);

	long getTotalAll();
	
	Booking queryById(String bid);
}
