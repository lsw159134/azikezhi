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
import org.springframework.web.bind.annotation.ResponseBody;

import com.zikezhi.entity.AdminZaiXinJian;
import com.zikezhi.entity.Purchase;
import com.zikezhi.service.PurchaseService;
import com.zikezhi.utils.PageBean;
/**
 * 采购记录（后台系统）
 * @author wrp
 *
 */
@Controller
public class PurchaseController {
	
	@Resource(name="purchaseService")
	private PurchaseService purchaseService;
	
	@RequestMapping("1019/zai/xin/jian/upPurchase")
	@ResponseBody
	public Map<String, Object> upPrimary(Purchase p,HttpSession session, Model model){
		Map<String, Object> map = new HashMap<String, Object>();
		if (session.getAttribute("user") == null) {
			map.put("result","login");
			return map;
		}
		AdminZaiXinJian admin=(AdminZaiXinJian)session.getAttribute("user");
		p.setPurchase_name(admin.getAdmin_id());
		int i=purchaseService.updateByPrimaryKeySelective(p);
		if(i==0){
			map.put("result","fail");
			map.put("msg","失败");
		}else{
			map.put("result","seccuss");
			map.put("msg","成功");
		}
		return map;
	}
	
	@RequestMapping("1019/zai/xin/jian/addPurchase")
	@ResponseBody
	public Map<String, Object> addPrimary(Purchase p,HttpSession session, Model model){
		Map<String, Object> map = new HashMap<String, Object>();
		if (session.getAttribute("user") == null) {
			map.put("result","login");
			return map;
		}
		AdminZaiXinJian admin=(AdminZaiXinJian)session.getAttribute("user");
		p.setPurchase_name(admin.getAdmin_id());
		p.setPurchase_time(new Date());
		int i=purchaseService.insertSelective(p);
		if(i==0){
			map.put("result","fail");
			map.put("msg","失败");
		}else{
			map.put("result","seccuss");
			map.put("msg","成功");
		}
		return map;
	}
	
	@RequestMapping( value="1019/zai/xin/jian/purchase")
	public String adminPurchase(@RequestParam(required = false) String product,@RequestParam(required = false) String time,@RequestParam(required = false) String supplier,@RequestParam(required = false) String page,@RequestParam(required = false) String rows,HttpSession session, Model model){
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		PageBean pageBean;
		if(page == null && rows == null){
			pageBean=new PageBean(1,100);
		}else{
			pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		}
		Map<String, Object> map = new HashMap<String,Object>();
		if(time!=null && !time.equals("")){
			map.put("purchase_time", "%"+time+"%");
		}
		if(product!=null && !product.equals("")){
			map.put("purchase_model", "%"+product+"%");
		}
		if(supplier!=null && !supplier.equals("")){
			map.put("purchase_supplier", "%"+supplier+"%");
		}
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Purchase> purchaseList=purchaseService.queryAll(map);
		int total=purchaseService.queryTotal(map);
		model.addAttribute("total", total);
		pageBean.setTotal(Integer.parseInt(String.valueOf(total)));
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page", pageBean.getPage());
		model.addAttribute("pageSize", pageBean.getPageSize());
		model.addAttribute("purchaseList", purchaseList);
		model.addAttribute("purchaseAll", "purchaseAll");
		return "adminHome";
	}
}
