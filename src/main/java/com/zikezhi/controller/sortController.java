package com.zikezhi.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.zikezhi.entity.Comments;
import com.zikezhi.entity.Discount;
import com.zikezhi.entity.PImg;
import com.zikezhi.entity.Page;
import com.zikezhi.entity.Product;
import com.zikezhi.entity.Search;
import com.zikezhi.entity.SearchTable;
import com.zikezhi.entity.Second;
import com.zikezhi.entity.Sort;
import com.zikezhi.entity.Supplier;
import com.zikezhi.entity.UserInfo;
import com.zikezhi.service.CartService;
import com.zikezhi.service.CommentsService;
import com.zikezhi.service.DiscountService;
import com.zikezhi.service.PImgService;
import com.zikezhi.service.PrimaryService;
import com.zikezhi.service.ProductService;
import com.zikezhi.service.SearchTableService;
import com.zikezhi.service.SecondService;
import com.zikezhi.service.SortService;
import com.zikezhi.service.SupplierService;
import com.zikezhi.service.UserInfoService;
import com.zikezhi.utils.GetIP;
import com.zikezhi.utils.PageBean;
import com.zikezhi.utils.UIDGenerator;

@Controller
public class sortController {
	@Resource(name = "productService")
	private ProductService productService;
	
	@Resource(name = "sortService")
	private SortService sortService;
	
	@Resource(name = "primaryService")
	private PrimaryService primaryService;
	
	@Resource(name = "pimgService")
	private PImgService pimgService;
	
	@Resource(name = "discountService")
    private DiscountService discountService;
	
	@Resource(name = "supplierService")
	private SupplierService supplierService;
	
	@Resource(name = "secondService")
	private SecondService secondService;
	
	@Resource(name = "userInfoService")
	private UserInfoService userInfoService;
	
	@Resource(name = "cartService")
	private CartService cartService;
	
	@Resource(name = "searchTableService")
	private SearchTableService searchTableService;
	
	@Resource(name = "commentsService")
	private CommentsService comments;
	
	private Logger logger = Logger.getLogger(AddProduct.class);
	
	//进入到选型指导页面
//	@RequestMapping("ST")
//	public String ST(Model model,@RequestParam(required = false) String page,
//								 @RequestParam(required = false) String rows) {
//		String sort_miaoshu = "ST,Cortex-M3";
//		Map<String,Object> map = new HashMap<String,Object>();
//		
//		PageBean pageBean;
//		if(page == null && rows == null){
//			pageBean=new PageBean(1,10);
//		}else{
//			pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
//		}
//		map.put("start", pageBean.getStart());
//		map.put("size", pageBean.getPageSize());
//		map.put("sort_miaoshu", sort_miaoshu);
//		
//		long total = productService.getTotalSort(map);
//		
//		List<Product> sortList = productService.sele_Sort(map);
//		pageBean.setTotal(Integer.parseInt(String.valueOf(total)));
//		System.out.println("total"+total);
//		model.addAttribute("sortList",sortList);
//		model.addAttribute("count", pageBean.getCount());
//		model.addAttribute("page",pageBean.getPage());
//		model.addAttribute("pageSize",pageBean.getPageSize());
//		model.addAttribute("total", total);
//		return "sortProduct/ST";
//	}
	
