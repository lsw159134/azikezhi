package com.zikezhi.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zikezhi.entity.Express;
import com.zikezhi.entity.UserInfo;
import com.zikezhi.entity.WithdrawAL;
import com.zikezhi.service.BomOrderService;
import com.zikezhi.service.ExpressService;
import com.zikezhi.service.UserInfoService;
import com.zikezhi.service.WithdrawALService;
import com.zikezhi.utils.PageBean;
import com.zikezhi.utils.UIDGenerator;
/**
 * 会员返现
 * @author wrp
 *
 */
@Controller
public class WithdrawALContrller {
	
	@Resource(name = "withdrawALService")
	private WithdrawALService withdrawALService;
	
	@Resource(name = "userInfoService")
	private UserInfoService userInfoService;
	
	@Resource(name = "expressService")
	private ExpressService expressService;
	
	@Resource(name="bomOrderService")
	private BomOrderService bomOrderService;
	
	/**
	 *查看返现
	 * @return
	 */
	@RequestMapping(value = "cashback")
	public String cashBack(HttpServletRequest req,@RequestParam(required = false) String page,@RequestParam(required = false) String rows,HttpSession session, Model model){
		String uid=(String)session.getAttribute("uid");
		UserInfo user = userInfoService.selectByPrimaryKey(uid);
		Map<String, Object> map = new HashMap<String,Object>();
		PageBean pageBean;
		if(page == null && rows == null){
			pageBean=new PageBean(1,10);
		}else{
			pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		}
		map.put("uid",uid);
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Express> expressList=expressService.queryselectFanli(map);
		Float fanTotal=expressService.selectFanBySum(uid);
		if(fanTotal==null){
			float a=0;
			fanTotal=a;
		}
		Float bomprice = bomOrderService.queryByfanUserBom(uid);
		if(bomprice==null){
			float a=0;
			bomprice=a;
		}
		BigDecimal b = new BigDecimal(fanTotal + bomprice);  
		fanTotal = b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
		Float price = withdrawALService.queryByUidAndWprice(uid);
		long total=expressService.queryselectFanliTotal(map);
		pageBean.setTotal(Integer.parseInt(String.valueOf(total)));
		req.setAttribute("fanTotal", fanTotal);
		req.setAttribute("price", price);
		req.setAttribute("total", total);
		req.setAttribute("count", pageBean.getCount());
		req.setAttribute("page",pageBean.getPage());
		req.setAttribute("pageSize",pageBean.getPageSize());
		model.addAttribute("user", user);
		req.setAttribute("expressList", expressList);
		req.setAttribute("cashback", "cashback");
		return "user/user-cashback";
	}
	
	/**
	 * 添加返现申请
	 * @param withdrawAL
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "addwithdrawal")
	@ResponseBody
	public Map<String, Object> cashBack(WithdrawAL withdrawAL,HttpSession session, Model model){
		String uid=(String)session.getAttribute("uid");
		Map<String, Object> map = new HashMap<String,Object>();
		withdrawAL.setW_id(UIDGenerator.getUUID());
		withdrawAL.setW_uid(uid);
		withdrawAL.setW_date(new Date());
		withdrawAL.setW_status("1");
		int i=withdrawALService.insertSelective(withdrawAL);
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
	 * 后台查看返现申请
	 * @param req
	 * @param page
	 * @param rows
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "1019/zai/xin/jian/withdrawAL")
	public String withdrawAL(HttpServletRequest req,@RequestParam(required = false) String page,@RequestParam(required = false) String rows,HttpSession session, Model model){
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		String uid=(String)session.getAttribute("uid");
		Map<String, Object> map = new HashMap<String,Object>();
		PageBean pageBean;
		if(page == null && rows == null){
			pageBean=new PageBean(1,10);
		}else{
			pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		}
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		Float fanTotal=expressService.selectFanBySum(uid);
		if(fanTotal==null){
			float a=0;
			fanTotal=a;
		}
		Float bomprice = bomOrderService.queryByfanUserBom(uid);
		if(bomprice==null){
			float a=0;
			bomprice=a;
		}
		BigDecimal b = new BigDecimal(fanTotal + bomprice);  
		fanTotal = b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
		Float price = withdrawALService.queryByUidAndWprice(uid);
		List<WithdrawAL> withdrawALList=withdrawALService.queryAll(map);
		long total=withdrawALService.getTotal();
		pageBean.setTotal(Integer.parseInt(String.valueOf(total)));
		req.setAttribute("fanTotal", fanTotal);
		req.setAttribute("price", price);
		req.setAttribute("total", total);
		req.setAttribute("count", pageBean.getCount());
		req.setAttribute("page",pageBean.getPage());
		req.setAttribute("pageSize",pageBean.getPageSize());
		req.setAttribute("withdrawALList", withdrawALList);
		req.setAttribute("withdrawAL", "withdrawAL");
		return "adminHome";
	}
	
	/**
	 * 修改提现申请
	 * @param withdrawAL
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "1019/zai/xin/jian/updatewithdrawALstatus", method = RequestMethod.POST)
	public String updatewithdrawALstatus(WithdrawAL withdrawAL, HttpSession session){
		if(session.getAttribute("user") != null){
			int i = withdrawALService.updateByPrimaryKeySelective(withdrawAL);
			if(i == 1){
				return "修改成功";
			}
		}
		return "修改失败";
	}
}
