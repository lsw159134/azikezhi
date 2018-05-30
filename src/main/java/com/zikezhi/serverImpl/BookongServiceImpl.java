package com.zikezhi.serverImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.BookingMapper;
import com.zikezhi.entity.Booking;
import com.zikezhi.service.BookingService;

@Service("bookingService")
public class BookongServiceImpl implements BookingService {

	@Autowired
    private BookingMapper bookingMapper;
	
	@Override
	public int insertSelective(Booking record) {
		return bookingMapper.insertSelective(record);
	}

	@Override
	public int updateByPrimaryKeySelective(Booking record) {
		return bookingMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public List<Booking> queryByUid(Map<String, Object> map) {
		return bookingMapper.queryByUid(map);
	}

	@Override
	public long getTotal(Map<String, Object> map) {
		return bookingMapper.getTotal(map);
	}

	@Override
	public List<Booking> queryAll(Map<String, Object> map) {
		return bookingMapper.queryAll(map);
	}

	@Override
	public long getTotalAll() {
		return bookingMapper.getTotalAll();
	}

	@Override
	public Booking queryById(String bid) {
		return bookingMapper.queryById(bid);
	}

}
