package com.zikezhi.controller;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zikezhi.entity.Supplier;
import com.zikezhi.service.SupplierService;
import com.zikezhi.utils.UIDGenerator;

/**
 * 
 * @author ponder
 * @version 1.0
 * @Date 2016年9月8日
 * @Description: 添加供应商
 * 
 * @ClassName AddSupplier.java
 * 
 */

@Controller
public class AddSupplier {

	@Resource(name = "supplierService")
	private SupplierService supplierService;

	private Logger logger = Logger.getLogger(AddSupplier.class);

	@RequestMapping(value = "addSupplier", method = RequestMethod.POST)
	public String addSupplier(HttpServletRequest req, Supplier supplier,HttpSession session,Model model) {
		logger.info("com.zikezhi.controller.AddProduct.addSupplier ----------> start");

		/*String path = req.getSession().getServletContext().getRealPath("/files/supplier");*/
		/*if (supplierphotosFile.length != 0) {
			for (int i = 0; i < supplierphotosFile.length; i++) {
				supplier.setSupplierphotos(
						Upload.uploadFile(req, RandomUtil.getRandomFileName(), supplierphotosFile[i], path));
			}
		}
		if (qualificationFile.length != 0) {
			for (MultipartFile multipartFile : qualificationFile) {
				supplier.setQualification(
						Upload.uploadFile(req, RandomUtil.getRandomFileName(), multipartFile, path));
			}
		}
		if (supplierprefileFile.length != 0) {
			for (MultipartFile multipartFile : supplierprefileFile) {
				supplier.setSupplierprefile(
						Upload.uploadFile(req, RandomUtil.getRandomFileName(), multipartFile, path));
			}
		}*/
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			return "login";
		}
		if(supplier.getSupplieruuid()==null || supplier.getSupplieruuid().equals("")){
			if(supplier.getSuppliername()!=null){
				Pattern p = Pattern.compile("\\s*|\t|\r|\n");
		        Matcher m = p.matcher(supplier.getSuppliername());
		        supplier.setSuppliername(m.replaceAll(""));
		        supplier.setSuppliername(supplier.getSuppliername().toUpperCase().replace(" ", "").replace("_", "\\_").replace("%", "\\%"));
			}
			List<Supplier> supp=supplierService.seleSupplierByname(supplier.getSuppliername());
			if(supp.isEmpty()){
				supplier.setSupplier_uid(uid);
				// 得到UUID
				supplier.setSupplieruuid(UIDGenerator.getUUID());
				int i=supplierService.insertSelective(supplier);
				model.addAttribute("biaozi", "chenggong");
			}else{
				model.addAttribute("biaozi", "shibai");
			}
		}else{
			supplierService.updateByPrimaryKeySelective(supplier);
			model.addAttribute("biaozi", "chenggong");
		}
		Supplier s = supplierService.seleSupplierUid(uid);
		model.addAttribute("supplier", s);
		
		return "user/supplier/supplier";
	}

}
