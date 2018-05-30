package com.zikezhi.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.google.gson.JsonObject;
import com.zikezhi.entity.BomOrder;
import com.zikezhi.entity.Uaddress;
import com.zikezhi.entity.UserInfo;
import com.zikezhi.service.BomOrderService;
import com.zikezhi.service.ExpressService;
import com.zikezhi.service.UaddressService;
import com.zikezhi.service.UserInfoService;
import com.zikezhi.service.WithdrawALService;
import com.zikezhi.utils.PageBean;
import com.zikezhi.utils.PersonalIdUrils;
import com.zikezhi.utils.SmsUtil;
/**
 * bom订单
 * @author wrp
 *
 */
@Controller
public class BomOrderController {
	
	@Resource(name="bomOrderService")
	private BomOrderService bomOrderService;
	
	@Resource(name = "userInfoService")
	private UserInfoService userInfoService;
	
	@Resource(name = "withdrawALService")
	private WithdrawALService withdrawALService;
	
	@Resource(name = "expressService")
	private ExpressService expressService;
	
	@Resource(name = "uaddressService")
	private UaddressService uaddressService;
	
	/**
	 * 进入添加bom订单页面
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("1019/zai/xin/jian/inbom")
	public String inbom(HttpSession session ,Model model){
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		model.addAttribute("inbom", "inbom");
		return "adminHome";
	}
	
	/**
	 * 用户bom订单查看
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("querybomuser")
	public String querybomuser(HttpSession session,Model model){
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			return "login";
		}
		UserInfo user = userInfoService.selectByPrimaryKey(uid);
		model.addAttribute("user", user);
		List<BomOrder> bomList=bomOrderService.querybomuserphone(uid);
		Float fanTotal=expressService.selectFanBySum(uid);
		if(fanTotal==null){
			float a=0;
			fanTotal=a;
		}
		Float price = withdrawALService.queryByUidAndWprice(uid);
		Float bomprice = bomOrderService.queryByfanUserBom(uid);
		if(bomprice==null){
			float a=0;
			bomprice=a;
		}
		BigDecimal b = new BigDecimal(fanTotal + bomprice);  
		fanTotal = b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
		model.addAttribute("fanTotal", fanTotal);
		model.addAttribute("price", price);
		model.addAttribute("bomList", bomList);
		model.addAttribute("bomuserAll", "bomuserAll");
		return "user/bom/bomList";
	}
	
	/**
	 * 管理员查看所有bom订单
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("1019/zai/xin/jian/bomQueryAll")
	public String queryAll(@RequestParam(required = false) String status,@RequestParam(required = false) String product,@RequestParam(required = false) String edate,@RequestParam(required = false) String address,@RequestParam(required = false) String telphone,@RequestParam(required = false) String name,@RequestParam(required = false) String page,@RequestParam(required = false) String rows,HttpSession session,Model model){
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
		if(name!=null && !name.equals("")){
			map.put("username", "%"+name+"%");
		}
		if(status!=null && !status.equals("")){
			map.put("status", "%"+status+"%");
		}
		if(address!=null && !address.equals("")){
			map.put("address", "%"+address+"%");
		}else if(telphone!=null && !telphone.equals("")){
			map.put("telphone", "%"+telphone+"%");
		}else if(edate!=null && !edate.equals("")){
			map.put("edate", "%"+edate+"%");
		}
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<BomOrder> bomList=bomOrderService.queryAll(map);
		List<BomOrder> bom=new ArrayList<BomOrder>();
		int i=0;
		if(product!=null && !product.equals("")){
			for(BomOrder b:bomList){
				if(b.getBom_content().indexOf(product)!=-1){
					bom.add(b);
					++i;
				}
			}
			model.addAttribute("total", i);
			pageBean.setTotal(i);
			model.addAttribute("count", pageBean.getCount());
			model.addAttribute("bomList", bom);
		}else{
			model.addAttribute("bomList", bomList);
			long total=bomOrderService.getTotalAll(map);
			model.addAttribute("total", total);
			pageBean.setTotal(Integer.parseInt(String.valueOf(total)));
			model.addAttribute("count", pageBean.getCount());
		}
		model.addAttribute("page", pageBean.getPage());
		model.addAttribute("pageSize", pageBean.getPageSize());
		model.addAttribute("bomAll", "bomAll");
		return "adminHome";
	}
	
	/**
	 * 根据id 查看bom订单
	 * @param id
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("queryByBomIduser")
	public String queryByBomIduser(int id,HttpSession session,Model model){
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			return "login";
		}
		UserInfo user = userInfoService.selectByPrimaryKey(uid);
		model.addAttribute("user", user);
		BomOrder bomList=bomOrderService.selectByid(id);
		model.addAttribute("bom", bomList);
		model.addAttribute("bomdeteils", "bomdeteils");
		return "user/bom/bom-details";
	}
	
	/**
	 * 根据id 查看bom订单
	 * @param id
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("1019/zai/xin/jian/queryByBomId")
	public String queryByBomId(int id,HttpSession session,Model model){
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		BomOrder bomList=bomOrderService.selectByid(id);
		model.addAttribute("bom", bomList);
		model.addAttribute("bomdeteils", "bomdeteils");
		return "adminHome";
	}
	
	@RequestMapping("1019/zai/xin/jian/addBom")
	public String addBom(BomOrder bomOrder,HttpSession session,Model model){
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		String str=simpleDateFormat.format(date);
		int i=bomOrderService.queryByDateCount(str+"%");
		++i;
		if(i<10){
			bomOrder.setBom_identifier(PersonalIdUrils.function(6)+0+i);
		}else{
			bomOrder.setBom_identifier(PersonalIdUrils.function(6)+i);
		}
		bomOrder.setBom_date(new Date());
		bomOrder.setBom_status("1");
		bomOrderService.insertSelective(bomOrder);
		model.addAttribute("bomdeteils", "bomdeteils");
		return "redirect:bomQueryAll";
	}
	
	@RequestMapping(value = "bomuppay")
	@ResponseBody
	public Map<String, Object> IndentDelect(BomOrder bom, HttpSession session, Model model,HttpServletRequest req){
		Map<String, Object> map = new HashMap<String,Object>();
		bomOrderService.updateByPrimaryKeySelective(bom);
		map.put("result","seccuss");
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "1019/zai/xin/jian/AdminupdateBom", method = RequestMethod.POST)
	public String AdminupdateBom(BomOrder bomOrder, HttpSession session){
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		if(session.getAttribute("user") != null){
			BomOrder bo=bomOrderService.selectByid(bomOrder.getBom_id());
			if(bo.getBom_status().equals("1") || bo.getBom_status().equals("6")){
				if(bomOrder.getBom_status().equals("2")){
					SendSmsRequest sms =new SendSmsRequest();
					Pattern p = null;  
				    Matcher m = null;  
				    boolean b = false;  
				    p = Pattern.compile("^[1][3,4,5,7,8][0-9]{9}$");
				    m = p.matcher(bo.getBom_phone());  
				    b = m.matches();  
					if(b){
						sms.setPhoneNumbers(bo.getBom_phone());
					}else{
						sms.setPhoneNumbers(bo.getBom_userphone());
					}
					JsonObject params =new JsonObject();
					params.addProperty("name",bo.getBom_name());
					sms.setTemplateParam(params.toString());
					SendSmsResponse res =SmsUtil.sendSmsPayment(sms);
					System.out.println(res.getCode());
				}
			}
			if(bo.getBom_status().equals("2")){
				if(bomOrder.getBom_status().equals("3")){
					SendSmsRequest sms =new SendSmsRequest();
					Pattern p = null;  
				    Matcher m = null;  
				    boolean b = false;  
				    p = Pattern.compile("^[1][3,4,5,7,8][0-9]{9}$");
				    m = p.matcher(bo.getBom_phone());  
				    b = m.matches();  
					if(b){
						sms.setPhoneNumbers(bo.getBom_phone());
					}else{
						sms.setPhoneNumbers(bo.getBom_userphone());
					}
					JsonObject params =new JsonObject();
					params.addProperty("name",bo.getBom_name());
					params.addProperty("express",bomOrder.getBom_help());
					sms.setTemplateParam(params.toString());
					SendSmsResponse res =SmsUtil.sendSmsStatus(sms);
					System.out.println(res.getCode());
				}
			}
			int i = bomOrderService.updateByPrimaryKeySelective(bomOrder);
			if(i == 1){
				return "修改成功";
			}
		}
		return "修改失败";
	}
	
	@RequestMapping(value = "1019/zai/xin/jian/queryByPhone", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> queryByPhone(String phone, HttpSession session){
		Map<String,Object> map=new HashMap<String, Object>();
		List<UserInfo> userinfo = userInfoService.findUserByTelphone(phone);
		if(!userinfo.isEmpty()){
			map.put("result","seccuss");
		}else{
			map.put("result","fail");
		}
		return map;
	}
	
	@RequestMapping("bomOrderPay")
	public String bomOrderPay(int id,@RequestParam(required = false)String aid,@RequestParam(required = false)String tijiao,@RequestParam(required = false)String beizhu,@RequestParam(required = false)String fapiao,@RequestParam(required = false)String expressname,HttpSession session,Model model){
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			return "login";
		}
		UserInfo user = userInfoService.selectByPrimaryKey(uid);
		model.addAttribute("user", user);
		BomOrder bomList=bomOrderService.selectByid(id);
		bomList.setBom_remarks(beizhu);
		float fapiaofei=0;
		float yunfei=0;
		float subtotal=bomList.getBom_price();
		if(bomList.getBom_kuaidi()==null){
			if("1".equals(expressname)){
				bomList.setBom_kuaidi("自取");
			} else if("2".equals(expressname)){
				yunfei=10;
				bomList.setBom_price(bomList.getBom_price()+10);
				bomList.setBom_kuaidi("申通");
			} else if("3".equals(expressname)){
				yunfei=23;
				bomList.setBom_price(bomList.getBom_price()+23);
				bomList.setBom_kuaidi("顺丰(省外)");
			} else if("4".equals(expressname)){
				yunfei=13;
				bomList.setBom_price(bomList.getBom_price()+13);
				bomList.setBom_kuaidi("顺丰(省内)");
			}else if("5".equals(expressname)){
				bomList.setBom_kuaidi("顺丰到付");
			}else if("6".equals(expressname)){
				yunfei=10;
				bomList.setBom_price(bomList.getBom_price()+10);
				bomList.setBom_kuaidi("速尔快(广东省内)");
			}else if("7".equals(expressname)){
				yunfei=10;
				bomList.setBom_price(bomList.getBom_price()+10);
				bomList.setBom_kuaidi("圆通");
			}else{
				yunfei=10;
				bomList.setBom_price(bomList.getBom_price()+10);
				bomList.setBom_kuaidi("申通");
			}
		}
		if(bomList.getBom_invoice()==null){
			if("1".equals(fapiao)){
				bomList.setBom_invoice("1");
			}else if("2".equals(fapiao)){
				BigDecimal s = new BigDecimal(bomList.getBom_price() * 1.06);
				BigDecimal a = new BigDecimal(s.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue()-bomList.getBom_price());
				fapiaofei= a.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
				bomList.setBom_price(s.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue());
				bomList.setBom_invoice("2");
			}else if("3".equals(fapiao)){
				BigDecimal s = new BigDecimal(bomList.getBom_price() * 1.17);
				BigDecimal a = new BigDecimal(s.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue()-bomList.getBom_price());
				fapiaofei= a.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
				bomList.setBom_price(s.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue());
				bomList.setBom_invoice("3");
			}else{
				bomList.setBom_invoice("1");
			}
		}
		if(bomList.getBom_name()==null){
			if(aid!=null && !aid.equals("")){
				Uaddress uaddress=uaddressService.queryByAid(aid);
				String  province=StringUtils.substringBefore(uaddress.getA_address(), "-");
				model.addAttribute("province", province);
				model.addAttribute("uaddress", uaddress);
				bomList.setBom_address(uaddress.getA_address());
				bomList.setBom_name(uaddress.getA_name());
				if(uaddress.getA_phone().equals("")||uaddress.getA_phone()==null){
					bomList.setBom_phone(uaddress.getA_gudingtel());
				}else{
					bomList.setBom_phone(uaddress.getA_phone());
				}
			}else{
				Uaddress u=uaddressService.queryByStatus(uid);
				if(u!=null){
					bomList.setBom_address(u.getA_address());
					bomList.setBom_name(u.getA_name());
					if(u.getA_phone().equals("")||u.getA_phone()==null){
						bomList.setBom_phone(u.getA_gudingtel());
					}else{
						bomList.setBom_phone(u.getA_phone());
					}
					model.addAttribute("uaddress", u);
				}
				if(u==null){
					List<Uaddress> uaddress=uaddressService.queryByUid(uid);
					if(!uaddress.isEmpty()){
						Uaddress uadd=new Uaddress();
						String  province=StringUtils.substringBefore(uaddress.get(0).getA_address(), "-");
						model.addAttribute("province", province);
						uadd.setA_address(uaddress.get(0).getA_address());
						uadd.setA_name(uaddress.get(0).getA_name());
						uadd.setA_phone(uaddress.get(0).getA_phone());
						uadd.setA_company(uaddress.get(0).getA_company());
						uadd.setA_id(uaddress.get(0).getA_id());
						bomList.setBom_address(uadd.getA_address());
						bomList.setBom_name(uadd.getA_name());
						if(uadd.getA_phone().equals("")||uadd.getA_phone()==null){
							bomList.setBom_phone(uadd.getA_gudingtel());
						}else{
							bomList.setBom_phone(uadd.getA_phone());
						}
						model.addAttribute("uaddress", uadd);
					}
				}
			}
		}else if(bomList.getBom_name()!=null){
			model.addAttribute("price", bomList.getBom_price());
			model.addAttribute("bomid", bomList.getBom_id());
			return "user/bom/pay";
		}
		
		if(tijiao!=null && tijiao!=""){
			if(tijiao.equals("queren")){
				bomOrderService.updateByPrimaryKeySelective(bomList);
				model.addAttribute("price", bomList.getBom_price());
				model.addAttribute("bomid", bomList.getBom_id());
				return "user/bom/pay";
			}
		}
		model.addAttribute("expressname", expressname);
		model.addAttribute("fapiao", fapiao);
		model.addAttribute("yunfei", yunfei);
		model.addAttribute("fapiaofei", fapiaofei);
		model.addAttribute("subtotal", subtotal);
		model.addAttribute("bom", bomList);
		return "user/bom/bomorder";
	}
	
	@RequestMapping(value = "1019/zai/xin/jian/adminShoujuBom")
	public String adminShoujuBom(@RequestParam(required = false) int bid,HttpSession session, Model model) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		BomOrder bomList=bomOrderService.selectByid(bid);
		if("2".equals(bomList.getBom_invoice())){
			BigDecimal b = new BigDecimal(bomList.getBom_price() / 1.06);
			bomList.setBom_price(b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue());
		}else if("3".equals(bomList.getBom_invoice())){
			BigDecimal b = new BigDecimal(bomList.getBom_price() / 1.17); 
			bomList.setBom_price(b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue());
		}
		if("自取".equals(bomList.getBom_kuaidi())){
			model.addAttribute("kuaidi", 0);
		} else if("申通".equals(bomList.getBom_kuaidi())){
			model.addAttribute("kuaidi", 10);
		} else if("圆通".equals(bomList.getBom_kuaidi())){
			model.addAttribute("kuaidi", 10);
		} else if("顺丰(省外)".equals(bomList.getBom_kuaidi())){
			model.addAttribute("kuaidi", 23);
		} else if("顺丰(省内)".equals(bomList.getBom_kuaidi())){
			model.addAttribute("kuaidi", 13);
		}else if("速尔快(广东省内)".equals(bomList.getBom_kuaidi())){
			model.addAttribute("kuaidi", 10);
		}else if("顺丰到付".equals(bomList.getBom_kuaidi())){
			model.addAttribute("kuaidi", 0);
		}
		model.addAttribute("yunfei", "运费");
		model.addAttribute("danwei", "个");
		model.addAttribute("dyshijian", new Date());
		model.addAttribute("bom", bomList);
		model.addAttribute("adminShoujubom", "adminShoujubom");
		return "admin/shoujubomdaying";
	}
	@RequestMapping(value = "1019/zai/xin/jian/adminShoujuBomxiugai")
	public String adminShoujuBomxiugai(@RequestParam(required = false) int bid,@RequestParam(required = false)Float yunfei,BomOrder b,HttpSession session, Model model) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		BomOrder bomList=bomOrderService.selectByid(bid);
		if("2".equals(bomList.getBom_invoice())){
			BigDecimal c = new BigDecimal(bomList.getBom_price() / 1.06);
			bomList.setBom_price(c.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue());
		}else if("3".equals(bomList.getBom_invoice())){
			BigDecimal c = new BigDecimal(bomList.getBom_price() / 1.17); 
			bomList.setBom_price(c.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue());
		}
		bomList.setBom_address(b.getBom_address());
		bomList.setBom_phone(b.getBom_phone());
		bomList.setBom_name(b.getBom_name());
		if("自取".equals(bomList.getBom_kuaidi())){
			BigDecimal a = new BigDecimal(bomList.getBom_price()+yunfei);
			bomList.setBom_price(a.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue());
		} else if("申通".equals(bomList.getBom_kuaidi())){
			BigDecimal a = new BigDecimal((bomList.getBom_price()-10)+yunfei);
			bomList.setBom_price(a.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue());
		} else if("圆通".equals(bomList.getBom_kuaidi())){
			BigDecimal a = new BigDecimal((bomList.getBom_price()-10)+yunfei);
			bomList.setBom_price(a.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue());
		} else if("顺丰(省外)".equals(bomList.getBom_kuaidi())){
			BigDecimal a = new BigDecimal((bomList.getBom_price()-23)+yunfei);
			bomList.setBom_price(a.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue());
		} else if("顺丰(省内)".equals(bomList.getBom_kuaidi())){
			BigDecimal a = new BigDecimal((bomList.getBom_price()-13)+yunfei);
			bomList.setBom_price(a.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue());
		}else if("速尔快(广东省内)".equals(bomList.getBom_kuaidi())){
			BigDecimal a = new BigDecimal((bomList.getBom_price()-10)+yunfei);
			bomList.setBom_price(a.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue());
		}else if("顺丰到付".equals(bomList.getBom_kuaidi())){
			BigDecimal a = new BigDecimal(bomList.getBom_price()+yunfei);
			bomList.setBom_price(a.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue());
		}
		model.addAttribute("yunfei", "运费");
		model.addAttribute("danwei", "个");
		model.addAttribute("kuaidi", yunfei);
		model.addAttribute("dyshijian", new Date());
		model.addAttribute("bom", bomList);
		model.addAttribute("adminShoujubom", "adminShoujubom");
		return "admin/shoujubomdaying";
	}
	
	@RequestMapping("1019/zai/xin/jian/adminprintBomKuai")
	public String adminprintBomKuai(BomOrder b,HttpSession session, Model model) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		BomOrder bomList=bomOrderService.selectByid(b.getBom_id());
		String[] sourceStrArray = bomList.getBom_address().split("-");
		String xiangxi=null;
		String province=null;
		String city=null;
		int s=sourceStrArray.length;
		if(s==2){
			for (int i = 0; i < sourceStrArray.length; i++) {
		    	if(i==0){
		    		province=sourceStrArray[i];
		    	}else if(i==1){
		    		xiangxi=sourceStrArray[i];
		    		city=StringUtils.substringBefore(xiangxi, "市"); 
		    		city=city+"市";
		    	}
			}
		}else{
			for (int i = 0; i < sourceStrArray.length; i++) {
		    	if(i==0){
		    		province=sourceStrArray[i];
		    	}else if(i==1){
		    		city=sourceStrArray[i];
		    	}else if(i==2){
		    		xiangxi=sourceStrArray[i];
		    	}
			}
		}
	    if(province.equals("北京市")){
	    	province=null;
	    	city="北京市";
	    }
	    model.addAttribute("city", city);
	    model.addAttribute("xiangxi", xiangxi);
	    model.addAttribute("province", province);
		model.addAttribute("bom", bomList);
		if("申通".equals(b.getBom_kuaidi())){
			return "admin/shentongprinBom";
		}else if("速尔快(广东省内)".equals(b.getBom_kuaidi())){
			return "admin/suerprintBom";
		}
		return "admin/admin-details";
	}
	
	@RequestMapping("1019/zai/xin/jian/bomorderprofit")
	public String deletePrimary(BomOrder e,HttpSession session, Model model){
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		bomOrderService.updateByPrimaryKeySelective(e);
		return "redirect:queryByBomId?id="+e.getBom_id();
	}
}
