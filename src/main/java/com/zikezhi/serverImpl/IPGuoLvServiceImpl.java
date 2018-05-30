package com.zikezhi.serverImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.IPGuoLvMapper;
import com.zikezhi.entity.IPGuoLv;
import com.zikezhi.service.IPGuoLvService;

@Service("ipGuoLvService")
public class IPGuoLvServiceImpl implements IPGuoLvService {

	@Autowired
	private IPGuoLvMapper ipGuoLvMapper;
	
	@Override
	public int insertSelective(IPGuoLv ip) {
		return ipGuoLvMapper.insertSelective(ip);
	}

}
