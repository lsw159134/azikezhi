package com.zikezhi.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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

import com.zikezhi.entity.Rkreport;
import com.zikezhi.entity.Stock;
import com.zikezhi.entity.XiaoShou;
import com.zikezhi.service.RkreportService;
import com.zikezhi.service.StockService;
import com.zikezhi.service.XiaoShouService;
import com.zikezhi.utils.PageBean;
import com.zikezhi.utils.UIDGenerator;
/**
 * 公司资源（销售）
 * @author lenovo
 *
 */
@Controller
public class XiaoShouController {

	@Resource(name="xiaoShouService")
	private XiaoShouService xiaoShouService;
	
	@Resource(name="rkreportService")
	private RkreportService rkreportService;
	
	@Resource(name="stockService")
	private StockService stockService;
	
	/**
	 * 销售记录查看
	 * @param product
	 * @param page
	 * @param model
	 * @return
	 */
	@RequestMapping("xiaoshouAll")
	public String xiaoshouall(@RequestParam(required=false)String product,@RequestParam(required=false)String page,HttpSession session,Model model){
		String uid=(String)session.getAttribute("uid");
		Map<String,Object> map=new HashMap<String,Object>();
		if(uid==null){
			return "login";
		}
		
		PageBean pageBean;
		if(page == null){
			pageBean = new PageBean(1,10);
		}else{
			pageBean=new PageBean(Integer.parseInt(page),10);
		}
		if(product != null && !product.equals("")){
			product = product.toUpperCase().replace(" ", "").replace("　","").replace("	","").replace("_", "\\_").replace("%", "\\%");
			model.addAttribute("product", product);
			map.put("name", product);
		}
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		map.put("uid", uid);
		List<XiaoShou> xiaoshou=xiaoShouService.queryAll(map);
		int total=xiaoShouService.countCart(map);
		model.addAttribute("xiaoshou", xiaoshou);
		pageBean.setTotal(total);
		model.addAttribute("total", total);
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page",pageBean.getPage());
		model.addAttribute("pageSize",pageBean.getPageSize());
		model.addAttribute("xiaoshouall", "xiaoshouall");
		return "user/stock/stock";
	}
	
	/**
	 * 添加销售记录
	 * @param xs
	 * @param shoujia
	 * @param id
	 * @param number
	 * @param xs_shoukuandate1
	 * @param session
	 * @return
	 */
	@RequestMapping("addxiaoshou")
	@ResponseBody
	public Map<String,Object> addxiaoshou(XiaoShou xs,@RequestParam(required=false)String shoujia,@RequestParam(required=false)String id,@RequestParam(required=false)String number,@RequestParam(required=false)String xs_shoukuandate1,HttpSession session){
		Map<String,Object> map=new HashMap<String,Object>();
		String uid=(String) session.getAttribute("uid");
		if(uid==null){
			map.put("result", "login");
			return map;
		}
		String number1[] = number.split(",");
		String id1[] = id.split(",");
		String shoujia1[] = shoujia.split(",");
		int x=shoujia1.length;
		xs.setXs_uid(uid);
		if(xs_shoukuandate1!=null && !xs_shoukuandate1.equals("")){
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
	        Date date = null;  
	        try {  
	            // Fri Feb 24 00:00:00 CST 2012  
	            date = format.parse(xs_shoukuandate1);   
	        } catch (ParseException e) {  
	            e.printStackTrace();  
	        }  
	        // 2012-02-24  
			xs.setXs_shoukuandate(date);
		}
		xs.setXs_id(UIDGenerator.getUUID());
		xiaoShouService.insertSelective(xs);
		for(int i=0;i<x;i++){
			if(number1[i]!=null && !number1[i].equals("") && id1[i]!=null && !id1[i].equals("") && shoujia1[i]!=null && !shoujia1[i].equals("")){
				Stock stock=stockService.seleByid(id1[i]);
				Rkreport rk=new Rkreport();
				rk.setRkreport_fangshi("销售出库");
				rk.setRkreport_status(3);
				rk.setRkreport_uid(uid);
				rk.setRkreport_num(number1[i]);
				rk.setRkreport_uid(uid);
				rk.setRkreport_stockid(id1[i]);
				rk.setRkreport_price(Float.valueOf(shoujia1[i]));
				rk.setRkreport_xsid(xs.getXs_id());
				rk.setRkreport_supplier(stock.getStock_supplier());
				rk.setRkreport_address(stock.getStock_address());
				rkreportService.insertSelective(rk);
			}
		}
		return map;
	}
	
	/**
	 * 修改销售记录
	 * @param xs
	 * @param shoujia
	 * @param rid
	 * @param sid
	 * @param number
	 * @param xs_shoukuandate1
	 * @param session
	 * @return
	 */
	@RequestMapping("upxiaoshou")
	@ResponseBody
	public Map<String,Object> upxiaoshou(XiaoShou xs,@RequestParam(required=false)String shoujia,@RequestParam(required=false)String rid,@RequestParam(required=false)String sid,@RequestParam(required=false)String number,@RequestParam(required=false)String xs_shoukuandate1,HttpSession session){
		Map<String,Object> map=new HashMap<String,Object>();
		String uid=(String) session.getAttribute("uid");
		if(uid==null){
			map.put("result", "login");
			return map;
		}
		String number1[] = number.split(",");
		String sid1[] = sid.split(",");
		String rid1[] = rid.split(",");
		String shoujia1[] = shoujia.split(",");
		int x=shoujia1.length;
		if(xs_shoukuandate1!=null && !xs_shoukuandate1.equals("")){
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
	        Date date = null;  
	        try {  
	            // Fri Feb 24 00:00:00 CST 2012  
	            date = format.parse(xs_shoukuandate1);   
	        } catch (ParseException e) {  
	            e.printStackTrace();  
	        }  
	        // 2012-02-24  
			xs.setXs_shoukuandate(date);
		}
		xiaoShouService.updateByPrimaryKeySelective(xs);
		for(int i=0;i<x;i++){
			if(number1[i]!=null && !number1[i].equals("") && sid1[i]!=null && !sid1[i].equals("") && rid1[i]!=null && !rid1[i].equals("") && shoujia1[i]!=null && !shoujia1[i].equals("")){
				Stock stock=stockService.seleByid(sid1[i]);
				Rkreport rk=new Rkreport();
				rk.setRkreport_num(number1[i]);
				rk.setRkreport_price(Float.valueOf(shoujia1[i]));
				rk.setId(Integer.parseInt(rid1[i]));
				if(xs.getXs_status().equals("1")){
					Stock s=new Stock();
					s.setStock_id(sid1[i]);
					s.setStock_number((Integer.parseInt(stock.getStock_number())-Integer.parseInt(number1[i]))+"");
					stockService.updateByPrimaryKeySelective(s);
					rk.setRkreport_status(2);
				}
				rkreportService.updateByPrimaryKeySelective(rk);
			}
		}
		return map;
	}
	
	/**
	 * 
	 * @param session
	 * @param id
	 * @return
	 */
	@RequestMapping("sele_xspdetail")
	@ResponseBody
	public Map<String,Object> sele_xspdetail(HttpSession session,String id){
		Map<String,Object> map=new HashMap<String,Object>();
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			map.put("result", "login");
			return map;
		}
		XiaoShou xs=xiaoShouService.seleByid(id);
		map.put("xsdetail", xs);
		map.put("result", "success");
		return map;
	}
	
}
