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

import com.zikezhi.entity.Discount;
import com.zikezhi.service.DiscountService;
import com.zikezhi.service.UserInfoService;
import com.zikezhi.utils.UIDGenerator;

/**
 * 优惠价格（分段）
 * @author wrp
 *
 */
@Controller
public class DiscountController {

	@Resource(name = "discountService")
	private DiscountService discountService;
	
	@Resource(name = "userInfoService")
	private UserInfoService userInfoService;
	
	/**
	 * 查询商品价格区间
	 * @param pid
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "1019/zai/xin/jian/queryByPid")
	public String queryByPid(String pid,HttpSession session, Model model){
		List<Discount> discountList=discountService.queryByPid(pid);
		model.addAttribute("pid", pid);
		if(discountList.isEmpty()){
			model.addAttribute("addDiscount", "addDiscount");
		}else if(!discountList.isEmpty()){
			model.addAttribute("upDiscount", "upDiscount");
			model.addAttribute("discountList", discountList);
		}
		return "adminHome";
	}
	
	/**
	 * 跳转添加价格区间页面
	 * @param pid
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "1019/zai/xin/jian/jumpAdd")
	public String jumpAdd(String pid,HttpSession session, Model model){
		model.addAttribute("pid", pid);
		return "admin/admin-addDiscount";
	}
	
	/**
	 * 添加商品价格区间
	 * @param discount_unit
	 * @param discount_numbermin
	 * @param discount_numbermax
	 * @param discount_price
	 * @param discount_pid
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "1019/zai/xin/jian/DiscountAdd")
	@ResponseBody
	public Map<String,Object> DiscountAdd(@RequestParam(required = false)Float price3,@RequestParam(required = false)Float price2,@RequestParam(required = false)Float price1,@RequestParam(required = false)String min1,@RequestParam(required = false)String max1,@RequestParam(required = false)String min2,@RequestParam(required = false)String max2,@RequestParam(required = false)String min3,@RequestParam(required = false)String discount_unit,@RequestParam(required = false)String discount_pid,HttpSession session, Model model){
		Map<String, Object> map = new HashMap<String,Object>();
		int i=0;
		if(min1!=null &&min1!=""){
			Discount discount =new Discount();
			discount.setDiscount_unit(discount_unit);
			discount.setDiscount_pid(discount_pid);
			discount.setDiscount_id(UIDGenerator.getUUID());
			discount.setDiscount_status("1");
			discount.setDiscount_date(new Date());
			discount.setDiscount_numbermax(Integer.parseInt(max1));
			discount.setDiscount_numbermin(Integer.parseInt(min1));
			discount.setDiscount_price(price1);
			i=discountService.insertSelective(discount);
		}
		if(min2!=null &&min2!=""){
			Discount discount =new Discount();
			discount.setDiscount_unit(discount_unit);
			discount.setDiscount_pid(discount_pid);
			discount.setDiscount_id(UIDGenerator.getUUID());
			discount.setDiscount_status("2");
			discount.setDiscount_date(new Date());
			discount.setDiscount_numbermax(Integer.parseInt(max2));
			discount.setDiscount_numbermin(Integer.parseInt(min2));
			discount.setDiscount_price(price2);
			i=discountService.insertSelective(discount);
		}if(min3!=null &&min3!=""){
			Discount discount =new Discount();
			discount.setDiscount_unit(discount_unit);
			discount.setDiscount_pid(discount_pid);
			discount.setDiscount_id(UIDGenerator.getUUID());
			discount.setDiscount_status("3");
			discount.setDiscount_date(new Date());
			discount.setDiscount_numbermax(0);
			discount.setDiscount_numbermin(Integer.parseInt(min3));
			discount.setDiscount_price(price3);
			i=discountService.insertSelective(discount);
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
	
	/**
	 * 商品价格区间修改
	 * @param discount
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "1019/zai/xin/jian/updateDiscount")
	@ResponseBody
	public Map<String,Object> updateDiscount(Discount discount,HttpSession session, Model model){
		Map<String, Object> map = new HashMap<String,Object>();
		int i=discountService.updateByPrimaryKeySelective(discount);
		if(i==0){
			map.put("result","fail");
			map.put("msg","失败");
		}else{
			map.put("result","seccuss");
			map.put("msg","成功");
		}
		return map;
	}
	
	/**
	 * 开始数量判断
	 * @param discount
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "1019/zai/xin/jian/queryByMin")
	@ResponseBody
	public Map<String,Object> queryByMin(Discount discount,HttpSession session, Model model){
		Map<String, Object> map = new HashMap<String,Object>();
		int number=discount.getDiscount_numbermin();
		List<Discount> list=discountService.queryByMin(discount);
		if(list.isEmpty()){
			map.put("result","seccuss");
			map.put("msg","成功");
		}else if(list.size()>0){
			for(Discount d:list){
				if(number<=d.getDiscount_numbermax()){
					map.put("result","fail");
					map.put("msg","失败");
					return map;
				}
			}
		}
		return map;
	}
	
}
