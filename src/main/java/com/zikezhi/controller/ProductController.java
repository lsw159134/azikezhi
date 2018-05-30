package com.zikezhi.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.google.gson.JsonObject;
import com.zikezhi.entity.AdminZaiXinJian;
import com.zikezhi.entity.Classification;
import com.zikezhi.entity.Evaluate;
import com.zikezhi.entity.Page;
import com.zikezhi.entity.Product;
import com.zikezhi.entity.RandomText;
import com.zikezhi.entity.Supplier;
import com.zikezhi.entity.UserInfo;
import com.zikezhi.service.ClassificationService;
import com.zikezhi.service.EvaluateService;
import com.zikezhi.service.PassiveComponentsService;
import com.zikezhi.service.ProductService;
import com.zikezhi.service.RandomTextService;
import com.zikezhi.service.SupplierService;
import com.zikezhi.service.UserInfoService;
import com.zikezhi.utils.PageBean;
import com.zikezhi.utils.PoiExcelUtils;
import com.zikezhi.utils.SmsUtil;
import com.zikezhi.utils.UIDGenerator;

/**
 * 产品管理（）
 * 
 * @author lenovo
 *
 */
@Controller
public class ProductController {

	@Resource(name = "productService")
	private ProductService productService;

	@Resource(name = "evaluateService")
	private EvaluateService evaluateService;

	private static SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	@Resource(name = "userInfoService")
	private UserInfoService userInfoService;

	@Resource(name = "supplierService")
	private SupplierService supplierService;

	@Resource(name = "randomTextService")
	private RandomTextService randomTextService;

	@Resource(name = "classificationService")
	private ClassificationService classificationService;

	@Resource(name = "passiveComponentsService")
	private PassiveComponentsService passiveComponentsService;

	@RequestMapping("userSupplierProduct")
	public String userSupplierProduct(HttpSession session, Model model) {
		String uid = (String) session.getAttribute("uid");
		if (uid == null) {
			return "login";
		}
		String dateString = formatter.format(new Date());
		UserInfo user = userInfoService.selectByPrimaryKey(uid);
		List<Product> product1 = productService.seleUserSupplierProduct1(uid);
		List<Product> product11 = new ArrayList<Product>();
		for (Product product : product1) {
			String a = formatter.format(product.getTime());
			if (product.getUptime() == null) {
				product.setQq("1");
			} else if (product.getUptime() != null) {
				String d = formatter.format(product.getUptime());
				if (dateString.equals(d)) {
					product.setQq("2");
				} else {
					product.setQq("1");
				}
			}
			if (dateString.equals(a)) {
				product.setQq("2");
			}
			product11.add(product);
		}
		List<Product> product2 = productService.seleUserSupplierProduct2(uid);
		List<Product> product22 = new ArrayList<Product>();
		for (Product product : product2) {
			String a = formatter.format(product.getTime());
			if (product.getUptime() == null) {
				product.setQq("1");
			} else if (product.getUptime() != null) {
				String d = formatter.format(product.getUptime());
				if (dateString.equals(d)) {
					product.setQq("2");
				} else {
					product.setQq("1");
				}
			}
			if (dateString.equals(a)) {
				product.setQq("2");
			}
			product22.add(product);
		}
		List<Product> product3 = productService.seleUserSupplierProduct3(uid);
		List<Product> product33 = new ArrayList<Product>();
		for (Product product : product3) {
			String a = formatter.format(product.getTime());
			if (product.getUptime() == null) {
				product.setQq("1");
			} else if (product.getUptime() != null) {
				String d = formatter.format(product.getUptime());
				if (dateString.equals(d)) {
					product.setQq("2");
				} else {
					product.setQq("1");
				}
			}
			if (dateString.equals(a)) {
				product.setQq("2");
			}
			product33.add(product);
		}
		model.addAttribute("product1", product11);
		model.addAttribute("product2", product22);
		model.addAttribute("product3", product33);
		model.addAttribute("user", user);
		return "user/product/product";
	}

	@RequestMapping("deleteproduct")
	@ResponseBody
	public Map<String, Object> deleteproduct(String pid, HttpSession session) {
		String uid = (String) session.getAttribute("uid");
		Map<String, Object> map = new HashMap<String, Object>();
		if (uid == null) {
			map.put("result", "login");
			return map;
		}
		int i = productService.daleteProduct(pid);
		if (i == 0) {
			map.put("result", "fail");
		} else {
			map.put("result", "success");
		}
		return map;
	}

