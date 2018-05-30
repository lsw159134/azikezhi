package com.zikezhi.controller;

import java.text.ParseException;
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

import com.zikezhi.entity.Printrecord;
import com.zikezhi.service.PrintrecordService;
import com.zikezhi.utils.PageBean;

/**
 * 打印记录
 * @author lenovo
 *
 */
@Controller
public class PrintrecordController {

	@Resource(name = "printrecordService")
	private PrintrecordService printrecordService;
	
	
	@RequestMapping(value = "1019/zai/xin/jian/kuaididayinjilv")
	public String kuaididayinjilv(Printrecord p,Model model, HttpSession session) {
		Printrecord printrecord=printrecordService.queryByeid(p.getPrintrecord_eid());
		if(printrecord==null){
			p.setPrintrecord_time(new Date());
			printrecordService.insertSelective(p);
		}else{
			printrecord.setPrintrecord_time(new Date());
			printrecordService.updateByPrimaryKeySelective(printrecord);
		}
		return "redirect:/1019/zai/xin/jian/cont";
	}
	
	@RequestMapping( value="1019/zai/xin/jian/printrecordAll")
	public String adminExpress(Printrecord p,@RequestParam(required = false) String page,@RequestParam(required = false) String rows,HttpSession session, Model model) throws ParseException {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		PageBean pageBean;
		if(page == null && rows == null){
			pageBean=new PageBean(1,100);
		}else{
			pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		}
		Map<String, Object> map = new HashMap<String,Object>();
		if(p.getPrintrecord_kuaidi()!=null && !p.getPrintrecord_kuaidi().equals("")){
			map.put("printrecord_kuaidi", "%"+p.getPrintrecord_time()+"%");
		}
		if(p.getPrintrecord_time()!=null && !p.getPrintrecord_time().equals("")){
			map.put("printrecord_time", "%"+p.getPrintrecord_time()+"%");
		}
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Printrecord> printrecordList = printrecordService.queryAll(map);
		long total=printrecordService.getTotal(map);
		model.addAttribute("total", total);
		pageBean.setTotal(Integer.parseInt(String.valueOf(total)));
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page", pageBean.getPage());
		model.addAttribute("pageSize", pageBean.getPageSize());
		model.addAttribute("printrecordList", printrecordList);
		model.addAttribute("printrecordAll", "printrecordAll");
		return "adminHome";
	}
	
}
