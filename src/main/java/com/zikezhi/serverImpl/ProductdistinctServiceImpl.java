package com.zikezhi.serverImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.ProductdistinctMapper;
import com.zikezhi.entity.Productdistinct;
import com.zikezhi.service.ProductdistinctService;

@Service("productdistinctService")
public class ProductdistinctServiceImpl implements ProductdistinctService {

	@Autowired
	private ProductdistinctMapper productdistinctMapper;
	
	@Override
	public int deleterandomtext() {
		return productdistinctMapper.deleterandomtext();
	}

	@Override
	public List<Productdistinct> query(String product) {
		return productdistinctMapper.query(product);
	}

}
