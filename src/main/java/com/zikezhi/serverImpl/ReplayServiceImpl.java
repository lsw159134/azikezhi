package com.zikezhi.serverImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.ReplayMapper;
import com.zikezhi.entity.Replay;
import com.zikezhi.service.ReplayService;

@Service("replayService")
public class ReplayServiceImpl implements ReplayService {

	@Autowired
	private ReplayMapper replayMapper;
	
	@Override
	public List<Replay> queryAll(int id) {
		// TODO Auto-generated method stub
		return replayMapper.queryAll(id);
	}

	@Override
	public int insertService(Replay replay) {
		// TODO Auto-generated method stub
		return replayMapper.insertService(replay);
	}

	@Override
	public int deletereplay(int id) {
		// TODO Auto-generated method stub
		return replayMapper.deletereplay(id);
	}

}
