package com.zikezhi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zikezhi.entity.Message;
import com.zikezhi.service.MessageService;

@Controller
public class MessageController {
	
	@Resource(name = "messageService")
	private MessageService messageService;
	
	//用户留言
	@ResponseBody
	@RequestMapping(value = "messageAdd" , method = RequestMethod.POST)
	public Map<String, Object> insertFankui(Message m,HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		String uid=(String) session.getAttribute("uid");
		if(uid!=null){
			m.setMessage_uid(uid);
		}
		int a = messageService.insertSelective(m);
		if(a == 1){
			map.put("result","success");
			map.put("msg","反馈成功");
		}else{
			map.put("result","fail");
			map.put("msg","反馈失败");
		}
		return map;
	}
	
	//反馈信息后台查询
	@RequestMapping("1019/zai/xin/jian/messageAll")
	public String cp_fk(Model model) {
		List<Message> fankuiList = messageService.selectMessage();
		//int total=messageService.getTotal();
		model.addAttribute("messageList",fankuiList);
		model.addAttribute("messageAll","messageAll");
		return "adminHome";
	}
}
