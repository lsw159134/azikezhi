package com.zikezhi.controller;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.google.gson.JsonObject;
import com.zikezhi.entity.*;
import com.zikezhi.service.*;
import com.zikezhi.utils.*;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 首页-搜索-下单-结算-登陆-产品修改
 * 
 * @author lenovo
 *
 */
@Controller
public class IndexController {

	@Resource(name = "productdistinctService")
	private ProductdistinctService productdistinctService;

	@Resource(name = "productService")
	private ProductService productService;

	@Resource(name = "ipGuoLvService")
	private IPGuoLvService ipGuoLvService;

	@Resource(name = "supplierService")
	private SupplierService supplierService;

	private Logger logger = Logger.getLogger(AddProduct.class);

	@Resource(name = "searchTableService")
	private SearchTableService searchTableService;

	/*
	 * @Resource(name = "procurementserviceService") private
	 * ProcurementserviceService psService;
	 */

	@Resource(name = "expressService")
	private ExpressService expressService;

	@Resource(name = "OrderItmeService")
	private OrderItmeService orderItmeService;

	@Resource(name = "discountService")
	private DiscountService discountService;

	@Resource(name = "adminZaiXinJianService")
	private AdminZaiXinJianService adminZaiXinJianService;
	/*
	 * 缺货型号，已删除
	 */
	// @Resource(name = "randomTextService")
	// private RandomTextService randomTextService;

	@Resource(name = "pimgService")
	private PImgService pimgService;

	@Resource(name = "primaryService")
	private PrimaryService primaryService;

	@Resource(name = "secondService")
	private SecondService SecondService;

	@Resource(name = "bomOrderService")
	private BomOrderService bomOrderService;

	@Resource(name = "fankuiService")
	private FanKuiService fankuiService;

	/*
	 * @Resource(name = "sellingService") private SellingService sellingService;
	 */

	@Resource(name = "cartService")
	private CartService cartService;

	@Resource(name = "brandService")
	private BrandService brandService;

	@Resource(name = "priceTrendService")
	private PriceTrendService priceTrendService;

	@Resource(name = "biaoQianService")
	private BiaoQianService biaoqianService;

	@Resource(name = "replaceService")
	private ReplaceService replaceService;

	static int[] a = new int[6];
	static int[] ps = new int[6];

	/**
	 * @param page
	 *            页面参数，得到当前页是多少{@link Integer}
	 * @Title IndexController
	 * @Description: 主页数据，得到当前页面是多少页 返回到WEB-INF/jsp/index页面
	 * @return
	 *
	 */
	@RequestMapping(value = { "/index", "/", "" }, method = RequestMethod.GET)
	public String index(@RequestParam(defaultValue = "1") final Integer page, Model model, HttpSession session) {
		logger.info("com.zikezhi.controller.IndexController.index start");
		List<Product> deal = productService.seleDeal();
	    Map<String,Object> map1 =new HashMap<>();
		Page pageEntity = new Page(page, 10);
		map1.put("start", pageEntity.getStart());
		map1.put("size", pageEntity.getPageSize());
		List<Product> productList = productService.seleZaixianGouByNum(map1);
		List<Supplier> supplier = supplierService.queryBySupplierXin();
		Map<String, Object> map = new HashMap<String, Object>();
		/*
		 * 缺货型号，首页已删除
		 */
		// List<RandomText> rand=randomTextService.query(map);
		int x = supplierService.getCount(map);
		int chengjiao = brandService.seleSort();
		int p = productService.getSupplierProductCount(map);
		int i = 1, k, count = 0;
		for (i = 0; i < 6; i++) {
			if (x / Math.pow(10, i) != 0) {
				count++;
			}
		}
		for (k = 0; k < count; k++) {
			a[k] = x % 10;
			x = x / 10;
		}
		model.addAttribute("gew", a[0]);
		model.addAttribute("shi", a[1]);
		model.addAttribute("bei", a[2]);
		model.addAttribute("qian", a[3]);
		model.addAttribute("wan", a[4]);
		model.addAttribute("shiwan", a[5]);
		count = 0;
		for (i = 0; i < 6; i++) {
			if (p / Math.pow(10, i) != 0) {
				count++;
			}
		}
		for (k = 0; k < count; k++) {
			ps[k] = p % 10;
			p = p / 10;
		}
		model.addAttribute("pgew", ps[0]);
		model.addAttribute("pshi", ps[1]);
		model.addAttribute("pbei", ps[2]);
		model.addAttribute("pqian", ps[3]);
		model.addAttribute("pwan", ps[4]);
		model.addAttribute("pshiwan", ps[5]);
		model.addAttribute("deal", deal);
		model.addAttribute("chengjiao", chengjiao);
       model.addAttribute("productList", productList);
		/*
		 * 缺货型号，首页已删除
		 */
		// model.addAttribute("rand", rand);
		model.addAttribute("supplier", supplier);
		return "forward:/indexb.jsp";
	}

	/**
	 * @param req
	 *            {@link HttpServletRequest} 获取 前台搜索传过来的参数
	 * @param keyword
	 *            {@code String} 关键字，在搜索的内容
	 * @param page
	 *            {@code String} 当前页面，当产品多时，分页显示 ，所以要传一个页面参数
	 * @param value
	 *            {@code 搜索产品还是搜索供应商}
	 * @Title IndexController
	 * @Description: 搜索产品和搜索供应商
	 *
	 */
	@RequestMapping(value = "search",method= RequestMethod.GET)
	public String search(@RequestParam(required = false) String isExact,
			@RequestParam(required = false) String encapsulation, @RequestParam(required = false) String keyword,
			Integer page, String value, Model model, HttpServletRequest req, HttpSession session) {
		logger.info("com.zikezhi.controller.IndexController.searchProduct start");
		model.addAttribute("isExact", isExact);
		Map<String, Object> map = new HashMap<>();
		if (value == null) {
			value = "product";
			page = 1;
		}
		Page pageEntity = new Page(page, 50);
		if (keyword == null) {
			model.addAttribute("keyword", keyword);
			return "404";
		}
		if (keyword != null) {
			Pattern p = Pattern.compile("[\u4e00-\u9fa5]");
			Matcher m = p.matcher(keyword);
			p = Pattern.compile("\t");
			m = p.matcher(keyword);
			keyword = m.replaceAll("");
			model.addAttribute("keyword", keyword);
			if (m.find()) {
				if (keyword.trim().length() <= 1 || keyword.trim().length() >= 30) {
					return "404";
				}
			} else {
				if (keyword.trim().length() <= 2 || keyword.trim().length() >= 30) {
					return "404";
				}
			}
			keyword = keyword.toUpperCase().trim();
			while (keyword.startsWith("　")) {// 这里判断是不是全角空格
				keyword = keyword.substring(1, keyword.length()).trim();
			}
			while (keyword.endsWith("　")) {
				keyword = keyword.substring(0, keyword.length() - 1).trim();
			}
			// 防止sql注入
			keyword = StringEscapeUtils.escapeSql(keyword);
			// 每一页输出的数据条数，并将值放到map中
			Search search = new Search(keyword, value);
			map.put("keyword", search.getKeyword());
			map.put("tableName", search.getTableName());
			List<Replace> replace = replaceService.selereplace(keyword);
			model.addAttribute("replace", replace);
			List<Replace> replacef = replaceService.selereplaceBy2(keyword);
			model.addAttribute("replacef", replacef);
		}
		map.put("isExact", isExact);
		map.put("start", pageEntity.getStart());
		map.put("size", pageEntity.getPageSize());
		String uid = (String) session.getAttribute("uid");
		SearchTable searchT = new SearchTable();
		if (uid != null) {
			searchT.setSearch_uid(uid);
			userInfoService.updateCountSearch(uid);
		}
		searchT.setContent(keyword);
		searchT.setIp(GetIP.getIP(req));
		searchT.setSearchuuid(UIDGenerator.getUUID());
		searchTableService.insertSelective(searchT);
		List<Product> supplierlist = productService.list(map);
		// 得到在数据库中，带有关键字的表
		long pageCount = productService.getTotal(map);
		int pageSize = (int) Math.ceil(pageCount / 50.0);
		if (pageSize == 0) {
			return "404";
		}
		model.addAttribute("keyword", keyword);
		model.addAttribute("encapsulation", encapsulation);
		model.addAttribute("currentPage", page);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("supplierlist", supplierlist);
		model.addAttribute("page", page);
		model.addAttribute("value", value);
		return "productSearchResult";
	}