	@RequestMapping("addproductuser1")
	@ResponseBody
	public Map<String, Object> addproductuser2(HttpSession session, Product product, int biaozi) {
		Map<String, Object> map = new HashMap<String, Object>();
		String uid = (String) session.getAttribute("uid");
		if (uid == null) {
			map.put("result", "login");
			return map;
		}
		Supplier supplier = supplierService.seleSupplierUid(uid);
		if (biaozi == 1) {
			List<Product> p = productService.seleUserSupplierProduct1(uid);
			if (product.getProductuuid() == null || product.getProductuuid().equals("")) {
				if (p.size() < 2) {
					product.setProductuuid(UIDGenerator.getUUID());
					product.setQuality(3);
					product.setSupplier(supplier.getSuppliername());
					product.setSupplieruuid(supplier.getSupplieruuid());
					productService.insertSelective(product);
					map.put("result", "fail");
					map.put("msg", product.getProductuuid());
				}
			} else {
				product.setUptime(new Date());
				productService.updateByPrimaryKeySelective(product);
				map.put("result", "success");
			}

		} else if (biaozi == 2) {
			List<Product> p = productService.seleUserSupplierProduct2(uid);
			if (product.getProductuuid() == null || product.getProductuuid().equals("")) {
				if (p.size() < 10) {
					product.setProductuuid(UIDGenerator.getUUID());
					product.setQuality(4);
					product.setSupplier(supplier.getSuppliername());
					product.setSupplieruuid(supplier.getSupplieruuid());
					productService.insertSelective(product);
					map.put("result", "fail");
					map.put("msg", product.getProductuuid());
				}
			} else {
				product.setUptime(new Date());
				productService.updateByPrimaryKeySelective(product);
				map.put("result", "success");
			}
		} else if (biaozi == 3) {
			List<Product> p = productService.seleUserSupplierProduct3(uid);
			if (product.getProductuuid() == null || product.getProductuuid().equals("")) {
				if (p.size() < 20) {
					product.setProductuuid(UIDGenerator.getUUID());
					product.setQuality(5);
					product.setSupplier(supplier.getSuppliername());
					product.setSupplieruuid(supplier.getSupplieruuid());
					productService.insertSelective(product);
					map.put("result", "fail");
					map.put("msg", product.getProductuuid());
				}
			} else {
				product.setUptime(new Date());
				productService.updateByPrimaryKeySelective(product);
				map.put("result", "success");
			}

		}
		return map;
	}

