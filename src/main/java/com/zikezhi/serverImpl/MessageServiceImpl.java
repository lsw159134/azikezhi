package com.zikezhi.serverImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.MessageMapper;
import com.zikezhi.entity.Message;
import com.zikezhi.service.MessageService;

@Service("messageService")
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageMapper messageMapper;
	
	@Override
	public int insertSelective(Message m) {
		return messageMapper.insertSelective(m);
	}

	@Override
	public int Messagedele(int id) {
		return messageMapper.Messagedele(id);
	}

	@Override
	public List<Message> selectMessage() {
		return messageMapper.selectMessage();
	}

	@Override
	public int getTotal() {
		return messageMapper.getTotal();
	}

}
