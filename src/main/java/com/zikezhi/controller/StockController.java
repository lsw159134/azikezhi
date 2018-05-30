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

import com.zikezhi.entity.Rkreport;
import com.zikezhi.entity.Stock;
import com.zikezhi.service.RkreportService;
import com.zikezhi.service.StockService;
import com.zikezhi.utils.PageBean;
import com.zikezhi.utils.UIDGenerator;
/**
 * 公司资源管理
 * @author lenovo
 *
 */
@Controller
public class StockController {
	
	@Resource(name="stockService")
	private StockService stockService;
	
	@Resource(name="rkreportService")
	private RkreportService rkreportService;
	
	@RequestMapping("stockAll")
	public String stockAll(@RequestParam(required = false)String product,@RequestParam(required = false)String page,@RequestParam(required = false)String rows,Model model,HttpSession session){
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			return "login";
		}
		PageBean pageBean;
		if(page == null && rows == null){
			pageBean = new PageBean(1,10);
		}else{
			pageBean=new PageBean(Integer.parseInt(page),10);
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uid", uid);
		if(product != null && !product.equals("")){
			product = product.toUpperCase().replace(" ", "").replace("　","").replace("	","").replace("_", "\\_").replace("%", "\\%");
			model.addAttribute("product", product);
			map.put("product", product);
			List<Stock> stockcount=stockService.seleBycount(product);
			model.addAttribute("stockcount", stockcount);
		}
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Stock> stock=stockService.queryAll(map);
		int total=stockService.countCart(map);
		model.addAttribute("stock", stock);
		pageBean.setTotal(Integer.parseInt(String.valueOf(total)));
		model.addAttribute("total", total);
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page",pageBean.getPage());
		model.addAttribute("pageSize",pageBean.getPageSize());
		model.addAttribute("stockall", "stockall");
		return "user/stock/stock";
	}
	
	@RequestMapping("sele_diaohuo")
	public String sele_diaohuo(@RequestParam(required = false)String id,@RequestParam(required = false)String page,@RequestParam(required = false)String rows,Model model,HttpSession session){
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			return "login";
		}
		PageBean pageBean;
		if(page == null && rows == null){
			pageBean = new PageBean(1,10);
		}else{
			pageBean=new PageBean(Integer.parseInt(page),10);
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uid", uid);
		if(id != null && !id.equals("")){
			id = id.toUpperCase().replace(" ", "").replace("　","").replace("	","").replace("_", "\\_").replace("%", "\\%");
			model.addAttribute("id", id);
			map.put("pid", id);
		}
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Stock> stock=stockService.queryAll(map);
		Stock s=stockService.seleByid(id);
		model.addAttribute("s", s);
		int total=stockService.countCart(map);
		model.addAttribute("stock", stock);
		pageBean.setTotal(Integer.parseInt(String.valueOf(total)));
		model.addAttribute("total", total);
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page",pageBean.getPage());
		model.addAttribute("pageSize",pageBean.getPageSize());
		model.addAttribute("diaohuo", "diaohuo");
		return "user/stock/stock";
	}
	
