package com.zikezhi.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zikezhi.entity.Quote;
import com.zikezhi.service.CartService;
import com.zikezhi.service.ExpressService;
import com.zikezhi.service.QuoteService;
import com.zikezhi.service.UserInfoService;
import com.zikezhi.utils.PageBean;
/**
 * 报价
 * @author lenovo
 *
 */
@Controller
public class QuoteController {
	
	@Resource(name = "userInfoService")
	private UserInfoService userInfoService;
	
	@Resource(name="quoteService")
	private QuoteService quoteService;
	
	@Resource(name = "cartService")
	private CartService cartService;
	
	@Resource(name="expressService")
	private ExpressService expressService;
	
	//添加报价
	@RequestMapping("addQuote")
	public String addQuote(Quote q,HttpSession session,HttpServletRequest request,Model model) throws IOException{
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			return "login";	
		}
		q.setQuote_uid(uid);
		q.setQuote_date(new Date());
		q.setQuote_status("1");
		quoteService.insertSelective(q);
		return "redirect:/quoteAllByUser";
	}
	
	//修改报价
	@RequestMapping("updateQuote")
	public String updateQuote(Quote q,HttpSession session,HttpServletRequest request,Model model) throws IOException{
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			return "login";	
		}
		quoteService.updateByPrimaryKeySelective(q);
		return "redirect:/quoteAllByUser";
	}
	
	//用户报价查询
	@RequestMapping("quoteAllByUser")
	public String addQuoteWenBen(@RequestParam(required = false) String product,@RequestParam(required = false)String status,@RequestParam(required = false)String date1,@RequestParam(required = false)String date2,@RequestParam(required = false) String page,HttpSession session,HttpServletRequest request,Model model) throws IOException{
		Map<String,Object> map=new HashMap<String,Object>();
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			return "login";	
		}
		PageBean pageBean;
		if(page == null){
			pageBean=new PageBean(1,30);
		}else{
			pageBean=new PageBean(Integer.parseInt(page),30);
		}
		if(product!=null){
			Pattern p = Pattern.compile("\\s*|\t|\r|\n");
            Matcher m = p.matcher(product);
            product = m.replaceAll("");
		}
		map.put("product", product);
		map.put("status", status);
		map.put("date1", date1);
		if(date2==null || date2.equals("")){
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			date2=formatter.format(new Date());
		}
		map.put("date2", date2);
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		map.put("uid", uid);
		List<Quote> quote=quoteService.queryByUser(map);
		int total=quoteService.getTotal(map);
		model.addAttribute("total", total);
		pageBean.setTotal(total);
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page", pageBean.getPage());
		model.addAttribute("pageSize", pageBean.getPageSize());
		model.addAttribute("quote", quote);
		model.addAttribute("product", product);
		model.addAttribute("date1", date1);
		model.addAttribute("date2", date2);
		model.addAttribute("status",status);
		return "user/inquiry/quoteList";
	}
	
	/**
	 * 报价查看（后台系统）
	 * @param session
	 * @param model
	 * @param product
	 * @param status
	 * @return
	 */
	@RequestMapping("1019/zai/xin/jian/quoteAllAdmin")
	public String quoteAllAdmin(HttpSession session ,Model model,@RequestParam(required = false)String product,@RequestParam(required = false)String status){
		if(session.getAttribute("user")==null){
			return "Adminlogin";
		}
		Map<String,Object> map=new HashMap<String,Object>();
		if(product!=null){
			Pattern p = Pattern.compile("\\s*|\t|\r|\n");
            Matcher m = p.matcher(product);
            product = m.replaceAll("");
		}
		map.put("product", product);
		map.put("status", status);
		List<Quote> quote=quoteService.queryAll(map);
		model.addAttribute("quote", quote);
		model.addAttribute("quoteAll", "quoteAll");
		return "adminHome";
	}
	
}
