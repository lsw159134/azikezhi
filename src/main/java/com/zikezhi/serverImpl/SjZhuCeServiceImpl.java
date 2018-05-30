package com.zikezhi.serverImpl;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zikezhi.dao.SjZhuCeMapper;
import com.zikezhi.entity.SjZhuCe;
import com.zikezhi.service.SjZhuCeService;

@Service("sjZhuCeService")
public class SjZhuCeServiceImpl implements SjZhuCeService {
	
	@Resource
	private  SjZhuCeMapper scm;
	
	public int insert(SjZhuCe sc) {
		// TODO Auto-generated method stub
		return scm.insert(sc);
	}

	@Override
	public int updateAll(SjZhuCe sc) {
		// TODO Auto-generated method stub
		return scm.updateAll(sc);
	}
	
	public int testCompany(String company){
		return scm.testCompany(company);
	}
	
	public int testTel(String tel){
		return scm.testTel(tel);
	}

	@Override
	public int testUserName(String username) {
		
		return scm.testUserName(username);
	}

	@Override
	public SjZhuCe sjLogin(SjZhuCe sj){
		// TODO Auto-generated method stub
		return scm.sjLogin(sj);
	}

	@Override
	public int updateSjById(SjZhuCe sj) {
		// TODO Auto-generated method stub
		return scm.updateSjById(sj);
	}

	@Override
	public List<SjZhuCe> sj_ShenHe() {
		// TODO Auto-generated method stub
		return scm.sj_ShenHe();
	}

	@Override
	public int shiroShenHe(SjZhuCe sj) {
		// TODO Auto-generated method stub
		return scm.shiroShenHe(sj);
	}

	@Override
	public SjZhuCe backSjIndex(SjZhuCe sj) {
		// TODO Auto-generated method stub
		return scm.backSjIndex(sj);
	}
}
