package com.zikezhi.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zikezhi.entity.AdminZaiXinJian;
import com.zikezhi.entity.Booking;
import com.zikezhi.entity.Express;
import com.zikezhi.entity.Product;
import com.zikezhi.entity.UserInfo;
import com.zikezhi.service.BookingService;
import com.zikezhi.service.ExpressService;
import com.zikezhi.service.ProductService;
import com.zikezhi.service.UserInfoService;
import com.zikezhi.utils.PageBean;
import com.zikezhi.utils.UIDGenerator;

/**
 * 代售
 * @author wrp
 *
 */
@Controller
public class BookingController {

	@Resource(name = "bookingService")
	private BookingService bookingService;
	
	@Resource(name = "userInfoService")
	private UserInfoService userInfoService;
	
	@Resource(name = "productService")
	private ProductService productService;
	
	@Resource(name = "expressService")
	private ExpressService expressService;

	/**
	 *查看代售信息（用户）
	 * @return
	 */
	@RequestMapping("bookingproductexpress")
	public String bookingproductexpress(@RequestParam(required = false) String page,@RequestParam(required = false) String rows,HttpSession session, Model model){
		String userUid = (String)session.getAttribute("uid");
		if(userUid==null){
			return "login";
		}
		UserInfo user = userInfoService.selectByPrimaryKey(userUid);
		PageBean pageBean;
		if(page == null && rows == null){
			pageBean=new PageBean(1,10);
		}else{
			pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		}
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("uid",userUid);
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Express> expressList = expressService.queryByBookingOrder(map);
		int total=expressService.getBookingOrderTotal(map);
		model.addAttribute("total", total);
		pageBean.setTotal(total);
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page",pageBean.getPage());
		model.addAttribute("pageSize",pageBean.getPageSize());
		model.addAttribute("expressList", expressList);
		model.addAttribute("user", user);
		return "user/user-mybookingorder";
	}
	
	/**
	 *查看代售信息（用户）
	 * @return
	 */
	@RequestMapping("booking")
	public String booking(@RequestParam(required = false) String page,@RequestParam(required = false) String rows,HttpSession session, Model model){
		String userUid = (String)session.getAttribute("uid");
		if(userUid==null){
			return "login";
		}
		UserInfo user = userInfoService.selectByPrimaryKey(userUid);
		PageBean pageBean;
		if(page == null && rows == null){
			pageBean=new PageBean(1,10);
		}else{
			pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		}
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("uid",userUid);
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Booking> bookingList = bookingService.queryByUid(map);
		long total=bookingService.getTotal(map);
		model.addAttribute("total", total);
		pageBean.setTotal(Integer.parseInt(String.valueOf(total)));
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page",pageBean.getPage());
		model.addAttribute("pageSize",pageBean.getPageSize());
		model.addAttribute("bookingList", bookingList);
		model.addAttribute("user", user);
		model.addAttribute("booking","booking");
		return "user/user-mybooking";
	}
	
	/**
	 *跳转的添加代售页面
	 * @throws Exception 
	 */
	@RequestMapping("jumpAddbooking")
	public String jumpAddbooking(HttpServletRequest request,HttpSession session,Model model) throws Exception{
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			return "login";
		}
		UserInfo user = userInfoService.selectByPrimaryKey(uid);
		model.addAttribute("user", user);
		model.addAttribute("addbooking", "addbooking");
		if (request == null) {  
	        throw (new Exception("getIpAddr method HttpServletRequest Object is null"));  
	    }  
	    String ipString = request.getHeader("x-forwarded-for");  
	    if (StringUtils.isBlank(ipString) || "unknown".equalsIgnoreCase(ipString)) {  
	        ipString = request.getHeader("Proxy-Client-IP");  
	    }  
	    if (StringUtils.isBlank(ipString) || "unknown".equalsIgnoreCase(ipString)) {  
	        ipString = request.getHeader("WL-Proxy-Client-IP");  
	    }  
	    if (StringUtils.isBlank(ipString) || "unknown".equalsIgnoreCase(ipString)) {  
	        ipString = request.getRemoteAddr();  
	    }  
	  
	    // 多个路由时，取第一个非unknown的ip  
	    final String[] arr = ipString.split(",");  
	    for (final String str : arr) {  
	        if (!"unknown".equalsIgnoreCase(str)) {  
	            ipString = str;  
	            break;  
	        }  
	    }  
		return "user/user-inBooking";
	}
	
	/**
	 *代售产品出售信息添加
	 * @throws Exception 
	 */
	@RequestMapping("1019/zai/xin/jian/addBookingProduct")
	public String addBookingProduct(String bid,HttpServletRequest request,HttpSession session,Model model) throws Exception{
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		Booking b=bookingService.queryById(bid);
		System.out.println(b.getBooking_product());
		model.addAttribute("booking", b);
		model.addAttribute("addUser","addUser");
		return "adminHome";
	}
	
	/**
	 *代售信息添加
	 */
	@RequestMapping(value = "1019/zai/xin/jian/Productadminbooking")
	@ResponseBody
	public Map<String, Object> bookingProductadmin(String booking_id,HttpSession session,Model model){
		Map<String, Object> map = new HashMap<String,Object>();
		AdminZaiXinJian user=(AdminZaiXinJian)session.getAttribute("user");
		if(user==null){
			map.put("result","login");
			return map;
		}
		Product p=productService.queryByProduct_booking(booking_id);
		if(p==null){
			map.put("result","fail");
			return map;
		}else{
			map.put("result","success");
			map.put("msg",p.getProductuuid());
			return map;
		}
	}
	
	
	/**
	 *代售信息添加
	 */
	@RequestMapping("bookingadd")
	@ResponseBody
	public Map<String, Object> addBooking(Booking booking,HttpSession session,Model model){
		Map<String, Object> map = new HashMap<String,Object>();
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			map.put("result","login");
			return map;
		}
		booking.setBooking_id(UIDGenerator.getUUID());
		booking.setBooking_status("1");
		booking.setBooking_date(new Date());
		booking.setBooking_uid(uid);
		int i=bookingService.insertSelective(booking);
		if(i==0){
			map.put("result","fail");
			map.put("msg","失败");
			return map;
		}else{
			map.put("result","seccuss");
			map.put("msg","成功");
		}
		return map;
	}
	
	/**
	 *查看代售信息（后台）
	 * @return
	 */
	@RequestMapping("1019/zai/xin/jian/bookingAll")
	public String bookingAll(@RequestParam(required = false) String page,@RequestParam(required = false) String rows,HttpSession session, Model model){
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		PageBean pageBean;
		if(page == null && rows == null){
			pageBean=new PageBean(1,10);
		}else{
			pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		}
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Booking> bookingList = bookingService.queryAll(map);
		long total=bookingService.getTotalAll();
		model.addAttribute("total", total);
		pageBean.setTotal(Integer.parseInt(String.valueOf(total)));
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page",pageBean.getPage());
		model.addAttribute("pageSize",pageBean.getPageSize());
		model.addAttribute("bookingList", bookingList);
		model.addAttribute("booking","booking");
		return "adminHome";
	}
	
	/**
	 * 修改代售信息
	 * @param booking
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "1019/zai/xin/jian/updateBookingstatus")
	@ResponseBody
	public String updatewithdrawALstatus(Booking booking, HttpSession session,Model model){
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		int i = bookingService.updateByPrimaryKeySelective(booking);
		if(i == 1){
			return "修改成功";
		}
		return "修改失败";
	}
	
	
}
