package com.zikezhi.serverImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.PurchaseMapper;
import com.zikezhi.entity.Purchase;
import com.zikezhi.service.PurchaseService;

@Service("purchaseService")
public class PurchaseServiceImpl implements PurchaseService {

	@Autowired
	private PurchaseMapper purchaseMapper;
	
	@Override
	public int insertSelective(Purchase p) {
		return purchaseMapper.insertSelective(p);
	}

	@Override
	public int updateByPrimaryKeySelective(Purchase p) {
		return purchaseMapper.updateByPrimaryKeySelective(p);
	}

	@Override
	public List<Purchase> queryAll(Map<String, Object> map) {
		return purchaseMapper.queryAll(map);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		return purchaseMapper.queryTotal(map);
	}

}
