package com.zikezhi.service;

import java.util.List;

import com.zikezhi.entity.Productdistinct;

public interface ProductdistinctService {
	
	int deleterandomtext();
	
	List<Productdistinct> query(String product);
}
