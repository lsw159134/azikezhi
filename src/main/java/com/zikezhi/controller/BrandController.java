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

import com.zikezhi.entity.Brand;
import com.zikezhi.service.AdminZaiXinJianService;
import com.zikezhi.service.BrandService;
/**
 * 
 * @author lenovo
 *
 */
@Controller
public class BrandController {
	
	@Resource(name = "brandService")
	private BrandService brandService;
	
	@Resource(name = "adminZaiXinJianService")
   	private AdminZaiXinJianService adminZaiXinJianService;
	
	@RequestMapping("1019/zai/xin/jian/addorUpDateBrand")
	@ResponseBody
	public Map<String, Object> addPrimary(Brand p,HttpSession session, Model model){
		Map<String, Object> map = new HashMap<String, Object>();
		if (session.getAttribute("user") == null) {
			map.put("result","login");
			return map;
		}
		int i=0;
		if(p.getBrand_id()!=0){
			i=brandService.updateByPrimaryKeySelective(p);
		}else{
			int total=brandService.getTotal();
			p.setBrand_sortimg((total+1));
			i=brandService.insertSelective(p);
		}
		if(i==0){
			map.put("result","fail");
			map.put("msg","失败");
		}else{
			map.put("result","seccuss");
			map.put("msg","成功");
		}
		return map;
	}
	
	@RequestMapping("1019/zai/xin/jian/deleteBrand")
	public String deleteBrand(int id,HttpSession session, Model model){
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		brandService.deleteByid(id);
		return "redirect:queryBrandAll";
	}
	
	@RequestMapping("1019/zai/xin/jian/queryBrandProductAll")
	@ResponseBody
	public List<Brand> queryPrimaryProductAll(HttpSession session, Model model){
		List<Brand> brandList=brandService.queryByname();
		model.addAttribute("brandList", brandList);
		return brandList;
	}
	
	@RequestMapping("1019/zai/xin/jian/queryBrandAll")
	public String queryPrimaryAll(HttpSession session, Model model){
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		List<Brand> brandList=brandService.queryAll();
		model.addAttribute("brandList", brandList);
		model.addAttribute("brandAll", "brandAll");
		return "adminHome";
	}
	
	@RequestMapping("1019/zai/xin/jian/queryBrandname")
	@ResponseBody
	public Map<String, Object> queryBrandname(Brand p,HttpSession session, Model model){
		Map<String, Object> map = new HashMap<String, Object>();
		if (session.getAttribute("user") == null) {
			map.put("result","login");
			return map;
		}
		int i=brandService.queryBy(p.getBrand_name());
		if(i==0){
			map.put("result","fail");
		}else{
			map.put("result","seccuss");
		}
		return map;
	}
}
