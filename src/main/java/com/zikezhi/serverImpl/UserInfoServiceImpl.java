package com.zikezhi.serverImpl;

import com.zikezhi.dao.UserInfoMapper;
import com.zikezhi.entity.UserInfo;
import com.zikezhi.service.UserInfoService;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 
 * @author ponder
 * @version 1.0
 * @Date 2016年9月2日 
 * 
 * @ClassName UserInfoService.java
 * 
*/

@Service("userInfoService")
public class UserInfoServiceImpl implements UserInfoService {
	
	@Resource
	private UserInfoMapper userInfo;

	public int deleteByPrimaryKey(String useruid) {
		return userInfo.deleteByPrimaryKey(useruid);
	}

	public Integer findTelphone(String tel){
		return userInfo.findTelphone(tel);
	}

	public int insert(UserInfo record) {
		return userInfo.insert(record);
	}

	public int insertSelective(UserInfo record) {
		return userInfo.insertSelective(record);
	}

	public UserInfo selectByPrimaryKey(String useruid) {
		return userInfo.selectByPrimaryKey(useruid);
	}

	public int updateByPrimaryKeySelective(UserInfo record) {
		return userInfo.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(UserInfo record) {
		return userInfo.updateByPrimaryKey(record);
	}

	public Set<String> findRoles(String userName) {
		return null;
	}

	public Set<String> findPermissions(String userName) {
		return null;
	}

	public UserInfo findUserByUsername(String userName) {
		return null;
	}

	public Integer findUserName(String userName) {
		return userInfo.findUserName(userName);
	}

	public List<UserInfo> userLogin(UserInfo user) {
		return userInfo.userLogin(user);
	}

	public List<UserInfo> findUserByTelphone(String tel) {
		return userInfo.findUserByTelphone(tel);
	}

	public int updateByalipay(Map<String,Object> map){

		return userInfo.updateByalipay(map);

	}

	public int updateCountSearch(String uid){
		return userInfo.updateCountSearch(uid);
	}

	@Override
	public int updateExpressAddress(Map<String,Object> map) {
		return userInfo.updateExpressAddress(map);
	}

	@Override
	public int updateRealAddress(Map<String,Object> map) {
		return userInfo.updateRealAddress(map);
	}

	@Override
	public int updateRealTelphone(Map<String,Object> map) {
		return userInfo.updateRealTelphone(map);
	}

	@Override
	public int updateRealName(Map<String,Object> map) {
		return userInfo.updateRealName(map);
	}

	@Override
	public String queryByPersonalID(String personal) {
		return userInfo.queryByPersonalID(personal);
	}

	@Override
	public List<UserInfo> queryAll(Map<String, Object> map) {
		return userInfo.queryAll(map);
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		return userInfo.getTotal(map);
	}

}
