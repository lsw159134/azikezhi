package com.zikezhi.service;

import java.util.List;

import com.zikezhi.entity.Message;

public interface MessageService {

	int insertSelective(Message m);
	
	int Messagedele(int id);
	
	List<Message> selectMessage();
	
	int getTotal();
}
