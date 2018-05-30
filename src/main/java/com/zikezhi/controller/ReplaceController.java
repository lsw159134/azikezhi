package com.zikezhi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zikezhi.entity.AdminZaiXinJian;
import com.zikezhi.entity.Replace;
import com.zikezhi.service.ReplaceService;
/**
 * 替换型号
 * @author lenovo
 *
 */
@Controller
public class ReplaceController {

	@Resource(name="replaceService")
	private ReplaceService replaceService;
	
	@RequestMapping("1019/zai/xin/jian/addreplaceByProduct")
	@ResponseBody
	public Map<String,Object> addreplaceByProduct(Replace replace,HttpSession session){
		Map<String,Object> map=new HashMap<String,Object>();
		if(session.getAttribute("user")==null){
			map.put("result", "login");
		}
		AdminZaiXinJian admin=(AdminZaiXinJian)session.getAttribute("user");
		replace.setReplace_adminname(admin.getAdmin_adminName());
		replaceService.insertService(replace);
		List<Replace> replacelist=replaceService.selereplaceAdmin(replace.getReplace_product());
		map.put("msg", replacelist);
		return map;
	}
	
	@RequestMapping("1019/zai/xin/jian/selereplaceByProduct")
	@ResponseBody
	public Map<String,Object> selereplaceByProduct(String product,HttpSession session){
		Map<String,Object> map=new HashMap<String,Object>();
		if(session.getAttribute("user")==null){
			map.put("result", "login");
		}
		List<Replace> replace=replaceService.selereplaceAdmin(product);
		map.put("msg", replace);
		return map;
	}
	
	@RequestMapping("1019/zai/xin/jian/deletereplace")
	@ResponseBody
	public Map<String,Object> deletereplace(String id,HttpSession session){
		Map<String,Object> map=new HashMap<String,Object>();
		if(session.getAttribute("user")==null){
			map.put("result", "login");
		}
		replaceService.deletet(id);
		map.put("result", "success");
		return map;
	}
	
}
