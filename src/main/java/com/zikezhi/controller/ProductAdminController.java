package com.zikezhi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zikezhi.entity.AdminZaiXinJian;
import com.zikezhi.entity.PImg;
import com.zikezhi.entity.Primary;
import com.zikezhi.entity.Product;
import com.zikezhi.service.AdminZaiXinJianService;
import com.zikezhi.service.BiaoQianService;
import com.zikezhi.service.BomOrderService;
import com.zikezhi.service.BrandService;
import com.zikezhi.service.CartService;
import com.zikezhi.service.DiscountService;
import com.zikezhi.service.ExpressService;
import com.zikezhi.service.FanKuiService;
import com.zikezhi.service.IPGuoLvService;
import com.zikezhi.service.OrderItmeService;
import com.zikezhi.service.PImgService;
import com.zikezhi.service.PriceTrendService;
import com.zikezhi.service.PrimaryService;
import com.zikezhi.service.ProductService;
import com.zikezhi.service.RandomTextService;
import com.zikezhi.service.SearchTableService;
import com.zikezhi.service.SecondService;
import com.zikezhi.service.SupplierService;
import com.zikezhi.utils.PageBean;
/**
 * 产品后台
 * @author lenovo
 *
 */
@Controller
public class ProductAdminController {

	@Resource(name = "productService")
	private ProductService productService;
	
	@Resource(name = "ipGuoLvService")
	private IPGuoLvService ipGuoLvService;
	
	@Resource(name = "supplierService")
	private SupplierService supplierService;
	
	private Logger logger = Logger.getLogger(AddProduct.class);

	@Resource(name = "searchTableService")
	private SearchTableService searchTableService;

    @Resource(name="expressService")
	private ExpressService expressService;
    
    @Resource(name = "OrderItmeService")
	private OrderItmeService orderItmeService;
    
    @Resource(name = "discountService")
	private DiscountService discountService;
    
    @Resource(name = "adminZaiXinJianService")
   	private AdminZaiXinJianService adminZaiXinJianService;
    
    @Resource(name = "randomTextService")
	private RandomTextService randomTextService;

    @Resource(name = "pimgService")
	private PImgService pimgService;
    
    @Resource(name = "primaryService")
	private PrimaryService primaryService;
    
    @Resource(name = "secondService")
	private SecondService SecondService;
    
    @Resource(name="bomOrderService")
	private BomOrderService bomOrderService;
    
    @Resource(name = "fankuiService")
    private FanKuiService fankuiService;
    
    /*@Resource(name = "sellingService")
	private SellingService sellingService;*/
    
    @Resource(name = "cartService")
	private CartService cartService;
    
    @Resource(name = "brandService")
	private BrandService brandService;
    
    @Resource(name="priceTrendService")
	private PriceTrendService priceTrendService;
    
    @Resource(name="biaoQianService")
	private BiaoQianService biaoqianService;
    
    /**
	 * 产品管理查看
	 * @param p
	 * @param page
	 * @param rows
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "1019/zai/xin/jian/queryAllProduct")
	public String productList(Product p,@RequestParam(required = false) String page,@RequestParam(required = false) String rows, Model model, HttpSession session) {
		AdminZaiXinJian admin=(AdminZaiXinJian) session.getAttribute("user");
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		// 每一页输出的数据条数，并将值放到map中
		Map<String, Object> map = new HashMap<String, Object>();
		PageBean pageBean;
		if(page == null && rows == null){
			pageBean = new PageBean(1,30);
		}else{
			pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		}
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		if(p.getProduct()!=null && !p.getProduct().equals("")){
			map.put("keyword", p.getProduct());
		}
		if(p.getManufacturer()!=null && !p.getManufacturer().equals("")){
			map.put("manufacturer", p.getManufacturer());
		}
		if(p.getSupplier()!=null && !p.getSupplier().equals("")){
			map.put("supplier", p.getSupplier());
		}
		// map.put("tableName", null);
		// 将所有的产品取出来
		List<Product> product = productService.queryAll(map);
		if (product == null || product.size() == 0) {
			return "redirect:/404";
		}
		// 得到在数据库中数据的条数,并分页
		long total = productService.getTotalAll(map);
		model.addAttribute("total", total);
		pageBean.setTotal(Integer.parseInt(String.valueOf(total)));
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page",pageBean.getPage());
		model.addAttribute("pageSize",pageBean.getPageSize());
		model.addAttribute("product", product);
		model.addAttribute("p", p);
		model.addAttribute("productHome", "productHome");
		return "adminHome";
	}
	
    
	
	/**
	 * @Title IndexController
	 * @Description: 添加产品-在线购
	 */
	@RequestMapping(value = "1019/zai/xin/jian/product")
	public String addProduct(HttpSession session,Model model) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		List<Primary> primaryList=primaryService.queryAll();
		model.addAttribute("primaryList", primaryList);
		logger.info("com.zikezhi.controller.IndexController.addProduct start");
		model.addAttribute("addUser","addUser");
		return "adminHome";
	}
	
	@RequestMapping(value = "1019/zai/xin/jian/updateProduct")
	public String updateProduct(Model model, final String uid,String result, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		// 将所有的产品取出来
		Product product = productService.selectByPrimaryKey(uid);
		// 得到在数据库中数据的条数,并分页
		long imgCount = pimgService.selectPimgCount(uid);
		List<PImg> pimgList = pimgService.selectPimg(uid);
		
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
		if(result!=null && result !=""){
			model.addAttribute("result", result);
		}
		model.addAttribute("product", product);
		model.addAttribute("updateProduct", "updateProduct");
		model.addAttribute("imgCount", imgCount);
		return "adminHome";
	}
	
	@RequestMapping(value = "1019/zai/xin/jian/seleNullData")
	public String seleNullData(Model model, final String uid, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		// 将所有的产品取出来
		Product product = productService.selectByPrimaryKey(uid);
		// 得到在数据库中数据的条数,并分页
		long imgCount = pimgService.selectPimgCount(uid);
		List<PImg> pimgList = pimgService.selectPimg(uid);
		
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
		model.addAttribute("seleNullData", "seleNullData");
		model.addAttribute("imgCount", imgCount);
		return "adminHome";
	}
	
	/**
	 * 删除商品
	 * @param model
	 * @param productuuid
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "1019/zai/xin/jian/deleteProduct")
	public String deleteProduct(Model model, String productuuid, HttpSession session) {
		AdminZaiXinJian admin=(AdminZaiXinJian) session.getAttribute("user");
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		if(admin.getAdmin_jurisdiction().equals("1") || (admin.getAdmin_shrio()!=null && admin.getAdmin_shrio().indexOf("o")!=-1)){
			productService.daleteProduct(productuuid);
			return "redirect:/1019/zai/xin/jian/queryAllProduct";
		}else{
			return "redirect:cont";
		}
	}
	
	@RequestMapping(value = "1019/zai/xin/jian/userOut")
	public String userOut(Model model, String productuuid, HttpSession session) {
		session.removeAttribute("user");
		return "redirect:cont";
	}
	
}
