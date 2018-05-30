package com.zikezhi.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.google.gson.JsonObject;
import com.zikezhi.entity.Inquiry;
import com.zikezhi.entity.UserInfo;
import com.zikezhi.service.InquiryService;
import com.zikezhi.service.UserInfoService;
import com.zikezhi.utils.PageBean;
import com.zikezhi.utils.SmsUtil;
/**
 * 询价（采购）
 * @author lenovo
 *
 */
@Controller
public class InquiryController {
	
	@Resource(name = "userInfoService")
	private UserInfoService userInfoService;
	
	@Resource(name = "inquiryService")
	private InquiryService inquiryService;
	
	/**
	 * 用户询价记录添加
	 * @param i
	 * @param session
	 * @return
	 */
	@RequestMapping("addInquiry")
	@ResponseBody
	public Map<String,Object> addInquiry(Inquiry i,HttpSession session ){
		Map<String,Object> map=new HashMap<String,Object>();
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			map.put("result","login");
			return map;
		}
		i.setInquiry_uid(uid);
		i.setInquiry_status("1");
		i.setInquiry_date(new Date());
		int j=inquiryService.insertSelective(i);
		if(j==1){
			map.put("result", "success");
		}
		return map;
	}
	
	
	@RequestMapping("addInquiryxunjia")
	public String addInquiryxunjia(Inquiry i,HttpSession session,@RequestParam(required = false)String dhxcombo){
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			return "login";
		}
		i.setInquiry_utilnumber(dhxcombo);
		i.setInquiry_uid(uid);
		i.setInquiry_status("1");
		i.setInquiry_date(new Date());
		inquiryService.insertSelective(i);
		return "redirect:/queryByInquiryUserid";
	}
	
	@RequestMapping("updateInquiryxunjia")
	public String updateInquiryxunjia(Inquiry i,HttpSession session ){
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			return "login";
		}
		inquiryService.updateByPrimaryKeySelective(i);
		return "redirect:/queryByInquiryUserid";
	}
	
	/**
	 * 采购添加
	 * @param i
	 * @param session
	 * @return
	 */
	@RequestMapping("addCaigou")
	@ResponseBody
	public Map<String,Object> addbaojia(Inquiry i,HttpSession session ){
		Map<String,Object> map=new HashMap<String,Object>();
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			map.put("result","login");
			return map;
		}
		System.out.println(i.getInquiry_telphone());
		i.setInquiry_uid(uid);
		i.setInquiry_status("2");
		i.setInquiry_date(new Date());
		inquiryService.insertSelective(i);
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("addCaigouUser")
	public String addCaigouUser(Inquiry i,HttpSession session,@RequestParam(required = false)String dhxcombo){
		Map<String,Object> map=new HashMap<String,Object>();
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			return "login";
		}
		i.setInquiry_utilnumber(dhxcombo);
		i.setInquiry_uid(uid);
		i.setInquiry_status("2");
		i.setInquiry_date(new Date());
		inquiryService.insertSelective(i);
		map.put("result", "success");
		return "redirect:/queryByInquiryUserid";
	}
	
	@RequestMapping("queryByInquiryUserid")
	public String queryByInquiryUserid(HttpSession session ,Model model,@RequestParam(required = false)String page,@RequestParam(required = false)String product,@RequestParam(required = false)String status,@RequestParam(required = false)String date1,@RequestParam(required = false)String date2){
		String uid=(String)session.getAttribute("uid");
		Map<String,Object> map=new HashMap<String,Object>();
		UserInfo user = userInfoService.selectByPrimaryKey(uid);
		model.addAttribute("user", user);
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
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		map.put("date1", date1);
		if(date2==null || date2.equals("")){
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			date2=formatter.format(new Date());
		}
		map.put("date2", date2);
		map.put("uid", uid);
		List<Inquiry> inquiry=inquiryService.queryByUserid(map);
		int total=inquiryService.getTotal(map);
		model.addAttribute("total", total);
		pageBean.setTotal(total);
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page", pageBean.getPage());
		model.addAttribute("pageSize", pageBean.getPageSize());
		model.addAttribute("product", product);
		model.addAttribute("date1", date1);
		model.addAttribute("date2", date2);
		model.addAttribute("status", status);
		model.addAttribute("inquiry", inquiry);
		return "user/inquiry/inquiryList";
	}
	
	@RequestMapping("1019/zai/xin/jian/queryByInquiry")
	public String queryByInquiry(HttpSession session ,Model model,@RequestParam(required = false)String product,@RequestParam(required = false)String status){
		if(session.getAttribute("user")==null){
			return "Adminlogin";
		}
		Map<String,Object> map=new HashMap<String,Object>();
		if(product!=null){
			Pattern p = Pattern.compile("\\s*|\t|\r|\n");
	        Matcher m = p.matcher(product);
			product = m.replaceAll("");
			product = product.toUpperCase().replace(" ", "").replace("_", "\\_").replace("%", "\\%");
		}
		map.put("product", product);
		map.put("status", status);
		List<Inquiry> inquiry=inquiryService.queryAll(map);
		model.addAttribute("inquiry", inquiry);
		model.addAttribute("inquiryAll", "inquiryAll");
		return "adminHome";
	}
	
	@ResponseBody
	@RequestMapping(value="1019/zai/xin/jian/upInquiry", method = RequestMethod.POST)
	public String upInquiry(Inquiry i,HttpSession session ,Model model){
		if(session.getAttribute("user")==null){
			return "Adminlogin";
		}
		Inquiry iq=inquiryService.queryByid(i.getInquiry_id());
		SendSmsRequest sms =new SendSmsRequest();
		sms.setPhoneNumbers(iq.getTelephone());
		JsonObject params =new JsonObject();
		params.addProperty("name",iq.getUsername());
		sms.setTemplateParam(params.toString());
		SendSmsResponse res =SmsUtil.sendSmsQuotes(sms);
		System.out.println(res.getCode());
		int s=inquiryService.updateByPrimaryKeySelective(i);
		if(s!=0){
			return "成功";
		}
		return "失败";
	}
}
