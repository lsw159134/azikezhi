package com.zikezhi.serverImpl;

import com.zikezhi.dao.CommentsMapper;
import com.zikezhi.entity.Comments;
import com.zikezhi.service.CommentsService;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("commentsService")
public class CommentsServicesImpl implements CommentsService {

	@Resource
	private CommentsMapper comments;
	
	public int deleteByPrimaryKey(String commentsuid) {
		return comments.deleteByPrimaryKey(commentsuid);
	}

	public int insert(Comments record) {
		return comments.insert(record);
	}

	public int insertSelective(Comments record) {
		return comments.insertSelective(record);
	}

	public Comments selectByPrimaryKey(String commentsuid) {
		return comments.selectByPrimaryKey(commentsuid);
	}

	public int updateByPrimaryKeySelective(Comments record) {
		return comments.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Comments record) {
		return comments.updateByPrimaryKey(record);
	}

	public List<Comments> selectByTopicType(String uid) {
		return comments.selectByTopicType(uid);
	}

	public List<Comments> selectLimit() {
		return comments.selectLimit();
	}
	
	public int selectCountUser(String userUid){
		return comments.selectCountUser(userUid);
	}

	@Override
	public List<Comments> selectByNew(Map<String,Object> map) {
		return comments.selectByNew(map);
	}
}
