package com.zikezhi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zikezhi.entity.Subcategory;
import com.zikezhi.service.SubcategoryService;
/**
 * 被动供应商分类（二级）
 * @author lenovo
 *
 */
@Controller
public class SubcategoryController {
	
	@Resource(name = "subcategoryService")
	private SubcategoryService subcategoryService;
	
	@RequestMapping("1019/zai/xin/jian/subcategoryList")
	@ResponseBody
	public List<Subcategory> subcategoryList(Subcategory s,HttpSession session,Model model){
		List<Subcategory> subcategory=subcategoryService.queryAll(s.getSubcategory_classification());
		model.addAttribute("subcategory", subcategory);
		return subcategory;
	}
	
	@RequestMapping("1019/zai/xin/jian/selectBySortSubcategory")
	@ResponseBody
	public Map<String,Object> selectBySortSubcategory(Subcategory s){
		Map<String,Object> map=new HashMap<String,Object>();
		List<Subcategory> subcategory=subcategoryService.selectBySort(s);
		if(subcategory.isEmpty()){
			map.put("result", "seccuss");
		}else{
			map.put("result", "fail");
		}
		return map;
	}
	
	@RequestMapping("1019/zai/xin/jian/addSubcategory")
	@ResponseBody
	public String addSubcategory(@RequestParam(required= false)Integer sort,@RequestParam(required= false)String name,@RequestParam(required= false)int cid){
		Subcategory s=new Subcategory();
		if(sort==null){
			List<Subcategory> subcategory=subcategoryService.queryAll(cid);
			s.setSubcategory_sort(subcategory.size()+1);
		}else{
			s.setSubcategory_sort(sort);
		}
		s.setSubcategory_classification(cid);
		s.setSubcategory_name(name);
		subcategoryService.insertSelective(s);
		return "seccuss";
	}
	
	@RequestMapping("1019/zai/xin/jian/upSubcategory")
	@ResponseBody
	public String upSubcategory(@RequestParam(required= false)Integer sort,@RequestParam(required= false)String name,@RequestParam(required= false)int id){
		Subcategory s=new Subcategory();
		s.setSubcategory_sort(sort);
		s.setSubcategory_id(id);
		s.setSubcategory_name(name);
		subcategoryService.updateByPrimaryKeySelective(s);
		return "seccuss";
	}
	
	@RequestMapping("1019/zai/xin/jian/deleteSubcategory")
	public String deleteSubcategory(HttpSession session,@RequestParam(required= false)int id){
		if(session.getAttribute("user")==null){
			return "Adminlogin";
		}
		subcategoryService.delete(id);
		return "redirect:classificationList";
	}
	
}
