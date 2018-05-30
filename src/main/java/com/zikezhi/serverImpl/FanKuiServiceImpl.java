package com.zikezhi.serverImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zikezhi.dao.FanKuiMapper;
import com.zikezhi.entity.FanKui;
import com.zikezhi.service.FanKuiService;

@Service("fankuiService")
public class FanKuiServiceImpl implements FanKuiService {

	@Resource
	private FanKuiMapper fankuiMapper;
	
	@Override
	public int insertFankui(FanKui fankui) {
		// TODO Auto-generated method stub
		return fankuiMapper.insertFankui(fankui);
	}

	@Override
	public List<FanKui> selectFankui() {
		// TODO Auto-generated method stub
		return fankuiMapper.selectFankui();
	}

	@Override
	public int fankuidele(String fankuiid) {
		// TODO Auto-generated method stub
		return fankuiMapper.fankuidele(fankuiid);
	}
}
