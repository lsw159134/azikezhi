package com.zikezhi.service;

import java.util.List;

import com.zikezhi.entity.SjZhuCe;

public interface SjZhuCeService {
	int insert(SjZhuCe sc);
	int updateAll(SjZhuCe sc);
	int testCompany(String company);
	int testTel(String tel);
	int testUserName(String username);
	SjZhuCe sjLogin(SjZhuCe sj);
	int updateSjById(SjZhuCe sj);
	List<SjZhuCe> sj_ShenHe();
	int shiroShenHe(SjZhuCe sj);
	SjZhuCe backSjIndex(SjZhuCe sj);
}
