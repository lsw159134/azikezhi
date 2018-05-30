package com.zikezhi.dao;

import org.apache.ibatis.annotations.Param;

import com.zikezhi.entity.UserInfo;

import java.util.List;
import java.util.Map;

public interface UserInfoMapper {
	List<UserInfo> userLogin(UserInfo user);
	
	Integer findUserName(String userName);

	Integer findTelphone(@Param("tel") String tel);
	
    int deleteByPrimaryKey(String useruid);

    int insert(UserInfo record);

    int insertSelective(UserInfo record);

    UserInfo selectByPrimaryKey(String useruid);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);

    List<UserInfo> findUserByTelphone(@Param("Telphone") String tel);

    int updateByalipay(Map<String,Object> map);

    int updateCountSearch(@Param("uid")String uid);

    int updateExpressAddress(Map<String,Object> map);

    int updateRealAddress(Map<String,Object> map);

    int updateRealTelphone(Map<String,Object> map);

    int updateRealName(Map<String,Object> map);

	String queryByPersonalID(String personal);
	
	List<UserInfo> queryAll(Map<String,Object> map);
	
	int getTotal(Map<String, Object> map);
}
