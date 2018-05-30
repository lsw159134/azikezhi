package com.zikezhi.dao;

import java.util.List;

import com.zikezhi.entity.Replay;

public interface ReplayMapper {

	List<Replay> queryAll(int id);
	
	int insertService(Replay replay);
	
	int deletereplay(int id);
}