	@RequestMapping("addstock")
	@ResponseBody
	public Map<String,Object> addstock(Stock s,Rkreport r,HttpSession session){
		Map<String,Object> map=new HashMap<String,Object>();
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			map.put("result", "login");
			return map;
		}
		r.setRkreport_num(s.getStock_number());
		s.setStock_id(UIDGenerator.getUUID());
		s.setStock_uid(uid);
		s.setStock_supplier(r.getRkreport_supplier());
		s.setStock_address(r.getRkreport_address());
		stockService.insertSelective(s);
		r.setRkreport_uid(uid);
		r.setRkreport_stockid(s.getStock_id());
		r.setRkreport_price(s.getStock_price());
		r.setRkreport_fangshi("采购入库");
		r.setRkreport_status(1);
		rkreportService.insertSelective(r);
		return map;
	}

	@RequestMapping("updatestock")
	@ResponseBody
	public Map<String,Object> update(Stock s,Rkreport r,HttpSession session){
		Map<String,Object> map=new HashMap<String,Object>();
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			map.put("result","login");
			return map;
		}
		Stock stock=stockService.seleByid(s.getStock_id());
		if(Integer.parseInt(stock.getStock_number())<=Integer.parseInt(s.getStock_number())){
			r.setRkreport_num((Integer.parseInt(s.getStock_number())-Integer.parseInt(stock.getStock_number()))+"");
			r.setRkreport_uid(uid);
			r.setRkreport_stockid(s.getStock_id());
			r.setRkreport_price(s.getStock_price());
			r.setRkreport_fangshi("人为修改");
			r.setRkreport_status(1);
			r.setRkreport_address(stock.getStock_address());
			r.setRkreport_supplier(stock.getStock_supplier());
			rkreportService.insertSelective(r);
		}else if(Integer.parseInt(stock.getStock_number())>Integer.parseInt(s.getStock_number())){
			r.setRkreport_num((Integer.parseInt(stock.getStock_number())-Integer.parseInt(s.getStock_number()))+"");
			r.setRkreport_uid(uid);
			r.setRkreport_stockid(s.getStock_id());
			r.setRkreport_price(s.getStock_price());
			r.setRkreport_fangshi("人为修改");
			r.setRkreport_status(2);
			rkreportService.insertSelective(r);
		}
		stockService.updateByPrimaryKeySelective(s);
		return map;
	}
	
	@RequestMapping("seleBystock")
	@ResponseBody
	public Map<String, Object> seleBystock(String product,HttpSession session){
		Map<String,Object> map=new HashMap<String,Object>();
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			map.put("result","login");
			return map;
		}
		Stock s=stockService.queryByPid(product, uid);
		map.put("stock", s);
		return map;
	}
	
	@RequestMapping("diaohuostock")
	@ResponseBody
	public Map<String,Object> diaohuostock(Stock s,HttpSession session){
		Map<String,Object> map=new HashMap<String,Object>();
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			map.put("result", "login");
			return map;
		}
		Stock stock=stockService.seleByid(s.getStock_id());
		stock.setStock_number((Integer.parseInt(stock.getStock_number())-Integer.parseInt(s.getStock_number()))+"");
		stockService.updateByPrimaryKeySelective(stock);
		Stock s1=new Stock();
		s1.setStock_id(UIDGenerator.getUUID());
		s1.setStock_uid(uid);
		s1.setStock_supplier(stock.getStock_supplier());
		s1.setStock_address(stock.getStock_address());
		s1.setStock_number(s.getStock_number());
		s1.setStock_price(stock.getStock_price());
		s1.setStock_product(stock.getStock_product());
		s1.setStock_brand(stock.getStock_brand());
		s1.setStock_package(stock.getStock_package());
		s1.setStock_lotnumber(stock.getStock_lotnumber());
		s1.setStock_position(s.getStock_position());
		s1.setStock_danwei1(stock.getStock_danwei1());
		s1.setStock_danwei2(stock.getStock_danwei2());
		s1.setStock_baozhuangnum(stock.getStock_baozhuangnum());
		s1.setStock_quality(stock.getStock_quality());
		stockService.insertSelective(s1);
		Rkreport r1=new Rkreport();
		r1.setRkreport_uid(uid);
		r1.setRkreport_num(s1.getStock_number());
		r1.setRkreport_uid(uid);
		r1.setRkreport_stockid(s1.getStock_id());
		r1.setRkreport_price(s1.getStock_price());
		r1.setRkreport_fangshi("调货入库");
		r1.setRkreport_status(1);
		r1.setRkreport_supplier(stock.getStock_supplier());
		r1.setRkreport_address(stock.getStock_address());
		rkreportService.insertSelective(r1);
		Rkreport r2=new Rkreport();
		r2.setRkreport_uid(uid);
		r2.setRkreport_num(s.getStock_number());
		r2.setRkreport_uid(uid);
		r2.setRkreport_stockid(stock.getStock_id());
		r2.setRkreport_price(stock.getStock_price());
		r2.setRkreport_fangshi("调货出库");
		r2.setRkreport_status(2);
		r2.setRkreport_supplier(stock.getStock_supplier());
		r2.setRkreport_address(stock.getStock_address());
		rkreportService.insertSelective(r2);
		return map;
	}
	
	/**
	 * 查看剩余库存
	 * @param product
	 * @param session
	 * @return
	 */
	@RequestMapping("sele_xsproduct")
	@ResponseBody
	public Map<String,Object> sele_xsproduct(String product,HttpSession session){
		Map<String,Object> map=new HashMap<String,Object>();
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			map.put("result","login");
			return map;
		}
		List<Stock> stock=stockService.seleByXiaoshou(product,uid);
		map.put("result", "success");
		map.put("xsproductList", stock);
		return map;
	}
	
}
