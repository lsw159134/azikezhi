package com.zikezhi.serverImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.OrderItmeMapper;
import com.zikezhi.entity.OrderItme;
import com.zikezhi.service.OrderItmeService;

@Service("OrderItmeService")
public class OrderItmeServiceImpl implements OrderItmeService {

	@Autowired
    private OrderItmeMapper orderItme;
	
	@Override
	public int insertSelective(OrderItme record) {
		// TODO Auto-generated method stub
		return orderItme.insertSelective(record);
	}

	@Override
	public int updateByPrimaryKeySelective(OrderItme record) {
		// TODO Auto-generated method stub
		return orderItme.updateByPrimaryKeySelective(record);
	}

	@Override
	public List<OrderItme> selectAll(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long getTotal() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<OrderItme> queryByEid(String eid) {
		// TODO Auto-generated method stub
		return orderItme.queryByEid(eid);
	}

}
