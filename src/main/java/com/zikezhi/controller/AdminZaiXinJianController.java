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
import com.zikezhi.service.AdminZaiXinJianService;
import com.zikezhi.utils.MD5Generator;
import com.zikezhi.utils.UIDGenerator;
/**
 * 权限
 * @author wrp
 *
 */
@Controller
public class AdminZaiXinJianController {

	@Resource(name = "adminZaiXinJianService")
	private AdminZaiXinJianService adminZaiXinJianService;
	 
	/**
	 * 查询所有管理员
	 * @param session
	 * @param page
	 * @param rows
	 * @param model
	 * @return
	 */
	@RequestMapping("1019/zai/xin/jian/admin_List")
	public String admin_list(HttpSession session,@RequestParam(required = false) String page,@RequestParam(required = false) String rows,Model model){
		AdminZaiXinJian adminzikezhi=(AdminZaiXinJian)session.getAttribute("user");
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		if(!adminzikezhi.getAdmin_jurisdiction().equals("1") && !adminzikezhi.getAdmin_adminName().equals("钟镇东")){
			return "redirect:cont";
		}
		AdminZaiXinJian admin=adminZaiXinJianService.queryByABystatus();
		List<AdminZaiXinJian> adminList=adminZaiXinJianService.queryAll();
		model.addAttribute("ip", admin);
		model.addAttribute("admin", adminList);
		model.addAttribute("adminList", "adminList");
		return "adminHome";
	}
	
	/**
	 * 跳转到添加管理员页面
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("1019/zai/xin/jian/inAdmin")
	public String inAdmin(HttpSession session,Model model){
		AdminZaiXinJian admin=(AdminZaiXinJian)session.getAttribute("user");
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		if(!admin.getAdmin_jurisdiction().equals("1") && !admin.getAdmin_adminName().equals("钟镇东")){
			return "redirect:cont";
		}
		model.addAttribute("inadmin", "inadmin");
		return "adminHome";
	}
	
	/**
	 * 跳转到修改管理员页面
	 * @param aid 要修改的管理员id
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("1019/zai/xin/jian/editAdmin")
	public String editAdmin(String aid,HttpSession session,Model model){
		AdminZaiXinJian admin=(AdminZaiXinJian)session.getAttribute("user");
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		if(!admin.getAdmin_jurisdiction().equals("1")&&!admin.getAdmin_adminName().equals("钟镇东")){
			return "redirect:cont";
		}
		AdminZaiXinJian adminZaiXinJian=adminZaiXinJianService.queryByAid(aid);
		model.addAttribute("adminZaiXinJian", adminZaiXinJian);
		session.setAttribute("pwd", adminZaiXinJian.getAdmin_adminpassword());
		model.addAttribute("editadmin", "editadmin");
		return "adminHome";
	}
	
	/**
	 * 管理员信息修改
	 * @param adminZaiXinJian
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("1019/zai/xin/jian/upAdmin")
	public String upAdmin(AdminZaiXinJian adminZaiXinJian,HttpSession session,Model model){
		AdminZaiXinJian adminzikezhi=(AdminZaiXinJian)session.getAttribute("user");
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		if(!adminzikezhi.getAdmin_jurisdiction().equals("1")&&!adminzikezhi.getAdmin_adminName().equals("钟镇东")){
			return "redirect:cont";
		}
		AdminZaiXinJian admin=(AdminZaiXinJian)session.getAttribute("user");
		String p=(String)session.getAttribute("pwd");
		session.removeAttribute("pwd");
		adminZaiXinJian.setAdmin_Thatadd(admin.getAdmin_id());
		adminZaiXinJian.setAdmin_uptime(new Date());
		if(!adminZaiXinJian.getAdmin_adminpassword().equals(p)){
			String pwd=MD5Generator.getMD5(adminZaiXinJian.getAdmin_adminpassword());
			adminZaiXinJian.setAdmin_adminpassword(pwd);
		}
		if(adminZaiXinJian.getAdmin_jurisdiction()!=null && !adminZaiXinJian.getAdmin_jurisdiction().equals("1")){
   			adminZaiXinJian.setAdmin_jurisdiction("7");
		}
		adminZaiXinJianService.updateByPrimaryKeySelective(adminZaiXinJian);
		return "redirect:admin_List";
	}
	
	/**
	 * 设置ip
	 * @param adminZaiXinJian
	 * @param session
	 * @return
	 */
	@RequestMapping("1019/zai/xin/jian/shezhiip")
	public String shezhiip(AdminZaiXinJian adminZaiXinJian,HttpSession session){
		AdminZaiXinJian adminzikezhi=(AdminZaiXinJian)session.getAttribute("user");
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		if(!adminzikezhi.getAdmin_jurisdiction().equals("1")&&!adminzikezhi.getAdmin_adminName().equals("钟镇东")){
			return "redirect:cont";
		}
		adminZaiXinJianService.updateByPrimaryKeySelective(adminZaiXinJian);
		return "redirect:admin_List";
	}
	
	/**
	 * 删除管理员
	 * @param aid 管理员id
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("1019/zai/xin/jian/deleteAdmin")
	public String deleteAdmin(String aid,HttpSession session,Model model){
		AdminZaiXinJian adminzikezhi=(AdminZaiXinJian)session.getAttribute("user");
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		if(!adminzikezhi.getAdmin_jurisdiction().equals("1")&&!adminzikezhi.getAdmin_adminName().equals("钟镇东")){
			return "redirect:cont";
		}
		adminZaiXinJianService.deleteByAdminID(aid);
		return "redirect:admin_List";
	}
	
	/**
	 * 添加管理员
	 * @param adminZaiXinJian
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("1019/zai/xin/jian/addAdmin")
	public String addAdmin(AdminZaiXinJian adminZaiXinJian,HttpSession session,Model model){
		AdminZaiXinJian adminzikezhi=(AdminZaiXinJian)session.getAttribute("user");
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		if(!adminzikezhi.getAdmin_jurisdiction().equals("1")&&!adminzikezhi.getAdmin_adminName().equals("钟镇东")){
			return "redirect:cont";
		}
		AdminZaiXinJian admin=(AdminZaiXinJian)session.getAttribute("user");
		String pwd=MD5Generator.getMD5(adminZaiXinJian.getAdmin_adminpassword());
		adminZaiXinJian.setAdmin_adminpassword(pwd);
		adminZaiXinJian.setAdmin_addtime(new Date());
		adminZaiXinJian.setAdmin_jurisdiction("7");
		adminZaiXinJian.setAdmin_id(UIDGenerator.getUUID());
		adminZaiXinJian.setAdmin_Thatadd(admin.getAdmin_id());
		adminZaiXinJianService.insertSelective(adminZaiXinJian);
		return "redirect:admin_List";
	}
	
	/**
	 * 管理员账号查询
	 * @param name 输入的账号
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("1019/zai/xin/jian/ByAccount")
	@ResponseBody
	public Map<String, Object> ByAccount(String name,HttpSession session,Model model){
		Map<String, Object> map = new HashMap<String, Object>();
		AdminZaiXinJian adminzaixinjian=adminZaiXinJianService.queryByAccount(name);
		if(adminzaixinjian==null){
			map.put("result", "seccuss");
		}else{
			map.put("result", "fail");
		}
		return map;
	}
}
