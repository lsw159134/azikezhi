package com.zikezhi.dao;

import java.util.List;

import com.zikezhi.entity.AdminZaiXinJian;

public interface AdminZaiXinJianMapper {
	
	int insertSelective(AdminZaiXinJian admin);
	
	int updateByPrimaryKeySelective(AdminZaiXinJian admin);
	
	AdminZaiXinJian adminLogin(String admin_adminAccountNumber,String admin_adminpassword);
	
	int deleteByAdminID(String adminID);

	List<AdminZaiXinJian> queryAll();

	AdminZaiXinJian queryByAccount(String name);

	AdminZaiXinJian queryByAid(String aid);
	
	AdminZaiXinJian queryByABystatus();
	
}
