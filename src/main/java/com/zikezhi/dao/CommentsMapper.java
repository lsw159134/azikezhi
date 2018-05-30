package com.zikezhi.dao;

import org.apache.ibatis.annotations.Param;

import com.zikezhi.entity.Comments;

import java.util.List;
import java.util.Map;

public interface CommentsMapper {
	
	List<Comments> selectByTopicType(@Param("uid")String uid);
	
    int deleteByPrimaryKey(String commentsuid);

    int insert(Comments record);

    int insertSelective(Comments record);

    Comments selectByPrimaryKey(String commentsuid);

    int updateByPrimaryKeySelective(Comments record);

    int updateByPrimaryKey(Comments record);
    
    List<Comments> selectLimit();
    
    int selectCountUser(String userUid);

    List<Comments> selectByNew(Map<String,Object> map);
}