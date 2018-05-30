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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zikezhi.entity.AdminZaiXinJian;
import com.zikezhi.entity.Express;
import com.zikezhi.entity.Page;
import com.zikezhi.entity.Product;
import com.zikezhi.entity.QueryResistanceVo;
import com.zikezhi.entity.Resistance;
import com.zikezhi.entity.ResistanceResult;
import com.zikezhi.entity.UserInfo;
import com.zikezhi.service.ExpressService;
import com.zikezhi.service.ProductService;
import com.zikezhi.service.ResistanceZoneService;
import com.zikezhi.service.UserInfoService;
import com.zikezhi.utils.PageBean;
import com.zikezhi.utils.UIDGenerator;

/**
 * 
 * 
 * @version 1.0
 * @Description: 电阻专区
 * 
 * @ClassName resistanceZone.java
 * 
 */

@Controller
public class ResistanceZoneController {
	@Resource(name = "resistanceZoneService")
	private ResistanceZoneService resistanceZoneService;

	@Resource(name = "expressService")
	private ExpressService expressService;
	
	@Resource(name = "userInfoService")
	private UserInfoService userInfoService;
	
	@Resource(name = "productService")
	private ProductService productService;

	@RequestMapping("resistanceZone")
	public String zaixiangouProduct1(Model model, Integer page, HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		if (page == null) {
			page = 1;
		}
		Page pageEntity = new Page(page, 10);
		map.put("start", pageEntity.getStart());
		map.put("size", pageEntity.getPageSize());
		List<Product> queryResistice = resistanceZoneService.queryResisticeList(map);
		model.addAttribute("Resistincelist", queryResistice);
		return "resistanceZone";
	}

	@RequestMapping("listResistance")
	@ResponseBody
	public Map<String, Object> listResistance(Model model, Integer page, HttpSession session, Resistance resistance) {

		Map<String, Object> map = new HashMap<>();
		if (page == null) {
			page = 1;
		}
		Page pageEntity = new Page(page, 50);
		map.put("start", pageEntity.getStart());
		map.put("size", pageEntity.getPageSize());
		List<ResistanceResult> list = resistanceZoneService.queryFengzhuang();
		map.put("list", list);
		if (list.size() > 0) {
			map.put("result", "success");
		}
		return map;
	}

	@RequestMapping("queryZhuZhi")
	@ResponseBody
	public Map<String, Object> queryZhuZhi(Model model, Integer page, HttpSession session, String encapsulation) {

		Map<String, Object> map = new HashMap<>();
		if (page == null) {
			page = 1;
		}
		Page pageEntity = new Page(page, 50);
		map.put("start", pageEntity.getStart());
		map.put("size", pageEntity.getPageSize());
		/*encapsulation.replace("%", "");*/
		List<ResistanceResult> list = resistanceZoneService.queryZhuZhi(encapsulation);
		map.put("list", list);
		if (list.size() > 0) {
			map.put("result", "success");
		}
		return map;
	}

	@RequestMapping("queryZhuZhiByCanshu")
	@ResponseBody
	public Map<String, Object> queryZhuZhiByCanshu(Model model, Integer page, HttpSession session,
			QueryResistanceVo queryVo) {

		Map<String, Object> map = new HashMap<>();
		if (page == null) {
			page = 1;
		}
		Page pageEntity = new Page(page, 50);
		map.put("start", pageEntity.getStart());
		map.put("size", pageEntity.getPageSize());
		List<ResistanceResult> list = resistanceZoneService.queryZhuZhiByCanshu(queryVo);
		map.put("list", list);
		if (list.size() > 0) {
			map.put("result", "success");
		}
		return map;
	}

	@RequestMapping("queryjqd")
	@ResponseBody
	public Map<String, Object> queryGonglv(Model model, Integer page, HttpSession session, QueryResistanceVo queryVo) {

		Map<String, Object> map = new HashMap<>();
		if (page == null) {
			page = 1;
		}
		Page pageEntity = new Page(page, 50);
		map.put("start", pageEntity.getStart());
		map.put("size", pageEntity.getPageSize());
		List<ResistanceResult> list = resistanceZoneService.queryGonglv(queryVo);
		map.put("list", list);
		if (list.size() > 0) {
			map.put("result", "success");
		}
		return map;
	}

