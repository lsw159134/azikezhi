package com.zikezhi.controller;

import com.zikezhi.entity.AdminZaiXinJian;
import com.zikezhi.entity.UserInfo;
import com.zikezhi.service.UserInfoService;
import com.zikezhi.utils.MD5Generator;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * 
 * @author ponder
 * @version 1.0
 * @Date 2016年12月9日 
 * @Description: TODO(用一句话描述这个方法的作用)
 * 
 * @ClassName UserUpdate.java
 * 
*/

@Controller
public class UserUpdate {

	@Resource(name = "userInfoService")
	private UserInfoService userInfoService;
	
	@ResponseBody
	@RequestMapping("updateusername")
	public Map<String, Object> updateusername(String username, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			map.put("result", "login");
			return map;
		} 
		UserInfo u=userInfoService.selectByPrimaryKey(uid);
		if(u.getUsername().equals(username)){
			map.put("result", "seccuss");
			map.put("msg", "更新成功");
			session.removeAttribute("userName");
			session.setAttribute("userName", username);
			return map;
		}else{
			int userinfo = userInfoService.findUserName(username);
			if(userinfo!=0){
				map.put("result","fail");
				map.put("name",u.getUsername());
				map.put("msg","该用户名已有!");
				return map;
			}
		}
		UserInfo user = new UserInfo();
		user.setUsername(username);
		user.setUseruid(uid);
		int i = userInfoService.updateByPrimaryKeySelective(user);
		if(i == 0){
			map.put("code", "-1");
			map.put("msg", "更新失败");
			return map;
		}
		map.put("result", "seccuss");
		map.put("msg", "更新成功");
		session.removeAttribute("userName");
		session.setAttribute("userName", username);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("updatepassword")
	public Map<String, Object> updatepassword(String password, String useruid, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		if(!session.getAttribute("uid").equals(useruid)){
			map.put("code", "-1");
			map.put("msg", "更新失败");
			return map;
		}
		UserInfo user = new UserInfo();
		user.setPassword(MD5Generator.getMD5(password, useruid));
		user.setUseruid(useruid);
		int i = userInfoService.updateByPrimaryKeySelective(user);
		if(i == 0){
			map.put("code", "-1");
			map.put("msg", "更新失败");
			return map;
		}
		map.put("code", "1");
		map.put("msg", "更新成功");
		return map;
	}
	
	@ResponseBody
	@RequestMapping("updatesex")
	public Map<String, Object> updatesex(String sex, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		UserInfo user = new UserInfo();
		user.setSex(sex);;
		user.setUseruid((String)session.getAttribute("uid"));
		int i = userInfoService.updateByPrimaryKeySelective(user);
		if(i == 0){
			map.put("code", "-1");
			map.put("msg", "用户更新失败");
			return map;
		}
		map.put("code", "1");
		map.put("msg", "用户更新成功");
		return map;
	}
	
	@ResponseBody
	@RequestMapping("updateqq")
	public Map<String, Object> updateqq(String qq, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		UserInfo user = new UserInfo();
		user.setQq(qq);;
		user.setUseruid((String)session.getAttribute("uid"));
		int i = userInfoService.updateByPrimaryKeySelective(user);
		if(i == 0){
			map.put("code", "-1");
			map.put("msg", "用户更新失败");
			return map;
		}
		map.put("code", "1");
		map.put("msg", "用户更新成功");
		return map;
	}
	
	@ResponseBody
	@RequestMapping("updatemail")
	public Map<String, Object> updatemail(String mail, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		UserInfo user = new UserInfo();
		user.setMail(mail);;
		user.setUseruid((String)session.getAttribute("uid"));
		int i = userInfoService.updateByPrimaryKeySelective(user);
		if(i == 0){
			map.put("code", "-1");
			map.put("msg", "用户更新失败");
			return map;
		}
		map.put("code", "1");
		map.put("msg", "用户更新成功");
		return map;
	}
	
	@ResponseBody
	@RequestMapping("1019/zai/xin/jian/updateUserSupplierOnline")
	public Map<String,Object> updateUserSupplierOnline(String uid,HttpSession session){
		Map<String,Object> map=new HashMap<String, Object>();
		AdminZaiXinJian admin=(AdminZaiXinJian)session.getAttribute("user");
		if(admin==null){
			map.put("result", "login");
			return map;
		}else if(admin.getAdmin_shrio()!=null && admin.getAdmin_shrio().indexOf("h")==-1){
			map.put("result", "fail");
			map.put("msg", "权限不足");
			return map;
		}
		UserInfo user= new UserInfo();
		user.setUseruid(uid);
		user.setSupplieruid("1");
		userInfoService.updateByPrimaryKeySelective(user);
		return map;
	}

}