	/**
	 * 下拉查看（搜索页面）
	 * 
	 * @param session
	 * @param model
	 * @param sid
	 * @param pid
	 * @param quality
	 * @param sname
	 * @param keyword
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("showcontent")
	@ResponseBody
	public List<Product> showcontent(HttpSession session, Model model, String sid, String pid, int quality,
			String sname, String keyword) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sid", sid);
		map.put("pid", pid);
		map.put("quality", quality);
		if (keyword != null) {
			Pattern p = Pattern.compile("[\u4e00-\u9fa5]");
			Matcher m = p.matcher(keyword);
			p = Pattern.compile("\t");
			m = p.matcher(keyword);
			keyword = m.replaceAll("");
			keyword = keyword.toUpperCase().trim();
			while (keyword.startsWith("　")) {// 这里判断是不是全角空格
				keyword = keyword.substring(1, keyword.length()).trim();
			}
			while (keyword.endsWith("　")) {
				keyword = keyword.substring(0, keyword.length() - 1).trim();
			}
			// 防止sql注入
			keyword = StringEscapeUtils.escapeSql(keyword);
			// 每一页输出的数据条数，并将值放到map中
			map.put("keyword", keyword);
		}

		List<Product> productList = productService.selectProductxia(map);
		return productList;
	}

	@RequestMapping(value = "fenleilist")
	public String fenleilist(@RequestParam(required = false) String product_second, Integer page, String value,
			Model model, HttpServletRequest req, HttpSession session) {
		logger.info("com.zikezhi.controller.IndexController.searchProduct start");
		String backUrl = req.getRequestURI();
		String[] sourceStrArray = backUrl.split("/");
		String url3 = null;
		for (int i = 0; i < sourceStrArray.length; i++) {
			if (i == 1) {
				url3 = sourceStrArray[i];
			}
		}
		if (value == null) {
			value = "product";
			page = 1;
		}
		session.setAttribute("url", url3 + "?product_second=" + product_second + "&value=" + value + "&page=" + page);
		if (product_second.trim().length() <= 2 || product_second.trim().length() >= 30) {
			return "404";
		}
		if (page == null) {
			page = 1;
		}
		if (value == null || value.equals("")) {
			value = "product";
		}

		product_second = product_second.toUpperCase().replace(" ", "").replace("_", "\\_").replace("%", "\\%");
		// 防止sql注入
		product_second = StringEscapeUtils.escapeSql(product_second);
		// 每一页输出的数据条数，并将值放到map中
		Page pageEntity = new Page(page, 20);
		Search search = new Search(product_second, value);

		Map<String, Object> map = new HashMap<>();
		map.put("start", pageEntity.getStart());
		map.put("size", pageEntity.getPageSize());
		if (product_second != null && !product_second.equals("")) {
			map.put("product_second", "%" + product_second + "%");
		}
		map.put("tableName", search.getTableName());

		String uid = (String) session.getAttribute("uid");
		UserInfo user = new UserInfo();
		if (uid != null && uid.length() == 32) {
			userInfoService.updateCountSearch(uid);
			// 得到用户信息
			user = userInfoService.selectByPrimaryKey(uid);
		}
		// 记录搜索记录 ip/关键字
		SearchTable searchT = new SearchTable();
		searchT.setContent(product_second);
		searchT.setIp(GetIP.getIP(req));
		searchT.setSearchuuid(UIDGenerator.getUUID());
		searchTableService.insertSelective(searchT);

		List<Product> product = productService.fenleilist(map);

		// 得到在数据库中，带有关键字的表
		Long pageCount = productService.fenleigetTotal(product_second);
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
			for (int i = list.size() - 1; i >= 0; i--) {
				if (i == 0) {
					list2.add(list.get(i).getContent().replaceAll("<[^*>]+>", ""));
				}
			}
			supplier.add(supplierService.selectByPrimaryKey(product1.getSupplieruuid()));
			list3.add(list2);
		}

		// 反馈随机码
		String fankuiPid = UIDGenerator.getUUID();

		model.addAttribute("comments", list3);
		model.addAttribute("supplier", supplier);
		model.addAttribute("currentPage", page);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("product", product);
		model.addAttribute("keyword", product_second);
		model.addAttribute("page", page);
		model.addAttribute("value", value);
		model.addAttribute("user", user);
		model.addAttribute("fankuiPid", fankuiPid);

		return "productSearchResult";

	}

	@ResponseBody
	@RequestMapping(value = "newComments", method = RequestMethod.POST)
	public Map<String, Object> newComments(String uid) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Comments> list = new ArrayList<Comments>();
		list = comments.selectByTopicType(uid);
		for (int i = list.size() - 1; i >= 3; i--) {
			list.remove(list.get(i));
		}
		map.put("comments", list);
		return map;
	}

	@RequestMapping(value = "parameterTypesupplier")
	public String addSupplier(HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		logger.info("com.zikezhi.controller.IndexController.addSupplier Start");
		return "addSupplier";
	}

	@RequestMapping("Logindynamic")
	public String dynamicLogin(HttpServletRequest request, HttpSession session) {
		return "dynamiclogin";
	}

	@RequestMapping("frontLogin")
	public String login(HttpServletRequest request, HttpSession session) {
		return "login";
	}

	@RequestMapping("merchantLogin")
	public String mclogin() {
		return "mclogin";
	}

	@RequestMapping("mcZhuCe")
	public String mczhuce() {
		return "mczhuce";
	}

	/**
	 * 用户注册
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "userOut")
	public String userOut(HttpSession session) {
		session.removeAttribute("userName");
		session.removeAttribute("uid");
		return "index";
	}

	@RequestMapping(value = "sjOut")
	public String sjOut(HttpSession session) {
		session.removeAttribute("sj_id");
		session.removeAttribute("sjLogin");
		return "index";
	}

	/**
	 * 修改产品（后台产品管理）
	 * 
	 * @return
	 * @throws IOException
	 */
	@SuppressWarnings("resource")
	@RequestMapping(value = "1019/zai/xin/jian/updateByPrimaryKeySelective")
	public String updateByPrimaryKeySelective(@RequestParam(required = false) String d_id3,
			@RequestParam(required = false) String d_id2, @RequestParam(required = false) String d_id1,
			@RequestParam(required = false) Float price3, @RequestParam(required = false) Float price2,
			@RequestParam(required = false) Float price1, @RequestParam(required = false) String min1,
			@RequestParam(required = false) String max1, @RequestParam(required = false) String min2,
			@RequestParam(required = false) String max2, @RequestParam(required = false) String min3,
			@RequestParam(required = false) String discount_unit, MultipartFile[] files, Model model, Product product,
			HttpSession session, HttpServletRequest req) throws IOException {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		product.setUptime(new Date());
		if (product.getProduct_primary() != null && product.getProduct_primary().length() != 0) {
			String[] sourceStrArray = product.getProduct_primary().split(",");
			for (int i = 0; i < sourceStrArray.length; i++) {
				Second s = new Second();
				s.setSecond_name(product.getProductuuid());
				s.setSecond_primaryid(Integer.parseInt(sourceStrArray[i]));
				int j = SecondService.querySecondName(s);
				if (j == 0) {
					SecondService.insertSelective(s);
				}
			}
		}
		productService.updateByPrimaryKeySelective(product);
		Integer res = productService.queryProductByProduct(product);//res为0则说明更新失败
		// 修改失败（修改后数据与数据库中一条数据产生重复），但是并不会对原数据产生影响，sql语句中添加了ignore，忽略错误
		if (res != 0) {
			PriceTrend pt = new PriceTrend();
			pt.setPt_price(product.getPrice());
			pt.setPt_pid(product.getProductuuid());
			pt.setPt_time(product.getUptime());
			priceTrendService.insertSelective(pt);
			if (d_id1 != null && d_id1 != "") {
				Discount discount = new Discount();
				discount.setDiscount_unit(discount_unit);
				discount.setDiscount_id(d_id1);
				discount.setDiscount_numbermax(Integer.parseInt(max1));
				discount.setDiscount_numbermin(Integer.parseInt(min1));
				discount.setDiscount_price(price1);
				discountService.updateByPrimaryKeySelective(discount);
			}
			if (d_id2 != null && d_id2 != "") {
				Discount discount = new Discount();
				discount.setDiscount_unit(discount_unit);
				discount.setDiscount_id(d_id2);
				discount.setDiscount_status("2");
				discount.setDiscount_numbermax(Integer.parseInt(max2));
				discount.setDiscount_numbermin(Integer.parseInt(min2));
				discount.setDiscount_price(price2);
				discountService.updateByPrimaryKeySelective(discount);
			}
			if (d_id3 != null && d_id3 != "") {
				Discount discount = new Discount();
				discount.setDiscount_unit(discount_unit);
				discount.setDiscount_id(d_id3);
				discount.setDiscount_status("3");
				discount.setDiscount_numbermax(0);
				discount.setDiscount_numbermin(Integer.parseInt(min3));
				discount.setDiscount_price(price3);
				discountService.updateByPrimaryKeySelective(discount);
			}
			if (d_id1 == null) {
				if (max1 != null && !max1.equals("")) {
					Discount discount = new Discount();
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
				if (max2 != null && !max2.equals("")) {
					Discount discount = new Discount();
					discount.setDiscount_unit(discount_unit);
					discount.setDiscount_pid(product.getProductuuid());
					discount.setDiscount_id(UIDGenerator.getUUID());
					discount.setDiscount_status("2");
					discount.setDiscount_date(new Date());
					discount.setDiscount_numbermax(Integer.parseInt(max2));
					discount.setDiscount_numbermin(Integer.parseInt(min2));
					discount.setDiscount_price(price2);
					discountService.insertSelective(discount);
				}
				if (min3 != null && !min3.equals("")) {
					Discount discount = new Discount();
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
			// 获取文件
			MultipartFile file1 = mult.getFile("img1");
			MultipartFile file2 = mult.getFile("img2");
			MultipartFile file3 = mult.getFile("img3");
			if (pimgList.size() == 0) {
				if (file1 != null) {
					String fileName = file1.getOriginalFilename();
					String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
					fileName = product.getProductuuid() + fileName;
					if ("jpg".equals(formatName) || "png".equals(formatName) || "jpeg".equals(formatName)) {
						File path = new File(req.getSession().getServletContext().getRealPath("/") + "upload");
						if (!path.exists()) {
							path.mkdirs();// 若不存在 ，则创建一个
						}
						FileOutputStream fos = new FileOutputStream(path + "/" + fileName);
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
				if (file2 != null) {
					String fileName2 = file2.getOriginalFilename();
					String formatName2 = fileName2.substring(fileName2.lastIndexOf(".") + 1);
					fileName2 = product.getProductuuid() + "_2" + fileName2;
					if ("jpg".equals(formatName2) || "png".equals(formatName2) || "jpeg".equals(formatName2)) {
						File path = new File(req.getSession().getServletContext().getRealPath("/") + "upload");
						if (!path.exists()) {
							path.mkdirs();// 若不存在 ，则创建一个
						}
						FileOutputStream fos = new FileOutputStream(path + "/" + fileName2);
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
				if (file3 != null) {
					String fileName3 = file3.getOriginalFilename();
					String formatName3 = fileName3.substring(fileName3.lastIndexOf(".") + 1);
					fileName3 = product.getProductuuid() + "_3" + fileName3;
					if ("jpg".equals(formatName3) || "png".equals(formatName3) || "jpeg".equals(formatName3)) {
						File path = new File(req.getSession().getServletContext().getRealPath("/") + "upload");
						if (!path.exists()) {
							path.mkdirs();// 若不存在 ，则创建一个
						}
						FileOutputStream fos = new FileOutputStream(path + "/" + fileName3);
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
			if (pimgList.size() >= 1) {
				if (file1 != null) {
					String fileName = file1.getOriginalFilename();
					String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
					fileName = pid + "_1" + fileName;

					// 获取原图片地址 删除
					String fileNameOne = pimgList.get(0).getP_imgname();

					if ("jpg".equals(formatName) || "png".equals(formatName) || "jpeg".equals(formatName)) {
						File path = new File(req.getSession().getServletContext().getRealPath("/") + "upload");
						delete(new File(path + "/" + fileNameOne));
						if (!path.exists()) {
							path.mkdirs();// 若不存在 ，则创建一个
						}
						FileOutputStream fos = new FileOutputStream(path + "/" + fileName);
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
				if (pimgList.size() == 1) {
					if (file2 != null) {
						String fileName2 = file2.getOriginalFilename();
						String formatName2 = fileName2.substring(fileName2.lastIndexOf(".") + 1);
						fileName2 = pid + "_2" + fileName2;
						if ("jpg".equals(formatName2) || "png".equals(formatName2) || "jpeg".equals(formatName2)) {
							File path = new File(req.getSession().getServletContext().getRealPath("/") + "upload");
							if (!path.exists()) {
								path.mkdirs();// 若不存在 ，则创建一个
							}
							FileOutputStream fos = new FileOutputStream(path + "/" + fileName2);
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
					if (file3 != null) {
						String fileName3 = file3.getOriginalFilename();
						String formatName3 = fileName3.substring(fileName3.lastIndexOf(".") + 1);
						fileName3 = pid + "_3" + fileName3;
						if ("jpg".equals(formatName3) || "png".equals(formatName3) || "jpeg".equals(formatName3)) {
							File path = new File(req.getSession().getServletContext().getRealPath("/") + "upload");
							if (!path.exists()) {
								path.mkdirs();// 若不存在 ，则创建一个
							}
							FileOutputStream fos = new FileOutputStream(path + "/" + fileName3);
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
				if (pimgList.size() == 2) {
					if (file3 != null) {
						String fileName3 = file3.getOriginalFilename();
						String formatName3 = fileName3.substring(fileName3.lastIndexOf(".") + 1);
						fileName3 = pid + "_3" + fileName3;
						if ("jpg".equals(formatName3) || "png".equals(formatName3) || "jpeg".equals(formatName3)) {
							File path = new File(req.getSession().getServletContext().getRealPath("/") + "upload");
							if (!path.exists()) {
								path.mkdirs();// 若不存在 ，则创建一个
							}
							FileOutputStream fos = new FileOutputStream(path + "/" + fileName3);
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
			if (pimgList.size() > 1 && pimgList.size() <= 3) {
				if (file2 != null) {
					String fileName2 = file2.getOriginalFilename();
					String formatName2 = fileName2.substring(fileName2.lastIndexOf(".") + 1);
					fileName2 = pid + "_2" + fileName2;

					// 获取原图片地址 删除
					String fileNameTwo = pimgList.get(1).getP_imgname();

					if ("jpg".equals(formatName2) || "png".equals(formatName2) || "jpeg".equals(formatName2)) {
						File path = new File(req.getSession().getServletContext().getRealPath("/") + "upload");
						delete(new File(path + "/" + fileNameTwo));

						if (!path.exists()) {
							path.mkdirs();// 若不存在 ，则创建一个
						}
						FileOutputStream fos = new FileOutputStream(path + "/" + fileName2);
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

			if (pimgList.size() == 3) {
				if (file3 != null) {
					String fileName3 = file3.getOriginalFilename();
					String formatName3 = fileName3.substring(fileName3.lastIndexOf(".") + 1);
					fileName3 = pid + "_3" + fileName3;

					// 获取原图片地址 删除
					String fileNameThree = pimgList.get(2).getP_imgname();

					if ("jpg".equals(formatName3) || "png".equals(formatName3) || "jpeg".equals(formatName3)) {
						File path = new File(req.getSession().getServletContext().getRealPath("/") + "upload");
						delete(new File(path + "/" + fileNameThree));

						if (!path.exists()) {
							path.mkdirs();// 若不存在 ，则创建一个
						}
						FileOutputStream fos = new FileOutputStream(path + "/" + fileName3);
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

		} else {
			// 通知用户修改失败，数据重复
			model.addAttribute("result", "fail");
			return "redirect:/1019/zai/xin/jian/updateProduct?uid=" + product.getProductuuid();
		}

		return "redirect:/1019/zai/xin/jian/queryAllProduct";
	}

	@SuppressWarnings("resource")
	@RequestMapping(value = "1019/zai/xin/jian/updateNullData")
	public String updateNullData(@RequestParam(required = false) String d_id3,
			@RequestParam(required = false) String d_id2, @RequestParam(required = false) String d_id1,
			@RequestParam(required = false) Float price3, @RequestParam(required = false) Float price2,
			@RequestParam(required = false) Float price1, @RequestParam(required = false) String min1,
			@RequestParam(required = false) String max1, @RequestParam(required = false) String min2,
			@RequestParam(required = false) String max2, @RequestParam(required = false) String min3,
			@RequestParam(required = false) String discount_unit, MultipartFile[] files, Model model, Product product,
			HttpSession session, HttpServletRequest req) throws IOException {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		product.setUptime(new Date());
		productService.updateByPrimaryKeySelective(product);
		if (d_id1 != null && d_id1 != "") {
			Discount discount = new Discount();
			discount.setDiscount_unit(discount_unit);
			discount.setDiscount_id(d_id1);
			discount.setDiscount_numbermax(Integer.parseInt(max1));
			discount.setDiscount_numbermin(Integer.parseInt(min1));
			discount.setDiscount_price(price1);
			discountService.updateByPrimaryKeySelective(discount);
		}
		if (d_id2 != null && d_id2 != "") {
			Discount discount = new Discount();
			discount.setDiscount_unit(discount_unit);
			discount.setDiscount_id(d_id2);
			discount.setDiscount_status("2");
			discount.setDiscount_numbermax(Integer.parseInt(max2));
			discount.setDiscount_numbermin(Integer.parseInt(min2));
			discount.setDiscount_price(price2);
			discountService.updateByPrimaryKeySelective(discount);
		}
		if (d_id3 != null && d_id3 != "") {
			Discount discount = new Discount();
			discount.setDiscount_unit(discount_unit);
			discount.setDiscount_id(d_id3);
			discount.setDiscount_status("3");
			discount.setDiscount_numbermax(0);
			discount.setDiscount_numbermin(Integer.parseInt(min3));
			discount.setDiscount_price(price3);
			discountService.updateByPrimaryKeySelective(discount);
		}
		if (d_id1 == null) {
			if (max1 != null && !max1.equals("")) {
				Discount discount = new Discount();
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
			if (max2 != null && !max2.equals("")) {
				Discount discount = new Discount();
				discount.setDiscount_unit(discount_unit);
				discount.setDiscount_pid(product.getProductuuid());
				discount.setDiscount_id(UIDGenerator.getUUID());
				discount.setDiscount_status("2");
				discount.setDiscount_date(new Date());
				discount.setDiscount_numbermax(Integer.parseInt(max2));
				discount.setDiscount_numbermin(Integer.parseInt(min2));
				discount.setDiscount_price(price2);
				discountService.insertSelective(discount);
			}
			if (min3 != null && !min3.equals("")) {
				Discount discount = new Discount();
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
		// 获取文件
		MultipartFile file1 = mult.getFile("img1");
		MultipartFile file2 = mult.getFile("img2");
		MultipartFile file3 = mult.getFile("img3");
		if (pimgList.size() == 0) {
			if (file1 != null) {
				String fileName = file1.getOriginalFilename();
				String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
				fileName = product.getProductuuid() + fileName;
				if ("jpg".equals(formatName) || "png".equals(formatName) || "jpeg".equals(formatName)) {
					File path = new File(req.getSession().getServletContext().getRealPath("/") + "upload");
					if (!path.exists()) {
						path.mkdirs();// 若不存在 ，则创建一个
					}
					FileOutputStream fos = new FileOutputStream(path + "/" + fileName);
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
			if (file2 != null) {
				String fileName2 = file2.getOriginalFilename();
				String formatName2 = fileName2.substring(fileName2.lastIndexOf(".") + 1);
				fileName2 = product.getProductuuid() + "_2" + fileName2;
				if ("jpg".equals(formatName2) || "png".equals(formatName2) || "jpeg".equals(formatName2)) {
					File path = new File(req.getSession().getServletContext().getRealPath("/") + "upload");
					if (!path.exists()) {
						path.mkdirs();// 若不存在 ，则创建一个
					}
					FileOutputStream fos = new FileOutputStream(path + "/" + fileName2);
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
			if (file3 != null) {
				String fileName3 = file3.getOriginalFilename();
				String formatName3 = fileName3.substring(fileName3.lastIndexOf(".") + 1);
				fileName3 = product.getProductuuid() + "_3" + fileName3;
				if ("jpg".equals(formatName3) || "png".equals(formatName3) || "jpeg".equals(formatName3)) {
					File path = new File(req.getSession().getServletContext().getRealPath("/") + "upload");
					if (!path.exists()) {
						path.mkdirs();// 若不存在 ，则创建一个
					}
					FileOutputStream fos = new FileOutputStream(path + "/" + fileName3);
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

		if (pimgList.size() >= 1) {
			if (file1 != null) {
				String fileName = file1.getOriginalFilename();
				String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
				fileName = pid + fileName;

				// 获取原图片地址 删除
				String fileNameOne = pimgList.get(0).getP_imgname();

				if ("jpg".equals(formatName) || "png".equals(formatName) || "jpeg".equals(formatName)) {
					File path = new File(req.getSession().getServletContext().getRealPath("/") + "upload");
					delete(new File(path + "/" + fileNameOne));
					if (!path.exists()) {
						path.mkdirs();// 若不存在 ，则创建一个
					}
					FileOutputStream fos = new FileOutputStream(path + "/" + fileName);
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
			if (pimgList.size() == 1) {
				if (file2 != null) {
					String fileName2 = file2.getOriginalFilename();
					String formatName2 = fileName2.substring(fileName2.lastIndexOf(".") + 1);
					fileName2 = pid + "_2" + fileName2;
					if ("jpg".equals(formatName2) || "png".equals(formatName2) || "jpeg".equals(formatName2)) {
						File path = new File(req.getSession().getServletContext().getRealPath("/") + "upload");
						if (!path.exists()) {
							path.mkdirs();// 若不存在 ，则创建一个
						}
						FileOutputStream fos = new FileOutputStream(path + "/" + fileName2);
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

				if (file3 != null) {
					String fileName3 = file3.getOriginalFilename();
					String formatName3 = fileName3.substring(fileName3.lastIndexOf(".") + 1);
					fileName3 = pid + "_3" + fileName3;
					if ("jpg".equals(formatName3) || "png".equals(formatName3) || "jpeg".equals(formatName3)) {
						File path = new File(req.getSession().getServletContext().getRealPath("/") + "upload");
						if (!path.exists()) {
							path.mkdirs();// 若不存在 ，则创建一个
						}
						FileOutputStream fos = new FileOutputStream(path + "/" + fileName3);
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
			if (pimgList.size() == 2) {
				if (file3 != null) {
					String fileName3 = file3.getOriginalFilename();
					String formatName3 = fileName3.substring(fileName3.lastIndexOf(".") + 1);
					fileName3 = pid + "_3" + fileName3;
					if ("jpg".equals(formatName3) || "png".equals(formatName3) || "jpeg".equals(formatName3)) {
						File path = new File(req.getSession().getServletContext().getRealPath("/") + "upload");
						if (!path.exists()) {
							path.mkdirs();// 若不存在 ，则创建一个
						}
						FileOutputStream fos = new FileOutputStream(path + "/" + fileName3);
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
		if (pimgList.size() > 1 && pimgList.size() <= 3) {
			if (file2 != null) {
				String fileName2 = file2.getOriginalFilename();
				String formatName2 = fileName2.substring(fileName2.lastIndexOf(".") + 1);
				fileName2 = pid + "_2" + fileName2;

				// 获取原图片地址 删除
				String fileNameTwo = pimgList.get(1).getP_imgname();

				if ("jpg".equals(formatName2) || "png".equals(formatName2) || "jpeg".equals(formatName2)) {
					File path = new File(req.getSession().getServletContext().getRealPath("/") + "upload");
					delete(new File(path + "/" + fileNameTwo));

					if (!path.exists()) {
						path.mkdirs();// 若不存在 ，则创建一个
					}
					FileOutputStream fos = new FileOutputStream(path + "/" + fileName2);
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
		if (pimgList.size() == 3) {
			if (file3 != null) {
				String fileName3 = file3.getOriginalFilename();
				String formatName3 = fileName3.substring(fileName3.lastIndexOf(".") + 1);
				fileName3 = pid + "_3" + fileName3;

				// 获取原图片地址 删除
				String fileNameThree = pimgList.get(2).getP_imgname();

				if ("jpg".equals(formatName3) || "png".equals(formatName3) || "jpeg".equals(formatName3)) {
					File path = new File(req.getSession().getServletContext().getRealPath("/") + "upload");
					delete(new File(path + "/" + fileNameThree));

					if (!path.exists()) {
						path.mkdirs();// 若不存在 ，则创建一个
					}
					FileOutputStream fos = new FileOutputStream(path + "/" + fileName3);
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
		return "redirect:/1019/zai/xin/jian/nullData";
	}

	/**
	 * 供应商管理
	 * 
	 * @param page
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "1019/zai/xin/jian/editsupplier")
	public String editSupplier(@RequestParam(defaultValue = "1") final Integer page, Model model, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		// 每一页输出的数据条数，并将值放到map中
		Page pageEntity = new Page(page, 60);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", pageEntity.getStart());
		map.put("size", pageEntity.getPageSize());
		map.put("keyword", null);
		// map.put("tableName", "supplier");

		// 将所有的产品取出来
		List<Supplier> supplier = supplierService.list(map);
		if (supplier == null || supplier.size() == 0) {
			return "redirect:/404";
		}
		// 得到在数据库中数据的条数,并分页
		Long pageCount = supplierService.getTotal(null);
		int pageSize = (int) Math.ceil(pageCount / 60.0);
		model.addAttribute("currentPage", page);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("supplier", supplier);
		model.addAttribute("supplierList", "supplierList");
		return "adminHome";
	}

	@RequestMapping(value = "1019/zai/xin/jian/updatesupplier")
	public String updateSupplier(Model model, String uid, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		Supplier supplier = supplierService.selectByPrimaryKey(uid);
		model.addAttribute("supplier", supplier);
		return "updateSupplier";
	}

	@RequestMapping(value = "1019/zai/xin/jian/supplierupdateByPrimaryKeySelective")
	public String supplierupdateByPrimaryKeySelective(Model model, Supplier supplier,
			@RequestParam MultipartFile[] supplierphotosFile, @RequestParam MultipartFile[] qualificationFile,
			@RequestParam MultipartFile[] supplierprefileFile, HttpServletRequest req, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		String path = req.getSession().getServletContext().getRealPath("/files/supplier");

		if (supplierphotosFile.length != 0) {
			for (int i = 0; i < supplierphotosFile.length; i++) {
				supplier.setSupplierphotos(
						Upload.uploadFile(req, RandomUtil.getRandomFileName(), supplierphotosFile[i], path));
			}
		}
		if (qualificationFile.length != 0) {
			for (MultipartFile multipartFile : qualificationFile) {
				supplier.setQualification(Upload.uploadFile(req, RandomUtil.getRandomFileName(), multipartFile, path));
			}
		}
		if (supplierprefileFile.length != 0) {
			for (MultipartFile multipartFile : supplierprefileFile) {
				supplier.setSupplierprefile(
						Upload.uploadFile(req, RandomUtil.getRandomFileName(), multipartFile, path));
			}
		}

		supplierService.updateByPrimaryKeySelective(supplier);
		return "forward:/editSupplier";
	}

	/*
	 * @RequestMapping(value = "1019/zai/xin/jian/model") public String
	 * model(HttpSession session) {
	 * logger.info("com.zikezhi.controller.IndexController.addModel start"); if
	 * (session.getAttribute("user") == null) { return "Adminlogin"; } return
	 * "addModel"; }
	 */

	@RequestMapping(value = "1019/zai/xin/jian/searchEditSupplier")
	public String searchEditSupplier(String keyword, int page, String value, Model model, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		keyword = keyword.toUpperCase();
		// 每一页输出的数据条数，并将值放到map中
		Page pageEntity = new Page(page, 60);
		Search search = new Search(keyword, value);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", pageEntity.getStart());
		map.put("size", pageEntity.getPageSize());
		map.put("keyword", search.getKeyword());
		map.put("tableName", search.getTableName());

		if (value.equals("product")) {
			List<Product> product = productService.list(map);
			if (product == null || product.size() == 0) {
				return "redirect: 404";
			}
			Long pageCount = productService.getTotal(map);
			int pageSize = (int) Math.ceil(pageCount / 60.0);
			model.addAttribute("currentPage", page);
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("product", product);
			model.addAttribute("productHome", "productHome");
			return "adminHome";
		}
		List<Supplier> supplier = supplierService.list(map);

		if (supplier == null || supplier.size() == 0) {
			return "redirect:/404";
		}

		// 得到在数据库中，带有关键字的表
		Long pageCount = supplierService.getTotal(keyword);
		int pageSize = (int) Math.ceil(pageCount / 60.0);
		model.addAttribute("currentPage", page);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("supplier", supplier);

		return "editSupplier";
	}

	/*
	 * @RequestMapping(value = "1019/zai/xin/jian/editmodel") public String
	 * editModel(HttpSession session) { if (session.getAttribute("user") ==
	 * null) { return "Adminlogin"; } return "editModel"; }
	 */

	/**
	 * 后台系统首页
	 * 
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "1019/zai/xin/jian/cont")
	public String cont(Model model, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		//System.out.println(session.getAttribute("user"));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", 0);
		map.put("size", 1000);
		List<SearchTable> searchTable = searchTableService.select(map);
		List<String> statusTotal = expressService.queryByStatus();
		List<String> bomTotal = bomOrderService.queryByStatus();
		int status1 = 0;
		int status2 = 0;
		int status3 = 0;
		int status4 = 0;
		int status5 = 0;
		int status6 = 0;
		if (!statusTotal.isEmpty()) {
			for (String zhuangtai : statusTotal) {
				if (zhuangtai != null) {
					if (zhuangtai.equals("1")) {
						status1++;
					} else if (zhuangtai.equals("2")) {
						status2++;
					} else if (zhuangtai.equals("3")) {
						status3++;
					} else if (zhuangtai.equals("4")) {
						status4++;
					} else if (zhuangtai.equals("5")) {
						status5++;
					} else if (zhuangtai.equals("6")) {
						status6++;
					}
				}
			}
		}
		if (!bomTotal.isEmpty()) {
			for (String zhuangtai : bomTotal) {
				if (zhuangtai.equals("1")) {
					status1++;
				} else if (zhuangtai.equals("2")) {
					status2++;
				} else if (zhuangtai.equals("3")) {
					status3++;
				} else if (zhuangtai.equals("4")) {
					status4++;
				} else if (zhuangtai.equals("5")) {
					status5++;
				} else if (zhuangtai.equals("6")) {
					status6++;
				}
			}
		}
		model.addAttribute("status1", status1);
		model.addAttribute("status2", status2);
		model.addAttribute("status3", status3);
		model.addAttribute("status4", status4);
		model.addAttribute("status5", status5);
		model.addAttribute("status6", status6);
		model.addAttribute("search", searchTable);
		model.addAttribute("adminHome", "adminHome");
		return "adminHome";
	}

	/*
	 * @RequestMapping("supplierindex") public String supplierindex(Model model)
	 * { List<Supplier> supplier = supplierService.selectRand(); List<Comments>
	 * listComments = comments.selectLimit(); List<Supplier> listSupplier = new
	 * ArrayList<Supplier>(); for (Comments comments : listComments) {
	 * listSupplier.add(supplierService.selectByPrimaryKey(comments.getTopictype
	 * ())); } model.addAttribute("comments", listComments);
	 * model.addAttribute("listsupplier", listSupplier);
	 * model.addAttribute("supplier", supplier); return "supplierindex"; }
	 */

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "change", method = RequestMethod.POST) public
	 * Map<String, Object> change() { Map<String, Object> map = new
	 * HashMap<String, Object>(); List<Supplier> supplier =
	 * supplierService.selectRand(); for (int i = 0; i < supplier.size(); i++) {
	 * supplier.get(i).setSupplierposition("");
	 * supplier.get(i).setRepoposition("");
	 * supplier.get(i).setValidityperiod(""); supplier.get(i).setTelphone4("");
	 * supplier.get(i).setTelphone3(""); supplier.get(i).setTelphone2("");
	 * supplier.get(i).setTelphone1(""); supplier.get(i).setTelphone("");
	 * supplier.get(i).setCellphone(""); supplier.get(i).setFax("");
	 * supplier.get(i).setEmail(""); supplier.get(i).setBrandoperation("");
	 * supplier.get(i).setSupplierphotos("");
	 * supplier.get(i).setQualification(""); supplier.get(i).setEvaluate("");
	 * supplier.get(i).setIscheck(false);
	 * supplier.get(i).setSupplierprefile(""); supplier.get(i).setQq("");
	 * supplier.get(i).setQq2(""); } map.put("supplier", supplier); return map;
	 * }
	 */

	/*
	 * @RequestMapping("searchsupplier") public String searchSupplier(String
	 * keyword, Model model, HttpServletRequest req) { if(keyword != null &&
	 * keyword.length() >= 30){ return "404"; } Map<String, Object> map = new
	 * HashMap<String, Object>(); map.put("start", 0); map.put("size", 3);
	 * map.put("keyword", keyword); // 记录搜索记录 ip/关键字 SearchTable searchT = new
	 * SearchTable(); searchT.setContent(keyword);
	 * searchT.setIp(GetIP.getIP(req));
	 * searchT.setSearchuuid(UIDGenerator.getUUID());
	 * searchTableService.insertSelective(searchT); List<Supplier> supplier =
	 * supplierService.list(map);
	 * 
	 * List<Comments> list = new ArrayList<>(); for (Supplier temp: supplier) {
	 * list = comments.selectByTopicType(temp.getSupplieruuid()); }
	 * 
	 * if (supplier.size() == 0) { return "404"; } // 得到在数据库中，带有关键字的表 Long
	 * pageCount = supplierService.getTotal(keyword); int pageSize = (int)
	 * Math.ceil(pageCount / 60.0); model.addAttribute("pageSize", pageSize);
	 * model.addAttribute("list", list); model.addAttribute("supplier",
	 * supplier); return "searchSupplier"; }
	 */

	/*
	 * @RequestMapping("searchSupplierResult") public String
	 * searchSupplierResult(String id, Model model) { Supplier supplier =
	 * supplierService.selectByPrimaryKey(id); List<Comments> list =
	 * comments.selectByTopicType(id); TreeUtil tree = new TreeUtil();
	 * List<Comments> list2 = tree.recursiveTree(list);
	 * model.addAttribute("supplier", supplier); model.addAttribute("comments",
	 * list2); return "searchSupplierResult"; }
	 */

	@RequestMapping("1019/zai/xin/jian/quanzifabiao")
	public String quanzifabiaoneirong(HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		return "quanzifabiao";
	}
	/*
	 * @Resource(name = "communityService") private CommunityService
	 * communityService;
	 */

	/*
	 * @RequestMapping("1019/zai/xin/jian/fabiaoquanzi") public String
	 * fabiaoquanzi(Community community, HttpServletRequest req, Model model,
	 * HttpSession session) { if (session.getAttribute("user") == null) { return
	 * "Adminlogin"; } community.setCommunityuuid(UIDGenerator.getUUID());
	 * community.setAuthor("admin"); communityService.insert(community); return
	 * "redirect:/index"; }
	 */

	/*
	 * @RequestMapping("complaintprice")
	 * 
	 * @ResponseBody public int complaintprice(Product product) { int result =
	 * productService.updateByPrimaryKeySelective(product); return result; }
	 */

	@RequestMapping("1019/zai/xin/jian/Adminlogin")
	public String Adminlogin() {
		return "Adminlogin";
	}

	/**
	 * 后台系统登录验证
	 * 
	 * @param username
	 * @param password
	 * @param req
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(name = "1019/zai/xin/jian/AdminloginAction", method = RequestMethod.POST)
	public String AdminloginAction(String username, String password, HttpServletRequest req, HttpSession session,
			Model model) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = formatter.format(new Date());
		String pwd = MD5Generator.getMD5(password);
		AdminZaiXinJian admin = adminZaiXinJianService.queryByABystatus();
		AdminZaiXinJian adminZaiXinJian = adminZaiXinJianService.adminLogin(username, pwd);
		if (adminZaiXinJian == null) {
			return "Adminlogin";
		}

		if (adminZaiXinJian.getAdmin_jurisdiction().equals("1")) {
			String uptime = formatter.format(adminZaiXinJian.getAdmin_uptime());
			if (!uptime.equals(dateString)) {
				AdminZaiXinJian a = new AdminZaiXinJian();
				a.setAdmin_loginIp1(GetIP.getIP(req));
				a.setAdmin_id(adminZaiXinJian.getAdmin_id());
				adminZaiXinJianService.updateByPrimaryKeySelective(a);
			}
			session.setAttribute("user", adminZaiXinJian);
			return "redirect:cont";
		} else if (!adminZaiXinJian.getAdmin_jurisdiction().equals("1")
				&& adminZaiXinJian.getAdmin_shrio().indexOf("n") == -1) {
			if (adminZaiXinJian.getAdmin_status().equals("1")) {
				return "Adminlogin";
			}
			if ((admin.getAdmin_loginIp1() != null && admin.getAdmin_loginIp1().equals(GetIP.getIP(req)))
					|| (admin.getAdmin_loginIp2() != null && admin.getAdmin_loginIp2().equals(GetIP.getIP(req)))
					|| (admin.getAdmin_loginIp3() != null && admin.getAdmin_loginIp3().equals(GetIP.getIP(req)))) {
				session.setAttribute("user", adminZaiXinJian);
				return "redirect:cont";
			} else {
				model.addAttribute("ip", "ip");
				return "Adminlogin";
			}
		} else if (adminZaiXinJian.getAdmin_shrio().indexOf("n") != -1) {
			session.setAttribute("user", adminZaiXinJian);
			return "redirect:cont";
		}
		return "redirect:404";
	}

	@RequestMapping(value = "register")
	public String reg() {
		return "register";
	}

	@Resource(name = "userInfoService")
	private UserInfoService userInfoService;

	/**
	 * 用户注册
	 * 
	 * @param user
	 * @param verify
	 * @param password1
	 * @param req
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "userRegister", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> userRegister(UserInfo user, @RequestParam(required = true) String verify,
			@RequestParam(required = true) String password1, HttpServletRequest req, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 校验码是否正确
		String code = (String) req.getSession().getAttribute("yanzheng");
		if (user.getUsername().length() >= 11 && user.getUsername().length() < 4 && user.getPassword().length() > 16
				&& user.getPassword().length() < 6) {
			map.put("msg", "用户名或密码不合要求");
			map.put("code", "-3");
			return map;
		}
		if (!code.equalsIgnoreCase(verify) || verify == null || verify == "") {
			map.put("msg", "验证码错误");
			map.put("code", "-2");
			return map;
		}
		// 查询用户名在数据库中是否存在
		if (userInfoService.findUserName(user.getUsername()) > 0 || password1.equals("") || password1 == null
				|| !user.getPassword().equals(password1) || userInfoService.findTelphone(user.getTelephone()) > 0) {
			map.put("msg", "用户名或电话号码己存在");
			map.put("code", "-1");
			return map;
		}
		user.setUseruid(UIDGenerator.getUUID());
		user.setRegip(GetIP.getIP(req));
		user.setPassword(MD5Generator.getMD5(user.getPassword(), user.getUseruid()));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			// 得到data，并按格式得到数据 ，再转化成data类型
			user.setRegtime(sdf.parse(sdf.format(new Date())));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		user.setActivity("true");
		userInfoService.insertSelective(user);
		List<UserInfo> userInfo = userInfoService.userLogin(user);
		session.setAttribute("supplieruid", userInfo.get(0).getSupplieruid());
		session.setAttribute("userName", userInfo.get(0).getUsername());
		session.setAttribute("uid", userInfo.get(0).getUseruid());
		map.put("msg", "登录成功");
		map.put("code", "1");
		return map;
	}

	/**
	 * 用户登录
	 * 
	 * @param user
	 * @param verify
	 * @param req
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "userLogin", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> userLogin(UserInfo user, @RequestParam(required = true) String verify,
			HttpServletRequest req, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 校验码是否正确
		String code = (String) req.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		if (!code.equalsIgnoreCase(verify) || verify == null || verify == "") {
			map.put("msg", "验证码错误");
			map.put("code", "-2");
			return map;
		}
		// 将用户数据从数据库中查询
		List<UserInfo> userInfo = userInfoService.userLogin(user);
		if (userInfo.size() != 1) {
			map.put("msg", "用户或密码错误");
			map.put("code", "-1");
			return map;
		}
		// 将数据库中的用户密码和用户输入的用户密码相比较，查看是否相等
		String sb = MD5Generator.getMD5(user.getPassword(), userInfo.get(0).getUseruid());
		if (!userInfo.get(0).getPassword().equals(sb)) {
			map.put("msg", "用户或密码错误 ");
			map.put("code", "-1");
			return map;
		}
		session.setAttribute("supplieruid", userInfo.get(0).getSupplieruid());
		session.setAttribute("userName", userInfo.get(0).getUsername());
		session.setAttribute("uid", userInfo.get(0).getUseruid());

		// 记录登录的时间
		UserInfo userLoginTime = new UserInfo();
		userLoginTime.setUseruid(userInfo.get(0).getUseruid());
		userLoginTime.setLasttime(new Date());
		userLoginTime.setLastip(GetIP.getIP(req));
		userInfoService.updateByPrimaryKeySelective(userLoginTime);
		String url = (String) session.getAttribute("url");
		session.removeAttribute("url");
		map.put("url", url);
		map.put("msg", "登录成功");
		map.put("code", "1");

		// 根据useruid找到对应的订单总数
		long user_order = expressService.user_Order(userInfo.get(0).getUseruid());
		session.setAttribute("user_order", user_order);

		return map;
	}

	@Resource(name = "commentsService")
	private CommentsService comments;

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "commentQuanzi", method = RequestMethod.POST)
	 * public Map<String, Object> commentQuanzi(@RequestParam(required = true)
	 * String comment,
	 * 
	 * @RequestParam(required = true) String postkey, String level, String
	 * anonymous,
	 * 
	 * @RequestParam(required = true) String topictype, String path, String
	 * parentuid, String useruid, HttpServletRequest req, HttpSession session) {
	 * Map<String, Object> map = new HashMap<String, Object>();
	 * 
	 * if(anonymous.equals("anonymous")){ //匿名用户 postkey = "anonymousis"; }
	 * 
	 * if (session.getAttribute("uid") == null ||
	 * !session.getAttribute("uid").equals(useruid)) {
	 * session.removeAttribute("userName"); map.put("code", "-1");
	 * map.put("msg", "你没有登录!"); return map; } String ip = GetIP.getIP(req);
	 * String uid = UIDGenerator.getUUID(); Comments commentsEntity = new
	 * Comments(); // 内容 commentsEntity.setContent(comment); // 回复的用户
	 * commentsEntity.setPostkey(postkey); // 回复的是哪个id
	 * commentsEntity.setParentuid(parentuid); // 被回复的用户
	 * commentsEntity.setPath(path); // 主题是哪个,供应商是哪个uid
	 * commentsEntity.setTopictype(topictype); // IP commentsEntity.setIp(ip);
	 * // uid commentsEntity.setCommentsuid(uid); // 用户uid
	 * commentsEntity.setUseruid(useruid); // 回复等级 如果为1则被回复的用户为空
	 * commentsEntity.setLevel(level); commentsEntity.setCreatedtime(new
	 * Date()); int result = comments.insertSelective(commentsEntity); if
	 * (result == 0) { map.put("code", "-2"); map.put("msg", "发表失败,稍候请重新发表");
	 * return map; } map.put("code", "1"); Comments c =
	 * comments.selectByPrimaryKey(commentsEntity.getCommentsuid());
	 * map.put("sid", c.getCommentsid()); map.put("uid", c.getCommentsuid());
	 * map.put("like", c.getLikecount()); map.put("downvote",
	 * c.getUnlikecount()); map.put("time", c.getCreatedtime());
	 * map.put("postkey", c.getPostkey()); map.put("level", c.getLevel());
	 * map.put("msg", "发表成功!"); return map; }
	 */

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "userlike", method = RequestMethod.POST) public
	 * Map<String, Object> userlike(@RequestParam(required = true) Integer like,
	 * 
	 * @RequestParam(required = true) Integer alike, @RequestParam(required =
	 * true) String comment) { Map<String, Object> map = new HashMap<String,
	 * Object>(); if(like - 1 != alike){ map.put("code", "失败,请稍候再赞"); return
	 * map; } Comments commentsEntity = new Comments();
	 * commentsEntity.setLikecount(like);
	 * commentsEntity.setCommentsuid(comment); int i =
	 * comments.updateByPrimaryKeySelective(commentsEntity); if (i == 1) {
	 * map.put("code", "插入成功"); map.put("value", like); } return map; }
	 */

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "downvote", method = RequestMethod.POST) public
	 * Map<String, Object> downvote(@RequestParam(required = true) Integer
	 * adownvote,
	 * 
	 * @RequestParam(required = true) Integer downvote, @RequestParam(required =
	 * true) String comment) { Map<String, Object> map = new HashMap<String,
	 * Object>(); if (downvote - 1 != adownvote) { map.put("code", "失败,请稍候再赞");
	 * return map; } Comments commentsEntity = new Comments();
	 * commentsEntity.setLikecount(downvote);
	 * commentsEntity.setCommentsuid(comment); int i =
	 * comments.updateByPrimaryKeySelective(commentsEntity); if (i == 1) {
	 * map.put("code", "插入成功"); map.put("value", downvote); } return map; }
	 */

	@RequestMapping("aboutus")
	public String aboutus() {
		return "aboutus";
	}

	/**
	 * 用户系统
	 * 
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("usersystem")
	public String userSystem(Model model, HttpSession session) {
		String uid = (String) session.getAttribute("uid");
		if (uid == null) {
			return "login";
		}
		int userCommentCount = comments.selectCountUser(uid);
		UserInfo user = userInfoService.selectByPrimaryKey(uid);
		int star = expressService.queryByStar(uid);
		model.addAttribute("star", star);
		model.addAttribute("user", user);
		model.addAttribute("commentCount", userCommentCount);
		model.addAttribute("biaozi", 2);
		List<Express> list = expressService.queryzdCountNoPay(uid);
		if(list.size()>0){
			model.addAttribute("zdCountNoPay", list.size());
		}
		List<Express> list1 = expressService.querybdCountNoPay(uid);
		if(list1.size()>0){
		   model.addAttribute("bdCountNoPay", list1.size());
		}
		return "usersystem";
	}

	/*
	 * @Resource(name = "billService") private BillService billService;
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "bill", method = RequestMethod.POST) public
	 * Map<String, Object> billPost(Bill bill, HttpSession session){ Map<String,
	 * Object> map = new HashMap<String, Object>();
	 * if(session.getAttribute("user") == null){ map.put("code", "-1"); return
	 * map; } bill.setBillUid(UIDGenerator.getUUID()); billService.insert(bill);
	 * return map; }
	 */

	/*
	 * @RequestMapping(value = "bill", method = RequestMethod.GET) public String
	 * bill(Model model, HttpSession session){ if (session.getAttribute("user")
	 * == null || !session.getAttribute("user").equals("quting")) { return
	 * "redirect:BillLogin"; } List<Bill> bill = billService.selectAll();
	 * model.addAttribute("bill", bill); return "user/bill"; }
	 */

	/*
	 * @RequestMapping(value = "BillLogin", method = RequestMethod.GET) public
	 * String billLogin(){ return "BillLogin"; }
	 */

	/*
	 * @RequestMapping(value = "BillLogin", method = RequestMethod.POST) public
	 * String billLogin(String username, String password, HttpSession session){
	 * if(username.equals("quting") && password.equals("qutingting")) {
	 * session.setAttribute("user", username); return "redirect:bill"; }else{
	 * return "redirect:BillLogin"; } }
	 */

	/*
	 * @RequestMapping("english") public String StudyEnglish(){ return
	 * "Advertisement/StudyEnglish"; }
	 * 
	 * @RequestMapping("user-englishStudy") public String userEnglishStudy(){
	 * return "user/user-englishStudy"; }
	 */

	/*
	 * @Resource(name = "memberServiceService") private MemberServiceServsvice
	 * memberService;
	 * 
	 * @RequestMapping("1019/zai/xin/jian/handlingMember") public String
	 * handlingMember(Model model, HttpSession session){ if
	 * (session.getAttribute("user") == null) { return "Adminlogin"; }
	 * List<MemberService> list = memberService.selectAll();
	 * model.addAttribute("members", list); return "user/memberService"; }
	 */

	/*
	 * @RequestMapping("1019/zai/xin/jian/handlingMemberService") public String
	 * handlingMemberService(String uid, Model model, HttpSession session){ if
	 * (session.getAttribute("user") == null) { return "Adminlogin"; }
	 * MemberService memberService1 = memberService.selectByPrimaryKey(uid);
	 * model.addAttribute("members", memberService1); return "user/handling"; }
	 */

	/*
	 * @RequestMapping(value = "1019/zai/xin/jian/addICProduct", method =
	 * RequestMethod.GET) public String addICProduct(HttpSession session, Model
	 * model){
	 * 
	 * if (session.getAttribute("user") == null) {
	 * model.addAttribute("msg","你没有登录"); model.addAttribute("code", "-2");
	 * return "user/msg"; } return "admin/icproductupload"; }
	 */

	/*
	 * @RequestMapping(value = "1019/zai/xin/jian/addICProduct", method =
	 * RequestMethod.POST)
	 * 
	 * @ResponseBody public Map<String, Object> addICProduct(String json,
	 * HttpSession session) throws InvocationTargetException,
	 * IllegalAccessException {
	 * 
	 * JSONArray jsonArray = JSON.parseArray(json); Map<String, Object>
	 * resultMap = new HashMap<>(); if (session.getAttribute("user") == null) {
	 * resultMap.put("msg","你没有登录"); resultMap.put("code", "-2"); return
	 * resultMap; } int j = 0; for (int i = 0; i < jsonArray.size(); i++) {
	 * Product product = new Product();
	 * 
	 * Map map = (Map)JSON.parse(jsonArray.get(0).toString());
	 * product.setProductuuid(UIDGenerator.getUUID());
	 * product.setSupplier(map.get("supplier").toString());
	 * product.setProduct(map.get("product").toString());
	 * product.setManufacturer(map.get("manufacturer").toString());
	 * product.setLotnumber(map.get("lotnumber").toString());
	 * product.setKeywords(map.get("keywords").toString());
	 * product.setEncapsulation(map.get("encapsulation").toString());
	 * product.setDescription(map.get("description").toString());
	 * product.setIsgoodsinstock(map.get("isgoodsinstock").toString());
	 * product.setPrice(Float.parseFloat(map.get("price").toString()));
	 * product.setQuality((Integer) map.get("quality"));
	 * product.setQq(map.get("qq").toString());
	 * product.setSupplieruuid(map.get("supplieruuid").toString());
	 * 
	 * j = productService.insertSelective(product); if(j == 0){
	 * resultMap.put("msg", "提交失败,请刷新后再试!"); resultMap.put("code", "-1"); return
	 * resultMap; }
	 * 
	 * } resultMap.put("msg", "提交成功,请刷新页面!"); resultMap.put("code", "1");
	 * 
	 * return resultMap; }
	 */

	/**
	 * 后台订单查看
	 * 
	 * @param session
	 * @param model
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value = "1019/zai/xin/jian/express")
	public String adminExpress(@RequestParam(required = false) String status,
			@RequestParam(required = false) String product, @RequestParam(required = false) String edate,
			@RequestParam(required = false) String address, @RequestParam(required = false) String telphone,
			@RequestParam(required = false) String name, @RequestParam(required = false) String page,
			@RequestParam(required = false) String rows, HttpSession session, Model model) throws ParseException {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		PageBean pageBean;
		if (page == null && rows == null) {
			pageBean = new PageBean(1, 100);
		} else {
			pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		}
		Map<String, Object> map = new HashMap<String, Object>();
		if (name != null && !name.equals("")) {
			map.put("username", "%" + name + "%");
		}
		if (status != null && !status.equals("")) {
			map.put("status", "%" + status + "%");
		}
		if (address != null && !address.equals("")) {
			map.put("address", "%" + address + "%");
		} else if (telphone != null && !telphone.equals("")) {
			map.put("telphone", "%" + telphone + "%");
		} else if (edate != null && !edate.equals("")) {
			map.put("edate", "%" + edate + "%");
		}
		if (product != null && !product.equals("")) {
			map.put("product", "%" + product + "%");
		}
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Express> expressList = expressService.selectAll(map);
		List<String> statusTotal = expressService.queryByEdate();
		List<String> bomTotal = bomOrderService.queryByTotalExpress();
		int status1 = 0;
		int status2 = 0;
		int status3 = 0;
		int status4 = 0;
		int status5 = 0;
		int status6 = 0;
		if (!statusTotal.isEmpty()) {
			for (String zhuangtai : statusTotal) {
				if (zhuangtai != null) {
					if (zhuangtai.equals("1")) {
						status1++;
					} else if (zhuangtai.equals("2")) {
						status2++;
					} else if (zhuangtai.equals("3")) {
						status3++;
					} else if (zhuangtai.equals("4")) {
						status4++;
					} else if (zhuangtai.equals("5")) {
						status5++;
					} else if (zhuangtai.equals("6")) {
						status6++;
					}
				}
			}
		}
		if (!bomTotal.isEmpty()) {
			for (String zhuangtai : bomTotal) {
				if (zhuangtai != null) {
					if (zhuangtai.equals("1")) {
						status1++;
					} else if (zhuangtai.equals("2")) {
						status2++;
					} else if (zhuangtai.equals("3")) {
						status3++;
					} else if (zhuangtai.equals("4")) {
						status4++;
					} else if (zhuangtai.equals("5")) {
						status5++;
					} else if (zhuangtai.equals("6")) {
						status6++;
					}
				}
			}
		}
		long total = expressService.getTotalAll(map);
		Float pricetotal = expressService.queryBypriceTotal();
		model.addAttribute("pricetotal", pricetotal);
		model.addAttribute("total", total);
		pageBean.setTotal(Integer.parseInt(String.valueOf(total)));
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page", pageBean.getPage());
		model.addAttribute("pageSize", pageBean.getPageSize());
		model.addAttribute("status1", status1);
		model.addAttribute("status2", status2);
		model.addAttribute("status3", status3);
		model.addAttribute("status4", status4);
		model.addAttribute("status5", status5);
		model.addAttribute("status6", status6);
		model.addAttribute("express", expressList);
		model.addAttribute("expressAll", "expressAll");
		return "adminHome";
	}

	/**
	 * 订单详情（后台系统）
	 * 
	 * @param eid
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "1019/zai/xin/jian/expressAdmin")
	public String adminExpressA(@RequestParam(required = false) String eid, HttpSession session, Model model) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		Express expressList = expressService.queryById(eid);// 通过express的id查询到整个express的信息
		BiaoQian biaoqian = biaoqianService.queryEid(eid);// 商品标签
		model.addAttribute("biaoqian", biaoqian);
		if (expressList.getProductuid() == null) {
			List<OrderItme> order = orderItmeService.queryByEid(eid);
			model.addAttribute("order", order);
		} else if (expressList.getProductuid() != null) {
			Product product = productService.findByPid(expressList.getProductuid());
			model.addAttribute("product", product);
		}
		model.addAttribute("express", expressList);
		model.addAttribute("expressDetails", "expressDetails");
		return "adminHome";
	}

	/**
	 * 优惠添加
	 * 
	 * @param express
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "1019/zai/xin/jian/upDiscountprice", method = RequestMethod.POST)
	public Map<String, Object> upDiscountprice(Express express, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (session.getAttribute("user") != null) {
			BigDecimal b = new BigDecimal(express.getEprice() - express.getPreferentialamount());
			express.setDiscountprice(b.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue());
			int i = expressService.updateByPrimaryKeySelective(express);
			if (i == 1) {
				map.put("result", "seccuss");
			} else {
				map.put("result", "fail");
			}
		}
		return map;
	}

	/**
	 * 后台订单修改
	 * 
	 * @param fan
	 * @param number
	 * @param uid
	 * @param id
	 * @param status
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "1019/zai/xin/jian/updateexpressstatus", method = RequestMethod.POST)
	public Map<String, Object> updateExpressStatus(@RequestParam(required = false) Float fan,
			@RequestParam(required = false) String number, @RequestParam(required = false) String uid,
			@RequestParam(required = false) String id, @RequestParam(required = false) String status,
			HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (session.getAttribute("user") == null) {
			map.put("result", "notlogin");
			return map;
		}
		if (session.getAttribute("user") != null) {
			Express expressList = expressService.queryById(id);// 通过expressid得到整个express的信息
			/*
			 * 1:未付款 2:已付款 3:已交货 4:已完成 5:已取消 6:未审核
			 * 
			 */
			if (expressList.getStatus().equals("1") || expressList.getStatus().equals("6")) {
				if (status.equals("2")) {
					/*
					 * 当状态改为已付款时，发送一条短信通知用户
					 */
					SendSmsRequest sms = new SendSmsRequest();
					sms.setPhoneNumbers(expressList.getUser().getTelephone());
					JsonObject params = new JsonObject();
					params.addProperty("name", expressList.getUser().getUsername());
					sms.setTemplateParam(params.toString());
					SendSmsResponse res = SmsUtil.sendSmsPayment(sms);
					System.out.println(res.getCode());
					// 当状态为已付款（2）的时候就将库存减少
					if (expressList.getProductuid() == null) {
						List<OrderItme> order = orderItmeService.queryByEid(id);
						for (OrderItme o : order) {
							Product product = new Product();
							product.setProductuuid(o.getO_pid());
							/*
							 * 暂时将库存设置为购买的数量，在sql语句中用原库存减去这个数量，得到减少后的实际库存
							 */
							product.setIsgoodsinstock(o.getO_number());
							productService.updateByNumberreduce(product);// 更新库存和已售出总数
						}
					} else {
						Product product = new Product();
						product.setProductuuid(expressList.getProductuid());
						product.setIsgoodsinstock(expressList.getExpressnumber());
						productService.updateByNumberreduce(product);
					}
				}
			}
			/*
			 * Express queryExpress =
			 * expressService.queryById(express.getExpress()); if (queryExpress
			 * != null) { if (queryExpress.getStatus() == "4") {// 已完成订单状态 //
			 * 对相应的产品进行库存的减少和销售量的增加 Product p =
			 * productService.findByPid(queryExpress.getProductuid()); if (p !=
			 * null) { p.setTotalSales(p.getTotalSales() +
			 * Integer.parseInt(express.getExpressnumber()));
			 * p.setIsgoodsinstock("" + (Integer.parseInt(p.getIsgoodsinstock())
			 * - Integer.parseInt(express.getExpressnumber())));
			 * System.out.println(p.getTotalSales()+p.getIsgoodsinstock());
			 * productService.updateByProductAfterExpress(p); } } }
			 */
			/*
			 * 更新订单信息
			 */
			Express express = new Express();
			express.setExpress(id);
			express.setUseruid(uid);
			express.setStatus(status);
			express.setHelp(number);
			express.setFan(fan);
			int i = expressService.updateByPrimaryKeySelective(express);
			if (i == 1) {
				map.put("result", "success");
				map.put("msg", "修改成功!");
				return map;
			}
		}
		map.put("result", "fail");
		map.put("msg", "修改失败!");
		return map;
	}

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "1019/zai/xin/jian/updateexpressnumber", method =
	 * RequestMethod.POST) public String
	 * updateExpressNumber(@RequestParam(required = true)String
	 * number, @RequestParam(required = true)String id, HttpSession session){
	 * 
	 * if(session.getAttribute("user") != null){ Express express = new
	 * Express(); express.setExpress(id); express.setExpressnumber(number); int
	 * i = expressService.updateByPrimaryKeySelective(express); if(i == 1){
	 * return "修改成功"; } } return "修改失败"; }
	 */

	@RequestMapping("generate")
	public String generateID(Model model, HttpSession session) {
		String uid = (String) session.getAttribute("uid");
		String personal = PersonalIdUrils.function(5);
		String id = userInfoService.queryByPersonalID(personal);
		if (id != null && !id.equals("")) {
			return generateID(model, session);
		} else {
			UserInfo user = new UserInfo();
			user.setUseruid(uid);
			user.setU_personalid(personal);
			userInfoService.updateByPrimaryKeySelective(user);
		}
		return userSystem(model, session);
	}

	@RequestMapping(value = "1019/zai/xin/jian/nullData")
	public String nullData(Product p, @RequestParam(required = false) String kongzhi,
			@RequestParam(required = false) String manufacturer, @RequestParam(required = false) String page,
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
		if (kongzhi != null) {
			session.removeAttribute("manufacturer");
		} else {
			String sessionManufacturer = (String) session.getAttribute("manufacturer");
			if (manufacturer != null) {
				map.put("manufacturer", manufacturer);
				session.setAttribute("manufacturer", manufacturer);
			} else {
				if (sessionManufacturer != null) {
					map.put("manufacturer", sessionManufacturer);
				}
			}
		}

		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		// 将所有的产品取出来
		List<Product> product = productService.dataNull(map);
		/*
		 * if (product == null || product.size() == 0) { return "redirect:/404";
		 * }
		 */
		// 得到在数据库中数据的条数,并分页
		long total = productService.dataNullTotal(map);
		model.addAttribute("total", total);
		pageBean.setTotal(Integer.parseInt(String.valueOf(total)));
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page", pageBean.getPage());
		model.addAttribute("pageSize", pageBean.getPageSize());
		model.addAttribute("product", product);
		model.addAttribute("p", p);
		model.addAttribute("nullData", "nullData");
		return "adminHome";
	}

	/**
	 * 待审核订单查询
	 * 
	 * @param model
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "1019/zai/xin/jian/queryByExpressByStatus", method = RequestMethod.POST)
	public Map<String, Object> queryByexpressBystatus(Model model, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		long num = expressService.getStatusSum();
		if (num != 0) {
			map.put("result", "seccuss");
			map.put("msg", num);
		}
		return map;
	}

	public static void delete(File f) {
		if (f.isDirectory()) {
			File[] files = f.listFiles();
			for (File file : files) {
				delete(file);
				file.delete();
			}
		}
		f.delete();
	}

	// 一级分类的值
	@RequestMapping("seleZhuanChang")
	public String seleZhuanChang(Model model) {
		List<Primary> primaryList = primaryService.queryAll();
		model.addAttribute("primaryList", primaryList);
		return "seleZhuanChang";
	}

	// 反馈信息的采集
	@ResponseBody
	@RequestMapping(value = "fankui", method = RequestMethod.POST)
	public Map<String, Object> insertFankui(FanKui fankui, @RequestParam(required = true) String productuuid,
			@RequestParam(required = true) String product, @RequestParam(required = true) String fankuitext) {
		Map<String, Object> map = new HashMap<String, Object>();
		fankui.setFankui_pid(productuuid);
		fankui.setFankuitext(fankuitext);
		fankui.setFankui_product(product);
		int a = fankuiService.insertFankui(fankui);
		if (a == 1) {
			map.put("result", "success");
			map.put("msg", "反馈成功");
		} else {
			map.put("result", "fail");
			map.put("msg", "反馈失败");
		}
		return map;
	}

	// ST专场
	@RequestMapping("p_ST")
	public String p_ST() {
		return "sortProduct/p_ST";
	}

	/**
	 * 用户名重复查询
	 * 
	 * @param name
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "queryByUserInfoAndName", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryByPhone(String name, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		int userinfo = userInfoService.findUserName(name);
		if (userinfo != 0) {
			map.put("result", "seccuss");
		} else {
			map.put("result", "fail");
		}
		return map;
	}

	/**
	 * 发送短信验证码
	 * 
	 * @param request
	 * @param session
	 * @param phone
	 * @return
	 */
	@RequestMapping(value = "verification")
	@ResponseBody
	public String VerificationCode(@RequestParam(required = false) String login, HttpServletRequest request,
			HttpSession session, String phone) {
		SendSmsRequest sms = new SendSmsRequest();
		sms.setPhoneNumbers(phone);
		JsonObject params = new JsonObject();
		int mobile_code = (int) ((Math.random() * 9 + 1) * 100000);
		params.addProperty("code", mobile_code);
		sms.setTemplateParam(params.toString());
		if (login != null) {
			if (login.equals("login")) {
				SendSmsResponse res = SmsUtil.sendSmsLogin(sms);
				System.out.println(res.getCode());
			}
		} else {
			SendSmsResponse res = SmsUtil.sendSms(sms);
			System.out.println(res.getCode());
		}
		session.setAttribute("yanzheng", String.valueOf(mobile_code));
		session.setMaxInactiveInterval(60);
		return null;
	}

	// 反馈信息后台查询
	@RequestMapping("1019/zai/xin/jian/chanpinfankui")
	public String cp_fk(Model model) {
		List<FanKui> fankuiList = fankuiService.selectFankui();
		model.addAttribute("fankuiList", fankuiList);
		return "chanpinfankui";
	}

	// 反馈信息删除
	@ResponseBody
	@RequestMapping(value = "1019/zai/xin/jian/fankuidele", method = RequestMethod.POST)
	public Map<String, Object> fankuidele(@RequestParam(required = true) String fankuiid) {
		Map<String, Object> map = new HashMap<String, Object>();
		int a = fankuiService.fankuidele(fankuiid);
		if (a == 1) {
			map.put("result", "success");
			map.put("msg", "审核成功");
		}
		return map;
	}

	/**
	 * 发送短信验证码
	 * 
	 * @param request
	 * @param session
	 * @param phone
	 * @return
	 */
	@RequestMapping(value = "Loginverification")
	@ResponseBody
	public Map<String, Object> Loginverification(UserInfo user, HttpServletRequest request, HttpSession session,
			String yanzhen, String verify) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 校验码是否正确
		String code = (String) session.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		String yan = (String) session.getAttribute("yanzheng");
		if (!code.equalsIgnoreCase(verify) || verify == null || verify == "") {
			map.put("msg", "图形验证码错误");
			map.put("code", "-2");
			return map;
		}
		// 将用户数据从数据库中查询
		List<UserInfo> userInfo = userInfoService.userLogin(user);
		if (userInfo.size() != 1) {
			map.put("msg", "用户或密码错误");
			map.put("code", "-1");
			return map;
		}
		// 将数据库中的用户密码和用户输入的用户密码相比较，查看是否相等
		if (yan == null) {
			map.put("msg", "短信验证码错误");
			map.put("code", "-1");
			return map;
		}
		if (!yan.equals(yanzhen)) {
			map.put("msg", "短信验证码错误");
			map.put("code", "-1");
			return map;
		}
		Supplier supplier = supplierService.selectByPrimaryKey(userInfo.get(0).getSupplieruid());
		if (supplier != null && supplier.getSuppliername() != null && supplier.getSuppliername().length() > 0) {
			session.setAttribute("supplieruid", userInfo.get(0).getSupplieruid());
		}

		session.setAttribute("userName", userInfo.get(0).getUsername());
		session.setAttribute("uid", userInfo.get(0).getUseruid());
		session.setMaxInactiveInterval(30 * 60);
		// 记录登录的时间
		UserInfo userLoginTime = new UserInfo();
		userLoginTime.setUseruid(userInfo.get(0).getUseruid());
		userLoginTime.setLasttime(new Date());
		userLoginTime.setLastip(GetIP.getIP(request));
		userInfoService.updateByPrimaryKeySelective(userLoginTime);
		map.put("msg", "登录成功");
		map.put("code", "1");
		// 根据useruid找到对应的订单总数
		long user_order = expressService.user_Order(userInfo.get(0).getUseruid());
		session.setAttribute("user_order", user_order);
		return map;
	}

	/**
	 * 收据打印
	 * 
	 * @param eid
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "1019/zai/xin/jian/adminShouju")
	public String adminShouju(@RequestParam(required = false) String eid, HttpSession session, Model model) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		List<OrderItme> order = new ArrayList<OrderItme>();
		Express expressList = expressService.queryById(eid);
		float total = expressList.getEprice();
		expressList.setBeizhu("");
		if (expressList.getProductuid() == null) {
			List<OrderItme> order1 = orderItmeService.queryByEid(eid);
			model.addAttribute("order", order);
			for (OrderItme or : order1) {
				or.setDanwei("片");
				order.add(or);
			}
			session.setAttribute("order", order);
			session.setAttribute("expressList", expressList);
		} else if (expressList.getProductuid() != null) {
			Product product = productService.findByPid(expressList.getProductuid());
			model.addAttribute("product", product);
		}
		if ("自取".equals(expressList.getExpressname())) {
			model.addAttribute("kuaidi", 0);
		} else if ("申通".equals(expressList.getExpressname())) {
			model.addAttribute("kuaidi", 10);
		} else if ("圆通".equals(expressList.getExpressname())) {
			model.addAttribute("kuaidi", 10);
		} else if ("顺丰(省外)".equals(expressList.getExpressname())) {
			model.addAttribute("kuaidi", 23);
		} else if ("顺丰(省内)".equals(expressList.getExpressname())) {
			model.addAttribute("kuaidi", 13);
		} else if ("速尔快(广东省内)".equals(expressList.getExpressname())) {
			model.addAttribute("kuaidi", 10);
		} else if ("顺丰到付".equals(expressList.getExpressname())) {
			model.addAttribute("kuaidi", 0);
		}
		float tax = 0;
		if ("2".equals(expressList.getE_invoice())) {
			BigDecimal b = new BigDecimal(expressList.getEprice() / 1.06);
			BigDecimal a = new BigDecimal(
					expressList.getEprice() - b.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue());
			tax = a.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();
			expressList.setEprice(b.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue());
		} else if ("3".equals(expressList.getE_invoice())) {
			BigDecimal b = new BigDecimal(expressList.getEprice() / 1.17);
			BigDecimal a = new BigDecimal(
					expressList.getEprice() - b.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue());
			tax = a.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();
			expressList.setEprice(b.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue());
		}
		model.addAttribute("tax", tax);
		model.addAttribute("yunfei", "运费");
		model.addAttribute("danwei", "个");
		model.addAttribute("total", total);
		model.addAttribute("dyshijian", new Date());
		model.addAttribute("express", expressList);
		model.addAttribute("adminShouju", "adminShouju");
		return "admin/shoujudaying";
	}

	/**
	 * 收据打印购物车
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "1019/zai/xin/jian/adminShoujuorder")
	public String adminShoujuorder(@RequestParam(required = false) Float tax,
			@RequestParam(required = false) String beizhu, @RequestParam(required = false) Float yunfei,
			@RequestParam(required = false) String lotnumber, @RequestParam(required = false) String encapsulation,
			@RequestParam(required = false) String manufacturer, @RequestParam(required = false) String danwei,
			OrderItme o, Express e, HttpSession session, Model model) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}

		Express expressList = (Express) session.getAttribute("expressList");
		session.removeAttribute("expressList");
		expressList.setBeizhu(beizhu);
		List<OrderItme> order1 = (List<OrderItme>) session.getAttribute("order");
		session.removeAttribute("order");
		List<OrderItme> order = new ArrayList<OrderItme>();
		float total = 0;
		for (OrderItme or : order1) {
			if (o.getO_id() != null) {
				if (or.getO_id().equals(o.getO_id())) {
					or.setO_number(o.getO_number());
					or.setO_one(o.getO_one());
					or.setO_product(o.getO_product());
					or.setDanwei(danwei);
					or.getP().setManufacturer(manufacturer);
					or.getP().setEncapsulation(encapsulation);
					or.getP().setLotnumber(lotnumber);
					BigDecimal b = new BigDecimal(Integer.parseInt(o.getO_number()) * o.getO_one());
					Float price = b.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();
					or.setO_price(price);
				}
			}
			BigDecimal s = new BigDecimal(total + or.getO_price());
			total = s.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();
			order.add(or);
		}
		if (tax == 0) {
			expressList.setE_invoice("1");
		}
		total = total + yunfei;
		expressList.setEprice(total);
		if ("2".equals(expressList.getE_invoice())) {
			BigDecimal b = new BigDecimal(expressList.getEprice() * 1.06);
			BigDecimal a = new BigDecimal(
					b.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue() - expressList.getEprice());
			tax = a.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();
			total = b.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();
		} else if ("3".equals(expressList.getE_invoice())) {
			BigDecimal b = new BigDecimal(expressList.getEprice() * 1.17);
			BigDecimal a = new BigDecimal(
					b.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue() - expressList.getEprice());
			tax = a.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();
			total = b.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();
		}
		expressList.setEprice(total);
		model.addAttribute("tax", tax);
		model.addAttribute("kuaidi", yunfei);
		model.addAttribute("yunfei", "运费");
		model.addAttribute("danwei", "个");
		expressList.setName(e.getName());
		expressList.setTelphone(e.getTelphone());
		expressList.setAddress(e.getAddress());
		session.setAttribute("order", order);
		session.setAttribute("expressList", expressList);
		model.addAttribute("total", expressList.getEprice());
		model.addAttribute("dyshijian", new Date());
		model.addAttribute("order", order);
		model.addAttribute("express", expressList);
		model.addAttribute("adminShouju", "adminShouju");
		return "admin/shoujudaying";
	}

	/**
	 * 收据内容删除
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "1019/zai/xin/jian/deleteadminShoujuorder")
	public String adminShoujuorderdelete(Float tax, Float yunfei, OrderItme o, Express e, HttpSession session,
			Model model) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}

		Express expressList = (Express) session.getAttribute("expressList");
		session.removeAttribute("expressList");
		List<OrderItme> order1 = (List<OrderItme>) session.getAttribute("order");
		session.removeAttribute("order");
		List<OrderItme> order = new ArrayList<OrderItme>();
		float total = 0;
		for (OrderItme or : order1) {
			if (o.getO_id() != null) {
				if (!or.getO_id().equals(o.getO_id())) {
					BigDecimal s = new BigDecimal(total + or.getO_price());
					total = s.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();
					order.add(or);
				}
			}
		}
		if (tax == 0) {
			expressList.setE_invoice("1");
		}
		total = total + yunfei;
		expressList.setEprice(total);
		if ("2".equals(expressList.getE_invoice())) {
			BigDecimal b = new BigDecimal(expressList.getEprice() * 1.06);
			BigDecimal a = new BigDecimal(
					b.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue() - expressList.getEprice());
			tax = a.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();
			total = b.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();
		} else if ("3".equals(expressList.getE_invoice())) {
			BigDecimal b = new BigDecimal(expressList.getEprice() * 1.17);
			BigDecimal a = new BigDecimal(
					b.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue() - expressList.getEprice());
			tax = a.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();
			total = b.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();
		}
		expressList.setEprice(total);
		model.addAttribute("tax", tax);
		model.addAttribute("kuaidi", yunfei);
		model.addAttribute("yunfei", "运费");
		model.addAttribute("danwei", "个");
		session.setAttribute("order", order);
		session.setAttribute("expressList", expressList);
		model.addAttribute("dyshijian", new Date());
		model.addAttribute("order", order);
		model.addAttribute("total", expressList.getEprice());
		model.addAttribute("express", expressList);
		model.addAttribute("adminShouju", "adminShouju");
		return "admin/shoujudaying";
	}

	/**
	 * 打印快递单
	 * 
	 * @param express
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("1019/zai/xin/jian/adminprintexpress")
	public String adminprintexpress(Express express, HttpSession session, Model model) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		Express expressList = expressService.queryById(express.getExpress());
		String[] sourceStrArray = expressList.getAddress().split("-");
		String xiangxi = null;
		String province = null;
		String city = null;
		int s = sourceStrArray.length;
		if (s == 2) {
			for (int i = 0; i < sourceStrArray.length; i++) {
				if (i == 0) {
					province = sourceStrArray[i];
				} else if (i == 1) {
					xiangxi = sourceStrArray[i];
					city = StringUtils.substringBefore(xiangxi, "市");
					city = city + "市";
				}
			}
		} else {
			for (int i = 0; i < sourceStrArray.length; i++) {
				if (i == 0) {
					province = sourceStrArray[i];
				} else if (i == 1) {
					city = sourceStrArray[i];
				} else if (i == 2) {
					xiangxi = sourceStrArray[i];
				}
			}
		}
		if (province.equals("北京市")) {
			province = null;
			city = "北京市";
		}
		model.addAttribute("city", city);
		model.addAttribute("xiangxi", xiangxi);
		model.addAttribute("province", province);
		model.addAttribute("express", expressList);
		if ("申通".equals(express.getExpressname())) {
			return "admin/shentongprin";
		} else if ("速尔快(广东省内)".equals(express.getExpressname())) {
			return "admin/suerprint";
		}
		return "admin/admin-details";
	}

	/**
	 * ip过滤
	 * 
	 * @param ip
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "1019/zai/xin/jian/updateByIPguoLv")
	public String updateByIPguoLv(IPGuoLv ip, Model model, HttpSession session) {
		ipGuoLvService.insertSelective(ip);
		return "redirect:/1019/zai/xin/jian/cont";
	}

	/**
	 * 订单数查询（后台）
	 * 
	 * @param ip
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "1019/zai/xin/jian/seleByIP")
	public String seleByIP(String ip, Model model, HttpSession session) {
		List<SearchTable> s = searchTableService.selectByIp(ip);
		List<String> statusTotal = expressService.queryByStatus();
		List<String> bomTotal = bomOrderService.queryByStatus();
		int status1 = 0;
		int status2 = 0;
		int status3 = 0;
		int status4 = 0;
		int status5 = 0;
		int status6 = 0;
		if (!statusTotal.isEmpty()) {
			for (String zhuangtai : statusTotal) {
				if (zhuangtai != null) {
					if (zhuangtai.equals("1")) {
						status1++;
					} else if (zhuangtai.equals("2")) {
						status2++;
					} else if (zhuangtai.equals("3")) {
						status3++;
					} else if (zhuangtai.equals("4")) {
						status4++;
					} else if (zhuangtai.equals("5")) {
						status5++;
					} else if (zhuangtai.equals("6")) {
						status6++;
					}
				}
			}
		}
		if (!bomTotal.isEmpty()) {
			for (String zhuangtai : bomTotal) {
				if (zhuangtai.equals("1")) {
					status1++;
				} else if (zhuangtai.equals("2")) {
					status2++;
				} else if (zhuangtai.equals("3")) {
					status3++;
				} else if (zhuangtai.equals("4")) {
					status4++;
				} else if (zhuangtai.equals("5")) {
					status5++;
				} else if (zhuangtai.equals("6")) {
					status6++;
				}
			}
		}
		model.addAttribute("status1", status1);
		model.addAttribute("status2", status2);
		model.addAttribute("status3", status3);
		model.addAttribute("status4", status4);
		model.addAttribute("status5", status5);
		model.addAttribute("status6", status6);
		model.addAttribute("search", s);
		model.addAttribute("adminHome", "adminHome");
		return "adminHome";
	}

	// 查找质量为1或者2的主页面
	@RequestMapping(value = "1019/zai/xin/jian/seleQuality")
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
		List<Product> product = productService.seleQuality(map);
		/*
		 * if (product == null || product.size() == 0) { return "redirect:/404";
		 * }
		 */
		// 得到在数据库中数据的条数,并分页
		long total = productService.seleQualityTotal(map);
		model.addAttribute("total", total);
		pageBean.setTotal(Integer.parseInt(String.valueOf(total)));
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page", pageBean.getPage());
		model.addAttribute("pageSize", pageBean.getPageSize());
		model.addAttribute("product", product);
		model.addAttribute("p", p);
		model.addAttribute("seleQuality", "seleQuality");
		return "adminHome";
	}

	// 查找质量为1或者2的修改页面
	@RequestMapping(value = "1019/zai/xin/jian/seleUpdateQuality")
	public String seleUpdateQuality(Model model, final String uid, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		// 将所有的产品取出来
		Product product = productService.selectByPrimaryKey(uid);
		// 得到在数据库中数据的条数,并分页
		long imgCount = pimgService.selectPimgCount(uid);
		List<PImg> pimgList = pimgService.selectPimg(uid);

		// 将图片链接名称传到页面
		String imgStauts1;
		String imgStauts2;
		String imgStauts3;
		if (imgCount >= 1) {
			imgStauts1 = pimgList.get(0).getP_imgname();
			model.addAttribute("imgStauts1", imgStauts1);
		}
		if (imgCount > 1 && imgCount <= 3) {
			imgStauts2 = pimgList.get(1).getP_imgname();
			model.addAttribute("imgStauts2", imgStauts2);
		}
		if (imgCount == 3) {
			imgStauts3 = pimgList.get(2).getP_imgname();
			model.addAttribute("imgStauts3", imgStauts3);
		}

		model.addAttribute("product", product);
		model.addAttribute("seleUpdateQuality", "seleUpdateQuality");
		model.addAttribute("imgCount", imgCount);
		return "adminHome";
	}

	// 质量为1或者2的删除
	@RequestMapping(value = "1019/zai/xin/jian/deleteQualityProduct")
	public String deleteQualityProduct(Model model, String productuuid, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		productService.daleteProduct(productuuid);
		return "redirect:/1019/zai/xin/jian/seleQuality";
	}

	// 空资料或者空分类删除
	@RequestMapping(value = "1019/zai/xin/jian/deleteNullProduct")
	public String deleteNullProduct(Model model, String productuuid, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		productService.daleteProduct(productuuid);
		return "redirect:/1019/zai/xin/jian/nullData";
	}

	@SuppressWarnings("resource")
	@RequestMapping(value = "1019/zai/xin/jian/updateQuality")
	public String updateQuality(@RequestParam(required = false) String d_id3,
			@RequestParam(required = false) String d_id2, @RequestParam(required = false) String d_id1,
			@RequestParam(required = false) Float price3, @RequestParam(required = false) Float price2,
			@RequestParam(required = false) Float price1, @RequestParam(required = false) String min1,
			@RequestParam(required = false) String max1, @RequestParam(required = false) String min2,
			@RequestParam(required = false) String max2, @RequestParam(required = false) String min3,
			@RequestParam(required = false) String discount_unit, MultipartFile[] files, Model model, Product product,
			HttpSession session, HttpServletRequest req) throws IOException {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		product.setUptime(new Date());
		productService.updateByPrimaryKeySelective(product);
		if (d_id1 != null && d_id1 != "") {
			Discount discount = new Discount();
			discount.setDiscount_unit(discount_unit);
			discount.setDiscount_id(d_id1);
			discount.setDiscount_numbermax(Integer.parseInt(max1));
			discount.setDiscount_numbermin(Integer.parseInt(min1));
			discount.setDiscount_price(price1);
			discountService.updateByPrimaryKeySelective(discount);
		}
		if (d_id2 != null && d_id2 != "") {
			Discount discount = new Discount();
			discount.setDiscount_unit(discount_unit);
			discount.setDiscount_id(d_id2);
			discount.setDiscount_status("2");
			discount.setDiscount_numbermax(Integer.parseInt(max2));
			discount.setDiscount_numbermin(Integer.parseInt(min2));
			discount.setDiscount_price(price2);
			discountService.updateByPrimaryKeySelective(discount);
		}
		if (d_id3 != null && d_id3 != "") {
			Discount discount = new Discount();
			discount.setDiscount_unit(discount_unit);
			discount.setDiscount_id(d_id3);
			discount.setDiscount_status("3");
			discount.setDiscount_numbermax(0);
			discount.setDiscount_numbermin(Integer.parseInt(min3));
			discount.setDiscount_price(price3);
			discountService.updateByPrimaryKeySelective(discount);
		}
		if (d_id1 == null) {
			if (max1 != null && !max1.equals("")) {
				Discount discount = new Discount();
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
			if (max2 != null && !max2.equals("")) {
				Discount discount = new Discount();
				discount.setDiscount_unit(discount_unit);
				discount.setDiscount_pid(product.getProductuuid());
				discount.setDiscount_id(UIDGenerator.getUUID());
				discount.setDiscount_status("2");
				discount.setDiscount_date(new Date());
				discount.setDiscount_numbermax(Integer.parseInt(max2));
				discount.setDiscount_numbermin(Integer.parseInt(min2));
				discount.setDiscount_price(price2);
				discountService.insertSelective(discount);
			}
			if (min3 != null && !min3.equals("")) {
				Discount discount = new Discount();
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
		// 获取文件
		MultipartFile file1 = mult.getFile("img1");
		MultipartFile file2 = mult.getFile("img2");
		MultipartFile file3 = mult.getFile("img3");
		if (pimgList.size() == 0) {
			if (file1 != null) {
				String fileName = file1.getOriginalFilename();
				String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
				fileName = product.getProductuuid() + fileName;
				if ("jpg".equals(formatName) || "png".equals(formatName) || "jpeg".equals(formatName)) {
					File path = new File(req.getSession().getServletContext().getRealPath("/") + "upload");
					if (!path.exists()) {
						path.mkdirs();// 若不存在 ，则创建一个
					}
					FileOutputStream fos = new FileOutputStream(path + "/" + fileName);
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
			if (file2 != null) {
				String fileName2 = file2.getOriginalFilename();
				String formatName2 = fileName2.substring(fileName2.lastIndexOf(".") + 1);
				fileName2 = product.getProductuuid() + "_2" + fileName2;
				if ("jpg".equals(formatName2) || "png".equals(formatName2) || "jpeg".equals(formatName2)) {
					File path = new File(req.getSession().getServletContext().getRealPath("/") + "upload");
					if (!path.exists()) {
						path.mkdirs();// 若不存在 ，则创建一个
					}
					FileOutputStream fos = new FileOutputStream(path + "/" + fileName2);
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
			if (file3 != null) {
				String fileName3 = file3.getOriginalFilename();
				String formatName3 = fileName3.substring(fileName3.lastIndexOf(".") + 1);
				fileName3 = product.getProductuuid() + "_3" + fileName3;
				if ("jpg".equals(formatName3) || "png".equals(formatName3) || "jpeg".equals(formatName3)) {
					File path = new File(req.getSession().getServletContext().getRealPath("/") + "upload");
					if (!path.exists()) {
						path.mkdirs();// 若不存在 ，则创建一个
					}
					FileOutputStream fos = new FileOutputStream(path + "/" + fileName3);
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

		if (pimgList.size() >= 1) {
			if (file1 != null) {
				String fileName = file1.getOriginalFilename();
				String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
				fileName = pid + fileName;

				// 获取原图片地址 删除
				String fileNameOne = pimgList.get(0).getP_imgname();

				if ("jpg".equals(formatName) || "png".equals(formatName) || "jpeg".equals(formatName)) {
					File path = new File(req.getSession().getServletContext().getRealPath("/") + "upload");
					delete(new File(path + "/" + fileNameOne));
					if (!path.exists()) {
						path.mkdirs();// 若不存在 ，则创建一个
					}
					FileOutputStream fos = new FileOutputStream(path + "/" + fileName);
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
			if (pimgList.size() == 1) {
				if (file2 != null) {
					String fileName2 = file2.getOriginalFilename();
					String formatName2 = fileName2.substring(fileName2.lastIndexOf(".") + 1);
					fileName2 = pid + "_2" + fileName2;
					if ("jpg".equals(formatName2) || "png".equals(formatName2) || "jpeg".equals(formatName2)) {
						File path = new File(req.getSession().getServletContext().getRealPath("/") + "upload");
						if (!path.exists()) {
							path.mkdirs();// 若不存在 ，则创建一个
						}
						FileOutputStream fos = new FileOutputStream(path + "/" + fileName2);
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

				if (file3 != null) {
					String fileName3 = file3.getOriginalFilename();
					String formatName3 = fileName3.substring(fileName3.lastIndexOf(".") + 1);
					fileName3 = pid + "_3" + fileName3;
					if ("jpg".equals(formatName3) || "png".equals(formatName3) || "jpeg".equals(formatName3)) {
						File path = new File(req.getSession().getServletContext().getRealPath("/") + "upload");
						if (!path.exists()) {
							path.mkdirs();// 若不存在 ，则创建一个
						}
						FileOutputStream fos = new FileOutputStream(path + "/" + fileName3);
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
			if (pimgList.size() == 2) {
				if (file3 != null) {
					String fileName3 = file3.getOriginalFilename();
					String formatName3 = fileName3.substring(fileName3.lastIndexOf(".") + 1);
					fileName3 = pid + "_3" + fileName3;
					if ("jpg".equals(formatName3) || "png".equals(formatName3) || "jpeg".equals(formatName3)) {
						File path = new File(req.getSession().getServletContext().getRealPath("/") + "upload");
						if (!path.exists()) {
							path.mkdirs();// 若不存在 ，则创建一个
						}
						FileOutputStream fos = new FileOutputStream(path + "/" + fileName3);
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
		if (pimgList.size() > 1 && pimgList.size() <= 3) {
			if (file2 != null) {
				String fileName2 = file2.getOriginalFilename();
				String formatName2 = fileName2.substring(fileName2.lastIndexOf(".") + 1);
				fileName2 = pid + "_2" + fileName2;

				// 获取原图片地址 删除
				String fileNameTwo = pimgList.get(1).getP_imgname();

				if ("jpg".equals(formatName2) || "png".equals(formatName2) || "jpeg".equals(formatName2)) {
					File path = new File(req.getSession().getServletContext().getRealPath("/") + "upload");
					delete(new File(path + "/" + fileNameTwo));

					if (!path.exists()) {
						path.mkdirs();// 若不存在 ，则创建一个
					}
					FileOutputStream fos = new FileOutputStream(path + "/" + fileName2);
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
		if (pimgList.size() == 3) {
			if (file3 != null) {
				String fileName3 = file3.getOriginalFilename();
				String formatName3 = fileName3.substring(fileName3.lastIndexOf(".") + 1);
				fileName3 = pid + "_3" + fileName3;

				// 获取原图片地址 删除
				String fileNameThree = pimgList.get(2).getP_imgname();

				if ("jpg".equals(formatName3) || "png".equals(formatName3) || "jpeg".equals(formatName3)) {
					File path = new File(req.getSession().getServletContext().getRealPath("/") + "upload");
					delete(new File(path + "/" + fileNameThree));

					if (!path.exists()) {
						path.mkdirs();// 若不存在 ，则创建一个
					}
					FileOutputStream fos = new FileOutputStream(path + "/" + fileName3);
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
		return "redirect:/1019/zai/xin/jian/seleQuality";
	}

	/**
	 * 盈利添加
	 * 
	 * @param e
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("1019/zai/xin/jian/expressprofit")
	public String deletePrimary(Express e, HttpSession session, Model model) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		expressService.updateByPrimaryKeySelective(e);
		return "redirect:expressAdmin?eid=" + e.getExpress();
	}

	/**
	 * 查看盈利
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("1019/zai/xin/jian/queryByprofit")
	public String queryByprofit(HttpSession session, Model model) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		List<Express> expressList = expressService.queryByprofit();
		Float totalprofit = expressService.selectByProfitSum();
		model.addAttribute("totalprofit", totalprofit);
		model.addAttribute("expressList", expressList);
		return "admin/profit/profit";
	}

	/**
	 * 注册用户查看（后台）
	 * 
	 * @param product
	 * @param page
	 * @param rows
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "1019/zai/xin/jian/queryUserInfoAll")
	public String queryUserInfoAll(@RequestParam(required = false) String product,
			@RequestParam(required = false) String page, @RequestParam(required = false) String rows, Model model,
			HttpSession session) {
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
		map.put("username", product);
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		// 将所有的产品取出来
		List<UserInfo> user = userInfoService.queryAll(map);
		long total = userInfoService.getTotal(map);
		model.addAttribute("total", total);
		pageBean.setTotal(Integer.parseInt(String.valueOf(total)));
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page", pageBean.getPage());
		model.addAttribute("pageSize", pageBean.getPageSize());
		model.addAttribute("user", user);
		model.addAttribute("userHome", "userHome");
		return "adminHome";
	}

	@RequestMapping(value = "queryByPImgandPid")
	@ResponseBody
	public List<PImg> queryByPImgandPid(@RequestParam(required = false) String pid, Model model, HttpSession session) {
		List<PImg> pimg = pimgService.selectPimg(pid);
		return pimg;
	}

	/**
	 * 缺货型号（首页）
	 * 
	 * @param product
	 * @return
	 */
	@RequestMapping("mohuxinghao")
	@ResponseBody
	public Map<String, Object> mohuxinghao(String product) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Productdistinct> productdistinct = productdistinctService.query(product);
		if (productdistinct.isEmpty()) {
			map.put("result", "fail");
			return map;
		} else {
			map.put("result", "success");
			map.put("msg", productdistinct);
		}
		return map;
	}
}
