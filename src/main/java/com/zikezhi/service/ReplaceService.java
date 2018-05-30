package com.zikezhi.service;

import java.util.List;

import com.zikezhi.entity.Replace;

public interface ReplaceService {

	int insertService(Replace r);
	
	int updateService(Replace r);
	
	List<Replace> selereplace(String product);
	
	List<Replace> selereplaceAdmin(String product);
	
	List<Replace> selereplaceBy2(String product);
	
	int deletet(String id);
}
