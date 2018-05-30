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

import com.zikezhi.entity.Rkreport;
import com.zikezhi.service.RkreportService;
import com.zikezhi.utils.PageBean;
/**
 * 公司资源管理（入库）
 * @author lenovo
 *
 */
@Controller
public class RkreportConrtoller {

	@Resource(name="rkreportService")
	private RkreportService	rkreportService;
	
	@RequestMapping("rkreportAll")
	public String rkreportAll(@RequestParam(required = false)String product,@RequestParam(required = false)String page,@RequestParam(required = false)String rows,Model model,HttpSession session){
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			return "login";
		}
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("uid", uid);
		PageBean pageBean;
		if(page == null && rows == null){
			pageBean = new PageBean(1,10);
		}else{
			pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		}
		if(product != null && !product.equals("")){
			product = product.toUpperCase().replace(" ", "").replace("　","").replace("	","").replace("_", "\\_").replace("%", "\\%");
			model.addAttribute("product", product);
			map.put("product", product);
		}
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Rkreport> rkreport=rkreportService.queryAll(map);
		int total=rkreportService.countCart(map);
		model.addAttribute("rkreport", rkreport);
		pageBean.setTotal(Integer.parseInt(String.valueOf(total)));
		model.addAttribute("total", total);
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page",pageBean.getPage());
		model.addAttribute("pageSize",pageBean.getPageSize());
		model.addAttribute("rkreportall", "rkreportall");
		return "user/stock/stock";
		
	}
	
}
