package com.zikezhi.dao;
import java.util.List;

import com.zikezhi.entity.SjZhuCe;

public interface SjZhuCeMapper {
	//注册插入
	int insert(SjZhuCe sc);
	
	//商家信息
	int updateAll(SjZhuCe sc);
	
	//注册时  验证公司是否存在
	int testCompany(String company);
	
	//注册时  验证手机号是否存在
	int testTel(String tel);
	
	//注册时  验证昵称是否存在
	int testUserName(String username);
	
	
	SjZhuCe sjLogin(SjZhuCe sj);
	
	int updateSjById(SjZhuCe sj);
	
	//将shiro修改进数据库
	int shiroShenHe(SjZhuCe sj);
	
	List<SjZhuCe> sj_ShenHe();
	
	SjZhuCe backSjIndex(SjZhuCe sj);
}
