package com.zikezhi.serverImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.EvaluateMapper;
import com.zikezhi.entity.Evaluate;
import com.zikezhi.service.EvaluateService;

@Service("evaluateService")
public class EvaluateServiceImpl implements EvaluateService {

	@Autowired
	private EvaluateMapper evaluateMapper;
	
	@Override
	public int insertSelective(Evaluate e) {
		// TODO Auto-generated method stub
		return evaluateMapper.insertSelective(e);
	}

	@Override
	public int selectByZanuid(String uid,String pid) {
		// TODO Auto-generated method stub
		return evaluateMapper.selectByZanuid(uid,pid);
	}

	@Override
	public int selectByCaiuid(String uid,String pid) {
		// TODO Auto-generated method stub
		return evaluateMapper.selectByCaiuid(uid,pid);
	}

	@Override
	public int seleZan(String pid) {
		// TODO Auto-generated method stub
		return evaluateMapper.seleZan(pid);
	}

	@Override
	public int seleCai(String pid) {
		// TODO Auto-generated method stub
		return evaluateMapper.seleCai(pid);
	}

	@Override
	public int seleUserSumZanBydate(String uid) {
		// TODO Auto-generated method stub
		return evaluateMapper.seleUserSumZanBydate(uid);
	}

	@Override
	public int seleUserSumCaiBydate(String uid) {
		// TODO Auto-generated method stub
		return evaluateMapper.seleUserSumCaiBydate(uid);
	}

}
