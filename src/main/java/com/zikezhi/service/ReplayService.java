package com.zikezhi.service;

import java.util.List;

import com.zikezhi.entity.Replay;

public interface ReplayService {

	List<Replay> queryAll(int id);
	
	int insertService(Replay replay);
	
	int deletereplay(int id);
}
