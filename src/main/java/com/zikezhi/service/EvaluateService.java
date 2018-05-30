package com.zikezhi.service;

import com.zikezhi.entity.Evaluate;

public interface EvaluateService {
	
	int insertSelective(Evaluate e);
	
	int selectByZanuid(String uid,String pid);
	
	int selectByCaiuid(String uid,String pid);
	
	int seleZan(String pid);
	
	int seleCai(String pid);
	
	int seleUserSumZanBydate(String uid);
	
	int seleUserSumCaiBydate(String uid);
}
