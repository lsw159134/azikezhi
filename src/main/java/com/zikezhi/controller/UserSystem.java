package com.zikezhi.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.zikezhi.entity.BiaoQian;
import com.zikezhi.entity.Cart;
import com.zikezhi.entity.Discount;
import com.zikezhi.entity.Express;
import com.zikezhi.entity.OrderItme;
import com.zikezhi.entity.Product;
import com.zikezhi.entity.Supplier;
import com.zikezhi.entity.Uaddress;
import com.zikezhi.entity.UserInfo;
import com.zikezhi.service.BiaoQianService;
import com.zikezhi.service.BomOrderService;
import com.zikezhi.service.CartService;
import com.zikezhi.service.ExpressService;
import com.zikezhi.service.OrderItmeService;
import com.zikezhi.service.ProductService;
import com.zikezhi.service.SupplierService;
import com.zikezhi.service.UaddressService;
import com.zikezhi.service.UserInfoService;
import com.zikezhi.service.WithdrawALService;
import com.zikezhi.utils.Alipay;
import com.zikezhi.utils.AlipayConfig;
import com.zikezhi.utils.PageBean;
import com.zikezhi.utils.PersonalIdUrils;
import com.zikezhi.utils.UIDGenerator;
/**
 * 用户系统订单（其他）
 * @author lenovo
 *
 */
@Controller
public class UserSystem {

	@Resource(name = "userInfoService")
	private UserInfoService userInfoService;

	@Resource(name = "supplierService")
	private SupplierService supplierService;

	@Resource(name = "productService")
	private ProductService productService;

	@Resource(name = "expressService")
	private ExpressService expressService;
	
	@Resource(name = "OrderItmeService")
	private OrderItmeService orderItmeService;
	
	@Resource(name = "uaddressService")
	private UaddressService uaddressService;
	
	@Resource(name = "withdrawALService")
	private WithdrawALService withdrawALService;
	
	@Resource(name = "cartService")
	private CartService cartService;
	
	@Resource(name="bomOrderService")
	private BomOrderService bomOrderService;
	
	@Resource(name="biaoQianService")
	private BiaoQianService biaoqianService;
	
	@RequestMapping("supplier-upload")
	public String supplierupload(){
		return "user/supplier-upload";
	}
	
	@RequestMapping("supplier-update")
	public String supplierupdate(HttpSession session, Model model){
		String supplierUid = (String)session.getAttribute("supplieruid");
		Supplier supplier = supplierService.selectByPrimaryKey(supplierUid);
		model.addAttribute("supplier", supplier);
		return "user/supplier-update";
	}

	/**
	 * 
	 *我的订单查看
	 * @return
	 */
	@RequestMapping("express")
	public String express(@RequestParam(required = false) String page,@RequestParam(required = false) String rows,HttpSession session, Model model,HttpServletRequest req){
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
		List<Express> expressList = expressService.selectByUseruid(map);
		long total=expressService.getTotal(map);
		req.setAttribute("total", total);
		pageBean.setTotal(Integer.parseInt(String.valueOf(total)));
		req.setAttribute("count", pageBean.getCount());
		req.setAttribute("page",pageBean.getPage());
		req.setAttribute("pageSize",pageBean.getPageSize());
		model.addAttribute("express", expressList);
		model.addAttribute("user", user);
		List<Express> list4 = expressService.queryzdCountNoPay(userUid);
		if(list4.size()>0){
			model.addAttribute("zdCountNoPay", list4.size());
		}
		List<Express> list3 = expressService.querybdCountNoPay(userUid);
		if(list3.size()>0){
		   model.addAttribute("bdCountNoPay", list3.size());
		}
		req.setAttribute("expressList", expressList);
		req.setAttribute("biaozi", 1);
		
		return "user/user-express";
	}
	
	/**
	 * 查看订单详情（用户）
	 * @return
	 */
	@RequestMapping("expressA")
	public String expressA(@RequestParam(required = false) String eid,HttpSession session, Model model,HttpServletRequest req){
		Express expressList = expressService.queryById(eid);
		if(expressList.getProductuid()==null){
			List<OrderItme> order=orderItmeService.queryByEid(eid);
			model.addAttribute("order", order);
		}else if(expressList.getProductuid() != null){
			Product product = productService.findByPid(expressList.getProductuid());
			model.addAttribute("product", product);
		}
		model.addAttribute("express", expressList);
		model.addAttribute("eid", eid);
		return "user/user-details";
	}
	//判断那个是被动订单
	/*@RequestMapping("product-upload")
	public String productupload(HttpSession session, Model model){
		String userUid = (String)session.getAttribute("uid");
		UserInfo user = userInfoService.selectByPrimaryKey(userUid);
		model.addAttribute("user", user);
		return "user/product-upload";
	}
	
	@RequestMapping("product-history")
	public String producthistory(Model model, HttpSession session,Integer page){
		Map<String, Object> map = new HashMap<String, Object>();
		String supplierUid = (String)session.getAttribute("supplieruid");
		map.put("start", 0);
		map.put("size", 10000);
		map.put("supplieruuid", supplierUid);
		List<Product> product = productService.selectBySupplierUUid(map);
		model.addAttribute("product", product);
		return "user/product-history";
	}*/

	/*@RequestMapping(value ="productUpdate", method = RequestMethod.GET)
	public String productUpdate(String productuid, Model model){
		Product product = productService.selectByPrimaryKey(productuid);
		model.addAttribute("product", product);
		return "user/product-update";
	}

	@RequestMapping(value = "productUpdate", method = RequestMethod.POST)
	public String productUp(Product product, Model model) {
		int i = productService.updateByPrimaryKeySelective(product);
		if (i == 0) {
			model.addAttribute("msg", "修改失败!");
			model.addAttribute("path", "product-history");
			return "user/msg";
		}
		model.addAttribute("msg", "修改成功!");
		model.addAttribute("path", "product-history");
		return "user/msg";
	}

	@RequestMapping("user-tips")
	public String userTips(){
		return "user/user-tips";
	}

	@RequestMapping("coming-soon")
	public String comingSoon(){
		return "user/comingSoon";
	}

	@ResponseBody
	@RequestMapping(value = "updatealipay", method = RequestMethod.POST)
	public String updatealipay(@RequestParam(required = true) String alipay, HttpSession session){

		Map<String, String> map = new HashMap<>();
		map.put("alipay", alipay);
		map.put("uid", (String)session.getAttribute("uid"));
		int i = userInfoService.updateByalipay(map);
		String msg = "";
		if(i == 1){
			msg = "添加成功";
			return msg;
		}
		msg = "添加失败";
		return msg;
	}*/

