package com.zikezhi.service;

import java.util.List;

import com.zikezhi.entity.AdminZaiXinJian;

public interface AdminZaiXinJianService {
	
	int insertSelective(AdminZaiXinJian admin);
	
	int updateByPrimaryKeySelective(AdminZaiXinJian admin);
	
	AdminZaiXinJian adminLogin(String admin_adminAccountNumber,String admin_adminpassword);
	
	int deleteByAdminID(String adminID);

	List<AdminZaiXinJian> queryAll();

	AdminZaiXinJian queryByAccount(String name);

	AdminZaiXinJian queryByAid(String aid);
	
	AdminZaiXinJian queryByABystatus();
}
