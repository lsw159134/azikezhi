package com.zikezhi.serverImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.RemarksMapper;
import com.zikezhi.entity.Remarks;
import com.zikezhi.service.RemarksService;

@Service("remarksService")
public class RemarksServiceImpl implements RemarksService {

	@Autowired
	private RemarksMapper remarksMapper;
	
	@Override
	public int insertSelective(Remarks r) {
		return remarksMapper.insertSelective(r);
	}

	@Override
	public int updateByPrimaryKeySelective(Remarks r) {
		return remarksMapper.updateByPrimaryKeySelective(r);
	}

	@Override
	public Remarks queryByPid(String suid, String userid) {
		return remarksMapper.queryByPid(suid, userid);
	}

	@Override
	public List<Remarks> queryAll() {
		// TODO Auto-generated method stub
		return remarksMapper.queryAll();
	}

}
