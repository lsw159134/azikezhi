package com.zikezhi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zikezhi.entity.Classification;
import com.zikezhi.service.ClassificationService;
/**
 * 被动供应商分类（一级）（后台系统）
 * @author lenovo
 *
 */
@Controller
public class ClassificationController {

	@Resource(name = "classificationService")
	private ClassificationService classificationService;
	
	@RequestMapping("1019/zai/xin/jian/classificationList")
	public String classificationList(Model model,HttpSession session){
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		List<Classification> classification=classificationService.queryAll();
		model.addAttribute("classification", classification);
		model.addAttribute("classificationAll", "classificationAll");
		return "adminHome";
	}
	
	@RequestMapping("1019/zai/xin/jian/classificationAll")
	@ResponseBody
	public List<Classification> classificationAll(Model model,HttpSession session){
		List<Classification> classification=classificationService.queryAll();
		return classification;
	}
	
	@RequestMapping("1019/zai/xin/jian/selectBySortClassification")
	@ResponseBody
	public Map<String,Object> selectBySort(int sort){
		Map<String,Object> map=new HashMap<String,Object>();
		List<Classification> classification=classificationService.selectBySort(sort);
		if(classification.isEmpty()){
			map.put("result", "seccuss");
		}else{
			map.put("result", "fail");
		}
		return map;
	}
	
	@RequestMapping("1019/zai/xin/jian/addClassification")
	public String addClassification(Classification c,String sort){
		if(c.getClassification_sort()==0){
			c.setClassification_sort(Integer.parseInt(sort));
		}
		classificationService.insertSelective(c);
		return "redirect:classificationList";
	}
	
	@RequestMapping("1019/zai/xin/jian/upClassification")
	public String upClassification(Classification c,HttpSession session){
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		classificationService.updateByclassificationKeySelective(c);
		return "redirect:classificationList";
	}
	
	@RequestMapping("1019/zai/xin/jian/classificationdelete")
	public String classificationdelete(int id,HttpSession session){
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}else{
			classificationService.delete(id);
		}
		return "redirect:classificationList";
	}
}