	//分类查询主页
	@RequestMapping("sortList")
	public String sele_Sort(@RequestParam(required = true) String sort_miaoshu,
			@RequestParam(required = false) String page,
			@RequestParam(required = false) String rows,
			@RequestParam(required = false) String sort_product,
			@RequestParam(required = false) String m,
			@RequestParam(required = false) String n,
			@RequestParam(required = false) String p,Model model,HttpSession session) {
		String uid = (String) session.getAttribute("uid");
		
		if(uid == null || uid == ""){
			session.setAttribute("url", "sortList?sort_miaoshu=ST");
			return "login";
		}
		PageBean pageBean;
		if(page == null && rows == null){
			pageBean=new PageBean(1,10);
		}else{
			pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("sort_miaoshu", sort_miaoshu);
		if(sort_product != null && sort_product != "" ){
			map.put("sort_product", sort_product);
			model.addAttribute("sort_product", sort_product);
		}
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		long total = sortService.getTotal_Sort(map);
		
		List<Sort> sortList = sortService.select_Sort(map);
		pageBean.setTotal(Integer.parseInt(String.valueOf(total)));
		model.addAttribute("sortList",sortList);
		model.addAttribute("sort_miaoshu", sort_miaoshu);
		model.addAttribute("m", m);
		model.addAttribute("n", n);
		model.addAttribute("p", p);
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page",pageBean.getPage());
		model.addAttribute("pageSize",pageBean.getPageSize());
		model.addAttribute("total", total);
		return "sortProduct/ST";
	}
	
	//进入到分类添加页面
	@RequestMapping(value="1019/zai/xin/jian/sortAdd",method = RequestMethod.GET)
	public String sortAdd(@RequestParam(required = true) String productuuid,
			@RequestParam(required = true) String product,
			@RequestParam(required = true) String encapsulation,Model model) {
		Product sortAdd = productService.sele_SortAdd(productuuid);
		model.addAttribute("productuuid", productuuid);
		model.addAttribute("product", product);
		model.addAttribute("encapsulation", encapsulation);
		model.addAttribute("sortAdd", sortAdd);
		return "sortProduct/sortAdd";
	}
	
	
	//进入到分类页面修改进数据库
	@RequestMapping(value="1019/zai/xin/jian/sort_update",method = RequestMethod.POST)
	public String sort_update(Product product) {
		productService.sort_update(product);
		return "redirect:/1019/zai/xin/jian/queryAllProduct";
	}
	
	/*
	 * 一个新的隔离添加分类
	 * 
	 */
	
	//进入到主页
	@RequestMapping("1019/zai/xin/jian/newSortList")
	public String select_Sort(@RequestParam(required = false) String page,
							  @RequestParam(required = false) String sort_product,
							  @RequestParam(required = false) String rows,Model model) {
		PageBean pageBean;
		if(page == null && rows == null){
			pageBean=new PageBean(1,10);
		}else{
			pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		map.put("sort_product",sort_product);
		long total = sortService.getTotal_Sort(map);
		
		List<Sort> sortList = sortService.select_Sort(map);
		pageBean.setTotal(Integer.parseInt(String.valueOf(total)));
		
		model.addAttribute("sortList",sortList);
		model.addAttribute("sort_product",sort_product);
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page",pageBean.getPage());
		model.addAttribute("pageSize",pageBean.getPageSize());
		model.addAttribute("total", total);
		return "sortProduct/newSortList";
	}
	
	//添加页面
		@RequestMapping("1019/zai/xin/jian/newSortAdd")
	public String newSortAdd() {
			return "sortProduct/newSortAdd";
		}
	
	//提交添加
	@RequestMapping(value="1019/zai/xin/jian/insert_Sort",method = RequestMethod.POST)
	public String insert_Sort(Sort sort) {
		String sort_miaoshu = sort.getSort_miaoshu();
		if(sort_miaoshu.contains("，")){
			sort_miaoshu = sort_miaoshu.replace('，',',');
		}
		sort_miaoshu = sort_miaoshu.trim();
		sort.setSort_miaoshu(sort_miaoshu);
		sortService.insert_Sort(sort);
		return "redirect:/1019/zai/xin/jian/newSortList";
	}
		
	//提交修改
	@RequestMapping(value="1019/zai/xin/jian/update_Sort",method = RequestMethod.POST)
	public String update_Sort(Sort sort) {
		sortService.update_Sort(sort);
		return "redirect:/1019/zai/xin/jian/newSortList";
	}
		
	//修改页面
	@RequestMapping("1019/zai/xin/jian/select_SortUpdate")
	public String select_SortUpdate(@RequestParam(required = true) String sort_id,Model model) {
		Sort sort = sortService.select_SortUpdate(sort_id);
		model.addAttribute("sort", sort);
		return "sortProduct/newSortUpdate";
	}
		
		
	
	/*
	 * 模块添加
	 *
	 */
	@RequestMapping("1019/zai/xin/jian/moduleList")
	public String moduleList(@RequestParam(required = false) String page,
							  @RequestParam(required = false) String product,
							  @RequestParam(required = false) String product_second,
							  @RequestParam(required = false) String rows,Model model) {
		String product_primary = "模块";
		
		PageBean pageBean;
		if(page == null && rows == null){
			pageBean=new PageBean(1,10);
		}else{
			pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		map.put("product",product);
		map.put("product_primary",product_primary);
		map.put("product_second",product_second);
		long total = productService.getTotal_Module(map);
		
		List<Product> moduleList = productService.select_module(map);
		
		pageBean.setTotal(Integer.parseInt(String.valueOf(total)));
		
		
		model.addAttribute("moduleList",moduleList);
		model.addAttribute("product",product);
		model.addAttribute("product_primary",product_primary);
		model.addAttribute("product_second",product_second);
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page",pageBean.getPage());
		model.addAttribute("pageSize",pageBean.getPageSize());
		model.addAttribute("total", total);
		return "sortProduct/moduleList";
	}
	
	@RequestMapping("1019/zai/xin/jian/addModule")
	public String addModule(Model model){
		model.addAttribute("addModule", "addModule");
		return "sortProduct/addModule";
	}
	
	@RequestMapping("1019/zai/xin/jian/select_updateModule")
	public String select_updateModule(@RequestParam(required = false) String productuuid,
											Model model){
		Product product = productService.selectByPrimaryKey(productuuid);
		// 得到在数据库中数据的条数,并分页
		long imgCount = pimgService.selectPimgCount(productuuid);
		List<PImg> pimgList = pimgService.selectPimg(productuuid);
		
		//将图片链接名称传到页面
		String imgStauts1;
		String imgStauts2;
		String imgStauts3;
		if(imgCount >= 1){
			imgStauts1 = pimgList.get(0).getP_imgname();
			model.addAttribute("imgStauts1", imgStauts1);
		}
		if(imgCount >1 && imgCount<=3){
			imgStauts2 = pimgList.get(1).getP_imgname();
			model.addAttribute("imgStauts2", imgStauts2);
		}
		if(imgCount == 3){
			imgStauts3 = pimgList.get(2).getP_imgname();
			model.addAttribute("imgStauts3", imgStauts3);
		}
		
		model.addAttribute("imgCount", imgCount);
		model.addAttribute("product", product);
		model.addAttribute("updateModule", "updateModule");
		return "adminHome";
	}
		
	@SuppressWarnings("resource")
	@RequestMapping(value = "1019/zai/xin/jian/updateModule")
	public String updateModule(@RequestParam(required = false)String d_id3,@RequestParam(required = false)String d_id2,@RequestParam(required = false)String d_id1,@RequestParam(required = false)Float price3,@RequestParam(required = false)Float price2,@RequestParam(required = false)Float price1,@RequestParam(required = false)String min1,@RequestParam(required = false)String max1,@RequestParam(required = false)String min2,@RequestParam(required = false)String max2,@RequestParam(required = false)String min3,@RequestParam(required = false)String discount_unit,
			MultipartFile[] files,Model model, Product product, HttpSession session,HttpServletRequest req) throws IOException{
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		product.setUptime(new Date());
		productService.updateByPrimaryKeySelective(product);
		if(d_id1!=null &&d_id1!=""){
			Discount discount =new Discount();
			discount.setDiscount_unit(discount_unit);
			discount.setDiscount_id(d_id1);
			discount.setDiscount_numbermax(Integer.parseInt(max1));
			discount.setDiscount_numbermin(Integer.parseInt(min1));
			discount.setDiscount_price(price1);
			discountService.updateByPrimaryKeySelective(discount);
		}
		if(d_id2!=null &&d_id2!=""){
			Discount discount =new Discount();
			discount.setDiscount_unit(discount_unit);
			discount.setDiscount_id(d_id2);
			discount.setDiscount_status("2");
			discount.setDiscount_numbermax(Integer.parseInt(max2));
			discount.setDiscount_numbermin(Integer.parseInt(min2));
			discount.setDiscount_price(price2);
			discountService.updateByPrimaryKeySelective(discount);
		}if(d_id3!=null &&d_id3!=""){
			Discount discount =new Discount();
			discount.setDiscount_unit(discount_unit);
			discount.setDiscount_id(d_id3);
			discount.setDiscount_status("3");
			discount.setDiscount_numbermax(0);
			discount.setDiscount_numbermin(Integer.parseInt(min3));
			discount.setDiscount_price(price3);
			discountService.updateByPrimaryKeySelective(discount);
		}
		if(d_id1==null){
			if(max1!=null && !max1.equals("")){
				Discount discount =new Discount();
				discount.setDiscount_unit(discount_unit);
				discount.setDiscount_pid(product.getProductuuid());
				discount.setDiscount_id(UIDGenerator.getUUID());
				discount.setDiscount_status("1");
				discount.setDiscount_date(new Date());
				discount.setDiscount_numbermax(Integer.parseInt(max1));
				discount.setDiscount_numbermin(Integer.parseInt(min1));
				discount.setDiscount_price(price1);
				discountService.insertSelective(discount);
			}
			if(max2!=null &&!max2.equals("")){
				Discount discount =new Discount();
				discount.setDiscount_unit(discount_unit);
				discount.setDiscount_pid(product.getProductuuid());
				discount.setDiscount_id(UIDGenerator.getUUID());
				discount.setDiscount_status("2");
				discount.setDiscount_date(new Date());
				discount.setDiscount_numbermax(Integer.parseInt(max2));
				discount.setDiscount_numbermin(Integer.parseInt(min2));
				discount.setDiscount_price(price2);
				discountService.insertSelective(discount);
			}if(min3!=null &&!min3.equals("")){
				Discount discount =new Discount();
				discount.setDiscount_unit(discount_unit);
				discount.setDiscount_pid(product.getProductuuid());
				discount.setDiscount_id(UIDGenerator.getUUID());
				discount.setDiscount_status("3");
				discount.setDiscount_date(new Date());
				discount.setDiscount_numbermax(0);
				discount.setDiscount_numbermin(Integer.parseInt(min3));
				discount.setDiscount_price(price3);
				discountService.insertSelective(discount);
			}
		}
		
		String pid = product.getProductuuid();
		List<PImg> pimgList = pimgService.selectPimg(pid);
		MultipartHttpServletRequest mult = (MultipartHttpServletRequest) req;
		//获取文件
		MultipartFile file1 = mult.getFile("img1");
		MultipartFile file2 = mult.getFile("img2");
		MultipartFile file3 = mult.getFile("img3");
		if( pimgList.size() == 0 ){
			if(file1 != null ){
				String fileName = file1.getOriginalFilename();
		 	    String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		 	    fileName = product.getProductuuid() + fileName; 
		 	    if("jpg".equals(formatName) || "png".equals(formatName) || "jpeg".equals(formatName)){
		 	    	File path = new File(req.getSession().getServletContext().getRealPath("/")+"upload");
			 		if(!path.exists()){
			 			path.mkdirs();//若不存在  ，则创建一个
			 		}
			 		FileOutputStream fos = new FileOutputStream(path+"/"+fileName);
			 		try {
			 			fos.write(file1.getBytes());
			 		} catch (IOException e) {
			 			e.printStackTrace();
			 		}
			 		fos.flush();
			 		fos.close();
			 		PImg pimg = new PImg();
			 		pimg.setP_imgid(UIDGenerator.getUUID());
			 		pimg.setP_imgpid(pid);
			 		pimg.setP_imgname(fileName);
			 		pimg.setP_imgstauts("1");
			 		pimgService.insertPimg(pimg);
		 	    }
			}
			if(file2 != null ){
	 			String fileName2 = file2.getOriginalFilename();
		 	    String formatName2 = fileName2.substring(fileName2.lastIndexOf(".")+1);
		 	    fileName2 = product.getProductuuid()+"_2"+ fileName2; 
		 	    if("jpg".equals(formatName2) || "png".equals(formatName2) || "jpeg".equals(formatName2)){
		 	    	File path = new File(req.getSession().getServletContext().getRealPath("/")+"upload");
			 		if(!path.exists()){
			 			path.mkdirs();//若不存在  ，则创建一个
			 		}
			 		FileOutputStream fos = new FileOutputStream(path+"/"+fileName2);
			 		try {
			 			fos.write(file2.getBytes());
			 		} catch (IOException e) {
			 			e.printStackTrace();
			 		}
			 			PImg pimg2 = new PImg();
				 		pimg2.setP_imgid(UIDGenerator.getUUID());
				 		pimg2.setP_imgpid(pid);
				 		pimg2.setP_imgname(fileName2);
				 		pimg2.setP_imgstauts("2");
				 		pimgService.insertPimg(pimg2);
		 	    }
	 		}
			if(file3 != null ){
	 			String fileName3 = file3.getOriginalFilename();
		 	    String formatName3 = fileName3.substring(fileName3.lastIndexOf(".")+1);
		 	    fileName3 = product.getProductuuid() +"_3"+ fileName3; 
		 	    if("jpg".equals(formatName3) || "png".equals(formatName3) || "jpeg".equals(formatName3)){
		 	    	File path = new File(req.getSession().getServletContext().getRealPath("/")+"upload");
			 		if(!path.exists()){
			 			path.mkdirs();//若不存在  ，则创建一个
			 		}
			 		FileOutputStream fos = new FileOutputStream(path+"/"+fileName3);
			 		try {
			 			fos.write(file3.getBytes());
			 		} catch (IOException e) {
			 			e.printStackTrace();
			 		}
			 			PImg pimg3 = new PImg();
				 		pimg3.setP_imgid(UIDGenerator.getUUID());
				 		pimg3.setP_imgpid(pid);
				 		pimg3.setP_imgname(fileName3);
				 		pimg3.setP_imgstauts("3");
				 		pimgService.insertPimg(pimg3);
		 	    }
	 		}
		}
		
		if( pimgList.size() >= 1 ){
			if(file1 != null ){
				String fileName = file1.getOriginalFilename();
		 	    String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		 	    fileName = pid + fileName; 
		 	    
		 	    //获取原图片地址  删除
		 	    String fileNameOne = pimgList.get(0).getP_imgname();
		 	    
		 	    if("jpg".equals(formatName) || "png".equals(formatName) || "jpeg".equals(formatName)){
		 	    	File path = new File(req.getSession().getServletContext().getRealPath("/")+"upload");
		 	    	delete(new File(path+"/"+fileNameOne)); 
			 		if(!path.exists()){
			 			path.mkdirs();//若不存在  ，则创建一个
			 		}
			 		FileOutputStream fos = new FileOutputStream(path+"/"+fileName);
			 		try {
			 			fos.write(file1.getBytes());
			 		} catch (IOException e) {
			 			e.printStackTrace();
			 		}
				 		fos.flush();
				 		fos.close();
				 		PImg pimg = new PImg();
				 		pimg.setP_imgid(pimgList.get(0).getP_imgid());
				 		pimg.setP_imgname(fileName);
				 		pimgService.updatePimgById(pimg);
			 	}
		 	 }
			if( pimgList.size() == 1 ){
		 		if(file2 != null){
		 			String fileName2 = file2.getOriginalFilename();
			 	    String formatName2 = fileName2.substring(fileName2.lastIndexOf(".")+1);
			 	    fileName2 = pid+"_2"+ fileName2; 
			 	    if("jpg".equals(formatName2) || "png".equals(formatName2) || "jpeg".equals(formatName2)){
			 	    	File path = new File(req.getSession().getServletContext().getRealPath("/")+"upload");
				 		if(!path.exists()){
				 			path.mkdirs();//若不存在  ，则创建一个
				 		}
				 		FileOutputStream fos = new FileOutputStream(path+"/"+fileName2);
				 		try {
				 			fos.write(file2.getBytes());
				 		} catch (IOException e) {
				 			e.printStackTrace();
				 		}
				 			PImg pimg2 = new PImg();
					 		pimg2.setP_imgid(UIDGenerator.getUUID());
					 		pimg2.setP_imgpid(pid);
					 		pimg2.setP_imgname(fileName2);
					 		pimg2.setP_imgstauts("2");
					 		pimgService.insertPimg(pimg2);
			 	    }
		 		}
		 		
		 		if(file3 != null ){
		 			String fileName3 = file3.getOriginalFilename();
			 	    String formatName3 = fileName3.substring(fileName3.lastIndexOf(".")+1);
			 	    fileName3 = pid +"_3"+ fileName3; 
			 	    if("jpg".equals(formatName3) || "png".equals(formatName3) || "jpeg".equals(formatName3)){
			 	    	File path = new File(req.getSession().getServletContext().getRealPath("/")+"upload");
				 		if(!path.exists()){
				 			path.mkdirs();//若不存在  ，则创建一个
				 		}
				 		FileOutputStream fos = new FileOutputStream(path+"/"+fileName3);
				 		try {
				 			fos.write(file3.getBytes());
				 		} catch (IOException e) {
				 			e.printStackTrace();
				 		}
				 			PImg pimg3 = new PImg();
					 		pimg3.setP_imgid(UIDGenerator.getUUID());
					 		pimg3.setP_imgpid(pid);
					 		pimg3.setP_imgname(fileName3);
					 		pimg3.setP_imgstauts("3");
					 		pimgService.insertPimg(pimg3);
			 	    }
		 		}
		 	    
		 	 } 
			if( pimgList.size() == 2 ){
		 		if(file3 != null ){
		 			String fileName3 = file3.getOriginalFilename();
			 	    String formatName3 = fileName3.substring(fileName3.lastIndexOf(".")+1);
			 	    fileName3 = pid +"_3"+ fileName3; 
			 	    if("jpg".equals(formatName3) || "png".equals(formatName3) || "jpeg".equals(formatName3)){
			 	    	File path = new File(req.getSession().getServletContext().getRealPath("/")+"upload");
				 		if(!path.exists()){
				 			path.mkdirs();//若不存在  ，则创建一个
				 		}
				 		FileOutputStream fos = new FileOutputStream(path+"/"+fileName3);
				 		try {
				 			fos.write(file3.getBytes());
				 		} catch (IOException e) {
				 			e.printStackTrace();
				 		}
				 			PImg pimg3 = new PImg();
					 		pimg3.setP_imgid(UIDGenerator.getUUID());
					 		pimg3.setP_imgpid(pid);
					 		pimg3.setP_imgname(fileName3);
					 		pimg3.setP_imgstauts("3");
					 		pimgService.insertPimg(pimg3);
			 	    }
		 		}
			}
		}
		if( pimgList.size() > 1 &&  pimgList.size() <= 3 ){
			if(file2 != null ){
				String fileName2 = file2.getOriginalFilename();
		 	    String formatName2 = fileName2.substring(fileName2.lastIndexOf(".")+1);
		 	    fileName2 = pid+"_2"+ fileName2; 
		 	    
		 	    //获取原图片地址  删除
		 	    String fileNameTwo = pimgList.get(1).getP_imgname();
		 	    
		 	    if("jpg".equals(formatName2) || "png".equals(formatName2) || "jpeg".equals(formatName2)){
		 	    	File path = new File(req.getSession().getServletContext().getRealPath("/")+"upload");
		 	    	delete(new File(path+"/"+fileNameTwo));
		 	    	
			 		if(!path.exists()){
			 			path.mkdirs();//若不存在  ，则创建一个
			 		}
			 		FileOutputStream fos = new FileOutputStream(path+"/"+fileName2);
			 		try {
			 			fos.write(file2.getBytes());
			 		} catch (IOException e) {
			 			e.printStackTrace();
			 		}
				 		fos.flush();
				 		fos.close();
				 		PImg pimg2 = new PImg();
				 		pimg2.setP_imgid(pimgList.get(1).getP_imgid());
				 		pimg2.setP_imgname(fileName2);
				 		pimgService.updatePimgById(pimg2);
			 	}
		 	 }
		}
		if( pimgList.size() == 3 ){
			if(file3 != null ){ 
				String fileName3 = file3.getOriginalFilename();
		 	    String formatName3 = fileName3.substring(fileName3.lastIndexOf(".")+1);
		 	    fileName3 = pid+"_3"+ fileName3; 
		 	    
		 	    //获取原图片地址  删除
		 	    String fileNameThree = pimgList.get(2).getP_imgname();
		 	    
		 	    if("jpg".equals(formatName3) || "png".equals(formatName3) || "jpeg".equals(formatName3)){
		 	    	File path = new File(req.getSession().getServletContext().getRealPath("/")+"upload");
		 	    	delete(new File(path+"/"+fileNameThree));
		 	    	
			 		if(!path.exists()){
			 			path.mkdirs();//若不存在  ，则创建一个
			 		}
			 		FileOutputStream fos = new FileOutputStream(path+"/"+fileName3);
			 		try {
			 			fos.write(file3.getBytes());
			 		} catch (IOException e) {
			 			e.printStackTrace();
			 		}
				 		fos.flush();
				 		fos.close();
				 		PImg pimg3 = new PImg();
				 		pimg3.setP_imgid(pimgList.get(2).getP_imgid());
				 		pimg3.setP_imgname(fileName3);
				 		pimgService.updatePimgById(pimg3);
			 	}
		 	 }
		}
		return "redirect:/1019/zai/xin/jian/moduleList";
	}
		
	@RequestMapping(value="1019/zai/xin/jian/module_add",method= RequestMethod.POST)
	public String addProduct(@RequestParam(required = false)Float price3,
			@RequestParam(required = false)Float price2,
			@RequestParam(required = false)Float price1,
			@RequestParam(required = false)String min1,
			@RequestParam(required = false)String max1,
			@RequestParam(required = false)String min2,
			@RequestParam(required = false)String max2,
			@RequestParam(required = false)String min3,
			@RequestParam(required = false)String discount_unit,
			Product product,PImg pimg, MultipartFile[] files, HttpServletRequest req) throws IOException {
		logger.info("com.zikezhi.controller.AddProduct.addProduct start");
		//String path = req.getSession().getServletContext().getRealPath("/files/product");
		// 得到UUID
		product.setProductuuid(UIDGenerator.getUUID());
		product.setSupplier("正品商城");
		String supplierid=supplierService.selectSupplierName(product.getSupplier());
		product.setSupplieruuid(supplierid);
		product.setQuality(1);
		
		
		MultipartHttpServletRequest mult = (MultipartHttpServletRequest) req;
		//获取文件
		MultipartFile file = mult.getFile("files");
		if(file != null){
			String fileName = file.getOriginalFilename();
	 	    String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
	 	    fileName = product.getProductuuid() + fileName; 
	 	    if("jpg".equals(formatName) || "png".equals(formatName) || "jpeg".equals(formatName)){
	 	    	File path = new File(req.getSession().getServletContext().getRealPath("/")+"upload");
		 		if(!path.exists()){
		 			path.mkdirs();//若不存在  ，则创建一个
		 		}
		 		FileOutputStream fos = new FileOutputStream(path+"/"+fileName);
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
	   
		
		// 第一个是图片，第二个是文件
//		for (int i = 0; i < files.length; i++) {
//			if (i == 0) {
//				product.setImage(Upload.uploadFile(req, product.getProductuuid(), files[i], path + "/images"));
//			} else {
//				product.setDocument(Upload.uploadFile(req, product.getProductuuid(), files[i], path+ "/files"));
//			}
//		}
	 		
		productService.insertSelective(product);
		if(min1!=null &&min1!=""){
			Discount discount =new Discount();
			discount.setDiscount_unit(discount_unit);
			discount.setDiscount_pid(product.getProductuuid());
			discount.setDiscount_id(UIDGenerator.getUUID());
			discount.setDiscount_status("1");
			discount.setDiscount_date(new Date());
			discount.setDiscount_numbermax(Integer.parseInt(max1));
			discount.setDiscount_numbermin(Integer.parseInt(min1));
			discount.setDiscount_price(price1);
			discountService.insertSelective(discount);
		}
		if(min2!=null &&min2!=""){
			Discount discount =new Discount();
			discount.setDiscount_unit(discount_unit);
			discount.setDiscount_pid(product.getProductuuid());
			discount.setDiscount_id(UIDGenerator.getUUID());
			discount.setDiscount_status("2");
			discount.setDiscount_date(new Date());
			discount.setDiscount_numbermax(Integer.parseInt(max2));
			discount.setDiscount_numbermin(Integer.parseInt(min2));
			discount.setDiscount_price(price2);
			discountService.insertSelective(discount);
		}if(min3!=null &&min3!=""){
			Discount discount =new Discount();
			discount.setDiscount_unit(discount_unit);
			discount.setDiscount_pid(product.getProductuuid());
			discount.setDiscount_id(UIDGenerator.getUUID());
			discount.setDiscount_status("3");
			discount.setDiscount_date(new Date());
			discount.setDiscount_numbermax(0);
			discount.setDiscount_numbermin(Integer.parseInt(min3));
			discount.setDiscount_price(price3);
			discountService.insertSelective(discount);
		}
		return "redirect:/1019/zai/xin/jian/moduleList";
	}
		
	public static void delete(File f) {  
        if(f.isDirectory()){  
            File[] files = f.listFiles();  
            for (File file : files) {  
                delete(file);  
                file.delete();  
            }  
        }  
        f.delete();  
    }
	
	@RequestMapping("module")
	public String module(@RequestParam(required = false) String page,
							  @RequestParam(required = false) String product,
							  @RequestParam(required = false) String product_second,
							  @RequestParam(required = false) String rows,Model model,HttpSession session) {
		String product_primary = "模块";
		
		
		String uid = (String)session.getAttribute("uid");
		if(uid == null || uid == ""){
			if(product_second != null && product_second != ""){
				session.setAttribute("url", "module?product_second="+product_second);
			}
			if(product!= null && product != ""){
				session.setAttribute("url", "module?product="+product);
			}
			if(product_second != null && product_second != "" && product!= null && product != ""){
				session.setAttribute("url", "module?product_second="+product_second+"&&product="+product);
			}
			if(product_second == null && product == null ){
				session.setAttribute("url", "module");
			}
		}
		
		
		PageBean pageBean;
		if(page == null && rows == null){
			pageBean=new PageBean(1,12);
		}else{
			pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		map.put("product",product);
		map.put("product_primary",product_primary);
		map.put("product_second",product_second); 
		long total = productService.getTotal_Module(map);
		
		List<Second> secondList = secondService.select_second_name(product_primary);
		List<Product> moduleList = productService.select_module(map);
		
		pageBean.setTotal(Integer.parseInt(String.valueOf(total)));
		
		model.addAttribute("secondList",secondList);
		model.addAttribute("moduleList",moduleList);
		model.addAttribute("product",product);
		model.addAttribute("product_primary",product_primary);
		model.addAttribute("product_second",product_second);
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page",pageBean.getPage());
		model.addAttribute("pageSize",pageBean.getPageSize());
		model.addAttribute("total", total);
		return "sortProduct/module";
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("module_detail")
	public String module_detail(@RequestParam(required = false) String productuuid,
								@RequestParam(required = false) String module_product,
			 					@RequestParam(required = false) String product_primary,
			 					@RequestParam(required = false) String product_second,
			 					Model model,HttpSession session){
		
		String uid = (String)session.getAttribute("uid");
		if(uid == null || uid == ""){
			if(product_second != null && product_second != ""){
				session.setAttribute("url", "module_detail?productuuid="+productuuid+"&&module_product="+module_product+"&&product_primary="+product_primary+"&&product_second="+product_second);
			}else{
				session.setAttribute("url", "module_detail?productuuid="+productuuid+"&&module_product="+module_product+"&&product_primary="+product_primary);
			}
		}
		
		Product product = productService.selectByPrimaryKey(productuuid);
		String document = product.getDocument();
		if(document != null && document != ""){
			String stringarray[] = document.split("\n");
			List documentList = new ArrayList();
			for (int i = 0; i < stringarray.length; i++) {
				documentList.add(stringarray[i]);
			}
			model.addAttribute("documentList", documentList);
		}
		// 得到在数据库中数据的条数,并分页
		long imgCount = pimgService.selectPimgCount(productuuid);
		List<PImg> pimgList = pimgService.selectPimg(productuuid);
		
		 Random random = new Random();
		 int ran = random.nextInt(200 - (100) + 1) + (100);
         
		//将图片链接名称传到页面
		String imgStauts1;
		String imgStauts2;
		String imgStauts3;
		if(imgCount >= 1){
			imgStauts1 = pimgList.get(0).getP_imgname();
			model.addAttribute("imgStauts1", imgStauts1);
		}
		if(imgCount >1 && imgCount<=3){
			imgStauts2 = pimgList.get(1).getP_imgname();
			model.addAttribute("imgStauts2", imgStauts2);
		}
		if(imgCount == 3){
			imgStauts3 = pimgList.get(2).getP_imgname();
			model.addAttribute("imgStauts3", imgStauts3);
		}
		
		model.addAttribute("product", product);
		model.addAttribute("ran", ran);
		model.addAttribute("module_product", module_product);
		model.addAttribute("product_primary",product_primary);
		model.addAttribute("product_second",product_second);
		return "sortProduct/module_detail";
	}
	
	@RequestMapping(value="indexSeleSecond",method = RequestMethod.POST)
	@ResponseBody
	public List<Second> indexSeleSecond(String primary_name){
		List<Second> secondList = secondService.select_second_name(primary_name);
		return secondList;
	}
	
	
	@RequestMapping(value = "shaixuanen")
	public String shaixuanen(@RequestParam(required = false)String encapsulation,@RequestParam(required = false)String keyword, Integer page, String value, Model model, HttpServletRequest req, HttpSession session) {
		
		logger.info("com.zikezhi.controller.IndexController.searchProduct start");
		Map<String, Object> map = new HashMap<>();
		
		String uidCart = (String) session.getAttribute("uid");
		if(uidCart != null){
			//获取购物车总数
			Long carCount = cartService.countCart(uidCart);
			model.addAttribute("carCount",carCount);
		}else{
			int s=searchTableService.queryBycount(GetIP.getIP(req));
			//int s=101;
			if(s>50){
				model.addAttribute("search","超过搜索");
				return "login";
			}
		}
		
		if( keyword==null || keyword == ""){
			return "404";
		}
		if( keyword!=null && keyword != "" ){
			Pattern p = Pattern.compile("[\u4e00-\u9fa5]");
	        Matcher m = p.matcher(keyword);
		        if (m.find()) {
		        	if (keyword.trim().length() <= 1 || keyword.trim().length() >= 30) {
		        		return "404";
		        	}
		        }else{
		        	if (keyword.trim().length() <= 2 || keyword.trim().length() >= 30) {
						return "404";
					}
		        }
		        
			keyword = keyword.toUpperCase().replace(" ", "").replace("_", "\\_").replace("%", "\\%");
			// 防止sql注入
			keyword = StringEscapeUtils.escapeSql(keyword);
			// 每一页输出的数据条数，并将值放到map中
			Search search = new Search(keyword, value);
			map.put("keyword", search.getKeyword());
			map.put("tableName", search.getTableName());
		}
		
		map.put("keyword",keyword);
		
		if( encapsulation != null && encapsulation != "" ){
			map.put("encapsulation",encapsulation);
			model.addAttribute("encapsulation", encapsulation);
		}else{
			return "404";
		}
			
		List encapsulationList = productService.seleEncapsulation(map);
		List manufacturerList = productService.seleManufacturer(map);
		int enSize = encapsulationList.size();
		int maSize = manufacturerList.size();
		
		model.addAttribute("encapsulationList", encapsulationList);
		model.addAttribute("manufacturerList", manufacturerList);
		model.addAttribute("enSize", enSize);
		model.addAttribute("maSize", maSize);
		
		String backUrl=req.getRequestURI();
		String[] sourceStrArray = backUrl.split("/");
		String url3=null;
		for (int i = 0; i < sourceStrArray.length; i++) {
	    	if(i==1){
	    		url3=sourceStrArray[i];
	    	}
		}
		if(value==null){
			value="product";
			page=1;
		}
		session.setAttribute("url", url3+"?keyword="+keyword+"&value="+value+"&page="+page);
		Page pageEntity = new Page(page, 20);
		if (page == null) {
			page = 1;
		}
		if (value == null || value.equals("")) {
			value = "product";
		}
		map.put("start", pageEntity.getStart());
		map.put("size", pageEntity.getPageSize());
		String uid = (String) session.getAttribute("uid");
		UserInfo user = new UserInfo();
		if (uid != null && uid.length() == 32) {
			userInfoService.updateCountSearch(uid);
			//得到用户信息
			user = userInfoService.selectByPrimaryKey(uid);
		}
		// 记录搜索记录 ip/关键字
		SearchTable searchT = new SearchTable();
		searchT.setContent(keyword);
		searchT.setIp(GetIP.getIP(req));
		searchT.setSearchuuid(UIDGenerator.getUUID());
		searchTableService.insertSelective(searchT);
		List<Product> product = productService.shaixuanList(map);
		// 得到在数据库中，带有关键字的表
		Long pageCount = productService.getshaixuanTotal(map);
		int pageSize = (int) Math.ceil(pageCount / 20.0);
		if (pageSize == 0) {
			return "redirect:/404";
		}
		//反馈随机码
		String fankuiPid = UIDGenerator.getUUID();
		model.addAttribute("currentPage", page);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("product", product);
		model.addAttribute("keyword", keyword);
		model.addAttribute("page", page);
		model.addAttribute("value", value);
		model.addAttribute("user", user);
		model.addAttribute("fankuiPid", fankuiPid);
		return "shaixuanen";
	}
	
	@RequestMapping(value = "shaixuanma")
	public String shaixuanma(@RequestParam(required = false)String manufacturer,@RequestParam(required = false)String keyword, Integer page, String value, Model model, HttpServletRequest req, HttpSession session) {
		
		logger.info("com.zaixinjian.controller.IndexController.searchProduct start");
		Map<String, Object> map = new HashMap<>();
		
		String uidCart = (String) session.getAttribute("uid");
		if(uidCart != null){
			//获取购物车总数
			Long carCount = cartService.countCart(uidCart);
			model.addAttribute("carCount",carCount);
		}else{
			int s=searchTableService.queryBycount(GetIP.getIP(req));
			//int s=101;
			if(s>50){
				model.addAttribute("search","超过搜索");
				return "login";
			}
		}
		
		if( keyword == null || keyword == "" ){
			return "404";
		}
		if( keyword != null && keyword != "" ){
			Pattern p = Pattern.compile("[\u4e00-\u9fa5]");
	        Matcher m = p.matcher(keyword);
		        if (m.find()) {
		        	if (keyword.trim().length() <= 1 || keyword.trim().length() >= 30) {
		        		return "404";
		        	}
		        }else{
		        	if (keyword.trim().length() <= 2 || keyword.trim().length() >= 30) {
						return "404";
					}
		        }
		        
			keyword = keyword.toUpperCase().replace(" ", "").replace("_", "\\_").replace("%", "\\%");
			// 防止sql注入
			keyword = StringEscapeUtils.escapeSql(keyword);
			// 每一页输出的数据条数，并将值放到map中
			Search search = new Search(keyword, value);
			map.put("keyword", search.getKeyword());
			map.put("tableName", search.getTableName());
		}
		
		map.put("keyword",keyword);
		
		if( manufacturer != null && manufacturer != "" ){
			map.put("manufacturer",manufacturer);
			model.addAttribute("manufacturer", manufacturer);
		}else{
			return "404";
		}
			
		List encapsulationList = productService.seleEncapsulation(map);
		List manufacturerList = productService.seleManufacturer(map);
		int enSize = encapsulationList.size();
		int maSize = manufacturerList.size();
		
		model.addAttribute("encapsulationList", encapsulationList);
		model.addAttribute("manufacturerList", manufacturerList);
		model.addAttribute("enSize", enSize);
		model.addAttribute("maSize", maSize);
		
		
		
		String backUrl=req.getRequestURI();
		String[] sourceStrArray = backUrl.split("/");
		String url3=null;
		for (int i = 0; i < sourceStrArray.length; i++) {
	    	if(i==1){
	    		url3=sourceStrArray[i];
	    	}
		}
		if(value==null){
			value="product";
			page=1;
		}
		session.setAttribute("url", url3+"?keyword="+keyword+"&value="+value+"&page="+page);
		Page pageEntity = new Page(page, 20);
		
		
		if (page == null) {
			page = 1;
		}
		if (value == null || value.equals("")) {
			value = "product";
		}
		map.put("start", pageEntity.getStart());
		map.put("size", pageEntity.getPageSize());
		String uid = (String) session.getAttribute("uid");
		UserInfo user = new UserInfo();
		if (uid != null && uid.length() == 32) {
			userInfoService.updateCountSearch(uid);
			//得到用户信息
			user = userInfoService.selectByPrimaryKey(uid);
		}

		// 记录搜索记录 ip/关键字
		SearchTable searchT = new SearchTable();
		searchT.setContent(keyword);
		
		searchT.setIp(GetIP.getIP(req));
		searchT.setSearchuuid(UIDGenerator.getUUID());
		searchTableService.insertSelective(searchT);

		List<Product> product = productService.shaixuanList(map);
		
		// 得到在数据库中，带有关键字的表
		Long pageCount = productService.getshaixuanTotal(map);
		int pageSize = (int) Math.ceil(pageCount / 20.0);
		if (pageSize == 0) {
			return "redirect:/404";
		}
		
		//反馈随机码
		String fankuiPid = UIDGenerator.getUUID();
		
		model.addAttribute("currentPage", page);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("product", product);
		model.addAttribute("keyword", keyword);
		model.addAttribute("page", page);
		model.addAttribute("value", value);
		model.addAttribute("user", user);
		model.addAttribute("fankuiPid", fankuiPid);
		return "shaixuanma";
	}
	
	@RequestMapping(value = "shaixuanenma")
	public String shaixuanenma(@RequestParam(required = false)String encapsulation,@RequestParam(required = false)String manufacturer,@RequestParam(required = false)String keyword, Integer page, String value, Model model, HttpServletRequest req, HttpSession session) {
		
		logger.info("com.zaixinjian.controller.IndexController.searchProduct start");
		Map<String, Object> map = new HashMap<>();
		
		String uidCart = (String) session.getAttribute("uid");
		if(uidCart != null){
			//获取购物车总数
			Long carCount = cartService.countCart(uidCart);
			model.addAttribute("carCount",carCount);
		}else{
			int s=searchTableService.queryBycount(GetIP.getIP(req));
			//int s=101;
			if(s>50){
				model.addAttribute("search","超过搜索");
				return "login";
			}
		}
		
		if( keyword == null || keyword == "" ){
			return "404";
		}
		if( keyword != null && keyword != "" ){
			Pattern p = Pattern.compile("[\u4e00-\u9fa5]");
	        Matcher m = p.matcher(keyword);
		        if (m.find()) {
		        	if (keyword.trim().length() <= 1 || keyword.trim().length() >= 30) {
		        		return "404";
		        	}
		        }else{
		        	if (keyword.trim().length() <= 2 || keyword.trim().length() >= 30) {
						return "404";
					}
		        }
		        
			keyword = keyword.toUpperCase().replace(" ", "").replace("_", "\\_").replace("%", "\\%");
			// 防止sql注入
			keyword = StringEscapeUtils.escapeSql(keyword);
			// 每一页输出的数据条数，并将值放到map中
			Search search = new Search(keyword, value);
			map.put("keyword", search.getKeyword());
			map.put("tableName", search.getTableName());
		}
		
		
		map.put("keyword",keyword);
		
		if( encapsulation != null && encapsulation != "" && manufacturer != null && manufacturer != "" ){
			map.put("encapsulation",encapsulation);
			map.put("manufacturer",manufacturer);
		}else{
			return "404";
		}
		
		model.addAttribute("manufacturer", manufacturer);
		model.addAttribute("encapsulation", encapsulation);
			
		List encapsulationList = productService.seleEncapsulation(map);
		List manufacturerList = productService.seleManufacturer(map);
		int enSize = encapsulationList.size();
		int maSize = manufacturerList.size();
		
		model.addAttribute("encapsulationList", encapsulationList);
		model.addAttribute("manufacturerList", manufacturerList);
		model.addAttribute("enSize", enSize);
		model.addAttribute("maSize", maSize);
		
		
		
		String backUrl=req.getRequestURI();
		String[] sourceStrArray = backUrl.split("/");
		String url3=null;
		for (int i = 0; i < sourceStrArray.length; i++) {
	    	if(i==1){
	    		url3=sourceStrArray[i];
	    	}
		}
		if(value==null){
			value="product";
			page=1;
		}
		session.setAttribute("url", url3+"?keyword="+keyword+"&value="+value+"&page="+page);
		Page pageEntity = new Page(page, 20);
		
		
		if (page == null) {
			page = 1;
		}
		if (value == null || value.equals("")) {
			value = "product";
		}
		map.put("start", pageEntity.getStart());
		map.put("size", pageEntity.getPageSize());
		String uid = (String) session.getAttribute("uid");
		UserInfo user = new UserInfo();
		if (uid != null && uid.length() == 32) {
			userInfoService.updateCountSearch(uid);
			//得到用户信息
			user = userInfoService.selectByPrimaryKey(uid);
		}

		// 将所有的产品取出来
		// 记录搜索记录 ip/关键字
		SearchTable searchT = new SearchTable();
		searchT.setContent(keyword);
		searchT.setIp(GetIP.getIP(req));
		searchT.setSearchuuid(UIDGenerator.getUUID());
		searchTableService.insertSelective(searchT);

		List<Product> product = productService.shaixuanList(map);
		
		// 得到在数据库中，带有关键字的表
		Long pageCount = productService.getshaixuanTotal(map);
		int pageSize = (int) Math.ceil(pageCount / 20.0);
		if (pageSize == 0) {
			return "redirect:/404";
		}
		
		//反馈随机码
		String fankuiPid = UIDGenerator.getUUID();
		
		model.addAttribute("currentPage", page);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("product", product);
		model.addAttribute("keyword", keyword);
		model.addAttribute("page", page);
		model.addAttribute("value", value);
		model.addAttribute("user", user);
		model.addAttribute("fankuiPid", fankuiPid);
		return "shaixuanenma";
	}
	
	@RequestMapping(value = "shaixuanse")
	public String shaixuanse1(@RequestParam(required = false)String brand_name, Integer page, String value, Model model, HttpServletRequest req, HttpSession session) {
		logger.info("com.zikezhi.controller.IndexController.searchProduct start");
		Map<String, Object> map = new HashMap<>();
		String uidCart = (String) session.getAttribute("uid");
		if(uidCart != null){
			//获取购物车总数
			Long carCount = cartService.countCart(uidCart);
			model.addAttribute("carCount",carCount);
		}else{
			int s=searchTableService.queryBycount(GetIP.getIP(req));
			//int s=101;
			if(s>50){
				model.addAttribute("search","超过搜索");
				return "login";
			}
		}
		if(brand_name != null && brand_name != ""){
			map.put("manufacturer",brand_name);
			model.addAttribute("manufacturer", brand_name);
		}else{
			return "404";
		}
		
		List encapsulationList = productService.seleEncapsulation(map);
		//List manufacturerList = productService.seleManufacturer(map);
		
		
		int enSize = encapsulationList.size();
		//int maSize = manufacturerList.size();
		model.addAttribute("encapsulationList", encapsulationList);
		//model.addAttribute("manufacturerList", manufacturerList);
		model.addAttribute("enSize", enSize);
		//model.addAttribute("maSize", maSize);
	
		
		
		String backUrl=req.getRequestURI();
		String[] sourceStrArray = backUrl.split("/");
		String url3=null;
		for (int i = 0; i < sourceStrArray.length; i++) {
	    	if(i==1){
	    		url3=sourceStrArray[i];
	    	}
		}
		if (page == null) {
			page = 1;
		}
		Page pageEntity = new Page(page, 20);
		if (value == null || value.equals("")) {
			value = "product";
		}
		map.put("start", pageEntity.getStart());
		map.put("size", pageEntity.getPageSize());
		String uid = (String) session.getAttribute("uid");
		UserInfo user = new UserInfo();
		if (uid != null && uid.length() == 32) {
			userInfoService.updateCountSearch(uid);
			//得到用户信息
			user = userInfoService.selectByPrimaryKey(uid);
		}

		// 记录搜索记录 ip/关键字
		SearchTable searchT = new SearchTable();
		searchT.setContent(brand_name);
		searchT.setIp(GetIP.getIP(req));
		searchT.setSearchuuid(UIDGenerator.getUUID());
		searchTableService.insertSelective(searchT);

		List<Product> product = productService.shaixuanList(map);
		
		// 得到在数据库中，带有关键字的表
		Long pageCount = productService.getshaixuanTotal(map);
		int pageSize = (int) Math.ceil(pageCount / 20.0);
		if (pageSize == 0) {
			return "redirect:/404";
		}
		List<Supplier> supplier = new ArrayList<>();
		List<Comments> list;
		List<Object> list3 = new ArrayList<>();
		for (Product product1 : product) {
			list = comments.selectByTopicType(product1.getSupplieruuid());
			List<String> list2 = new ArrayList<String>();
			for(int i = list.size() - 1; i >= 0; i--) {
				if (i == 0) {
					list2.add(list.get(i).getContent().replaceAll("<[^*>]+>", ""));
				}
			}
			supplier.add(supplierService.selectByPrimaryKey(product1.getSupplieruuid()));
			list3.add(list2);
		}
		
		//反馈随机码
		String fankuiPid = UIDGenerator.getUUID();
		
		model.addAttribute("comments", list3);
		model.addAttribute("currentPage", page);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("product", product);
		model.addAttribute("page", page);
		model.addAttribute("value", value);
		model.addAttribute("user", user);
		model.addAttribute("fankuiPid", fankuiPid);
		return "shaixuanse";
	}
	
		@RequestMapping(value = "shaixuanse1")
	public String shaixuanse(@RequestParam(required = false)String primary_name,@RequestParam(required = false)String product_second, Integer page, String value, Model model, HttpServletRequest req, HttpSession session) {
			
			logger.info("com.zikezhi.controller.IndexController.searchProduct start");
			Map<String, Object> map = new HashMap<>();
			
			String uidCart = (String) session.getAttribute("uid");
			if(uidCart != null){
				//获取购物车总数
				Long carCount = cartService.countCart(uidCart);
				model.addAttribute("carCount",carCount);
			}else{
				int s=searchTableService.queryBycount(GetIP.getIP(req));
				//int s=101;
				if(s>50){
					model.addAttribute("search","超过搜索");
					return "login";
				}
			}
			
			
			if( product_second != null && product_second != "" && primary_name != null && primary_name != "" ){
				map.put("product_second", product_second);
				map.put("second_name", product_second);
				map.put("product_primary",primary_name);
				model.addAttribute("primary_name", primary_name);
				model.addAttribute("product_second", product_second);
			}else{
				return "404";
			}
			
			List encapsulationList = productService.seleEncapsulation(map);
			List manufacturerList = productService.seleManufacturer(map);
			List secondnameList = secondService.select_second_name(primary_name);
			
			
			int enSize = encapsulationList.size();
			int maSize = manufacturerList.size();
			int seSize = secondnameList.size();
			model.addAttribute("seSize", seSize);
			model.addAttribute("encapsulationList", encapsulationList);
			model.addAttribute("manufacturerList", manufacturerList);
			model.addAttribute("secondnameList", secondnameList);
			model.addAttribute("enSize", enSize);
			model.addAttribute("maSize", maSize);
			
			String backUrl=req.getRequestURI();
			String[] sourceStrArray = backUrl.split("/");
			String url3=null;
			for (int i = 0; i < sourceStrArray.length; i++) {
		    	if(i==1){
		    		url3=sourceStrArray[i];
		    	}
			}
			if(value==null){
				value="product";
				page=1;
			}
			Page pageEntity = new Page(page, 20);
			
			if (page == null) {
				page = 1;
			}
			if (value == null || value.equals("")) {
				value = "product";
			}
			map.put("start", pageEntity.getStart());
			map.put("size", pageEntity.getPageSize());
			String uid = (String) session.getAttribute("uid");
			UserInfo user = new UserInfo();
			if (uid != null && uid.length() == 32) {
				userInfoService.updateCountSearch(uid);
				//得到用户信息
				user = userInfoService.selectByPrimaryKey(uid);
			}

				// 记录搜索记录 ip/关键字
				SearchTable searchT = new SearchTable();
				searchT.setContent(product_second);
				searchT.setIp(GetIP.getIP(req));
				searchT.setSearchuuid(UIDGenerator.getUUID());
				searchTableService.insertSelective(searchT);

				List<Product> product = productService.shaixuanList(map);
				
				// 得到在数据库中，带有关键字的表
				Long pageCount = productService.getshaixuanTotal(map);
				int pageSize = (int) Math.ceil(pageCount / 20.0);
				if (pageSize == 0) {
					return "redirect:/404";
				}
				
				//反馈随机码
				String fankuiPid = UIDGenerator.getUUID();
				
				model.addAttribute("currentPage", page);
				model.addAttribute("pageSize", pageSize);
				model.addAttribute("product", product);
				model.addAttribute("page", page);
				model.addAttribute("value", value);
				model.addAttribute("user", user);
				model.addAttribute("fankuiPid", fankuiPid);
				return "shaixuanse1";
			}
		
		@RequestMapping(value = "shaixuanse2")
	public String shaixuanse2(@RequestParam(required = false)String primary_name,@RequestParam(required = false)String encapsulation, Integer page, String value, Model model, HttpServletRequest req, HttpSession session) {
			
			logger.info("com.zikezhi.controller.IndexController.searchProduct start");
			Map<String, Object> map = new HashMap<>();
			
			String uidCart = (String) session.getAttribute("uid");
			if(uidCart != null){
				//获取购物车总数
				Long carCount = cartService.countCart(uidCart);
				model.addAttribute("carCount",carCount);
			}else{
				int s=searchTableService.queryBycount(GetIP.getIP(req));
				//int s=101;
				if(s>50){
					model.addAttribute("search","超过搜索");
					return "login";
				}
			}
			
			if( primary_name != null && primary_name != "" && encapsulation != null && encapsulation != ""){
				map.put("encapsulation",encapsulation);
				model.addAttribute("encapsulation", encapsulation);
			}else{
				return "404";
			}
			
			List encapsulationList = productService.seleEncapsulation(map);
			List manufacturerList = productService.seleManufacturer(map);
			
			
			int enSize = encapsulationList.size();
			int maSize = manufacturerList.size();
			model.addAttribute("encapsulationList", encapsulationList);
			model.addAttribute("manufacturerList", manufacturerList);
			model.addAttribute("enSize", enSize);
			model.addAttribute("maSize", maSize);
			
			
			
			String backUrl=req.getRequestURI();
			String[] sourceStrArray = backUrl.split("/");
			String url3=null;
			for (int i = 0; i < sourceStrArray.length; i++) {
		    	if(i==1){
		    		url3=sourceStrArray[i];
		    	}
			}
			if(value==null){
				value="product";
				page=1;
			}
			Page pageEntity = new Page(page, 20);
			
			if (page == null) {
				page = 1;
			}
			if (value == null || value.equals("")) {
				value = "product";
			}
			map.put("start", pageEntity.getStart());
			map.put("size", pageEntity.getPageSize());
			String uid = (String) session.getAttribute("uid");
			UserInfo user = new UserInfo();
			if (uid != null && uid.length() == 32) {
				userInfoService.updateCountSearch(uid);
				//得到用户信息
				user = userInfoService.selectByPrimaryKey(uid);
			}

				// 记录搜索记录 ip/关键字
				SearchTable searchT = new SearchTable();
				searchT.setContent(encapsulation);
				searchT.setIp(GetIP.getIP(req));
				searchT.setSearchuuid(UIDGenerator.getUUID());
				searchTableService.insertSelective(searchT);

				List<Product> product = productService.shaixuanList(map);
				
				// 得到在数据库中，带有关键字的表
				Long pageCount = productService.getshaixuanTotal(map);
				int pageSize = (int) Math.ceil(pageCount / 20.0);
				if (pageSize == 0) {
					return "redirect:/404";
				}
				
				//反馈随机码
				String fankuiPid = UIDGenerator.getUUID();
				
				model.addAttribute("currentPage", page);
				model.addAttribute("pageSize", pageSize);
				model.addAttribute("product", product);
				model.addAttribute("page", page);
				model.addAttribute("value", value);
				model.addAttribute("user", user);
				model.addAttribute("fankuiPid", fankuiPid);
				return "shaixuanse2";
			}
	
		@RequestMapping(value = "shaixuanse3")
	public String shaixuanse3(@RequestParam(required = false)String primary_name,@RequestParam(required = false)String manufacturer,Integer page, String value, Model model, HttpServletRequest req, HttpSession session) {
			
			logger.info("com.zikezhi.controller.IndexController.searchProduct start");
			Map<String, Object> map = new HashMap<>();
			
			String uidCart = (String) session.getAttribute("uid");
			if(uidCart != null){
				//获取购物车总数
				Long carCount = cartService.countCart(uidCart);
				model.addAttribute("carCount",carCount);
			}else{
				int s=searchTableService.queryBycount(GetIP.getIP(req));
				//int s=101;
				if(s>50){
					model.addAttribute("search","超过搜索");
					return "login";
				}
			}
			
			if( primary_name != null && primary_name != "" && manufacturer != null && manufacturer != ""){
				map.put("manufacturer",manufacturer);
				map.put("product_primary",primary_name);
				model.addAttribute("primary_name", primary_name);
				model.addAttribute("manufacturer", manufacturer);
			}
			
			List encapsulationList = productService.seleEncapsulation(map);
			List manufacturerList = productService.seleManufacturer(map);
			List secondnameList = secondService.select_second_name(primary_name);
			
			
			int enSize = encapsulationList.size();
			int maSize = manufacturerList.size();
			int seSize = secondnameList.size();
			model.addAttribute("seSize", seSize);
			model.addAttribute("encapsulationList", encapsulationList);
			model.addAttribute("manufacturerList", manufacturerList);
			model.addAttribute("secondnameList", secondnameList);
			model.addAttribute("enSize", enSize);
			model.addAttribute("maSize", maSize);
			
			
			
			String backUrl=req.getRequestURI();
			String[] sourceStrArray = backUrl.split("/");
			String url3=null;
			for (int i = 0; i < sourceStrArray.length; i++) {
		    	if(i==1){
		    		url3=sourceStrArray[i];
		    	}
			}
			if(value==null){
				value="product";
				page=1;
			}
			Page pageEntity = new Page(page, 20);
			
			if (page == null) {
				page = 1;
			}
			if (value == null || value.equals("")) {
				value = "product";
			}
			map.put("start", pageEntity.getStart());
			map.put("size", pageEntity.getPageSize());
			String uid = (String) session.getAttribute("uid");
			UserInfo user = new UserInfo();
			if (uid != null && uid.length() == 32) {
				userInfoService.updateCountSearch(uid);
				//得到用户信息
				user = userInfoService.selectByPrimaryKey(uid);
			}

				// 记录搜索记录 ip/关键字
				SearchTable searchT = new SearchTable();
				searchT.setContent(primary_name);
				searchT.setIp(GetIP.getIP(req));
				searchT.setSearchuuid(UIDGenerator.getUUID());
				searchTableService.insertSelective(searchT);

				List<Product> product = productService.shaixuanList(map);
				
				// 得到在数据库中，带有关键字的表
				Long pageCount = productService.getshaixuanTotal(map);
				int pageSize = (int) Math.ceil(pageCount / 20.0);
				if (pageSize == 0) {
					return "redirect:/404";
				}
				
				//反馈随机码
				String fankuiPid = UIDGenerator.getUUID();
				
				model.addAttribute("currentPage", page);
				model.addAttribute("pageSize", pageSize);
				model.addAttribute("product", product);
				model.addAttribute("page", page);
				model.addAttribute("value", value);
				model.addAttribute("user", user);
				model.addAttribute("fankuiPid", fankuiPid);
				return "shaixuanse3";
			}
			
			@RequestMapping(value = "shaixuanse4")
	public String shaixuanse4(@RequestParam(required = false)String primary_name,@RequestParam(required = false)String encapsulation,@RequestParam(required = false)String product_second,Integer page, String value, Model model, HttpServletRequest req, HttpSession session) {
				
				logger.info("com.zikezhi.controller.IndexController.searchProduct start");
				Map<String, Object> map = new HashMap<>();
				
				String uidCart = (String) session.getAttribute("uid");
				if(uidCart != null){
					//获取购物车总数
					Long carCount = cartService.countCart(uidCart);
					model.addAttribute("carCount",carCount);
				}else{
					int s=searchTableService.queryBycount(GetIP.getIP(req));
					//int s=101;
					if(s>50){
						model.addAttribute("search","超过搜索");
						return "login";
					}
				}
				
				if( primary_name != null && primary_name != "" && product_second != null && product_second != "" && encapsulation != null && encapsulation != ""){
					map.put("encapsulation",encapsulation);
					map.put("product_second", product_second);
					map.put("second_name", product_second);
					map.put("product_primary",primary_name);
					model.addAttribute("primary_name", primary_name);
					model.addAttribute("product_second", product_second);
					model.addAttribute("encapsulation", encapsulation);
				}else{
					return "404";
				}
				
				
				List encapsulationList = productService.seleEncapsulation(map);
				List manufacturerList = productService.seleManufacturer(map);
				List secondnameList = secondService.select_second_name(primary_name);
				
				
				int enSize = encapsulationList.size();
				int maSize = manufacturerList.size();
				int seSize = secondnameList.size();
				model.addAttribute("seSize", seSize);
				model.addAttribute("encapsulationList", encapsulationList);
				model.addAttribute("manufacturerList", manufacturerList);
				model.addAttribute("secondnameList", secondnameList);
				model.addAttribute("enSize", enSize);
				model.addAttribute("maSize", maSize);
				
				
				
				String backUrl=req.getRequestURI();
				String[] sourceStrArray = backUrl.split("/");
				String url3=null;
				for (int i = 0; i < sourceStrArray.length; i++) {
			    	if(i==1){
			    		url3=sourceStrArray[i];
			    	}
				}
				if(value==null){
					value="product";
					page=1;
				}
				Page pageEntity = new Page(page, 20);
				
				if (page == null) {
					page = 1;
				}
				if (value == null || value.equals("")) {
					value = "product";
				}
				map.put("start", pageEntity.getStart());
				map.put("size", pageEntity.getPageSize());
				String uid = (String) session.getAttribute("uid");
				UserInfo user = new UserInfo();
				if (uid != null && uid.length() == 32) {
					userInfoService.updateCountSearch(uid);
					//得到用户信息
					user = userInfoService.selectByPrimaryKey(uid);
				}

					// 记录搜索记录 ip/关键字
					SearchTable searchT = new SearchTable();
					searchT.setContent(product_second);
					searchT.setIp(GetIP.getIP(req));
					searchT.setSearchuuid(UIDGenerator.getUUID());
					searchTableService.insertSelective(searchT);

					List<Product> product = productService.shaixuanList(map);
					
					// 得到在数据库中，带有关键字的表
					Long pageCount = productService.getshaixuanTotal(map);
					int pageSize = (int) Math.ceil(pageCount / 20.0);
					if (pageSize == 0) {
						return "redirect:/404";
					}
					
					//反馈随机码
					String fankuiPid = UIDGenerator.getUUID();
					
					model.addAttribute("currentPage", page);
					model.addAttribute("pageSize", pageSize);
					model.addAttribute("product", product);
					model.addAttribute("page", page);
					model.addAttribute("value", value);
					model.addAttribute("user", user);
					model.addAttribute("fankuiPid", fankuiPid);
					return "shaixuanse4";
				}
			
			@RequestMapping(value = "shaixuanse5")
	public String shaixuanse5(@RequestParam(required = false)String primary_name,@RequestParam(required = false)String manufacturer,@RequestParam(required = false)String product_second,Integer page, String value, Model model, HttpServletRequest req, HttpSession session) {
				
				logger.info("com.zikezhi.controller.IndexController.searchProduct start");
				Map<String, Object> map = new HashMap<>();
				
				String uidCart = (String) session.getAttribute("uid");
				if(uidCart != null){
					//获取购物车总数
					Long carCount = cartService.countCart(uidCart);
					model.addAttribute("carCount",carCount);
				}else{
					int s=searchTableService.queryBycount(GetIP.getIP(req));
					//int s=101;
					if(s>50){
						model.addAttribute("search","超过搜索");
						return "login";
					}
				}
				
				if( primary_name != null && primary_name != "" && product_second != null && product_second != "" && manufacturer != null && manufacturer != ""){
					map.put("manufacturer",manufacturer);
					map.put("product_second", product_second);
					map.put("second_name", product_second);
					map.put("product_primary",primary_name);
					model.addAttribute("primary_name", primary_name);
					model.addAttribute("product_second", product_second);
					model.addAttribute("manufacturer", manufacturer);
				}else{
					return "404";
				}
				
				List encapsulationList = productService.seleEncapsulation(map);
				List manufacturerList = productService.seleManufacturer(map);
				List secondnameList = secondService.select_second_name(primary_name);
				
				
				int enSize = encapsulationList.size();
				int maSize = manufacturerList.size();
				int seSize = secondnameList.size();
				
				model.addAttribute("seSize", seSize);
				model.addAttribute("encapsulationList", encapsulationList);
				model.addAttribute("manufacturerList", manufacturerList);
				model.addAttribute("secondnameList", secondnameList);
				model.addAttribute("enSize", enSize);
				model.addAttribute("maSize", maSize);
				
				
				
				String backUrl=req.getRequestURI();
				String[] sourceStrArray = backUrl.split("/");
				String url3=null;
				for (int i = 0; i < sourceStrArray.length; i++) {
			    	if(i==1){
			    		url3=sourceStrArray[i];
			    	}
				}
				if(value==null){
					value="product";
					page=1;
				}
				Page pageEntity = new Page(page, 20);
				if (page == null) {
					page = 1;
				}
				if (value == null || value.equals("")) {
					value = "product";
				}
				map.put("start", pageEntity.getStart());
				map.put("size", pageEntity.getPageSize());
				String uid = (String) session.getAttribute("uid");
				UserInfo user = new UserInfo();
				if (uid != null && uid.length() == 32) {
					userInfoService.updateCountSearch(uid);
					//得到用户信息
					user = userInfoService.selectByPrimaryKey(uid);
				}

					// 记录搜索记录 ip/关键字
					SearchTable searchT = new SearchTable();
					searchT.setContent(product_second);
					searchT.setIp(GetIP.getIP(req));
					searchT.setSearchuuid(UIDGenerator.getUUID());
					searchTableService.insertSelective(searchT);

					List<Product> product = productService.shaixuanList(map);
					
					// 得到在数据库中，带有关键字的表
					Long pageCount = productService.getshaixuanTotal(map);
					int pageSize = (int) Math.ceil(pageCount / 20.0);
					if (pageSize == 0) {
						return "redirect:/404";
					}
					
					//反馈随机码
					String fankuiPid = UIDGenerator.getUUID();
					
					model.addAttribute("currentPage", page);
					model.addAttribute("pageSize", pageSize);
					model.addAttribute("product", product);
					model.addAttribute("page", page);
					model.addAttribute("value", value);
					model.addAttribute("user", user);
					model.addAttribute("fankuiPid", fankuiPid);
					return "shaixuanse5";
				}
			
		@RequestMapping(value = "shaixuanse6")
	public String shaixuanse6(@RequestParam(required = false)String encapsulation,@RequestParam(required = false)String manufacturer,Integer page, String value, Model model, HttpServletRequest req, HttpSession session) {
			logger.info("com.zikezhi.controller.IndexController.searchProduct start");
			Map<String, Object> map = new HashMap<>();
			
			String uidCart = (String) session.getAttribute("uid");
			if(uidCart != null){
				//获取购物车总数
				Long carCount = cartService.countCart(uidCart);
				model.addAttribute("carCount",carCount);
			}else{
				int s=searchTableService.queryBycount(GetIP.getIP(req));
				//int s=101;
				if(s>50){
					model.addAttribute("search","超过搜索");
					return "login";
				}
			}
			
			
			if(manufacturer != null && manufacturer != "" && encapsulation != null && encapsulation != ""){
				map.put("encapsulation",encapsulation);
				map.put("manufacturer",manufacturer);
				model.addAttribute("manufacturer", manufacturer);
				model.addAttribute("encapsulation", encapsulation);
			}else{
				return "404";
			}
			
			List encapsulationList = productService.seleEncapsulation(map);
			//List manufacturerList = productService.seleManufacturer(map);
			
			
			int enSize = encapsulationList.size();
			//int maSize = manufacturerList.size();
			model.addAttribute("encapsulationList", encapsulationList);
			//model.addAttribute("manufacturerList", manufacturerList);
			model.addAttribute("enSize", enSize);
			//model.addAttribute("maSize", maSize);
			
			
			
			String backUrl=req.getRequestURI();
			String[] sourceStrArray = backUrl.split("/");
			String url3=null;
			for (int i = 0; i < sourceStrArray.length; i++) {
		    	if(i==1){
		    		url3=sourceStrArray[i];
		    	}
			}
			if(value==null){
				value="product";
				page=1;
			}
			Page pageEntity = new Page(page, 20);
			
			if (page == null) {
				page = 1;
			}
			if (value == null || value.equals("")) {
				value = "product";
			}
			map.put("start", pageEntity.getStart());
			map.put("size", pageEntity.getPageSize());
			String uid = (String) session.getAttribute("uid");
			UserInfo user = new UserInfo();
			if (uid != null && uid.length() == 32) {
				userInfoService.updateCountSearch(uid);
				//得到用户信息
				user = userInfoService.selectByPrimaryKey(uid);
			}

				// 记录搜索记录 ip/关键字
				SearchTable searchT = new SearchTable();
				searchT.setContent(manufacturer);
				searchT.setIp(GetIP.getIP(req));
				searchT.setSearchuuid(UIDGenerator.getUUID());
				searchTableService.insertSelective(searchT);

				List<Product> product = productService.shaixuanList(map);
				
				// 得到在数据库中，带有关键字的表
				Long pageCount = productService.getshaixuanTotal(map);
				int pageSize = (int) Math.ceil(pageCount / 20.0);
				if (pageSize == 0) {
					return "redirect:/404";
				}
				//反馈随机码
				String fankuiPid = UIDGenerator.getUUID();
				
				model.addAttribute("currentPage", page);
				model.addAttribute("pageSize", pageSize);
				model.addAttribute("product", product);
				model.addAttribute("page", page);
				model.addAttribute("value", value);
				model.addAttribute("user", user);
				model.addAttribute("fankuiPid", fankuiPid);
				return "shaixuanse6";
			}
			
		@RequestMapping(value = "shaixuanse7")
	public String shaixuanse7(@RequestParam(required = false)String primary_name,@RequestParam(required = false)String encapsulation,@RequestParam(required = false)String manufacturer,@RequestParam(required = false)String product_second,Integer page, String value, Model model, HttpServletRequest req, HttpSession session) {
				
				logger.info("com.zikezhi.controller.IndexController.searchProduct start");
				Map<String, Object> map = new HashMap<>();
				
				String uidCart = (String) session.getAttribute("uid");
				if(uidCart != null){
					//获取购物车总数
					Long carCount = cartService.countCart(uidCart);
					model.addAttribute("carCount",carCount);
				}else{
					int s=searchTableService.queryBycount(GetIP.getIP(req));
					//int s=101;
					if(s>50){
						model.addAttribute("search","超过搜索");
						return "login";
					}
				}
				
				if( primary_name != null && primary_name != "" && product_second != null && product_second != "" &&  manufacturer != null && manufacturer != "" && encapsulation != null && encapsulation != ""){
					map.put("encapsulation",encapsulation);
					map.put("manufacturer",manufacturer);
					map.put("product_second", product_second);
					map.put("second_name", product_second);
					map.put("product_primary",primary_name);
					model.addAttribute("primary_name", primary_name);
					model.addAttribute("product_second", product_second);
					model.addAttribute("manufacturer", manufacturer);
					model.addAttribute("encapsulation", encapsulation);
				}else{
					return "404";
				}
				
				List encapsulationList = productService.seleEncapsulation(map);
				List manufacturerList = productService.seleManufacturer(map);
				List secondnameList = secondService.select_second_name(primary_name);
				
				
				int enSize = encapsulationList.size();
				int maSize = manufacturerList.size();
				int seSize = secondnameList.size();
				model.addAttribute("seSize", seSize);
				model.addAttribute("encapsulationList", encapsulationList);
				model.addAttribute("manufacturerList", manufacturerList);
				model.addAttribute("secondnameList", secondnameList);
				model.addAttribute("enSize", enSize);
				model.addAttribute("maSize", maSize);
				
				
				
				String backUrl=req.getRequestURI();
				String[] sourceStrArray = backUrl.split("/");
				String url3=null;
				for (int i = 0; i < sourceStrArray.length; i++) {
			    	if(i==1){
			    		url3=sourceStrArray[i];
			    	}
				}
				if(value==null){
					value="product";
					page=1;
				}
				Page pageEntity = new Page(page, 20);
				
				if (page == null) {
					page = 1;
				}
				if (value == null || value.equals("")) {
					value = "product";
				}
				map.put("start", pageEntity.getStart());
				map.put("size", pageEntity.getPageSize());
				String uid = (String) session.getAttribute("uid");
				UserInfo user = new UserInfo();
				if (uid != null && uid.length() == 32) {
					userInfoService.updateCountSearch(uid);
					//得到用户信息
					user = userInfoService.selectByPrimaryKey(uid);
				}

					// 记录搜索记录 ip/关键字
					SearchTable searchT = new SearchTable();
					searchT.setContent(product_second);
					searchT.setIp(GetIP.getIP(req));
					searchT.setSearchuuid(UIDGenerator.getUUID());
					searchTableService.insertSelective(searchT);

					List<Product> product = productService.shaixuanList(map);
					
					// 得到在数据库中，带有关键字的表
					Long pageCount = productService.getshaixuanTotal(map);
					int pageSize = (int) Math.ceil(pageCount / 20.0);
					if (pageSize == 0) {
						return "redirect:/404";
					}
					
					//反馈随机码
					String fankuiPid = UIDGenerator.getUUID();
					
					model.addAttribute("currentPage", page);
					model.addAttribute("pageSize", pageSize);
					model.addAttribute("product", product);
					model.addAttribute("page", page);
					model.addAttribute("value", value);
					model.addAttribute("user", user);
					model.addAttribute("fankuiPid", fankuiPid);
					return "shaixuanse7";
				}
}
