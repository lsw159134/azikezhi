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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zikezhi.entity.Discount;
import com.zikezhi.entity.Product;
import com.zikezhi.entity.SjZhuCe;
import com.zikezhi.service.DiscountService;
import com.zikezhi.service.ProductService;
import com.zikezhi.service.SjZhuCeService;
import com.zikezhi.utils.MD5Generator;
import com.zikezhi.utils.PageBean;
import com.zikezhi.utils.UIDGenerator;

@Controller
public class SjXinXiController {
	
	@Resource(name = "productService")
	private ProductService productService;
	
	@Resource(name = "sjZhuCeService")
	private SjZhuCeService sjZhuCeService;
	
	@Resource(name = "discountService")
	private DiscountService discountService;
	
	
	//商家注册   后台审核
	@RequestMapping(value = "sjZhuCe", method = RequestMethod.POST)
	public String SjZhuCe(SjZhuCe sc){
		sc.setId(UIDGenerator.getUUID());
		sc.setPassWord(MD5Generator.getMD5(sc.getPassWord()));
		sjZhuCeService.insert(sc);
		//sjZhuCeService.insert(sc);
		return "mclogin" ;
	}
	
	//测试验证码
	/*处理请求的时候 如果要提交请求类型就要加上value： value = "testYzm", method = RequestMethod.POST
	 * 接受页面传来的值：@RequestParam(required = true) String verify
	 * 
	 */
	@RequestMapping(value = "testYzm", method = RequestMethod.POST)
	@ResponseBody
	public boolean testYzm( @RequestParam(required = true) String verify, HttpSession session){
		String code = (String) session.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		if(!code.equalsIgnoreCase(verify)){
			return false;
		}
		return true ;
	}
	
	@RequestMapping(value = "testCompany", method = RequestMethod.POST)
	@ResponseBody
	public boolean testCompany(@RequestParam(required = true) String comPany){
		int count = sjZhuCeService.testCompany(comPany);
		if(count == 0){
			return false;
		}
		return true;
	}
	
	@RequestMapping(value = "testTel", method = RequestMethod.POST)
	@ResponseBody
	public boolean testTel(@RequestParam(required = true) String tel){
		int count = sjZhuCeService.testTel(tel);
		if(count == 0){
			return false;
		}
		return true;
	}
	
	@RequestMapping(value = "testUserName", method = RequestMethod.POST)
	@ResponseBody
	public boolean testUserName(@RequestParam(required = true) String userName){
		int count = sjZhuCeService.testUserName(userName);
		if(count == 0){
			return false;
		}
		return true;
	}
	
	//跳转到添加商品页面
	@RequestMapping("tianJiaSp")
	public String tianJiaSp(Model model) {
		model.addAttribute("sj_addcp", 1);
		return "sj/sj_index";
	}
	
/*	//跳转到添加商品页面
	@RequestMapping("sjIndex")
	public String SjIndex() {
		return "sj/sjIndex";
	}*/
	
	//跳转到添加商品页面
	@RequestMapping("sj_ziliao")
	public String sj_ziliao(Model model) {
		model.addAttribute("sj_ziliao", 1);
		return "sj/sj_index";
	}
		
	//跳转到添加商品页面
	@RequestMapping("sjIndex")
	public String sj_Index() {
		return "sj/sj_index";
	}
//	
//	//跳转到添加商品页面
//		@RequestMapping("zz")
//		public String zz() {
//			return "testSearch";
//		}
//	
	

