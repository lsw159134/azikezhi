package com.zikezhi.service;

import java.util.List;
import java.util.Map;

import com.zikezhi.entity.Comments;

public interface CommentsService {

	List<Comments> selectByTopicType(String uid);
	
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