	@RequestMapping("seleGengduo")
	@ResponseBody
	public List<Product> seleGengduo(HttpSession session, Product product) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productuuid", product.getProductuuid());
		map.put("keyword", product.getProduct());
		List<Product> productList = productService.seleBygengduo(map);
		return productList;
	}

	@RequestMapping("seleGengduoBysuid")
	@ResponseBody
	public List<Product> seleGengduoBysuid(HttpSession session, Product product) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productuuid", product.getProductuuid());
		map.put("keyword", product.getProduct());
		map.put("supplieruuid", product.getSupplieruuid());
		List<Product> productList = productService.seleBysuuid(map);
		return productList;
	}

	@RequestMapping("seleSupplierXinxi")
	@ResponseBody
	public Supplier seleSupplierXinxi(HttpSession session, String supplieruuid) {
		Supplier productList = supplierService.selectByPrimaryKey(supplieruuid);
		return productList;
	}

	@RequestMapping("inZan")
	@ResponseBody
	public Map<String, Object> inZan(HttpSession session, Evaluate e) {
		Map<String, Object> map = new HashMap<String, Object>();
		String uid = (String) session.getAttribute("uid");
		if (uid == null) {
			map.put("result", "login");
			return map;
		}
		int zan = evaluateService.selectByZanuid(uid, e.getEvaluate_pid());
		int cai = evaluateService.selectByCaiuid(uid, e.getEvaluate_pid());
		int zansum = evaluateService.seleUserSumZanBydate(uid);
		if (zan == 0 && cai == 0 && zansum < 5) {
			e.setEvaluate_uid(uid);
			e.setEvaluate_zan(1);
			e.setEvaluate_time(new Date());
			evaluateService.insertSelective(e);
			productService.updateEvaluatezai(e.getEvaluate_pid());
			Product p = productService.select_updateModule(e.getEvaluate_pid());
			map.put("msg", p.getProduct_evaluatezai());
			map.put("result", "success");
		} else {
			map.put("result", "fail");
		}
		return map;
	}

	@RequestMapping("inCai")
	@ResponseBody
	public Map<String, Object> inCai(HttpSession session, Evaluate e) {
		Map<String, Object> map = new HashMap<String, Object>();
		String uid = (String) session.getAttribute("uid");
		if (uid == null) {
			map.put("result", "login");
			return map;
		}
		int zan = evaluateService.selectByZanuid(uid, e.getEvaluate_pid());
		int cai = evaluateService.selectByCaiuid(uid, e.getEvaluate_pid());
		int caisum = evaluateService.seleUserSumCaiBydate(uid);
		if (cai == 0 && zan == 0 && caisum < 5) {
			e.setEvaluate_uid(uid);
			e.setEvaluate_cai(1);
			e.setEvaluate_time(new Date());
			evaluateService.insertSelective(e);
			productService.updateEvaluatecai(e.getEvaluate_pid());
			Product p = productService.select_updateModule(e.getEvaluate_pid());
			map.put("msg", p.getProduct_evaluatecai());
			map.put("result", "success");
		} else {
			map.put("result", "fail");
		}
		return map;
	}

	@RequestMapping("putong")
	public String putong(Model model, HttpSession session, Product product, @RequestParam(required = false) String page,
			@RequestParam(required = false) String rows) {
		String uid = (String) session.getAttribute("uid");
		if (uid == null) {
			return "login";
		}
		PageBean pageBean;
		if (page == null && rows == null) {
			pageBean = new PageBean(1, 30);
		} else {
			pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		}
		Supplier supplier = supplierService.seleSupplierUid(uid);
		if (supplier == null) {
			return "user/supplier/supplier";
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sid", supplier.getSupplieruuid());
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Product> productList = productService.selePuTong(map);
		int total = productService.getputongTatol(map);
		model.addAttribute("total", total);
		pageBean.setTotal(total);
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page", pageBean.getPage());
		model.addAttribute("pageSize", pageBean.getPageSize());
		model.addAttribute("productList", productList);
		return "user/product/putong";
	}

	@RequestMapping("deleteputongproduct")
	public String deleteputongproduct(String pid) {
		productService.daleteProduct(pid);
		return "redirect:/putong";
	}

	@RequestMapping("inproductputong")
	@ResponseBody
	public Map<String, Object> inputong(HttpSession session, Product product) {
		Map<String, Object> map = new HashMap<String, Object>();
		String uid = (String) session.getAttribute("uid");
		if (uid == null) {
			map.put("result", "login");
			return map;
		}
		Supplier supplier = supplierService.seleSupplierUid(uid);
		product.setProductuuid(UIDGenerator.getUUID());
		product.setQuality(6);
		product.setSupplier(supplier.getSuppliername());
		product.setSupplieruuid(supplier.getSupplieruuid());
		productService.insertSelective(product);
		map.put("result", "success");
		return map;
	}

	@RequestMapping("addputongduotian")
	public String addputongduotian(HttpSession session, String[] product, String[] manufacturer, String[] lotnumber,
			String[] encapsulation, String[] isgoodsinstock, String[] description) {
		String uid = (String) session.getAttribute("uid");
		if (uid == null) {
			return "login";
		}
		Supplier supplier = supplierService.seleSupplierUid(uid);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sid", supplier.getSupplieruuid());
		int total = productService.getputongTatol(map);
		int j = product.length;
		for (int i = 0; i < j; i++) {
			if (product[i] != null && !product[i].equals("") && manufacturer[i] != null && !manufacturer[i].equals("")
					&& lotnumber[i] != null && !lotnumber[i].equals("") && encapsulation[i] != null
					&& !encapsulation[i].equals("") && isgoodsinstock[i] != null && !isgoodsinstock[i].equals("")) {
				if (i + total > 3000) {
					return "redirect:/putong";
				}
				Product p = new Product();
				p.setProductuuid(UIDGenerator.getUUID());
				p.setQuality(6);
				p.setSupplier(supplier.getSuppliername());
				p.setSupplieruuid(supplier.getSupplieruuid());
				p.setProduct(product[i]);
				p.setLotnumber(lotnumber[i]);
				p.setManufacturer(manufacturer[i]);
				p.setEncapsulation(encapsulation[i]);
				p.setDescription(description[i]);
				p.setIsgoodsinstock(isgoodsinstock[i]);
				productService.insertNoPepetition(p);
			}
		}
		return "redirect:/putong";
	}

	@RequestMapping("upproductputong")
	public String upproductputong(Product product) {
		product.setUptime(new Date());
		productService.updateByPrimaryKeySelective(product);
		return "redirect:/putong";
	}

	@RequestMapping("uploadExecl")
	public String uplo(HttpSession session) {
		String uid = (String) session.getAttribute("uid");
		if (uid == null) {
			return "login";
		}
		return "user/product/uploadFileExecl";
	}

	@RequestMapping("daorumobandownload")
	@ResponseBody
	public String download(HttpServletResponse resp, HttpServletRequest req) throws UnsupportedEncodingException {
		String fileName = req.getSession().getServletContext().getRealPath("/moban/moban.xls");
		resp.setHeader("Content-disposition",
				"attachment; filename=" + java.net.URLEncoder.encode("moban.xls", "UTF-8"));
		try {
			ServletOutputStream os = resp.getOutputStream();
			FileInputStream fis = new FileInputStream(fileName);
			byte[] bytes = new byte[fis.available()];
			fis.read(bytes);
			os.write(bytes);
			fis.close();
			os.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}

	@RequestMapping("indaoruproduct")
	@ResponseBody
	public Map<String, Object> indaoruproduct(MultipartFile[] files, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		String uid = (String) session.getAttribute("uid");
		if (uid == null) {
			map.put("result", "login");
			return map;
		}
		Supplier supplier = supplierService.seleSupplierUid(uid);
		map.put("sid", supplier.getSupplieruuid());
		int total = productService.getputongTatol(map);
		MultipartHttpServletRequest mult = (MultipartHttpServletRequest) request;
		// 获取文件
		MultipartFile file = mult.getFile("files");
		if (file != null) {
			String fileName = file.getOriginalFilename();
			File path = new File(request.getSession().getServletContext().getRealPath("/") + "upload");
			if (!path.exists()) {
				path.mkdirs();
			}
			FileOutputStream fos = new FileOutputStream(path + "/" + fileName);
			fos.write(file.getBytes());
			fos.flush();
			fos.close();
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			int i = 0;
			int j = 0;
			int k = 0;
			if ("xls".equals(formatName)) {
				InputStream is = new FileInputStream(path + "/" + fileName);
				HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
				// 循环工作表Sheet
				for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {
					HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);
					if (hssfSheet == null) {
						continue;
					}
					// 循环行Row
					for (int rowNum = 0; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
						HSSFRow hssfRow = hssfSheet.getRow(rowNum);
						if (hssfRow == null) {
							continue;
						}
						if (hssfRow.getRowNum() < 1) {
							continue;
						}
						if (i + total >= 3000) {
							File file2 = new File(path + "/" + fileName);
							file2.delete();
							is.close();
							map.put("result", "fail");
							map.put("chenggong", i);
							map.put("msg", "普通库存已达到3000条");
							return map;
						}
						// 创建实体类
						Product info = new Product();
						if (hssfRow.getCell(0) != null) {
							hssfRow.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
							info.setProduct(hssfRow.getCell(0).getStringCellValue());
							if (info.getProduct().equals("")) {
								j += 1;
								System.out.println(i);
								continue;
							}
						} else {
							j += 1;
							System.out.println(i);
							continue;
						}
						if (hssfRow.getCell(1) != null) {
							hssfRow.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
							info.setManufacturer(hssfRow.getCell(1).getStringCellValue());
							if (info.getManufacturer().equals("")) {
								j += 1;
								System.out.println(i);
								continue;
							}
						} else {
							j += 1;
							System.out.println(i);
							continue;
						}
						if (hssfRow.getCell(2) != null) {
							hssfRow.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
							info.setLotnumber(hssfRow.getCell(2).getStringCellValue());
							if (info.getLotnumber().equals("")) {
								j += 1;
								System.out.println(i);
								continue;
							}
						} else {
							j += 1;
							System.out.println(i);
							continue;
						}
						if (hssfRow.getCell(3) != null) {
							hssfRow.getCell(3).setCellType(Cell.CELL_TYPE_STRING);
							info.setEncapsulation(hssfRow.getCell(3).getStringCellValue());
							if (info.getEncapsulation().equals("")) {
								j += 1;
								System.out.println(i);
								continue;
							}
						} else {
							j += 1;
							System.out.println(i);
							continue;
						}
						if (hssfRow.getCell(4) != null) {
							hssfRow.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
							info.setIsgoodsinstock(hssfRow.getCell(4).getStringCellValue());
							if (info.getIsgoodsinstock().equals("")) {
								j += 1;
								System.out.println(i);
								continue;
							}
						} else {
							j += 1;
							System.out.println(i);
							continue;
						}
						if (hssfRow.getCell(5) != null) {
							hssfRow.getCell(5).setCellType(Cell.CELL_TYPE_STRING);
							info.setDescription(hssfRow.getCell(5).getStringCellValue());
						}
						i++;
						info.setSupplieruuid(supplier.getSupplieruuid());
						info.setQuality(6);
						File file2 = new File(path + "/" + fileName);
						file2.delete();
						Product p = productService.selepAndlAndmAndeAnd(info);
						if (p != null) {
							k++;
							info.setProductuuid(p.getProductuuid());
							productService.updateByPrimaryKeySelective(info);
						} else {
							info.setProductuuid(UIDGenerator.getUUID());
							info.setSupplier(supplier.getSuppliername());
							productService.insertProduct(info);
						}

					}
				}
				is.close();
			} else if ("xlsx".equals(formatName)) {
				XSSFWorkbook xssfWorkbook = new XSSFWorkbook(path + "/" + fileName);
				// 循环工作表Sheet
				for (int numSheet = 0; numSheet < xssfWorkbook.getNumberOfSheets(); numSheet++) {
					XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(numSheet);
					if (xssfSheet == null) {
						continue;
					}
					// 循环行Row
					for (int rowNum = 0; rowNum <= xssfSheet.getLastRowNum(); rowNum++) {
						XSSFRow xssfRow = xssfSheet.getRow(rowNum);
						if (xssfRow == null) {
							continue;
						}
						if (xssfRow.getRowNum() < 1) {
							continue;
						}
						if (i + total >= 3000) {
							File file2 = new File(path + "/" + fileName);
							file2.delete();
							map.put("result", "fail");
							map.put("chenggong", i);
							map.put("msg", "普通库存已达到3000条");
							return map;
						}
						// 创建实体类
						Product info = new Product();
						if (xssfRow.getCell(0) != null) {
							xssfRow.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
							info.setProduct(xssfRow.getCell(0).getStringCellValue());
							if (info.getProduct().equals("")) {
								j += 1;
								continue;
							}
						} else {
							j += 1;
							continue;
						}
						if (xssfRow.getCell(1) != null) {
							xssfRow.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
							info.setManufacturer(xssfRow.getCell(1).getStringCellValue());
							if (info.getManufacturer().equals("")) {
								j += 1;
								continue;
							}
						} else {
							j += 1;
							continue;
						}
						if (xssfRow.getCell(2) != null) {
							xssfRow.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
							info.setLotnumber(xssfRow.getCell(2).getStringCellValue());
							if (info.getLotnumber().equals("")) {
								j += 1;
								continue;
							}
						} else {
							j += 1;
							continue;
						}
						if (xssfRow.getCell(3) != null) {
							xssfRow.getCell(3).setCellType(Cell.CELL_TYPE_STRING);
							info.setEncapsulation(xssfRow.getCell(3).getStringCellValue());
							if (info.getEncapsulation().equals("")) {
								j += 1;
								continue;
							}
						} else {
							j += 1;
							continue;
						}
						if (xssfRow.getCell(4) != null) {
							xssfRow.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
							info.setIsgoodsinstock(xssfRow.getCell(4).getStringCellValue());
							if (info.getIsgoodsinstock().trim().equals("")) {
								j += 1;
								continue;
							}
						} else {
							j += 1;
							continue;
						}
						if (xssfRow.getCell(5) != null) {
							xssfRow.getCell(5).setCellType(Cell.CELL_TYPE_STRING);
							info.setDescription(xssfRow.getCell(5).getStringCellValue());
						}
						i++;
						info.setProductuuid(UIDGenerator.getUUID());
						info.setQuality(6);
						info.setSupplier(supplier.getSuppliername());
						info.setSupplieruuid(supplier.getSupplieruuid());
						File file2 = new File(path + "/" + fileName);
						file2.delete();
						productService.insertSelective(info);
					}
				}
			}
			map.put("chengong", i);
			map.put("shibai", j);
			map.put("chongfu", k);
			if (j > 0) {
				map.put("msg", "请严格按照范本填写");
			}
			map.put("result", "success");
		} else {
			map.put("result", "fail");
		}
		return map;
	}

	@RequestMapping("panduanshangcheng")
	@ResponseBody
	public Map<String, Object> pangs(HttpSession session, Product product) {
		Map<String, Object> map = new HashMap<String, Object>();
		String uid = (String) session.getAttribute("uid");
		if (uid == null) {
			map.put("result", "login");
			return map;
		}
		Supplier supplier = supplierService.seleSupplierUid(uid);
		product.setSupplieruuid(supplier.getSupplieruuid());
		int i = productService.queryByproductByMByEbyI(product);
		if (i == 0) {
			map.put("result", "success");
		} else {
			map.put("result", "fail");
		}
		return map;
	}

	@RequestMapping("1019/zai/xin/jian/SupplierAllProduct")
	public String AdminProductSupplier(@RequestParam(required = false) String product1,
			@RequestParam(required = false) String supplier, HttpSession session,
			@RequestParam(required = false) String page, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		PageBean pageBean;
		if (page == null) {
			pageBean = new PageBean(1, 60);
		} else {
			pageBean = new PageBean(Integer.parseInt(page), 60);
		}
		if (product1 != null) {
			Pattern p = Pattern.compile("\\s*|\t|\r|\n");
			Matcher m = p.matcher(product1);
			product1 = m.replaceAll("");
			product1 = product1.toUpperCase().replace(" ", "").replace("_", "\\_").replace("%", "\\%");
		}
		if (supplier != null) {
			Pattern p = Pattern.compile("\\s*|\t|\r|\n");
			Matcher m = p.matcher(supplier);
			supplier = m.replaceAll("");
			supplier = supplier.toUpperCase().replace(" ", "").replace("_", "\\_").replace("%", "\\%");
		}
		map.put("product", product1);
		map.put("supplier", supplier);
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Product> product = productService.SupplierProduct(map);
		int total = productService.getSupplierProductCount(map);
		model.addAttribute("total", total);
		pageBean.setTotal(total);
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page", pageBean.getPage());
		model.addAttribute("pageSize", pageBean.getPageSize());
		model.addAttribute("product", product);
		model.addAttribute("product1", product1);
		model.addAttribute("supplier", supplier);
		model.addAttribute("supplierProduct", "supplierProduct");
		return "adminHome";
	}

	@RequestMapping("1019/zai/xin/jian/inSupplierProductAdmin")
	public String inSupplierProductAdmin(Model model, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		model.addAttribute("addSupplierProduct", "addSupplierProduct");
		return "adminHome";
	}

	@RequestMapping("1019/zai/xin/jian/supplierListname")
	@ResponseBody
	public List<Supplier> supplierListname(String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		List<Supplier> supplier = supplierService.list(map);
		return supplier;
	}

	@RequestMapping("1019/zai/xin/jian/queryByGroup")
	@ResponseBody
	public List<Product> queryByGroup(String keyword) {
		List<Product> supplier = productService.queryByGroup(keyword);
		return supplier;
	}

	@RequestMapping(value = "1019/zai/xin/jian/addProductSupplier", method = RequestMethod.POST)
	public String addProduct(String[] supplier_uid, String[] supplier_bieming, String[] cellphone, String[] quality,
			String[] product, String[] manufacturer, String[] lotnumber, String[] encapsulation,
			String[] isgoodsinstock, String[] description, String[] supplier, String[] supplieruuid,
			HttpServletRequest req, HttpSession session) throws IOException, ServerException, ClientException {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		// String path =
		// req.getSession().getServletContext().getRealPath("/files/product");
		// 得到UUID
		int j = quality.length;
		for (int i = 0; i < j; i++) {
			if (product[i] != null && !product[i].equals("") && manufacturer[i] != null && !manufacturer[i].equals("")
					&& lotnumber[i] != null && !lotnumber[i].equals("") && encapsulation[i] != null
					&& !encapsulation[i].equals("") && isgoodsinstock[i] != null && !isgoodsinstock[i].equals("")
					&& supplier[i] != null && !supplier[i].equals("") && supplieruuid[i] != null
					&& !supplieruuid[i].equals("")) {
				Product p = new Product();
				p.setProductuuid(UIDGenerator.getUUID());
				p.setQuality(Integer.parseInt(quality[i]));
				p.setSupplier(supplier[i]);
				p.setSupplieruuid(supplieruuid[i]);
				p.setProduct(product[i]);
				p.setLotnumber(lotnumber[i]);
				p.setManufacturer(manufacturer[i]);
				p.setEncapsulation(encapsulation[i]);
				p.setDescription(description[i]);
				p.setIsgoodsinstock(isgoodsinstock[i]);
				productService.insertNoPepetition(p);
			}
			if (cellphone[i] != null && !cellphone[i].equals("")
					&& (supplier_uid[i] == null || supplier_uid[i].equals(""))) {
				SendSmsRequest sms = new SendSmsRequest();
				String a = SmsUtil.sess(cellphone[i]);
				System.out.println(a);
				if (Integer.parseInt(a) < 3) {
					sms.setPhoneNumbers(cellphone[i]);
					JsonObject params = new JsonObject();
					if (supplier_bieming[i] != null && !supplier_bieming[i].equals("")) {
						params.addProperty("name", supplier_bieming[i]);
					} else {
						params.addProperty("name", supplier[i]);
					}
					sms.setTemplateParam(params.toString());
					SendSmsResponse res = SmsUtil.sendSmsQuotes(sms);
					System.out.println(res.getCode());
				}
			}
		}
		return "redirect:/1019/zai/xin/jian/SupplierAllProduct";
	}

	@RequestMapping(value = "1019/zai/xin/jian/deleteProductSupplier")
	@ResponseBody
	public Map<String, Object> deleteProductSupplier(Model model, String productuuid, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		AdminZaiXinJian adminzikezhi = (AdminZaiXinJian) session.getAttribute("user");
		if (session.getAttribute("user") == null) {
			map.put("result", "login");
			return map;
		} else if (adminzikezhi.getAdmin_shrio() != null && adminzikezhi.getAdmin_shrio().indexOf("o") == -1) {
			map.put("msg", "权限不足");
			return map;
		}
		productService.daleteProduct(productuuid);
		map.put("result", "success");
		return map;
	}

	@RequestMapping(value = "1019/zai/xin/jian/updateProductSupplier")
	public String updateProductSupplier(Model model, String productuuid, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		Product product = productService.selectByPrimaryKey(productuuid);
		List<Product> supplier = productService.queryByGroup(product.getSupplieruuid());
		int i = 0, j = 0, k = 0, l = 0;
		System.out.println(supplier.size());
		for (Product p : supplier) {
			if (product.getQuality() == p.getQuality()) {
				String a = Integer.parseInt(p.getIsgoodsinstock()) - 1 + "";
				p.setIsgoodsinstock(a);
			}
			if (p.getQuality() == 3 && Integer.parseInt(p.getIsgoodsinstock()) < 2) {
				model.addAttribute("quality3", "3");
				i++;
			}
			if (p.getQuality() == 3 && Integer.parseInt(p.getIsgoodsinstock()) >= 2) {
				i++;
			}
			if (p.getQuality() == 4 && Integer.parseInt(p.getIsgoodsinstock()) < 10) {
				j++;
				model.addAttribute("quality4", "4");
			}
			if (p.getQuality() == 4 && Integer.parseInt(p.getIsgoodsinstock()) >= 10) {
				j++;
			}
			if (p.getQuality() == 5 && Integer.parseInt(p.getIsgoodsinstock()) < 20) {
				k++;
				model.addAttribute("quality5", "5");
			}
			if (p.getQuality() == 5 && Integer.parseInt(p.getIsgoodsinstock()) >= 20) {
				k++;
			}
			if (p.getQuality() == 6 && Integer.parseInt(p.getIsgoodsinstock()) < 3000) {
				l++;
				model.addAttribute("qualit	y6", "6");
			}
			if (p.getQuality() == 6 && Integer.parseInt(p.getIsgoodsinstock()) >= 3000) {
				l++;
			}
		}
		if (i == 0) {
			model.addAttribute("quality3", "3");
		}
		if (j == 0) {
			model.addAttribute("quality4", "4");
		}
		if (k == 0) {
			model.addAttribute("quality5", "5");
		}
		if (l == 0) {
			model.addAttribute("quality6", "6");
			System.out.println(l);
		}
		model.addAttribute("product", product);
		model.addAttribute("upSupplierProduct", "upSupplierProduct");
		return "adminHome";
	}

	@RequestMapping(value = "1019/zai/xin/jian/upProductSupplierByAdmin")
	@ResponseBody
	public Map<String, Object> upProductSupplierByAdmin(Model model, Product product, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (session.getAttribute("user") == null) {
			map.put("result", "login");
			return map;
		}
		product.setUptime(new Date());
		productService.updateByPrimaryKeySelective(product);
		map.put("result", "success");
		return map;
	}

	@RequestMapping(value = "1019/zai/xin/jian/seleProductque")
	public String seleProductque(@RequestParam(required = false) String product, Model model, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		Map<String, Object> map = new HashMap<String, Object>();
		if (product != null) {
			Pattern p = Pattern.compile("\\s*|\t|\r|\n");
			Matcher m = p.matcher(product);
			product = m.replaceAll("");
			product = product.toUpperCase().replace(" ", "").replace("_", "\\_").replace("%", "\\%");
		}
		map.put("product", product);
		List<RandomText> r = randomTextService.query(map);
		model.addAttribute("randomList", r);
		model.addAttribute("random", "random");
		return "adminHome";
	}

	@RequestMapping(value = "1019/zai/xin/jian/inquehuoProduct")
	public String inquehuoProduct(Model model, RandomText r, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		randomTextService.insertSelective(r);
		return "redirect:/1019/zai/xin/jian/seleProductque";
	}

	@RequestMapping(value = "1019/zai/xin/jian/deleterandomtext")
	public String deleterandomtext(Model model, int id, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		randomTextService.deleterandomtext(id);
		return "redirect:/1019/zai/xin/jian/seleProductque";
	}

	@RequestMapping(value = "1019/zai/xin/jian/sheweirexiao")
	public String sheweirexiao(Model model, Product p, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		p.setProduct_selling(2);
		productService.updateByPrimaryKeySelective(p);
		return "redirect:/1019/zai/xin/jian/queryAllProduct";
	}

	@RequestMapping(value = "1019/zai/xin/jian/quxiaorexiao")
	public String quxiaorexiao(Model model, Product p, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		p.setProduct_selling(1);
		productService.updateByPrimaryKeySelective(p);
		return "redirect:/1019/zai/xin/jian/queryAllProduct";
	}

	@RequestMapping("zaixiangouProduct")
	public String zaixiangouProduct(Model model, Integer page, HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		if (page == null) {
			page = 1;
		}
		Page pageEntity = new Page(page, 50);
		map.put("start", pageEntity.getStart());
		map.put("size", pageEntity.getPageSize());
		List<Product> productList = productService.seleZaiXianProduct(map);
		for (Product p : productList) {
			if (p.getTotalSales() == 0 || p.getTotalSales() < 2000) {
				p.setTotalSales((int) (Math.random() * 18000 + 10000));
			}
		}
		int pageCount = productService.getZaiTotal();
		int pageSize = (int) Math.ceil(pageCount / 50.0);
		if (pageSize == 0) {
			return "redirect:/404";
		}
		model.addAttribute("currentPage", page);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("page", page);
		model.addAttribute("productlist", productList);
		return "zaixiangouProduct";
	}
	


	@RequestMapping("beidongProduct")
	public String beidongProduct(Model model) {
		List<Classification> classification = classificationService.selepassice();
		model.addAttribute("classification", classification);
		return "beidongProduct";
	}

	@RequestMapping("seleonlineProduct")
	public String seleonlineProduct(@RequestParam(required = false) String page,
			@RequestParam(required = false) String product, HttpSession session, Model model) {
		String uid = (String) session.getAttribute("uid");
		String supplieruid = (String) session.getAttribute("supplieruid");
		if (uid == null) {
			return "login";
		}
		if (!supplieruid.equals("1")) {
			return "404";
		}
		Supplier supplier = supplierService.seleSupplierUid(uid);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("suid", supplier.getSupplieruuid());
		PageBean pageBean;
		if (page == null) {
			pageBean = new PageBean(1, 60);
		} else {
			pageBean = new PageBean(Integer.parseInt(page), 60);
		}
		if (product != null) {
			Pattern p = Pattern.compile("\\s*|\t|\r|\n");
			Matcher m = p.matcher(product);
			product = m.replaceAll("");
			product = product.toUpperCase().replace(" ", "").replace("_", "\\_").replace("%", "\\%");
			map.put("product", product);
		}
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Product> productlist = productService.seleByOnline(map);
		int total = productService.getOnlineTotal(map);
		model.addAttribute("total", total);
		pageBean.setTotal(total);
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page", pageBean.getPage());
		model.addAttribute("pageSize", pageBean.getPageSize());
		model.addAttribute("product", productlist);
		model.addAttribute("sproduct", product);
		return "user/product/onlineProduct";
	}

	@ResponseBody
	@RequestMapping("addOnlineProduct")
	public Map<String, Object> addOnlineProduct(Product product, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		String uid = (String) session.getAttribute("uid");
		if (uid == null) {
			map.put("result", "login");
			return map;
		}
		Supplier supplier = supplierService.seleSupplierUid(uid);
		product.setProductuuid(UIDGenerator.getUUID());
		product.setSupplier(supplier.getSuppliername());
		product.setSupplieruuid(supplier.getSupplieruuid());
		product.setQuality(1);
		int i = productService.insertNoPepetition(product);
		if (i == 0) {
			map.put("result", "fail");
			return map;
		} else {
			map.put("result", "success");
		}
		return map;
	}

	@ResponseBody
	@RequestMapping("upOnlineProduct")
	public Map<String, Object> upOnlineProduct(Product product, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		String uid = (String) session.getAttribute("uid");
		if (uid == null) {
			map.put("result", "login");
			return map;
		}
		int i = productService.updateByPrimaryKeySelective(product);
		if (i == 0) {
			map.put("result", "fail");
			return map;
		} else {
			map.put("result", "success");
		}
		return map;
	}

	@ResponseBody
	@RequestMapping("deleteOnlineProduct")
	public Map<String, Object> deleteOnlineProduct(String pid, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		String uid = (String) session.getAttribute("uid");
		if (uid == null) {
			map.put("result", "login");
			return map;
		}
		int i = productService.daleteProduct(pid);
		if (i == 0) {
			map.put("result", "fail");
			return map;
		} else {
			map.put("result", "success");
		}
		return map;
	}

	/**
	 * 从Excel文档中添加供应商产品数据 对应jsp:admin/SuplierProduct.jsp 支持.xls和.xlsx格式
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "1019/zai/xin/jian/addProductForExcel", method = RequestMethod.POST)
	public Map<String, Object> addProductForExcel(MultipartFile[] excelDataFile, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		/*
		 * 解析excel文档
		 */
		// 获取文件
		MultipartHttpServletRequest mult = (MultipartHttpServletRequest) request;
		MultipartFile excelFile = mult.getFile("excelDataFile");
		int successCount = 0;
		if (excelFile != null) {
			String fileName = excelFile.getOriginalFilename();
			if (fileName.endsWith(".xls")) {
				/*
				 * 解析.xls文档
				 */
				File path = new File(request.getSession().getServletContext().getRealPath("/") + "upload");
				if (!path.exists()) {
					path.mkdirs();
				}
				Format format = new SimpleDateFormat("yyyyMMdd");
				String newFileName = UUID.randomUUID() + format.format(new Date()) + ".xls";
				File dir = new File(path, newFileName);
				excelFile.transferTo(dir);// 写入数据
				String filePath = dir.getAbsolutePath();
				ArrayList<Product> productList = PoiExcelUtils.getListByExcelXLS(PoiExcelUtils.readExcelXLS(filePath));
				for (Product p : productList) {
					if (p.getProduct() != null && !p.getProduct().equals("") && p.getManufacturer() != null
							&& !p.getManufacturer().equals("") && p.getLotnumber() != null
							&& !p.getLotnumber().equals("") && p.getEncapsulation() != null
							&& !p.getEncapsulation().equals("") && p.getIsgoodsinstock() != null
							&& !p.getIsgoodsinstock().equals("") && p.getSupplier() != null
							&& !p.getSupplier().equals("")) {
						if (supplierService.queryBysname(p.getSupplier(), null, null) > 0) {
							Supplier supplier = supplierService.querySupplierBySupplierName(p.getSupplier());
							if (supplier != null) {
								p.setSupplieruuid(supplier.getSupplieruuid());
								p.setQuality(6);// 批量导入默认全部设置为6，也就是普通库存
								p.setProductuuid(UIDGenerator.getUUID());
								successCount = successCount + productService.insertNoPepetition(p);
								/**
								 * 数据保存完成后，删除对应的excel数据文件
								 */
								if (new File(filePath).exists() && new File(filePath).isFile()) {
									new File(filePath).delete();
								}
							}
						}
					}
				}
			} else if (fileName.endsWith(".xlsx")) {
				/*
				 * 解析.xlsx文档
				 */
				File path = new File(request.getSession().getServletContext().getRealPath("/") + "upload");
				if (!path.exists()) {
					path.mkdirs();
				}
				Format format = new SimpleDateFormat("yyyyMMdd");
				String newFileName = UIDGenerator.getUUID() + format.format(new Date()) + ".xlsx";
				File dir = new File(path, newFileName);
				excelFile.transferTo(dir);// 写入数据
				String filePath = dir.getAbsolutePath();
				ArrayList<Product> productList = PoiExcelUtils
						.getListByExcelXLSX(PoiExcelUtils.readExcelXLSX(filePath));
				for (Product p : productList) {
					if (p.getProduct() != null && !p.getProduct().equals("") && p.getManufacturer() != null
							&& !p.getManufacturer().equals("") && p.getLotnumber() != null
							&& !p.getLotnumber().equals("") && p.getEncapsulation() != null
							&& !p.getEncapsulation().equals("") && p.getIsgoodsinstock() != null
							&& !p.getIsgoodsinstock().equals("") && p.getSupplier() != null
							&& !p.getSupplier().equals("")) {
						if (supplierService.queryBysname(p.getSupplier(), null, null) > 0) {
							Supplier supplier = supplierService.querySupplierBySupplierName(p.getSupplier());
							if (supplier != null) {
								p.setSupplieruuid(supplier.getSupplieruuid());
								p.setQuality(6);// 批量导入默认全部设置为6，也就是普通库存
								p.setProductuuid(UIDGenerator.getUUID());
								successCount = successCount + productService.insertNoPepetition(p);
								/**
								 * 数据保存完成后，删除对应的excel数据文件
								 */
								if (new File(filePath).exists() && new File(filePath).isFile()) {
									new File(filePath).delete();
								}
							}
						}
					}
				}
			} else {
				map.put("result", "fail");
			}
		} else {
			map.put("result", "fail");
		}
		map.put("result", "success." + successCount);
		return map;
	}

}