	//商家登录验证	
	@RequestMapping(value = "sjLogin", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sjLogin(SjZhuCe sj,HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		//将用户数据从数据库中查询
			
			SjZhuCe sjLogin = sjZhuCeService.sjLogin(sj);
		
			if (sjLogin == null) {
				map.put("msg", "用户或密码错误");
				map.put("result", "fail");
			}else{
				//将数据库中的用户密码和用户输入的用户密码相比较，查看是否相等
				String sb = MD5Generator.getMD5(sj.getPassWord());
				//判断商家是否审核
				if(!sjLogin.getPassWord().equals(sb)){
					map.put("msg", "用户或密码错误 ");
					map.put("result", "fail");
				}else{
					map.put("msg", "登录成功 ");
					map.put("result", "success");
					if(session.getAttribute("sj_id") == null && session.getAttribute("sjLogin") == null){
						session.setAttribute("sj_id", sjLogin.getId());
						session.setAttribute("sjLogin", sjLogin);
					}
				}
			}
		return map;
	}
	
	@RequestMapping(value = "updateSjIndex", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateSjIndex(@RequestParam(required = false) String biaozi,SjZhuCe sj,HttpSession session){	
		Map<String, Object> map = new HashMap<String, Object>();				
		sj.setId((String)session.getAttribute("sj_id"));
		
		if(biaozi!=null){
			String newPsd = sj.getPassWord();
			sj.setPassWord(MD5Generator.getMD5(newPsd));
		}
		int a = sjZhuCeService.updateSjById(sj);
		
		if(a == 1){			
			map.put("msg", "更新成功");
			SjZhuCe sjLogin = sjZhuCeService.backSjIndex(sj);
			session.setAttribute("sjLogin", sjLogin);
		}else{
			map.put("msg", "更新失败");
		}
		
		return map;
	}
	
	@RequestMapping(value = "1019/zai/xin/jian/shenHe")
	public String sj_ShenHe(HttpSession session,Model model){		
		List<SjZhuCe> sjShenHe = sjZhuCeService.sj_ShenHe();
		model.addAttribute("sjShenHe", sjShenHe);
		model.addAttribute("supplier", "supplier");
		return "adminHome";
	}
	
	@RequestMapping(value = "1019/zai/xin/jian/shiroShenHe", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> shiroShenHe(SjZhuCe sj){	
		Map<String, Object> map = new HashMap<String, Object>();
		
		int a = sjZhuCeService.shiroShenHe(sj);		
		if(a == 1){	
			map.put("result","success");
			map.put("msg", "审核成功");
		}
		return map;
	}
		
//	@RequestMapping(value = "addNewProduct", method = RequestMethod.POST)
//		productService.addNewProduct(product);
//		public String AddNewProduct(Product product){
//		product.setProductuuid(UIDGenerator.getUUID());
//		return "sj/sjIndex" ;
//	}
	
	@RequestMapping(value = "addNewProduct", method = RequestMethod.POST)
	public String AddNewProduct(Product product,Discount discount,HttpSession session,
												@RequestParam(required = true) String min1,
												@RequestParam(required = true) String max1,
												@RequestParam(required = true) String min2,
												@RequestParam(required = true) String max2,
												@RequestParam(required = true) String min3,
												@RequestParam(required = true) Float price1,
												@RequestParam(required = true) Float price2,
												@RequestParam(required = true) Float price3,
												@RequestParam(required = true) String discount_unit){
		if(session.getAttribute("sj_id") == null){
			return "redirect:/merchantLogin";
		}
		product.setProductuuid(UIDGenerator.getUUID());
		String pid = product.getProductuuid();
		if(min1!=null &&min1!=""){
			discount.setDiscount_unit(discount_unit);
			discount.setDiscount_pid(pid);
			discount.setDiscount_id(UIDGenerator.getUUID());
			discount.setDiscount_status("1");
			discount.setDiscount_date(new Date());
			discount.setDiscount_numbermax(Integer.parseInt(max1));
			discount.setDiscount_numbermin(Integer.parseInt(min1));
			discount.setDiscount_price(price1);
			discountService.insertSelective(discount);
		}
		if(min2!=null &&min2!=""){
			discount.setDiscount_unit(discount_unit);
			discount.setDiscount_pid(pid);
			discount.setDiscount_id(UIDGenerator.getUUID());
			discount.setDiscount_status("2");
			discount.setDiscount_date(new Date());
			discount.setDiscount_numbermax(Integer.parseInt(max2));
			discount.setDiscount_numbermin(Integer.parseInt(min2));
			discount.setDiscount_price(price2);
			discountService.insertSelective(discount);
		}if(min3!=null &&min3!=""){
			discount.setDiscount_unit(discount_unit);
			discount.setDiscount_pid(pid);
			discount.setDiscount_id(UIDGenerator.getUUID());
			discount.setDiscount_status("3");
			discount.setDiscount_date(new Date());
			discount.setDiscount_numbermax(0);
			discount.setDiscount_numbermin(Integer.parseInt(min3));
			discount.setDiscount_price(price3);
			discountService.insertSelective(discount);
		}
		productService.addNewProduct(product);
		return "redirect:/sj_searchProduct" ;
	}
	
	@RequestMapping(value = "sj_searchProduct")
	public String sj_searchProduct(@RequestParam(required = false) String page,@RequestParam(required = false) String rows,Product product,Model model,HttpSession session){
		
		if(session.getAttribute("sj_id") == null){
			return "redirect:/merchantLogin";
		}
		
		model.addAttribute("sj_searchcp", 1);
		
		product.setSupplieruuid((String)session.getAttribute("sj_id"));
		
		PageBean pageBean;
		if(page == null && rows == null){
			pageBean=new PageBean(1,10);
		}else{
			pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		}
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("supplieruuid",product.getSupplieruuid());
		map.put("product",product.getProduct());
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Product> sj_product = productService.sj_searchProduct(map);
		long total=productService.getTotalBySj(map);
		model.addAttribute("total", total);
		pageBean.setTotal(Integer.parseInt(String.valueOf(total)));
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page",pageBean.getPage());
		model.addAttribute("pageSize",pageBean.getPageSize());
		model.addAttribute("sj_product", sj_product);
		return "sj/sj_index" ;
	}
	
	@RequestMapping(value = "supplier_deleCp")
	public String sj_deleCP(@RequestParam(required = true) String productuuid,HttpSession session){	
		if(session.getAttribute("sj_id") == null){
			return "redirect:/merchantLogin";
		}
		
		productService.sj_deleCP(productuuid);
		return "redirect:/sj_searchProduct";
	}
	
	@RequestMapping(value = "supplier_searchCP")
	public String supplier_searchCP(@RequestParam(required = false) String page,@RequestParam(required = false) String rows,Product product,Model model,HttpSession session){
		if(session.getAttribute("sj_id") == null){
			return "redirect:/merchantLogin";
		}
		
		model.addAttribute("supplier_searchCP", 1);
		Product sj_product = productService.supplier_searchCP(product);
		model.addAttribute("sj_product", sj_product);
		return "sj/sj_index" ;
	}
	
	@RequestMapping(value = "supplier_updateCp", method = RequestMethod.POST)
	public String supplier_updateCp(Product product,Discount discount,HttpSession session,
												@RequestParam(required = false)String d_id3,
												@RequestParam(required = false)String d_id2,
												@RequestParam(required = false)String d_id1,
												@RequestParam(required = true) String min1,
												@RequestParam(required = true) String max1,
												@RequestParam(required = true) String min2,
												@RequestParam(required = true) String max2,
												@RequestParam(required = true) String min3,
												@RequestParam(required = true) Float price1,
												@RequestParam(required = true) Float price2,
												@RequestParam(required = true) Float price3,
												@RequestParam(required = true) String discount_unit){
		if(session.getAttribute("sj_id") == null){
			return "redirect:/merchantLogin";
		}
		
		if(d_id1!=null &&d_id1!=""){
			discount.setDiscount_id(d_id1);
			discount.setDiscount_unit(discount_unit);
			discount.setDiscount_status("1");
			discount.setDiscount_numbermax(Integer.parseInt(max1));
			discount.setDiscount_numbermin(Integer.parseInt(min1));
			discount.setDiscount_price(price1);
			discountService.updateByPrimaryKeySelective(discount);
		}
		if(d_id2!=null &&d_id2!=""){
			discount.setDiscount_id(d_id2);
			discount.setDiscount_unit(discount_unit);
			discount.setDiscount_status("2");
			discount.setDiscount_numbermax(Integer.parseInt(max2));
			discount.setDiscount_numbermin(Integer.parseInt(min2));
			discount.setDiscount_price(price2);
			discountService.updateByPrimaryKeySelective(discount);
		}if(d_id3!=null &&d_id3!=""){
			discount.setDiscount_id(d_id3);
			discount.setDiscount_unit(discount_unit);
			discount.setDiscount_status("3");
			discount.setDiscount_numbermax(0);
			discount.setDiscount_numbermin(Integer.parseInt(min3));
			discount.setDiscount_price(price3);
			discountService.updateByPrimaryKeySelective(discount);
		}
		product.setUptime(new Date());
		productService.supplier_updateCp(product);
		return "redirect:/sj_searchProduct" ;
	}
		
}
