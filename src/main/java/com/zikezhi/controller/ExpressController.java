package com.zikezhi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zikezhi.entity.Express;
import com.zikezhi.entity.Supplier;
import com.zikezhi.service.ExpressService;
import com.zikezhi.service.OrderItmeService;
import com.zikezhi.service.ProductService;
import com.zikezhi.service.SupplierService;
import com.zikezhi.service.UserInfoService;
import com.zikezhi.utils.PageBean;
/**
 * 订单
 * @author lenovo
 *
 */
@Controller
public class ExpressController {

	@Resource(name = "userInfoService")
	private UserInfoService userInfoService;

	@Resource(name = "supplierService")
	private SupplierService supplierService;

	@Resource(name = "productService")
	private ProductService productService;

	@Resource(name = "expressService")
	private ExpressService expressService;
	
	@Resource(name = "OrderItmeService")
	private OrderItmeService orderItmeService;
	
	/**
	 * 在线购商户订单查询
	 * @param username
	 * @param page
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("seleOnlineExpress")
	public String seleOnlineExpress(@RequestParam(required=false)String username,@RequestParam(required=false)String page,Model model,HttpSession session){
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			return "login";
		}
		String supplieruid=(String) session.getAttribute("supplieruid");
		if(!supplieruid.equals("1")){
			return "404";
		}
		Supplier supplier=supplierService.seleSupplierUid(uid);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("sid", supplier.getSupplieruuid());
		PageBean pageBean;
		if(page == null){
			pageBean=new PageBean(1,60);
		}else{
			pageBean=new PageBean(Integer.parseInt(page),60);
		}
		if(username!=null){
			Pattern p = Pattern.compile("\\s*|\t|\r|\n");
	        Matcher m = p.matcher(username);
	        username = m.replaceAll("");
	        username = username.toUpperCase().replace(" ", "").replace("_", "\\_").replace("%", "\\%");
			map.put("username", username);
		}
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Express> express=expressService.seleOnlineExpress(map);
		int total=expressService.getOnlineExpress(map);
		Float pricetotal=expressService.queryBysuidTotal(supplier.getSupplieruuid());
		model.addAttribute("pricetotal", pricetotal);
		model.addAttribute("total", total);
		pageBean.setTotal(total);
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page",pageBean.getPage());
		model.addAttribute("pageSize",pageBean.getPageSize());
		model.addAttribute("express",express);
		return "user/product/onlineExpress";
	}
	
	/**
	 * 取消订单
	 * @return
	 */
	@RequestMapping("onlineQuxiao")
	public String expressQuxiao(@RequestParam(required = false) String eid){
		Express expressList = expressService.queryById(eid);
		expressList.setStatus("5");
		expressService.updateByPrimaryKeySelective(expressList);
		return "redirect:/seleOnlineExpress";
	}
	
	/**
	 * 交货
	 * @return
	 */
	@RequestMapping("onlinejiaohuo")
	public String onlinejiaohuo(@RequestParam(required = false) String eid){
		Express expressList = expressService.queryById(eid);
		expressList.setStatus("3");
		expressService.updateByPrimaryKeySelective(expressList);
		return "redirect:/seleOnlineExpress";
	}
	
	/**
	 * 交货
	 * @return
	 */
	@RequestMapping("onlineshouhuo")
	public String onlineshouhuo(@RequestParam(required = false) String eid){
		Express expressList = expressService.queryById(eid);
		expressList.setStatus("4");
		expressService.updateByPrimaryKeySelective(expressList);
		return "redirect:/express";
	}
}