	/*@ResponseBody
	@RequestMapping(value = "updateexpressaddress", method = RequestMethod.POST)
	public String updateExpressAddress(@RequestParam(required = true)String expressaddress, HttpSession session){
		Map<String, String> map = new HashMap<>();
		map.put("uid", (String)session.getAttribute("uid"));
		map.put("expressaddress", expressaddress);
		int i = userInfoService.updateExpressAddress(map);
		String msg = "";
		if(i == 1){
			msg = "修改成功";
			return msg;
		}select s.*,p.* from
   			(select * from(select * from express where useruid=#{useruid, jdbcType=VARCHAR} ORDER BY edate desc limit #{start},#{size})e LEFT JOIN orderitme o on o.o_eid=e.express )s LEFT JOIN (select * from product q left join p_img i on q.productuuid = i.p_imgpid) p on s.productuid=p.productuuid or s.o_pid=p.productuuid
   			 ORDER BY s.edate desc
		msg = "修改失败";
		return msg;
	}

	@ResponseBody
	@RequestMapping(value="updaterealaddress", method = RequestMethod.POST)
	public String updateRealAddress(@RequestParam(required = true)String realaddress, HttpSession session){
		Map<String, String> map = new HashMap<>();
		map.put("uid", (String)session.getAttribute("uid"));
		map.put("realaddress", realaddress);
		int i = userInfoService.updateRealAddress(map);
		String msg = "";
		if(i == 1){
			msg = "修改成功";
			return msg;
		}
		msg = "修改失败";
		return msg;
	}

	@ResponseBody
	@RequestMapping(value="updaterealtelphone", method = RequestMethod.POST)
	public String updateRealTelphone(@RequestParam(required = true)String realtelphone, HttpSession session){
		Map<String, String> map = new HashMap<>();
		map.put("uid", (String)session.getAttribute("uid"));
		map.put("realtelphone", realtelphone);
		int i = userInfoService.updateRealTelphone(map);
		String msg = "";
		if(i == 1){
			msg = "修改成功";
			return msg;
		}
		msg = "修改失败";
		return msg;
	}
	
	@ResponseBody
	@RequestMapping(value="updaterealname", method = RequestMethod.POST)
	public String updateRealName(@RequestParam(required = true)String realname, HttpSession session){
		Map<String, String> map = new HashMap<>();
		map.put("uid", (String)session.getAttribute("uid"));
		map.put("realname", realname);
		int i = userInfoService.updateRealName(map);
		String msg = "";
		if(i == 1){
			msg = "修改成功";
			return msg;
		}
		msg = "修改失败";
		return msg;
	}*/

	/**
	 * 立即购买下单
	 * @return
	 */
	@RequestMapping(value = "pay")
	public String pay(@RequestParam(required = false)String expressname,
			@RequestParam(required = false)String biaoqian,
			@RequestParam(required = false)String beizhu,
			@RequestParam(required = false)String number, 
			@RequestParam(required = true)String productuid, 
			@RequestParam(required = false)String bdpanduan,HttpSession session, Model model,HttpServletRequest req){
		String uid = (String)session.getAttribute("uid");
		if ("".equals(uid) || uid == null) {
			return "login";
		}
		if(Integer.parseInt(number)==0){
			number="1";
		}
		String panduan = (String)session.getAttribute("panduan");
		if(panduan != null && panduan != ""){
			session.removeAttribute("panduan");
		}
		if(biaoqian==null){
			biaoqian="1";
		}else{
			if(!biaoqian.equals("2")){
				biaoqian="1";
			}
		}
		List<BiaoQian> biaoqianList = biaoqianService.queryByUid(uid);
		model.addAttribute("biaoqianList",biaoqianList);
		model.addAttribute("biaoqian",biaoqian);
		Express express = new Express();
		Product p=productService.findByPid(productuid);
		float subtotal=0;
		float yunfei=0;
		BigDecimal ss = new BigDecimal(p.getPrice()*Integer.parseInt(number));  
		Float price=ss.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
		BigDecimal a1 = new BigDecimal(price);
		subtotal= a1.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
		express.setOne(p.getPrice());
		if(expressname==null){
			expressname="1";
		}else{
			if(expressname.equals("2")){
				price=price+5;
				yunfei=5;
			}else{
				expressname="1";
			}
		}
		BigDecimal b = new BigDecimal(price); 
		price=b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
		express.setEprice(b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue());
		express.setExpress(UIDGenerator.getUUID());
		express.setProduct(p.getProduct());
		express.setExpress_package(p.getEncapsulation());
		express.setUseruid(uid);
		express.setProductuid(productuid);
		express.setExpressnumber(number);
		express.setBeizhu(beizhu);
		if("beidong".equals(bdpanduan)){
			express.setPanduan("1");
		}
		model.addAttribute("yunfei", yunfei);
		model.addAttribute("subtotal", subtotal);
		model.addAttribute("expressname", expressname);
		model.addAttribute("beizhu", beizhu);
		session.setAttribute("express", express);
		model.addAttribute("product", p);
		model.addAttribute("panduan", bdpanduan);
		return "order";
	}
	
	
	@RequestMapping(value = "tijiao")
	@ResponseBody
	public Map<String,Object> tijiao(@RequestParam(required = false)String aid,
			@RequestParam(required = false)String tijiao,
			@RequestParam(required = false)String panduan,
			@RequestParam(required = false)String beizhu,
			@RequestParam(required = false)String fapiao,
			@RequestParam(required = false)String expressname,
			@RequestParam(required = false)String number, 
			@RequestParam(required = true)String productuid,
			@RequestParam(required = false)String b_content,
			/*MultipartFile[] files,*/
	HttpSession session, Model model,HttpServletRequest req){
		String uid = (String)session.getAttribute("uid");
		Map<String,Object> map=new HashMap<String,Object>();
		if(uid == null) {
			map.put("result", "login");
			return map;
		}
		Express express = new Express();
		Product p=productService.findByPid(productuid);
		if(Integer.parseInt(p.getIsgoodsinstock())<Integer.parseInt(number)){
			map.put("result", "fail");
			return map;
		}
		BigDecimal ss = new BigDecimal(p.getPrice()*Integer.parseInt(number));  
		Float price=ss.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
		express.setOne(p.getPrice());
		if(expressname.equals("2")){
			price=price+5;
			express.setExpressname("配送");
		}else{
			express.setExpressname("自取");
		}
		BigDecimal b = new BigDecimal(price);
		price=b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
		if("1".equals(panduan)){
			express.setPanduan("1");
		}
		express.setEprice(b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue());
		express.setExpress(UIDGenerator.getUUID());
		express.setProduct(p.getProduct());
		express.setExpress_package(p.getEncapsulation());
		express.setExpress_sid(p.getSupplieruuid());
		express.setUseruid(uid);
		express.setProductuid(productuid);
		express.setExpressnumber(number);
		express.setEdate(new Date());
		express.setBeizhu(beizhu);
		express.setStatus("1");
		express.setExpress_biaoqian(b_content);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		String str=simpleDateFormat.format(date);
		int i=expressService.queryByDateCount(str+"%");
		++i;
		if(i<10){
			express.setOrdernumber(PersonalIdUrils.function(6)+0+i);
		}else{
			express.setOrdernumber(PersonalIdUrils.function(6)+i);
		}
		expressService.insertSelective(express);
		if(b_content!=null && !b_content.equals("")){
			BiaoQian bq=new BiaoQian();
			bq.setB_content(b_content);
			bq.setB_uid(uid);
			bq.setB_eid(express.getExpress());
			biaoqianService.insertSelective(bq);
		}
		map.put("result", "success");
		map.put("ordernumber", express.getOrdernumber());
		map.put("eid", express.getExpress());
		map.put("price", express.getEprice());
		return map;
	}
	
