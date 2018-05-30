package com.zikezhi.controller;

import com.zikezhi.entity.AdminZaiXinJian;
import com.zikezhi.entity.PImg;
import com.zikezhi.entity.PriceTrend;
import com.zikezhi.entity.Product;
import com.zikezhi.entity.Second;
import com.zikezhi.entity.Supplier;
import com.zikezhi.service.AdminZaiXinJianService;
import com.zikezhi.service.DiscountService;
import com.zikezhi.service.PImgService;
import com.zikezhi.service.PriceTrendService;
import com.zikezhi.service.ProductService;
import com.zikezhi.service.SecondService;
import com.zikezhi.service.SupplierService;
import com.zikezhi.utils.UIDGenerator;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 
 * @author ponder
 * @version 1.0
 * @Date 2016年9月2日
 * @Description: 添加产品
 * 
 * @ClassName AddProduct.java
 * 
 */

@Controller
@RequestMapping("1019/zai/xin/jian/")
public class AddProduct {

	@Resource(name = "productService")
	private ProductService productService;

	@Resource(name = "supplierService")
	private SupplierService supplierService;

	/*
	 * @Resource(name = "modelService") private ModelService modelService;
	 */

	@Resource(name = "discountService")
	private DiscountService discountService;

	@Resource(name = "pimgService")
	private PImgService pimgService;

	@Resource(name = "adminZaiXinJianService")
	private AdminZaiXinJianService adminZaiXinJianService;

	@Resource(name = "priceTrendService")
	private PriceTrendService priceTrendService;

	@Resource(name = "secondService")
	private SecondService SecondService;

	private Logger logger = Logger.getLogger(AddProduct.class);

	/**
	 * @Title AddProduct
	 * @param product
	 *            {@link com.zikezhi.entity.Product}
	 * @param req
	 *            {@link javax.servlet.http.HttpServletRequest}
	 * @Description: 将添加产品页面传输出过来的参数保存到数据库中
	 * @return 重定向到product页面，重新添加产品
	 * @throws IOException
	 */
	@RequestMapping(value = "addProduct", method = RequestMethod.POST)
	public String addProduct(Model model, Product product, PImg pimg, MultipartFile[] files, HttpServletRequest req,
			HttpSession session) throws IOException {
		logger.info("com.zikezhi.controller.AddProduct.addProduct start");
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		AdminZaiXinJian admin = (AdminZaiXinJian) session.getAttribute("user");
		// String path =
		// req.getSession().getServletContext().getRealPath("/files/product");
		// 得到UUID
		product.setProductuuid(UIDGenerator.getUUID());
		product.setQuality(1);
		product.setSupplieruuid("505a2498732f37d9ba9c1a9b0289dab9");
		product.setSupplier("样品商城");
		product.setP_data(admin.getAdmin_adminName());
		MultipartHttpServletRequest mult = (MultipartHttpServletRequest) req;
		// 获取文件
		MultipartFile file = mult.getFile("files");
		if (file != null) {
			String fileName = file.getOriginalFilename();
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			fileName = product.getProductuuid() + fileName;
			if ("jpg".equals(formatName) || "png".equals(formatName) || "jpeg".equals(formatName)) {
				File path = new File(req.getSession().getServletContext().getRealPath("/") + "upload");
				if (!path.exists()) {
					path.mkdirs();// 若不存在 ，则创建一个
				}
				FileOutputStream fos = new FileOutputStream(path + "/" + fileName);
				try {
					fos.write(file.getBytes());
				} catch (IOException e) {
					e.printStackTrace();
				}
				fos.flush();
				fos.close();
				pimg.setP_imgid(UIDGenerator.getUUID());
				pimg.setP_imgpid(product.getProductuuid());
				pimg.setP_imgname(fileName);
				pimg.setP_imgstauts("1");
				pimgService.insertPimg(pimg);
			}
		}
		if (product.getProduct_primary() != null && product.getProduct_primary().length() != 0) {
			String[] sourceStrArray = product.getProduct_primary().split(",");
			for (int i = 0; i < sourceStrArray.length; i++) {
				Second s = new Second();
				s.setSecond_name(product.getProductuuid());
				s.setSecond_primaryid(Integer.parseInt(sourceStrArray[i]));
				SecondService.insertSelective(s);
			}
		}
		productService.insertNoPepetition(product);
		PriceTrend pt = new PriceTrend();
		pt.setPt_pid(product.getProductuuid());
		pt.setPt_price(product.getPrice());
		pt.setPt_time(new Date());
		priceTrendService.insertSelective(pt);
		return "redirect:/1019/zai/xin/jian/queryAllProduct";
	}

	@RequestMapping("searchsupplier")
	@ResponseBody
	public Map<String, Object> searchSupplier(String keyword, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", 0);
		map.put("size", 10);
		map.put("keyword", keyword);
		List<Supplier> supplier = supplierService.list(map);
		Map<String, Object> modelMap = new HashMap<String, Object>();
		modelMap.put("supplier", supplier);
		modelMap.put("size", supplier.size());
		modelMap.put("success", "true");
		return modelMap;
	}

	@RequestMapping("1019/zai/xin/jian/addProductHistory")
	public String addProductHistory(HttpSession session, Model model) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		Map<String, Object> map = new HashMap<>();
		map.put("start", 0);
		map.put("size", 200);
		List<Product> list = productService.addProductHistory(map);
		model.addAttribute("product", list);
		return "addProductHistory";
	}

	@RequestMapping(value = "supplier")
	public String supplier() {
		return "addSupplier";
	}

}
