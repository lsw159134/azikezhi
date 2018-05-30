package com.zikezhi.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zikezhi.entity.Primary;
import com.zikezhi.service.PrimaryService;

@Controller
public class moreSortController {
	@Resource(name = "primaryService")
	private PrimaryService primaryService;
	
	@RequestMapping("moreSort")
	public String moreSort(Model model,HttpSession session){
		List<Primary> primaryList = primaryService.moreSort();
		model.addAttribute("primaryList", primaryList);
		
		String uid = (String)session.getAttribute("uid");
		if(uid == null || uid == ""){
			session.setAttribute("url", "moreSort");
		}
		
		return "sortProduct/moreSort";
	}
}
