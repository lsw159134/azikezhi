package com.zikezhi.controller;

import com.alibaba.fastjson.JSON;
import com.zikezhi.entity.Product;
import com.zikezhi.entity.Supplier;
import com.zikezhi.entity.UserInfo;
import com.zikezhi.service.ProductService;
import com.zikezhi.service.SupplierService;
import com.zikezhi.service.UserInfoService;
import com.zikezhi.utils.MD5Generator;
import com.zikezhi.utils.UIDGenerator;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserSupplier {

	@Resource(name = "supplierService")
	private SupplierService supplierService;
	
	@Resource(name = "productService")
	private ProductService productService;
	
	@Resource(name = "userInfoService")
	private UserInfoService userInfoService;
	
	@SuppressWarnings("unused")
	@ResponseBody
	@RequestMapping("supplierUpload")
	public Map<String, Object> supplierUpload(Supplier supplier, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
//		String str = supplierService.selectSupplierName(supplier.getSuppliername());
		String str = null;
		if(str == null){
			//插入这个供应商,并将uid放到用户表中去
			supplier.setSupplieruuid(UIDGenerator.getUUID());
			session.setAttribute("supplieruid",supplier.getSupplieruuid());
			supplierService.insertSelective(supplier);
			//把这个供应商的数据放到用户表中
			UserInfo user = new UserInfo();
			user.setUseruid((String)session.getAttribute("uid"));
			user.setSupplieruid(supplier.getSupplieruuid());
			userInfoService.updateByPrimaryKeySelective(user);
			map.put("code", "0");
			map.put("supplieruid", supplier.getSupplieruuid());
			map.put("result", "成功");
			map.put("path","supplier-update");
		}else{
			//插入供应商，对这个供应商进行关联
			supplier.setSupplieruuid(str);
			session.setAttribute("supplieruid", str);
			//将这个供应商插入到用户表字段中
			UserInfo userInfo = new UserInfo();
			userInfo.setSupplieruid(str);
			userInfo.setUseruid((String)session.getAttribute("uid"));
			userInfoService.updateByPrimaryKeySelective(userInfo);
			supplierService.updateByPrimaryKeySelective(supplier);
			map.put("supplieruid", str);
			map.put("code", "1");
			map.put("result", "成功");
		}
		return map;
	}

	@SuppressWarnings("unused")
	@ResponseBody
	@RequestMapping("productUpload")
	public Map<String, Object> productUpload(@RequestBody String product, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();

		if (session.getAttribute("userName") == null){
			map.put("msg","没有登录,请刷新后重试!");
			return map;
		}

		try {
			product = URLDecoder.decode(product, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String str = product.substring(0, product.indexOf("&"));
		String count = str.replace("count=", "");
		product = product.replace(str+"&", "");
		str = product.substring(0, product.indexOf("&"));
		product = product.replace(str+"&", "");
		String level = str;

		String supplierUid = product.substring(0, product.indexOf("&"));
		str = product.substring(0, product.indexOf("&"));
		product = product.replace(str+"&product=", "");

		List<Product> addProductUpload = JSON.parseArray(product, Product.class);

		for (int i = 0; i < addProductUpload.size(); i++){
			if (addProductUpload.get(i).getPrice() == 0 || addProductUpload.get(i).getPrice().equals("0")) {
				map.put("msg","添加失败,价格不能为0!");
				return map;
			}
		}

		supplierUid = supplierUid.substring(supplierUid.indexOf("=")+1);

		int i = 0;
		Supplier supplier = supplierService.selectByPrimaryKey(supplierUid);
		for (int x = 0; x < addProductUpload.size(); x++) {
			addProductUpload.get(x).setProductuuid(UIDGenerator.getUUID());
			addProductUpload.get(x).setSupplieruuid(supplierUid);
			addProductUpload.get(x).setQq(supplier.getQq()==null?supplier.getQq():null);
			addProductUpload.get(x).setSupplier(supplier.getSuppliername());
			i = productService.insertSelective(addProductUpload.get(x));
		}
		if(i == 0){
			map.put("msg","添加失败,请刷新页面后再添加!");
			return map;
		}
		map.put("msg","添加成功	");
		return map;
	}
	
	@RequestMapping(value="supplierUpdate", method = RequestMethod.POST)
	public String supplierUpdate(Supplier supplier){
		supplierService.updateByPrimaryKey(supplier);
		return "redirect:/supplier-update";
	}


	@RequestMapping(value = "1019/zai/xin/jian/getPasswd", method = RequestMethod.GET)
	public String getPassword(Model model) {
		model.addAttribute("getUserPasswd", "getUserPasswd");
		return "adminHome";
	}

	@ResponseBody
	@RequestMapping(value = "1019/zai/xin/jian/getpassword", method = RequestMethod.POST)
	public Map<String, Object> getPassword(String telphone, Model model, HttpSession session) {

		Map<String, Object> resultMap = new HashMap<>();

		if(session.getAttribute("user")==null){
			resultMap.put("code", "-1");
			resultMap.put("msg", "更新失败,没有登录!");
			return resultMap;
		}

		if (telphone == null || telphone.equals("")) {
			resultMap.put("msg", "出错,请重新提交!");
			resultMap.put("code", "-1");
			return resultMap;
		}
		List<UserInfo> user = userInfoService.findUserByTelphone(telphone);
		if(user.size() == 0){
			resultMap.put("msg", "没有找到此用户!");
			resultMap.put("code", "-2");
			return resultMap;
		}
		resultMap.put("user", user);
		resultMap.put("msg", "成功");
		resultMap.put("code", "1");
		return resultMap;
	}

	@ResponseBody
	@RequestMapping(value = "1019/zai/xin/jian/updateUserPasswd", method = RequestMethod.POST)
	public Map<String, Object> getpasswordupdateUserPasswd(String uid, Model model, HttpSession session) {
		Map<String, Object> resultMap = new HashMap<>();

		if(session.getAttribute("user")==null){
			resultMap.put("code", "-1");
			resultMap.put("msg", "更新失败,没有登录!");
			return resultMap;
		}

		UserInfo user = new UserInfo();
		user.setUseruid(uid);
		user.setPassword(MD5Generator.getMD5("666666", uid));
		int i = userInfoService.updateByPrimaryKeySelective(user);
		if(i == 1){
			resultMap.put("code", "1");
			resultMap.put("msg", "更新成功");
			return resultMap;
		}
		resultMap.put("code", "-1");
		resultMap.put("msg", "更新失败");
		return resultMap;
	}
}
