package com.zikezhi.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zikezhi.entity.AdminZaiXinJian;
import com.zikezhi.entity.Notepad;
import com.zikezhi.service.AdminZaiXinJianService;
import com.zikezhi.service.NotepadService;

/**
 * 记事本
 * @author wrp
 *
 */
@Controller
public class NotepadController {

	@Resource(name = "notepadService")
   	private NotepadService notepadService;
	
	@Resource(name = "adminZaiXinJianService")
   	private AdminZaiXinJianService adminZaiXinJianService;
	
	/**
	 * 添加记事信息
	 * @param n
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "1019/zai/xin/jian/addNotepad")
	public String addNotepad(Notepad n,HttpSession session,Model model) {
		AdminZaiXinJian admin=(AdminZaiXinJian)session.getAttribute("user");
		if (admin== null) {
			return "Adminlogin";
		}
		n.setNotepad_uid(admin.getAdmin_id());
		n.setNotepad_date(new Date());
		notepadService.insertSelective(n);
		return "redirect:/1019/zai/xin/jian/queryAllnotepad";
	}
	
	/**
	 * 添加记事信息
	 * @param n
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "1019/zai/xin/jian/upNotepad")
	public String upNotepad(Notepad n,HttpSession session,Model model) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		notepadService.updateByPrimaryKeySelective(n);
		return "redirect:/1019/zai/xin/jian/queryAllnotepad";
	}
	
	
	/**
	 * @Title 
	 * @Description: 查询所有
	 */
	@RequestMapping(value = "1019/zai/xin/jian/queryAllnotepad")
	public String queryAllnotepad(@RequestParam(required = false) String connet,HttpSession session,Model model) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		Map<String,Object> map=new HashMap<String,Object>();
		if(connet!=null && !connet.equals("")){
			map.put("connet", "%"+connet+"%");
		}
		List<Notepad> notepad=notepadService.queryAll(map);
		model.addAttribute("connet",connet);
		String connets="<span style='color:red'>"+connet+"</span>";
		model.addAttribute("connets",connets);
		model.addAttribute("notepad",notepad);
		model.addAttribute("notepadAll","notepadAll");
		return "adminHome";
	}
	
	
}
