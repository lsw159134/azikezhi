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

import com.zikezhi.entity.Remarks;
import com.zikezhi.service.RemarksService;
/**
 * 供应商备注
 * @author lenovo
 *
 */
@Controller
public class RemarksController {

	@Resource(name = "remarksService")
	private	RemarksService remarksService;
	
	@RequestMapping("addSupplierremarks")
	@ResponseBody
	public Map<String,Object> addSupplierremarks(@RequestParam(required=false)String remarks_contest,@RequestParam(required=false)String suid,HttpSession session){
		Map<String,Object> map=new HashMap<String,Object>();
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			map.put("result", "login");
			return map;
		}
		Remarks r=remarksService.queryByPid(suid, uid);
		if(r==null){
			Remarks r1=new Remarks();
			r1.setRemarks_contest(remarks_contest);
			r1.setRemarks_suid(suid);
			r1.setRemarks_userid(uid);
			remarksService.insertSelective(r1);
		}else{
			r.setRemarks_contest(remarks_contest);
			remarksService.updateByPrimaryKeySelective(r);
		}
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("selectSupplierremarks")
	@ResponseBody
	public Map<String,Object> selectSupplierremaks(@RequestParam(required=false)String suid,HttpSession session){
		Map<String,Object> map=new HashMap<String,Object>();
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			map.put("result", "login");
			return map;
		}
		Remarks r=remarksService.queryByPid(suid, uid);
		map.put("msg", r);
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("1019/zai/xin/jian/seleSupplierRemarksAdmin")
	public String seleSupplierRemarksAdmin(Model model,HttpSession session){
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		List<Remarks> remarks=remarksService.queryAll();
		model.addAttribute("remarks", remarks);
		model.addAttribute("remarksAll", "remarksAll");
		return "adminHome";
	}
}
