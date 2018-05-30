package com.zikezhi.serverImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.PrintrecordMapper;
import com.zikezhi.entity.Printrecord;
import com.zikezhi.service.PrintrecordService;

@Service("printrecordService")
public class PrintrecordServiceImpl implements PrintrecordService {

	@Autowired
	private PrintrecordMapper printrecordMapper;
	
	@Override
	public int insertSelective(Printrecord p) {
		// TODO Auto-generated method stub
		return printrecordMapper.insertSelective(p);
	}

	@Override
	public List<Printrecord> queryAll(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return printrecordMapper.queryAll(map);
	}

	@Override
	public Printrecord queryByeid(String eid) {
		// TODO Auto-generated method stub
		return printrecordMapper.queryByeid(eid);
	}

	@Override
	public int updateByPrimaryKeySelective(Printrecord p) {
		// TODO Auto-generated method stub
		return printrecordMapper.updateByPrimaryKeySelective(p);
	}

	@Override
	public long getTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return printrecordMapper.getTotal(map);
	}

}