	@RequestMapping("queryPinpai")
	@ResponseBody
	public Map<String, Object> queryPinpai(@RequestParam(required = false) String encapsulation,
			@RequestParam(required = false) String zhuzhi, @RequestParam(required = false) String jingquedu,
			Model model, Integer page, HttpSession session) {

		Map<String, Object> map = new HashMap<>();
		if (page == null) {
			page = 1; 
		}
		Page pageEntity = new Page(page, 50);
		map.put("start", pageEntity.getStart());
		map.put("size", pageEntity.getPageSize());
	
		List<ResistanceResult> list = resistanceZoneService.queryPinpai(encapsulation, zhuzhi, jingquedu);
		map.put("list", list);
		if (list.size() > 0) {
			map.put("result", "success");
		}
		return map;
	}

	
	@RequestMapping("queryBaozhuang")
	@ResponseBody
	public Map<String, Object> queryBaozhuang(@RequestParam(required = false) String encapsulation,
			@RequestParam(required = false) String zhuzhi, @RequestParam(required = false) String jingquedu,@RequestParam(required = false) String manufacturer,
			Model model, Integer page, HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		List<ResistanceResult> list = resistanceZoneService.queryBaozhuang(encapsulation, zhuzhi, jingquedu,manufacturer);
		if (list.size() > 0) {
			map.put("result", "success");
		}
		map.put("list", list);
		return map;
	}
	@RequestMapping("queryResistanceList")
	@ResponseBody
	public Map<String, Object> queryResistanceList(Model model, Integer page, HttpSession session,
			QueryResistanceVo queryVo) {
		Map<String, Object> map = new HashMap<>();
		if (page == null) {
			page = 1;
		}
		Page pageEntity = new Page(page, 50);
		queryVo.setStart(pageEntity.getStart());
		queryVo.setSize(pageEntity.getPageSize());
		List<ResistanceResult> list = resistanceZoneService.queryResistanceList(queryVo);
		map.put("list", list);
		if (list.size() > 0) {
			map.put("result", "success");
		}
	/*	int pageCount = resistanceZoneService.getTotal();
		int pageSize = (int) Math.ceil(pageCount / 50.0);
		if (pageSize == 0) {
			map.put("result", "fail");
		}
		model.addAttribute("currentPage", page);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("page", page);*/
		return map;
	}
	// 后台增删改查
	@RequestMapping(value = "1019/zai/xin/jian/queryResistinceList")
	public String productList(Product p, @RequestParam(required = false) String page,
			@RequestParam(required = false) String rows, Model model, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		// 每一页输出的数据条数，并将值放到map中
		Map<String, Object> map = new HashMap<String, Object>();
		PageBean pageBean;
		if (page == null && rows == null) {
			pageBean = new PageBean(1, 30);
		} else {
			pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		}
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		if (p.getProduct() != null && !p.getProduct().equals("")) {
			map.put("product", p.getProduct());
		}
		if (p.getManufacturer() != null && !p.getManufacturer().equals("")) {
			map.put("manufacturer", p.getManufacturer());
		}
		if (p.getEncapsulation() != null && !p.getEncapsulation().equals("")) {
			map.put("encapsulation", p.getEncapsulation());
		}
		// map.put("tableName", null);
		// 将所有的产品取出来
		List<Product> product = resistanceZoneService.queryResistice(map);
		// 得到在数据库中数据的条数,并分页
		long total = resistanceZoneService.getTotalAll(map);
		model.addAttribute("total", total);
		pageBean.setTotal(Integer.parseInt(String.valueOf(total)));
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page", pageBean.getPage());
		model.addAttribute("pageSize", pageBean.getPageSize());
		model.addAttribute("product", product);
		model.addAttribute("p", p);
		model.addAttribute("dianzu", "dianzu");
		return "adminHome";
	}

