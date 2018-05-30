package com.zikezhi.serverImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.StockMapper;
import com.zikezhi.entity.Stock;
import com.zikezhi.service.StockService;

@Service("stockService")
public class StockServiceImpl implements StockService {
	
	@Autowired
	private StockMapper stockMapper;

	@Override
	public int insertSelective(Stock s) {
		return stockMapper.insertSelective(s);
	}

	@Override
	public int updateByPrimaryKeySelective(Stock s) {
		return stockMapper.updateByPrimaryKeySelective(s);
	}

	@Override
	public Stock queryByPid(String product, String uid) {
		return stockMapper.queryByPid(product, uid);
	}

	@Override
	public List<Stock> queryAll(Map<String, Object> map) {
		return stockMapper.queryAll(map);
	}

	@Override
	public int countCart(Map<String, Object> map) {
		return stockMapper.countCart(map);
	}

	@Override
	public Stock seleByxiangtong(Stock s) {
		return stockMapper.seleByxiangtong(s);
	}

	@Override
	public List<Stock> seleBycount(String product) {
		// TODO Auto-generated method stub
		return stockMapper.seleBycount(product);
	}

	@Override
	public Stock seleByid(String id) {
		// TODO Auto-generated method stub
		return stockMapper.seleByid(id);
	}

	@Override
	public List<Stock> seleByXiaoshou(String product, String uid) {
		// TODO Auto-generated method stub
		return stockMapper.seleByXiaoshou(product, uid);
	}

}