	/**
	 * 订单收货地址修改
	 * @param eid
	 * @param name
	 * @param phone
	 * @param address
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "updateAddress", method = RequestMethod.POST)
	public String updateAddress(@RequestParam(required = false)String eid,@RequestParam(required = false)String name,@RequestParam(required = false)String phone,@RequestParam(required = false)String address,HttpSession session){
		Express ex=new Express();
		ex.setExpress(eid);
		ex.setName(name);
		ex.setTelphone(phone);
		ex.setAddress(address);
		String msg = "";
		int i=expressService.updateByPrimaryKeySelective(ex);		
		if(i == 1){
			msg = "修改成功";
			return msg;
		}
		msg = "修改失败";
		return msg;
	}
	
	/**
	 * 订单状态修改
	 * @param biaozi
	 * @param express
	 * @param session
	 * @param model
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "indentdelect")
	@ResponseBody
	public Map<String, Object> IndentDelect(@RequestParam(required = true)String biaozi,@RequestParam(required = false)String zdexpress,
			@RequestParam(required = false)String bdexpress,
			HttpSession session, Model model,HttpServletRequest req){
		Map<String, Object> map = new HashMap<String,Object>();
		if(StringUtils.isNotBlank(zdexpress)){
			Express es = new Express();
			es.setExpress(zdexpress);
			es.setStatus("6");
			es.setMode("支付宝");
			expressService.upIndent(es);		
		}
		if(StringUtils.isNotBlank(bdexpress)){
			Express es1 = new Express();
			es1.setExpress(bdexpress);
			es1.setStatus("6");
			es1.setMode("支付宝");
			expressService.upIndent(es1);		
		}
		map.put("result","seccuss");
		return map;
	}
	
	
	@RequestMapping(value = "payreturn")
	public String payreturn(HttpServletRequest request,HttpServletResponse response){
	try {
		Map<String,String> params = new HashMap<String,String>();
		Map<String,String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//乱码解决，这段代码在出现乱码时使用
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名
		//——请在这里编写您的程序（以下代码仅作参考）——
		if(signVerified) {
			//商户订单号
			String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
			//支付宝交易号
			String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
			//付款金额
			String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");
			if(out_trade_no.length()>32){
				return "redirect:beidongExpress";
			}else{
				String express = expressService.selectByExpress(out_trade_no);
				if(StringUtils.isNotBlank(express)){
					return "redirect:beidongExpress";
				}
				return "redirect:express";
			}
		}else {
			System.out.println("验签失败");
			return "redirect:expressA?eid=out_trade_no";
		}
	} catch (UnsupportedEncodingException e) {
		e.printStackTrace();
	} catch (AlipayApiException e) {
		e.printStackTrace();
	}
	return "redirect:express";
	}
	
	
	
	@RequestMapping(value = "paynotify")
	public void paynotify(HttpServletRequest request,HttpServletResponse response){
		try {
			Map<String,String> params = new HashMap<String,String>();
			Map<String,String[]> requestParams = request.getParameterMap();
			for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
				String name = (String) iter.next();
				String[] values = (String[]) requestParams.get(name);
				String valueStr = "";
				for (int i = 0; i < values.length; i++) {
					valueStr = (i == values.length - 1) ? valueStr + values[i]
							: valueStr + values[i] + ",";
				}
				/*//乱码解决，这段代码在出现乱码时使用
				valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");*/
				params.put(name, valueStr);
			}
			
			boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名

			//——请在这里编写您的程序（以下代码仅作参考）——
			
			/* 实际验证过程建议商户务必添加以下校验：
			1、需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号，
			2、判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额），
			3、校验通知中的seller_id（或者seller_email) 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）
			4、验证app_id是否为该商户本身。
			*/
			if(signVerified) {//验证成功
				//商户订单号
			
				
				String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
			
				//支付宝交易号
				String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
			
				//交易状态
				String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");
				if(trade_status.equals("TRADE_FINISHED")){
					if(out_trade_no.length()>32){
					String zdexpress = out_trade_no.substring(0, 32);
					String bdexpress = out_trade_no.substring(32, 64);
					if(StringUtils.isNotBlank(zdexpress)){
						Express es = new Express();
						es.setExpress(zdexpress);
						es.setStatus("6");
						es.setMode("支付宝");
						expressService.upIndent(es);		
					}
					if(StringUtils.isNotBlank(bdexpress)){
						Express es1 = new Express();
						es1.setExpress(bdexpress);
						es1.setStatus("6");
						es1.setMode("支付宝");
						expressService.upIndent(es1);		
					}

					}else{
						Express express = expressService.selectByPrimaryKey(out_trade_no);
						express.setExpress(out_trade_no);
						express.setStatus("6");
						express.setMode("支付宝");
						expressService.upIndent(express);
					}
					//判断该笔订单是否在商户网站中已经做过处理
					//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
					//如果有做过处理，不执行商户的业务程序
						
					//注意：
					//退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知
				}else if (trade_status.equals("TRADE_SUCCESS")){
					//找出所有的
						if(out_trade_no.length()>32){
						String zdexpress = out_trade_no.substring(0, 32);
						String bdexpress = out_trade_no.substring(32, 64);
						if(StringUtils.isNotBlank(zdexpress)){
							Express es = new Express();
							es.setExpress(zdexpress);
							es.setStatus("6");
							es.setMode("支付宝");
							expressService.upIndent(es);		
						}
						if(StringUtils.isNotBlank(bdexpress)){
							Express es1 = new Express();
							es1.setExpress(bdexpress);
							es1.setStatus("6");
							es1.setMode("支付宝");
							expressService.upIndent(es1);		
						}

						}else{
							Express express = expressService.selectByPrimaryKey(out_trade_no);
							express.setExpress(out_trade_no);
							express.setStatus("6");
							express.setMode("支付宝");
							expressService.upIndent(express);
						}
					//判断该笔订单是否在商户网站中已经做过处理
					//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
					//如果有做过处理，不执行商户的业务程序
					
					//注意：
					//付款完成后，支付宝系统发送该交易状态通知
				}
				response.getWriter().write("success");
			}else {//验证失败
				response.getWriter().write("fail");
			
				//调试用，写文本函数记录程序运行情况是否正常
				//String sWord = AlipaySignature.getSignCheckContentV1(params);
				//AlipayConfig.logResult(sWord);
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (AlipayApiException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	/**
	 * 在订单列表中进入付款页面
	 * @param session
	 * @param model
	 * @param req
	 * @param eid
	 * @param price
	 * @return
	 */
	@RequestMapping(value = "houfu")
	public void houfu(HttpSession session, Model model, HttpServletResponse reqs,
			HttpServletRequest req,
			@RequestParam(required = false) String eid,
			@RequestParam(required = false) String ordernumber,@RequestParam(required = false) String price){
		/*model.addAttribute("eid", eid);
		model.addAttribute("ordernumber", ordernumber);
		model.addAttribute("price", price);
		model.addAttribute("panduan", panduan);*/
		List<String>  list= new ArrayList<>();
			list.add(eid);
 		String pay = Alipay.pay(list, price, "元器件","元器件");
 		try {
			reqs.getWriter().write(pay);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 提交订单时进入付款页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "payOrder")
	public String payOrder(@RequestParam(required = false) String beizhu,HttpSession session, Model model,HttpServletRequest req,@RequestParam(required = false) String eid,@RequestParam(required = false) String price){
		Express express=new Express();
		express.setBeizhu(beizhu);
		express.setExpress(eid);
		expressService.updateByPrimaryKeySelective(express);
		model.addAttribute("eid", eid);
		model.addAttribute("price", price);
		return "payOrder";
	}
	
	/**
	 * 添加购物车商品
	 * @return
	 */
	@RequestMapping(value = "addCart")
	@ResponseBody
	public Map<String, Object> addCart(Model model,HttpSession session,
			@RequestParam(required = false) String count,
			@RequestParam(required = false) String panduan,
			@RequestParam(required = false) String pid) {
		Map<String, Object> map = new HashMap<String,Object>();
		String uid = (String)session.getAttribute("uid");
		Cart cart=cartService.queryByPid(pid,uid);
		if(cart!=null){
			cart.setCart_id(cart.getCart_id());
			cart.setCart_number(cart.getCart_number()+1);
			cartService.updateByPrimaryKeySelective(cart);
		}else if(cart==null){
			if(StringUtils.isNotBlank(panduan)){
				Cart c=new Cart();
				c.setCart_id(UIDGenerator.getUUID());
				c.setPanduan("beidong");
				c.setCart_number(1);
				c.setCart_pid(pid);
				c.setCart_uid(uid);
				c.setCart_date(new Date());
				cartService.insertSelective(c);
			}else{
				Cart c=new Cart();
				c.setCart_id(UIDGenerator.getUUID());
				c.setCart_number(1);
				c.setCart_pid(pid);
				c.setCart_uid(uid);
				c.setCart_date(new Date());
				cartService.insertSelective(c);
			}
		}
		
		model.addAttribute("biaozi", 3);
		map.put("result","seccuss");
		return map;
	}

	/**
	 * 清空购物车的执行的方法:
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "clearCart")
	public String clearCart(Model model,HttpSession session){
		String userUid=(String) session.getAttribute("uid");
		UserInfo user = userInfoService.selectByPrimaryKey(userUid);
		model.addAttribute("user", user);
		// 调用购物车中清空方法.
		cartService.deleteByUid(userUid);
		String panduan = "";
		return myCart(model,session,panduan);
	}
	
	
	/**
	 * 从购物车中移除商品的方法:
	 * @return
	 */
	@RequestMapping(value = "removeCart")
	public String removeCart(Model model,@RequestParam(required = false) String pid,HttpSession session){
		String userUid=(String)session.getAttribute("uid");
		UserInfo user = userInfoService.selectByPrimaryKey(userUid);
		model.addAttribute("user", user);
		cartService.deleteByPid(pid);
		String panduan ="";
		return myCart(model,session,panduan);
	}
	
	
	/**
	 * 我的购物车:执行的方法 
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "myCart")
	public String myCart(Model model,HttpSession session,String panduan){
		String userUid=(String)session.getAttribute("uid");
		if(userUid==null){
			return "login";
		}
		UserInfo user = userInfoService.selectByPrimaryKey(userUid);
		Uaddress uaddress=uaddressService.queryByStatus(userUid);
	
		List<Product> list2=new ArrayList<Product>();
		List<Product> list=productService.queryByCart(userUid);
		List<Product> list1=productService.querybdByCart(userUid);
		float total = 0;
		if(!list.isEmpty()){
			for(Product product:list){
				if(!product.getDiscountList().isEmpty()){
					for(Discount discount:product.getDiscountList()){
						if(product.getCart().getCart_number()>=discount.getDiscount_numbermin() && product.getCart().getCart_number()>discount.getDiscount_numbermax() &&discount.getDiscount_numbermax()==0 ){
							product.setPrice(discount.getDiscount_price());
						}
						if(product.getCart().getCart_number()>=discount.getDiscount_numbermin() && product.getCart().getCart_number()<=discount.getDiscount_numbermax()){
							product.setPrice(discount.getDiscount_price());
						}
					}
				}
				BigDecimal b = new BigDecimal(product.getCart().getCart_number() * product.getPrice());  
				Float price = b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue(); 
				product.setSubtotal(price);
				list2.add(product);
				BigDecimal s = new BigDecimal(total + price);  
				total = s.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
			}
		}
		float total2 = 0;
		if(!list1.isEmpty()){
			for(Product product:list1){
				if(!product.getDiscountList().isEmpty()){
					for(Discount discount:product.getDiscountList()){
						if(product.getCart().getCart_number()>=discount.getDiscount_numbermin() && product.getCart().getCart_number()>discount.getDiscount_numbermax() &&discount.getDiscount_numbermax()==0 ){
							product.setPrice(discount.getDiscount_price());
						}
						if(product.getCart().getCart_number()>=discount.getDiscount_numbermin() && product.getCart().getCart_number()<=discount.getDiscount_numbermax()){
							product.setPrice(discount.getDiscount_price());
						}
					}
				}
				BigDecimal b = new BigDecimal(product.getCart().getCart_number() * product.getPrice());  
				Float price = b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue(); 
				product.setSubtotal(price);
				list2.add(product);
				BigDecimal s = new BigDecimal(total2 + price);  
				total2 = s.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
			}
		}
		if(list1.size()>0){
			model.addAttribute("panduan", panduan);
		}
		List<Express> list4 = expressService.queryzdCountNoPay(userUid);
		if(list4.size()>0){
			model.addAttribute("zdCountNoPay", list4.size());
		}
		List<Express> list3 = expressService.querybdCountNoPay(userUid);
		if(list3.size()>0){
		   model.addAttribute("bdCountNoPay", list3.size());
		}
		model.addAttribute("uaddress", uaddress);
		model.addAttribute("user", user);
		model.addAttribute("total", total+total2);
		model.addAttribute("cartItem", list2);
		model.addAttribute("biaozi", 3);
		return "cart";
	}
	
	
	/**
	 * 购物车订单提交
	 * @throws IOException 
	 */
	@RequestMapping(value = "saveOrder")
	public void saveOrder(@RequestParam(required = false)String b_content, HttpServletResponse re,
			@RequestParam(required = false)String panduan,
			/*MultipartFile[] files,*/@RequestParam(required = true)String beizhu,Model model,HttpSession session) throws IOException{
		String uid = (String)session.getAttribute("uid");
		List<Product> list=productService.queryByCart(uid);
		List<Product> list1=productService.querybdByCart(uid);
		List<String> list2 = new ArrayList<>();
		if(list.size()==0&&list1.size()==0){
			//return myCart(model,session,panduan);
		}else {
			String ordernumber ="";
			float Totalprice = 0;
			if(list.size()>0){
			float total=0;
			Express express = new Express();
			express.setExpress(UIDGenerator.getUUID());
			express.setUseruid(uid);
			list2.add(express.getExpress());
			express.setStatus("1");
			express.setBeizhu(beizhu);
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date=new Date();
			express.setEdate(date);
			String str=simpleDateFormat.format(date);
			int i=expressService.queryByDateCount(str+"%");
			++i;
			if(i<10){
				express.setOrdernumber(PersonalIdUrils.function(6)+0+i);
			}else{
				express.setOrdernumber(PersonalIdUrils.function(6)+i);
			}
			for (Product product : list) {
				// 订单项的信息从购物项获得的.
				OrderItme orderItem = new OrderItme();
				orderItem.setO_id(UIDGenerator.getUUID());
				orderItem.setO_number(product.getCart().getCart_number()+"");
				orderItem.setO_eid(express.getExpress());
				if(!product.getDiscountList().isEmpty()){
					for(Discount discount:product.getDiscountList()){
						if(product.getCart().getCart_number()>=discount.getDiscount_numbermin() && product.getCart().getCart_number()>discount.getDiscount_numbermax() &&discount.getDiscount_numbermax()==0 ){
							product.setPrice(discount.getDiscount_price());
						}
						if(product.getCart().getCart_number()>=discount.getDiscount_numbermin() && product.getCart().getCart_number()<=discount.getDiscount_numbermax()){
							product.setPrice(discount.getDiscount_price());
						}
					}
				}
				BigDecimal b = new BigDecimal(product.getCart().getCart_number() * product.getPrice());  
				Float price = b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
				orderItem.setO_price(price);
				BigDecimal s = new BigDecimal(total + price);  
				total = s.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
				orderItem.setO_product(product.getProduct());
				orderItem.setO_pid(product.getProductuuid());
				orderItem.setO_one(product.getPrice());
				orderItem.setO_package(product.getEncapsulation());
				orderItem.setO_sid(product.getSupplieruuid());
				orderItem.setO_date(date);
				orderItmeService.insertSelective(orderItem);
			}
			express.setEprice(total);
			express.setExpressname("自取");
			express.setExpress_biaoqian(b_content);
			BigDecimal b = new BigDecimal(express.getEprice()); 
			express.setEprice(b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue());
			expressService.insertSelective(express);
			if(b_content!=null && !b_content.equals("")){
				BiaoQian bq=new BiaoQian();
				bq.setB_content(b_content);
				bq.setB_uid(uid);
				bq.setB_eid(express.getExpress());
				biaoqianService.insertSelective(bq);
			}
			 Totalprice += express.getEprice();
			 model.addAttribute("eid", express.getExpress());
			 ordernumber=express.getOrdernumber();
			 model.addAttribute("price", Totalprice);
			}
			if(list1.size()>0){
				float total1=0;
				float Totalprice1 = 0;
				Express express = new Express();
				express.setExpress(UIDGenerator.getUUID());
				list2.add(express.getExpress());
				express.setUseruid(uid);
				express.setStatus("1");
				express.setBeizhu(beizhu);
				express.setPanduan("1");
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date date=new Date();
				express.setEdate(date);
				String str=simpleDateFormat.format(date);
				int i=expressService.queryByDateCount(str+"%");
				++i;
				if(i<10){
					express.setOrdernumber(PersonalIdUrils.function(6)+0+i);
				}else{
					express.setOrdernumber(PersonalIdUrils.function(6)+i);
				}
				for (Product product : list1) {
					// 订单项的信息从购物项获得的.
					OrderItme orderItem = new OrderItme();
					orderItem.setO_id(UIDGenerator.getUUID());
					orderItem.setO_number(product.getCart().getCart_number()+"");
					orderItem.setO_eid(express.getExpress());
					if(!product.getDiscountList().isEmpty()){
						for(Discount discount:product.getDiscountList()){
							if(product.getCart().getCart_number()>=discount.getDiscount_numbermin() && product.getCart().getCart_number()>discount.getDiscount_numbermax() &&discount.getDiscount_numbermax()==0 ){
								product.setPrice(discount.getDiscount_price());
							}
							if(product.getCart().getCart_number()>=discount.getDiscount_numbermin() && product.getCart().getCart_number()<=discount.getDiscount_numbermax()){
								product.setPrice(discount.getDiscount_price());
							}
						}
					}
					BigDecimal b = new BigDecimal(product.getCart().getCart_number() * product.getPrice());  
					Float price = b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
					orderItem.setO_price(price);
					BigDecimal s = new BigDecimal(total1 + price);  
					total1 = s.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
					orderItem.setO_product(product.getProduct());
					orderItem.setO_pid(product.getProductuuid());
					orderItem.setO_one(product.getPrice());
					orderItem.setO_package(product.getEncapsulation());
					orderItem.setO_sid(product.getSupplieruuid());
					orderItem.setO_date(date);
					orderItmeService.insertSelective(orderItem);
				}
				express.setEprice(total1);
				express.setExpressname("自取");
				express.setExpress_biaoqian(b_content);
				BigDecimal b = new BigDecimal(express.getEprice()); 
				express.setEprice(b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue());
				expressService.insertSelective(express);
				if(b_content!=null && !b_content.equals("")){
					BiaoQian bq=new BiaoQian();
					bq.setB_content(b_content);
					bq.setB_uid(uid);
					bq.setB_eid(express.getExpress());
					biaoqianService.insertSelective(bq);
				}
				 Totalprice1 = express.getEprice();
				 model.addAttribute("bdeid", express.getExpress());
				 ordernumber+=express.getOrdernumber();
				 model.addAttribute("price", Totalprice1+Totalprice);
				 Totalprice+=Totalprice1;
				}
			model.addAttribute("ordernumber",ordernumber);
			String dody="";
			if(list1.size()>0){
				 dody="被动订单";
			}else{
				 dody="主动订单";
			}
			cartService.deleteByUid(uid);
			System.out.println(list2);
			String pay = Alipay.pay(list2, Totalprice+"", "元器件",dody);
			re.getWriter().write(pay);
		}
//		return "pay";
	}
	
	
	/**
	 * 地址管理
	 * 2017-06-08
	 */
	@RequestMapping(value = "MyAddress")
	public String MyAddress(Model model,HttpSession session){
		String panduan = (String)session.getAttribute("panduan");
		if(panduan != null && panduan != ""){
			session.removeAttribute("panduan");
		}
		String uid = (String)session.getAttribute("uid");
		UserInfo user = userInfoService.selectByPrimaryKey(uid);
		model.addAttribute("user", user);
		List<Uaddress> uaddress=uaddressService.queryByUid(uid);
		model.addAttribute("uaddress", uaddress);
		model.addAttribute("biaozi", 4);
		model.addAttribute("showadd", "");
		model.addAttribute("showup", "");
		List<Express> list = expressService.queryzdCountNoPay(uid);
		if(list.size()>0){
			model.addAttribute("zdCountNoPay", list.size());
		}
		List<Express> list1 = expressService.querybdCountNoPay(uid);
		if(list1.size()>0){
		   model.addAttribute("bdCountNoPay", list1.size());
		}
		return "user/user-myAddress";
	}
	
	/**
	 * 地址管理
	 * 2017-06-08
	 */
	@RequestMapping(value = "deleteUaddress")
	public String deleteUaddress(String a_id,Model model,HttpSession session){
		uaddressService.deleteUaddress(a_id);
		return "redirect:/MyAddress";
	}
	
	/**
	 * 从购物车中修改购物项的方法: 
	 * @param count
	 * @param model
	 * @param pid
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "upCart")
	@ResponseBody
	public Map<String, Object> upCart(@RequestParam(required = false) String count,Model model,@RequestParam(required = false) String pid,HttpSession session){
		
		Map<String, Object> map = new HashMap<String,Object>();
		Cart cart=new Cart();
		cart.setCart_id(pid);
		cart.setCart_number(Integer.parseInt(count));
		cartService.updateByPrimaryKeySelective(cart);
		map.put("result","seccuss");
		return map;
	}
	
	/**
	 * 跳转到地址添加页面
	 * @return
	 */
	@RequestMapping(value = "inAdd")
	public String inAdd(@RequestParam(required = false)String bid,@RequestParam(required = false)String eid,@RequestParam(required = false)String expressname,@RequestParam(required = false)String fapiao,@RequestParam(required = false)String pid,@RequestParam(required = false)String number,Model model,HttpSession session){
		String userUid = (String)session.getAttribute("uid");
		List<Uaddress> uaddress=uaddressService.queryByUid(userUid);
		UserInfo user = userInfoService.selectByPrimaryKey(userUid);
		model.addAttribute("expressname", expressname);
		model.addAttribute("fapiao", fapiao);
		model.addAttribute("eid", eid);
		model.addAttribute("number", number);
		model.addAttribute("pid", pid);
		model.addAttribute("bid", bid);
		model.addAttribute("user", user);
		model.addAttribute("biaozi", 4);
		model.addAttribute("uaddress", uaddress);
		model.addAttribute("showadd", "showadd");
		return "user/user-myAddress";
	}
	
	/**
	 * 我的地址添加
	 * 2017-06-08
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "inAddress")
	@ResponseBody
	public Map<String, Object> inAddress(Uaddress uaddress,Model model,HttpSession session,@RequestParam(required = true)String xiangxi,@RequestParam(required = true)String province,@RequestParam(required = true)String city,HttpServletResponse response) throws UnsupportedEncodingException{
		Map<String, Object> map = new HashMap<String,Object>();
		String uid = (String)session.getAttribute("uid");
		response.setContentType("text/html;charset=UTF-8");
		province=URLDecoder.decode(province,"UTF-8");
		city=URLDecoder.decode(city,"UTF-8");
		xiangxi=URLDecoder.decode(xiangxi,"UTF-8");
		uaddress.setA_name(URLDecoder.decode(uaddress.getA_name(),"UTF-8"));
		String demos=null;	//组合 省、市、县
		uaddress.setA_uid(uid);//所属用户
		uaddress.setA_id(UIDGenerator.getUUID());
		if(uaddress!=null){
			demos=province+"-"+city+"-"+xiangxi;
		}
		uaddress.setA_address(demos);
		Uaddress u = uaddressService.queryByStatus(uid);
		if(u==null){
			uaddress.setA_status("1");
		}else{
			uaddress.setA_status("2");
		}
		uaddressService.insertSelective(uaddress);
		map.put("result","seccuss");
		map.put("aid",uaddress.getA_id());
		return map;
	}
	
	/**
	 * 我的地址查询
	 * 2017-06-08
	 */
	@RequestMapping(value = "ByUid")
	@ResponseBody
	public Map<String, Object> ByUid(Model model,HttpSession session){
		String uid = (String)session.getAttribute("uid");
		Map<String, Object> map = new HashMap<String,Object>();
		List<Uaddress> uaddress=uaddressService.queryByUid(uid);
		if(uaddress.isEmpty()){
			map.put("result","fail");
			model.addAttribute("biaozi", 1);
		}else if(!uaddress.isEmpty()){
			map.put("result","seccuss");
		}
		return map;
	}
	

	/**
	 * 跳转到我的地址修改页面
	 * 2017-06-10
	 */
	@RequestMapping(value = "jumpUp")
	public String jumpUp(Model model,String aid,HttpSession session){
		Uaddress upaddress = uaddressService.queryByAid(aid);
		String[] sourceStrArray = upaddress.getA_address().split("-");
		String xiangxi=null;
		String province=null;
		String city=null;
	    for (int i = 0; i < sourceStrArray.length; i++) {
	    	if(i==0){
	    		province=sourceStrArray[i];
	    	}else if(i==1){
	    		city=sourceStrArray[i];
	    	}else if(i==2){
	    		xiangxi=sourceStrArray[i];
	    	}
		}
	    String userUid=(String)session.getAttribute("uid");
		UserInfo user = userInfoService.selectByPrimaryKey(userUid);
		List<Uaddress> uaddress = uaddressService.queryByUid(userUid);
		model.addAttribute("user", user);
	    model.addAttribute("city", city);
	    model.addAttribute("xiangxi", xiangxi);
	    model.addAttribute("province", province);
		model.addAttribute("uaddress", uaddress);
		model.addAttribute("showup", "showup");
		model.addAttribute("upaddress", upaddress);
		return "user/user-myAddress";
	}
	
	
	/**
	 * 我的地址修改
	 * 2017-06-08
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("upAddress")
	@ResponseBody
	public Map<String, Object> upAddress(Uaddress uaddress,Model model,HttpSession session,@RequestParam(required = true)String xiangxi,@RequestParam(required = true)String province,@RequestParam(required = true)String city,HttpServletResponse response) throws UnsupportedEncodingException{
		Map<String, Object> map = new HashMap<String,Object>();
		response.setContentType("text/html;charset=UTF-8");
		province=URLDecoder.decode(province,"UTF-8");
		city=URLDecoder.decode(city,"UTF-8");
		xiangxi=URLDecoder.decode(xiangxi,"UTF-8");
		uaddress.setA_name(URLDecoder.decode(uaddress.getA_name(),"UTF-8"));
		String demos=null;	//组合 省、市、县
		if(uaddress!=null){
			demos=province+"-"+city+"-"+xiangxi;
		}
		uaddress.setA_address(demos);
		uaddressService.updateByPrimaryKeySelective(uaddress);
		map.put("result","success");
		return map;
	}
	

	/**
	 * 设置默认地址
	 * 2017-06-10
	 */
	@RequestMapping("tacitly")
	public String tacitly(Uaddress uaddress,Model model,HttpSession session){
		uaddress.setA_status("1");
		uaddressService.updateByPrimaryKeySelective(uaddress);
		uaddressService.updateByAid(uaddress);
		return MyAddress(model,session);
	}

	/**
	 * 选择收货地址
	 * 2017-06-10
	 *//*
	@RequestMapping("chooseAddress")
	public String chooseAddress(@RequestParam(required = false)String panduan,@RequestParam(required = false)String bid,@RequestParam(required = false)String eid,@RequestParam(required = false)String expressname,@RequestParam(required = false)String fapiao,@RequestParam(required = false)String pid,@RequestParam(required = false)String number,Model model,HttpSession session){
		if(panduan != null && panduan != ""){
			session.setAttribute("panduan", panduan);
		}
		String uid = (String)session.getAttribute("uid");
		UserInfo user = userInfoService.selectByPrimaryKey(uid);
		model.addAttribute("user", user);
		List<Uaddress> uaddress=uaddressService.queryByUid(uid);
		model.addAttribute("uaddress", uaddress);
		model.addAttribute("biaozi", 4);
		model.addAttribute("pid", pid);
		model.addAttribute("eid", eid);
		model.addAttribute("bid", bid);
		model.addAttribute("expressname", expressname);
		model.addAttribute("fapiao", fapiao);
		model.addAttribute("number", number);
		model.addAttribute("xuanzhe", "xuanzhe");
		return "user/user-myAddress";
	}
*/	
	/**
	 * 购物车结算
	 * @param biaoqian
	 * @param beizhu
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "myCartSettlement")
	public String myCartSettlement(@RequestParam(required = false)String biaoqian,
			@RequestParam(required = false)String panduan,@RequestParam(required = false)String beizhu,Model model,HttpSession session){
		String userUid=(String)session.getAttribute("uid");
		if(userUid==null){
			return "login";
		}
		if(biaoqian==null){
			biaoqian="1";
		}else{
			if(!biaoqian.equals("2")){
				biaoqian="1";
			}
		}
		List<BiaoQian> biaoqianList = biaoqianService.queryByUid(userUid);
		UserInfo user = userInfoService.selectByPrimaryKey(userUid);
		List<Product> list2=new ArrayList<Product>();
		List<Product> list=productService.queryByCart(userUid);
		List<Product> list1=productService.querybdByCart(userUid);
		float total = 0;
		if(!list.isEmpty()){
			for(Product product:list){
				if(!product.getDiscountList().isEmpty()){
					for(Discount discount:product.getDiscountList()){
						if(product.getCart().getCart_number()>=discount.getDiscount_numbermin() && product.getCart().getCart_number()>discount.getDiscount_numbermax() &&discount.getDiscount_numbermax()==0 ){
							product.setPrice(discount.getDiscount_price());
						}
						if(product.getCart().getCart_number()>=discount.getDiscount_numbermin() && product.getCart().getCart_number()<=discount.getDiscount_numbermax()){
							product.setPrice(discount.getDiscount_price());
						}
					}
				}
				BigDecimal b = new BigDecimal(product.getCart().getCart_number() * product.getPrice());  
				Float price = b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue(); 
				product.setSubtotal(price);
				list2.add(product);
				BigDecimal s = new BigDecimal(total + price);  
				total = s.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
			}
		}
		float total1 = 0;
		if(!list1.isEmpty()){
			for(Product product:list1){
				if(!product.getDiscountList().isEmpty()){
					for(Discount discount:product.getDiscountList()){
						if(product.getCart().getCart_number()>=discount.getDiscount_numbermin() && product.getCart().getCart_number()>discount.getDiscount_numbermax() &&discount.getDiscount_numbermax()==0 ){
							product.setPrice(discount.getDiscount_price());
						}
						if(product.getCart().getCart_number()>=discount.getDiscount_numbermin() && product.getCart().getCart_number()<=discount.getDiscount_numbermax()){
							product.setPrice(discount.getDiscount_price());
						}
					}
				}
				BigDecimal b = new BigDecimal(product.getCart().getCart_number() * product.getPrice());  
				Float price = b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue(); 
				product.setSubtotal(price);
				list2.add(product);
				BigDecimal s = new BigDecimal(total1 + price);  
				total1 = s.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
			
			}
		}
		model.addAttribute("user", user);
		model.addAttribute("biaoqianList",biaoqianList);
		model.addAttribute("biaoqian",biaoqian);
		BigDecimal b = new BigDecimal(total); 
		total=b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
		model.addAttribute("total", total+total1);
		model.addAttribute("subtotal", total+total1);
		model.addAttribute("cartItem", list2);
		model.addAttribute("beizhu", beizhu);
		if(list1.size()>0){
			model.addAttribute("panduan", panduan);
		}
		return "cartorder";
	}
	
	/**
	 * 取消订单
	 * @return
	 */
	@RequestMapping("expressQuxiao")
	public String expressQuxiao(@RequestParam(required = false) String eid){
		Express expressList = expressService.queryById(eid);
		expressList.setStatus("5");
		expressService.updateByPrimaryKeySelective(expressList);
		return "redirect:/express";
	}
	
	/**
	 * 再次购买
	 * @return
	 */
	
/*	@RequestMapping("goAgain")
	public String goAgain(@RequestParam(required = false)String eid,
						  @RequestParam(required = false)String aid,
						  @RequestParam(required = false)String beizhu,
						  @RequestParam(required = false)String expressname,
						  @RequestParam(required = false)String fapiao,
						  Model model,HttpSession session){
		String userUid=(String)session.getAttribute("uid");
		if(userUid==null){
			return "login";
		}
		String  province = null;
		UserInfo user = userInfoService.selectByPrimaryKey(userUid);
		if(aid!=null && !aid.equals("")){
			Uaddress uaddress=uaddressService.queryByAid(aid);
			province=StringUtils.substringBefore(uaddress.getA_address(), "-");
			if(uaddress.getA_phone()==null){
				uaddress.setA_phone(uaddress.getA_gudingtel());
			}
			model.addAttribute("province", province);
			model.addAttribute("uaddress", uaddress);
		}else{
			Uaddress u=uaddressService.queryByStatus(userUid);
			if(u!=null){
				if(u.getA_phone()==null){
					u.setA_phone(u.getA_gudingtel());
				}
				province=StringUtils.substringBefore(u.getA_address(), "-");
				model.addAttribute("province", province);
				model.addAttribute("uaddress", u);
			}
			if(u==null){
				List<Uaddress> uaddress=uaddressService.queryByUid(userUid);
				if(!uaddress.isEmpty()){
					Uaddress uadd=new Uaddress();
					province=StringUtils.substringBefore(uaddress.get(0).getA_address(), "-");
					model.addAttribute("province", province);
					uadd.setA_address(uaddress.get(0).getA_address());
					uadd.setA_name(uaddress.get(0).getA_name());
					if(uaddress.get(0).getA_phone()==null){
						uadd.setA_phone(uaddress.get(0).getA_gudingtel());
					}else{
						uadd.setA_phone(uaddress.get(0).getA_phone());
					}
					uadd.setA_id(uaddress.get(0).getA_id());
					uadd.setA_company(uaddress.get(0).getA_company());
					model.addAttribute("uaddress", uadd);
				}
			}
		}
		model.addAttribute("user", user);
		List<Product> list2=new ArrayList<Product>();
		List<Product> list = productService.goAgain(eid);
		float total = 0;
		float subtotal=0;
		if(!list.isEmpty()){
			for(Product product:list){
				BigDecimal b = new BigDecimal(product.getCart().getCart_number() * product.getPrice());  
				Float price = b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue(); 
				product.setSubtotal(price);
				list2.add(product);
				BigDecimal s = new BigDecimal(total + price);  
				total = s.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
				subtotal=total;
			}
		}
		float yunfei = 0;
		if("1".equals(expressname)){
		} else if("2".equals(expressname)){
			if(province!=null && province.equals("广东省")){
				total+=10;
				yunfei=10;
				expressname="6";
			}else{
				total+=10;
				yunfei=10;
			}
		} else if("3".equals(expressname)){
			total=total+23;
			yunfei=23;
		} else if("4".equals(expressname)){
			total=total+13;
			yunfei=13;
		}else if("6".equals(expressname)){
			total=total+10;
			yunfei=10;
		}
		else if("7".equals(expressname)){
			total=total+10;
			yunfei=10;
		}else{
			total+=10;
			yunfei=10;
		}
		float fapiaofei = 0;
		if("2".equals(fapiao)){
			BigDecimal b = new BigDecimal(total * 1.06);
			BigDecimal a = new BigDecimal(b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue()-total);
			fapiaofei= a.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
			total=b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
		}else if("3".equals(fapiao)){
			BigDecimal b = new BigDecimal(total * 1.17); 
			BigDecimal a = new BigDecimal(b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue()-total);
			fapiaofei= a.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
			total=b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
		}
		model.addAttribute("expressname", expressname);
		model.addAttribute("fapiao", fapiao);
		model.addAttribute("yunfei", yunfei);
		model.addAttribute("fapiaofei", fapiaofei);
		model.addAttribute("total", total);
		model.addAttribute("subtotal", subtotal);
		model.addAttribute("cartItem", list2);
		model.addAttribute("beizhu", beizhu);
		return "goAgain";
	}*/

}