	@RequestMapping(value = "1019/zai/xin/jian/addResistince")
	public String addProduct(HttpSession session, Model model) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		model.addAttribute("addDianzu", "addDianzu");
		return "adminHome";
	}

	@RequestMapping(value = "1019/zai/xin/jian/addDianzu", method = RequestMethod.POST)
	public String adddianzu(Model model,Product product,HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		AdminZaiXinJian admin = (AdminZaiXinJian) session.getAttribute("user");
		product.setProductuuid(UIDGenerator.getUUID());
		product.setSupplieruuid("ba9e7715b5524920844a570f091b1d15");
		product.setSupplier("深圳市进化式科技经营部");
		product.setP_data(admin.getAdmin_adminName());
		product.setProductName("贴片电阻");
		product.setQuality(8);
		resistanceZoneService.insertResistance(product);
		return "redirect:/1019/zai/xin/jian/queryResistinceList";
	}
	
	@RequestMapping(value = "1019/zai/xin/jian/updateDianzu")
	public String updateProduct(Model model, final String uid,String result, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		// 将所有的产品取出来
		Product product = resistanceZoneService.selectByPrimaryKey(uid);
		if(result!=null && result !=""){
			model.addAttribute("result", result);
		}
	
		model.addAttribute("product", product);
		model.addAttribute("updateDianzu", "updateDianzu");
		return "adminHome";
	}
	
	@RequestMapping(value = "1019/zai/xin/jian/updateDianzuByPrimaryKey")
	public String updateByPrimaryKeySelective(HttpSession session,Product product){
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		product.setUptime(new Date());
		resistanceZoneService.updateDianzu(product);

		return "redirect:/1019/zai/xin/jian/queryResistinceList";
	}
	@RequestMapping(value = "1019/zai/xin/jian/deleteDianzu")
	public String deleteProduct(Model model, String productuuid, HttpSession session) {
		AdminZaiXinJian admin=(AdminZaiXinJian) session.getAttribute("user");
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		if(admin.getAdmin_jurisdiction().equals("1") || (admin.getAdmin_shrio()!=null && admin.getAdmin_shrio().indexOf("o")!=-1)){
			productService.daleteProduct(productuuid);
			return "redirect:/1019/zai/xin/jian/queryResistinceList";
		}else{
			return "redirect:cont";
		}
	}
	
	@RequestMapping(value = "1019/zai/xin/jian/seleDianzu")
	public String seleQuality(Product p, @RequestParam(required = false) String isgoodsinstock,
			@RequestParam(required = false) String kongzhi, @RequestParam(required = false) String manufacturer,
			@RequestParam(required = false) String productQuality, @RequestParam(required = false) String page,
			@RequestParam(required = false) String rows, Model model, HttpSession session) {

		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		// 每一页输出的数据条数，并将值放到map中
		Map<String, Object> map = new HashMap<String, Object>();
		if (isgoodsinstock != null && isgoodsinstock != "") {
			map.put("isgoodsinstock", isgoodsinstock);
			model.addAttribute("kucun", isgoodsinstock);
		}
		PageBean pageBean;
		if (page == null && rows == null) {
			pageBean = new PageBean(1, 30);
		} else {
			pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		}
		if (kongzhi != null) {
			session.removeAttribute("manufacturer");
			session.removeAttribute("productQuality");
		} else {
			String sessionManufacturer = (String) session.getAttribute("manufacturer");
			String sessionProduct = (String) session.getAttribute("productQuality");

			if (manufacturer != null) {
				map.put("manufacturer", manufacturer);
				session.setAttribute("manufacturer", manufacturer);
			} else {
				if (sessionManufacturer != null) {
					map.put("manufacturer", sessionManufacturer);
				}
			}
			if (productQuality != null) {
				map.put("product", productQuality);
				session.setAttribute("productQuality", productQuality);
			} else {
				if (sessionProduct != null) {
					map.put("product", sessionProduct);
				}
			}
		}

		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		// 将所有的产品取出来
		List<Product> product = resistanceZoneService.queryDianzuList(map);
		/*
		 * if (product == null || product.size() == 0) { return "redirect:/404";
		 * }
		 */
		// 得到在数据库中数据的条数,并分页
		long total = resistanceZoneService.getTotalAll(map);
		model.addAttribute("total", total);
		pageBean.setTotal(Integer.parseInt(String.valueOf(total)));
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page", pageBean.getPage());
		model.addAttribute("pageSize", pageBean.getPageSize());
		model.addAttribute("product", product);
		model.addAttribute("p", p);
		model.addAttribute("seleDianzu", "seleDianzu");
		return "adminHome";
	}
	
	
	@RequestMapping(name="beidongExpress")
	public String beidongExpress(@RequestParam(required = false) String page,@RequestParam(required = false) String rows,HttpSession session, Model model,HttpServletRequest req){
		String userUid = (String)session.getAttribute("uid");
		UserInfo user = userInfoService.selectByPrimaryKey(userUid);
		PageBean pageBean;
		if(page == null && rows == null){
			pageBean=new PageBean(1,10);
		}else{
			pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		}
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("useruid",userUid);
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Express> expressList = expressService.selectBeiDongByUseruid(map);
		long total=expressService.getTotal(map);
		req.setAttribute("total", total);
		pageBean.setTotal(Integer.parseInt(String.valueOf(total)));
		req.setAttribute("count", pageBean.getCount());
		req.setAttribute("page",pageBean.getPage());
		req.setAttribute("pageSize",pageBean.getPageSize());
		model.addAttribute("express", expressList);
		model.addAttribute("user", user);
		List<Express> list = expressService.queryzdCountNoPay(userUid);
		if(list.size()>0){
			model.addAttribute("zdCountNoPay", list.size());
		}
		List<Express> list1 = expressService.querybdCountNoPay(userUid);
		if(list1.size()>0){
		   model.addAttribute("bdCountNoPay", list1.size());
		}
		req.setAttribute("expressList", expressList);
		req.setAttribute("biaozi", 1);
		return "user/user-beidongExpress";
	}
	
	
	
}
