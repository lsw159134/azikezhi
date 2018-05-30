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

import com.zikezhi.entity.Primary;
import com.zikezhi.service.PrimaryService;

/**
 * 一级分类
 * @author wrp
 *
 */
@Controller
public class PrimaryController {

	@Resource(name = "primaryService")
	private PrimaryService primaryService;
	
	@RequestMapping("1019/zai/xin/jian/queryPrimaryProductAll")
	@ResponseBody
	public List<Primary> queryPrimaryProductAll(HttpSession session, Model model){
		List<Primary> primaryList=primaryService.queryAll();
		model.addAttribute("primaryList", primaryList);
		return primaryList;
	}
	
	@RequestMapping("1019/zai/xin/jian/upPrimary")
	@ResponseBody
	public Map<String, Object> upPrimary(Primary p,HttpSession session, Model model){
		Map<String, Object> map = new HashMap<String, Object>();
		if (session.getAttribute("user") == null) {
			map.put("result","login");
			return map;
		}
		int i=primaryService.updateByPrimaryKeySelective(p);
		if(i==0){
			map.put("result","fail");
			map.put("msg","失败");
		}else{
			map.put("result","seccuss");
			map.put("msg","成功");
		}
		return map;
	}
	
	@RequestMapping("1019/zai/xin/jian/addPrimary")
	@ResponseBody
	public Map<String, Object> addPrimary(Primary p,HttpSession session, Model model){
		Map<String, Object> map = new HashMap<String, Object>();
		if (session.getAttribute("user") == null) {
			map.put("result","login");
			return map;
		}
		p.setPrimary_addtime(new Date());
		int i=primaryService.insertSelective(p);
		if(i==0){
			map.put("result","fail");
			map.put("msg","失败");
		}else{
			map.put("result","seccuss");
			map.put("msg","成功");
		}
		return map;
	}
	
	@RequestMapping("1019/zai/xin/jian/queryPrimaryName")
	@ResponseBody
	public Map<String, Object> queryPrimaryName(Primary p,HttpSession session, Model model){
		Map<String, Object> map = new HashMap<String, Object>();
		if (session.getAttribute("user") == null) {
			map.put("result","login");
			return map;
		}
		p.setPrimary_addtime(new Date());
		int i=primaryService.queryPrimaryName(p);
		if(i!=0){
			map.put("result","fail");
			map.put("msg","失败");
		}else{
			map.put("result","seccuss");
			map.put("msg","成功");
		}
		return map;
	}
	
	@RequestMapping("1019/zai/xin/jian/deletePrimary")
	public String deletePrimary(int id,HttpSession session, Model model){
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		primaryService.deletePrimary(id);
		return "redirect:queryPrimaryAll";
	}
	
	@RequestMapping("1019/zai/xin/jian/queryPrimaryAll")
	public String queryPrimaryAll(HttpSession session, Model model){
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		List<Primary> primaryList=primaryService.queryAll();
		model.addAttribute("primaryList", primaryList);
		model.addAttribute("primaryAll", "primaryAll");
		return "adminHome";
	}
	
	
}
