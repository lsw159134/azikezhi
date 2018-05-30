package com.zikezhi.dao;

import java.util.List;

import com.zikezhi.entity.Message;

public interface MessageMapper {

	int insertSelective(Message m);
	
	int Messagedele(int id);
	
	List<Message> selectMessage();
	
	int getTotal();
	
}
