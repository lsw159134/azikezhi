package com.zikezhi.serverImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.AdminZaiXinJianMapper;
import com.zikezhi.entity.AdminZaiXinJian;
import com.zikezhi.service.AdminZaiXinJianService;

@Service("adminZaiXinJianService")
public class AdminZaiXinJianServiceImpl implements AdminZaiXinJianService {

	@Autowired
	private AdminZaiXinJianMapper adminZaiXinJianMapper;
	
	@Override
	public int insertSelective(AdminZaiXinJian admin) {
		return adminZaiXinJianMapper.insertSelective(admin);
	}

	@Override
	public int updateByPrimaryKeySelective(AdminZaiXinJian admin) {
		return adminZaiXinJianMapper.updateByPrimaryKeySelective(admin);
	}

	@Override
	public AdminZaiXinJian adminLogin(String admin_adminAccountNumber, String admin_adminpassword) {
		return adminZaiXinJianMapper.adminLogin(admin_adminAccountNumber, admin_adminpassword);
	}

	@Override
	public int deleteByAdminID(String adminID) {
		return adminZaiXinJianMapper.deleteByAdminID(adminID);
	}

	@Override
	public List<AdminZaiXinJian> queryAll() {
		// TODO Auto-generated method stub
		return adminZaiXinJianMapper.queryAll();
	}

	@Override
	public AdminZaiXinJian queryByAccount(String name) {
		// TODO Auto-generated method stub
		return adminZaiXinJianMapper.queryByAccount(name);
	}

	@Override
	public AdminZaiXinJian queryByAid(String aid) {
		// TODO Auto-generated method stub
		return adminZaiXinJianMapper.queryByAid(aid);
	}

	@Override
	public AdminZaiXinJian queryByABystatus() {
		// TODO Auto-generated method stub
		return adminZaiXinJianMapper.queryByABystatus();
	}

}
