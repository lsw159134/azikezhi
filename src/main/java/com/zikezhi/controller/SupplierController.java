package com.zikezhi.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.zikezhi.entity.Supplier;
import com.zikezhi.service.SupplierService;
import com.zikezhi.utils.PageBean;
import com.zikezhi.utils.UIDGenerator;
/**
 * 主动器件供应商
 * @author lenovo
 *
 */
@Controller
public class SupplierController {

	@Resource(name = "supplierService")
	private SupplierService supplierService;
	
	@RequestMapping("supplierIn")
	public String inSupplier(HttpSession session ,Model model){
		String uid=(String)session.getAttribute("uid");
		if(uid==null){
			return "login";
		}
		Supplier supplier = supplierService.seleSupplierUid(uid);
		model.addAttribute("supplier", supplier);
		return "user/supplier/supplier";
	}
	
	//公司信息判断
	@ResponseBody
	@RequestMapping("paduansupplier")
	public Map<String,Object> paduansupplier(Supplier supplier,HttpSession session ,Model model){
		String uid=(String)session.getAttribute("uid");
		Map<String,Object> map=new HashMap<String, Object>();
		if(uid==null){
			map.put("login", "login");
			return map;
		}
		supplier.setSupplier_uid(uid);
		List<Supplier> s=supplierService.selepanduan(supplier);
		if(s.isEmpty()){
			map.put("result", "seccuss");
		}else{
			map.put("result", "fail");
			map.put("s", s);
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping("supplierseleuser")
	public Map<String,Object> supplierseleuser(HttpSession session ,Model model){
		String uid=(String)session.getAttribute("uid");
		Map<String,Object> map=new HashMap<String,Object>();
		if(uid==null){
			map.put("result", "login");
			return map;
		}
		Supplier supplier = supplierService.seleSupplierUid(uid);
		if(supplier==null){
			map.put("result","fail");
		}else{
			map.put("result","seccuss");
		}
		return map;
	}
	
	@RequestMapping("1019/zai/xin/jian/supplierList")
	public String supplierList(@RequestParam(required = false)String username,@RequestParam(required = false)String suppliername,@RequestParam(required = false)String page,HttpSession session,Model model){
		Map<String,Object> map=new HashMap<String,Object>();
		if (session.getAttribute("user") == null) {
			return "Adminlogin";
		}
		PageBean pageBean;
		if(page == null){
			pageBean=new PageBean(1,30);
		}else{
			pageBean=new PageBean(Integer.parseInt(page),30);
		}
		if(session.getAttribute("supplieruuid")!=null){
			session.removeAttribute("supplieruuid");
		}
		if(username!=null){
			Pattern p = Pattern.compile("\\s*|\t|\r|\n");
	        Matcher m = p.matcher(username);
	        username = m.replaceAll("");
	        username = username.toUpperCase().replace(" ", "").replace("_", "\\_").replace("%", "\\%");
		}
		if(suppliername!=null){
			Pattern p = Pattern.compile("\\s*|\t|\r|\n");
	        Matcher m = p.matcher(suppliername);
	        suppliername = m.replaceAll("");
			suppliername = suppliername.toUpperCase().replace(" ", "").replace("_", "\\_").replace("%", "\\%");
		}
		map.put("username", username);
		map.put("suppliername", suppliername);
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Supplier> supplier=supplierService.selectByNews(map);
		int total=supplierService.getCount(map);
		model.addAttribute("total", total);
		pageBean.setTotal(total);
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page", pageBean.getPage());
		model.addAttribute("pageSize", pageBean.getPageSize());
		model.addAttribute("supplierAll", supplier);
		model.addAttribute("suppliername", suppliername);
		model.addAttribute("supplierList", "supplierList");
		return "adminHome";
	}
	
	
	@RequestMapping("1019/zai/xin/jian/addSupplierAdmin")
	public String addSupplierAdmin(Model model){
		model.addAttribute("addSupplier", "addSupplier");
		return "adminHome";
	}
	
	@RequestMapping("1019/zai/xin/jian/AdminAddSupplier")
	public String AdminAddSupplier(HttpSession session,Supplier supplier){
		supplier.setSupplieruuid(UIDGenerator.getUUID());
		if(supplier.getSuppliername()!=null && !supplier.getSuppliername().equals("")){
			supplierService.insertSelective(supplier);
		}
		return "redirect:/1019/zai/xin/jian/supplierList";
	}
	
	@RequestMapping("1019/zai/xin/jian/updateSupplierAdmin")
	public String upSupplierAdmin(HttpSession session,Model model,String sid){
		if(session.getAttribute("user")==null){
			return "Adminlogin";
		}
		Supplier s=supplierService.selectByPrimaryKey(sid);
		model.addAttribute("supplier", s);
		model.addAttribute("upSupplier", "upSupplier");
		return "adminHome";
	}
	@RequestMapping("1019/zai/xin/jian/deleteSupplierAdmin")
	public String deleteByPrimaryKey(String sid,Model model,HttpSession session){
		if(session.getAttribute("user")==null){
			return "Adminlogin";
		}
		supplierService.deleteByPrimaryKey(sid);
		return "redirect:/1019/zai/xin/jian/supplierList";
	}
	
	
	@RequestMapping("1019/zai/xin/jian/supplierupdateByAdmin")
	public String upSupplierAdmin(HttpSession session,Model model,Supplier sid){
		if(session.getAttribute("user")==null){
			return "Adminlogin";
		}
		supplierService.updateByPrimaryKeySelective(sid);
		return "redirect:/1019/zai/xin/jian/supplierList";
	}
	
	@RequestMapping("1019/zai/xin/jian/suppliernamelist")
	@ResponseBody
	public Map<String,Object> suppliernamelist(MultipartFile[] files,HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException{
		Map<String,Object> map=new HashMap<String,Object>();
		MultipartHttpServletRequest mult = (MultipartHttpServletRequest) request;
		//获取文件
		MultipartFile file = mult.getFile("files");
		if(file!=null){
			String fileName = file.getOriginalFilename();
		    File path=new File(request.getSession().getServletContext().getRealPath("/")+"upload");
			if(!path.exists()){
				path.mkdirs();
			}
			FileOutputStream fos=new FileOutputStream(path+"/"+fileName);
			fos.write(file.getBytes());
			fos.flush();
			fos.close();
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			int i=0;
			int j=0;
			int k=0;
			if("xls".equals(formatName)){
				InputStream is = new FileInputStream(path+"/"+fileName);  
			    HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);   
			    // 循环工作表Sheet  
			    for(int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++){  
			    	HSSFSheet hssfSheet = hssfWorkbook.getSheetAt( numSheet);  
					if(hssfSheet == null){  
						continue;  
					}  
					// 循环行Row   
					for(int rowNum = 0; rowNum <= hssfSheet.getLastRowNum(); rowNum++){  
						HSSFRow hssfRow = hssfSheet.getRow( rowNum);  
						if(hssfRow == null){  
						  continue;  
						}
						if(hssfRow.getRowNum()<1){
							continue;
						}
						//创建实体类
						Supplier info=new Supplier();
						if(hssfRow.getCell(0)!=null){
							hssfRow.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
							info.setSuppliername(hssfRow.getCell(0).getStringCellValue());
							if(info.getSuppliername().equals("")){
								j+=1;System.out.println(i);
								continue;
							}
						}else{
							j+=1;System.out.println(i);
							continue;
						}
						if(hssfRow.getCell(1)!=null){
							hssfRow.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
							info.setTelphone1(hssfRow.getCell(1).getStringCellValue());
						}else{
							j+=1;System.out.println(i);
							continue;
						}
						if(hssfRow.getCell(2)!=null){
							hssfRow.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
							info.setTelphone2(hssfRow.getCell(2).getStringCellValue());
						}else{
							j+=1;System.out.println(i);
							continue;
						}
						if(hssfRow.getCell(3)!=null){
							hssfRow.getCell(3).setCellType(Cell.CELL_TYPE_STRING);
							info.setTelphone3(hssfRow.getCell(3).getStringCellValue());
						}else{
							j+=1;System.out.println(i);
							continue;
						}
						if(hssfRow.getCell(4)!=null){
							hssfRow.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
							info.setTelphone4(hssfRow.getCell(4).getStringCellValue());
						}else{
							j+=1;System.out.println(i);
							continue;
						}
						if(hssfRow.getCell(5)!=null){
							hssfRow.getCell(5).setCellType(Cell.CELL_TYPE_STRING);
							info.setCellphone(hssfRow.getCell(5).getStringCellValue());
						}
						if(hssfRow.getCell(6)!=null){
							hssfRow.getCell(6).setCellType(Cell.CELL_TYPE_STRING);
							info.setSupplierposition(hssfRow.getCell(6).getStringCellValue());
							if(info.getSupplierposition().equals("")){
								j+=1;System.out.println(i);
								continue;
							}
						}
						if(hssfRow.getCell(7)!=null){
							hssfRow.getCell(7).setCellType(Cell.CELL_TYPE_STRING);
							info.setQq(hssfRow.getCell(7).getStringCellValue());
						}
						if(hssfRow.getCell(8)!=null){
							hssfRow.getCell(8).setCellType(Cell.CELL_TYPE_STRING);
							info.setQq2(hssfRow.getCell(8).getStringCellValue());
						}
						i++;
						info.setSupplieruuid(UIDGenerator.getUUID());
						File file2 = new File(path+"/"+fileName);
						file2.delete();
						int p=supplierService.queryBysname(info.getSuppliername(), info.getTelphone1(), info.getTelphone1());
						if(p>=1){
							k++;
							System.out.println("重复="+k);
						}else{
							supplierService.insertSelective(info);
						}
						
					}  
			    }  
			    is.close();
			}
			map.put("chengong", i);
			map.put("shibai",j);
			map.put("chongfu",k);
			if(j>0){
				map.put("msg", "请严格按照范本填写");
			}
			map.put("result", "success");
		}else{
			map.put("result", "fail");
		}
		return map;
	}
	
}
