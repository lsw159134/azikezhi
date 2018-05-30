package com.zikezhi.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zikezhi.entity.PassiveComponents;
import com.zikezhi.service.PassiveComponentsService;
import com.zikezhi.utils.PageBean;
import com.zikezhi.utils.UIDGenerator;
/**
 * 被动供应商
 * @author lenovo
 *
 */
@Controller
public class PassiveController {

	@Resource(name="passiveComponentsService")
	private PassiveComponentsService passiveComponentsService;
	
	@RequestMapping("selectByCidandSid")
	@ResponseBody
	public List<PassiveComponents> selectByCidandSid(int cid,int sid){
		List<PassiveComponents> PassiveComponents=passiveComponentsService.selectByCidandSid(cid, sid);
		return PassiveComponents;
	}
	
	@RequestMapping("1019/zai/xin/jian/passiveList")
	public String passiveList(HttpSession session,Model model,@RequestParam(required=false)String name,@RequestParam(required=false)String product,@RequestParam(required = false)String page){
		if(session.getAttribute("user")==null){
			return "Adminlogin";
		}
		Map<String,Object> map=new HashMap<String,Object>();
		PageBean pageBean;
		if(page == null){
			pageBean=new PageBean(1,60);
		}else{
			pageBean=new PageBean(Integer.parseInt(page),60);
		}
		if(product!=null){
			Pattern p = Pattern.compile("\\s*|\t|\r|\n");
	        Matcher m = p.matcher(product);
			product = m.replaceAll("");
			product = product.toUpperCase().replace(" ", "").replace("_", "\\_").replace("%", "\\%");
		}
		map.put("name", name);
		map.put("supplier", product);
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<PassiveComponents> passive=passiveComponentsService.selectByName(map);
		int total=passiveComponentsService.getTotal(map);
		model.addAttribute("total", total);
		pageBean.setTotal(total);
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page",pageBean.getPage());
		model.addAttribute("pageSize",pageBean.getPageSize());
		model.addAttribute("passive", passive);
		model.addAttribute("passiveAll", "passiveAll");
		return "adminHome";
	}
	
	@RequestMapping("1019/zai/xin/jian/addpassive")
	public String addpassive(Model model,HttpSession session){
		if(session.getAttribute("user")==null){
			return "Adminlogin";
		}
		model.addAttribute("addpassice", "addpassice");
		return "adminHome";
	}
	
	@RequestMapping("1019/zai/xin/jian/insertpassiveS")
	public String insertpassiveS(PassiveComponents p,Model model,HttpSession session){
		if(session.getAttribute("user")==null){
			return "Adminlogin";
		}
		p.setPassivecomponentsuid(UIDGenerator.getUUID());
		passiveComponentsService.insertSelective(p);
		return "redirect:passiveList";
	}
	
	@RequestMapping("1019/zai/xin/jian/uppassive")
	public String uppassive(Model model,HttpSession session,String pid){
		if(session.getAttribute("user")==null){
			return "Adminlogin";
		}
		PassiveComponents passive=passiveComponentsService.queryByid(pid);
		model.addAttribute("passive", passive);
		model.addAttribute("uppassice", "uppassice");
		return "adminHome";
	}
	
	@RequestMapping("1019/zai/xin/jian/updatepassiveS")
	public String updatepassiveS(PassiveComponents p,Model model,HttpSession session){
		if(session.getAttribute("user")==null){
			return "Adminlogin";
		}
		passiveComponentsService.updateByPrimaryKeySelective(p);
		return "redirect:passiveList";
	}
	
	@RequestMapping("1019/zai/xin/jian/deletePassiveComponents")
	public String deleteByPrimaryKey(String pid,Model model,HttpSession session){
		if(session.getAttribute("user")==null){
			return "Adminlogin";
		}
		passiveComponentsService.deleteByPrimaryKey(pid);
		return "redirect:passiveList";
	}
	
	@RequestMapping("1019/zai/xin/jian/seleTotalcid")
	@ResponseBody
	public int seleTotalcid(Integer cid){
		int i=passiveComponentsService.getCidTotal(cid);
		i+=1;
		return i;
	}
	
	@RequestMapping("1019/zai/xin/jian/selectByCidandSidTotal")
	@ResponseBody
	public int selectByCidandSidTotal(int cid,int sid){
		List<PassiveComponents> PassiveComponents=passiveComponentsService.selectByCidandSid(cid, sid);
		int i=PassiveComponents.size();
		i+=1;
		return i;
	}
	
}
