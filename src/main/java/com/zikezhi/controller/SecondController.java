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
import org.springframework.web.bind.annotation.ResponseBody;

import com.zikezhi.entity.Second;
import com.zikezhi.service.SecondService;

/**
 * 二级分类
 * @author wrp
 *
 */
@Controller
public class SecondController {

	@Resource(name = "secondService")
	private SecondService SecondService;
	
	@RequestMapping("1019/zai/xin/jian/upSecond")
	@ResponseBody
	public Map<String, Object> upSecond(Second p,HttpSession session, Model model){
		Map<String, Object> map = new HashMap<String, Object>();
		if (session.getAttribute("user") == null) {
			map.put("result","login");
			return map;
		}
		int i=SecondService.updateByPrimaryKeySelective(p);
		if(i==0){
			map.put("result","fail");
			map.put("msg","失败");
		}else{
			map.put("result","seccuss");
			map.put("msg","成功");
		}
		return map;
	}
	
	@RequestMapping("1019/zai/xin/jian/addSecond")
	@ResponseBody
	public Map<String, Object> addSecond(Second p,HttpSession session, Model model){
		Map<String, Object> map = new HashMap<String, Object>();
		if (session.getAttribute("user") == null) {
			map.put("result","login");
			return map;
		}
		p.setSecond_addtime(new Date());
		int i=SecondService.insertSelective(p);
		if(i==0){
			map.put("result","fail");
			map.put("msg","失败");
		}else{
			map.put("result","seccuss");
			map.put("msg","成功");
		}
		return map;
	}
	
	@RequestMapping("1019/zai/xin/jian/querySecondName")
	@ResponseBody
	public Map<String, Object> querySecondName(Second p,HttpSession session, Model model){
		Map<String, Object> map = new HashMap<String, Object>();
		if (session.getAttribute("user") == null) {
			map.put("result","login");
			return map;
		}
		p.setSecond_addtime(new Date());
		int i=SecondService.querySecondName(p);
		if(i!=0){
			map.put("result","fail");
			map.put("msg","失败");
		}else{
			map.put("result","seccuss");
			map.put("msg","成功");
		}
		return map;
	}
	
	@RequestMapping("1019/zai/xin/jian/deleteSecond")
	public String deleteSecond(int id,HttpSession session, Model model){
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		SecondService.deleteSecond(id);
		return "redirect:queryPrimaryAll";
	}
	
	@RequestMapping("1019/zai/xin/jian/querySecondAll")
	@ResponseBody
	public List<Second> querySecondAll(int id,HttpSession session, Model model){
		List<Second> SecondList=SecondService.queryAll(id);
		model.addAttribute("SecondList", SecondList);
		return SecondList;
	}
	
	
}
