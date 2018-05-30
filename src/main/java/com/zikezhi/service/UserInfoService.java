package com.zikezhi.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.zikezhi.entity.UserInfo;


public interface UserInfoService {
	
	List<UserInfo> userLogin(UserInfo user);
	
	Integer findUserName(String userName);

	Integer findTelphone(String tel);

	List<UserInfo> findUserByTelphone(String tel);
	
	int deleteByPrimaryKey(String useruid);

    int insert(UserInfo record);

    int insertSelective(UserInfo record);

    UserInfo selectByPrimaryKey(String useruid);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);
	
	Set<String> findRoles(String userName);
	
	Set<String> findPermissions(String userName);
	
	UserInfo findUserByUsername(String userName);

	int updateByalipay(Map<String,Object> map);

	int updateCountSearch(String uid);

	int updateExpressAddress(Map<String,Object> map);

	int updateRealAddress(Map<String,Object> map);

	int updateRealTelphone(Map<String,Object> map);

	int updateRealName(Map<String,Object> map);

	String queryByPersonalID(String personal);
	
	List<UserInfo> queryAll(Map<String,Object> map);
	
	int getTotal(Map<String, Object> map);
}
