package com.zikezhi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zikezhi.entity.AdminZaiXinJian;
import com.zikezhi.entity.Cart;
import com.zikezhi.entity.Product;
import com.zikezhi.service.CartService;
import com.zikezhi.service.ProductService;

/**
 * 购物车信息
 * @author wrp
 *
 */
@Controller
public class CartController {

	@Resource(name = "cartService")
	private CartService cartService;
	
	@Resource(name = "productService")
	private ProductService productService;
	
	/**
	 * 购物车查看（后台系统）
	 * @param eid
	 * @param expressname
	 * @param fapiao
	 * @param pid
	 * @param number
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "1019/zai/xin/jian/cartAll")
	public String inAdd(@RequestParam(required = false)String eid,@RequestParam(required = false)String expressname,@RequestParam(required = false)String fapiao,@RequestParam(required = false)String pid,@RequestParam(required = false)String number,Model model,HttpSession session){
		AdminZaiXinJian admin=(AdminZaiXinJian)session.getAttribute("user");
		if(admin==null){
			return "Adminlogin";
		}
		List<Cart> cartList = cartService.queryAll();
		model.addAttribute("cartList", cartList);
		model.addAttribute("cartAdmin", "cartAdmin");
		return "adminHome";
	}
	
	//新加入panduan 来判断是电阻电容订单  
	@RequestMapping("cartback")
	public String cartback(Model model,HttpSession session,String pid,String panduan){
		Product product = productService.selectByPrimaryKey(pid);
		List<Product> productRan = productService.seleCartRan();
		String uidCart = (String) session.getAttribute("uid");
		if(uidCart != null){
			
			//获取购物车总数
			Long carCount = cartService.countCart(uidCart);
			model.addAttribute("carCount",carCount);
		}
		if(StringUtils.isNotBlank(panduan)){
			model.addAttribute("panduan",panduan);
		}
		model.addAttribute("product",product);
		model.addAttribute("productRan",productRan);
		return "cartback";
	}
	
	@RequestMapping("queryCartOrdercount")
	@ResponseBody
	public Map<String,Object> count(Model model,HttpSession session,String pid){
		Map<String,Object> map=new HashMap<String,Object>();
		Product product = productService.findByPid(pid);
		map.put("count", product.getIsgoodsinstock());
		return map;
	}
	
}
