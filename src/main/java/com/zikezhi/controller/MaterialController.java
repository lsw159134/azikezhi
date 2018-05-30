package com.zikezhi.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.zikezhi.entity.AdminZaiXinJian;
import com.zikezhi.entity.Material;
import com.zikezhi.entity.Replay;
import com.zikezhi.entity.UserInfo;
import com.zikezhi.service.CartService;
import com.zikezhi.service.MaterialService;
import com.zikezhi.service.ReplayService;
import com.zikezhi.service.SearchTableService;
import com.zikezhi.service.UserInfoService;
import com.zikezhi.utils.PageBean;

@Controller
public class MaterialController {

	@Resource(name = "userInfoService")
	private UserInfoService userInfoService;
	
	@Resource(name = "materialService")
	private MaterialService materialService;
	
	@Resource(name = "replayService")
	private ReplayService replayService;
	
	@Resource(name = "cartService")
	private CartService cartService;
	
	@Resource(name = "searchTableService")
	private SearchTableService searchTableService;
	
	//添加
	@ResponseBody
	@RequestMapping("1019/zai/xin/jian/addMaterial")
	public Map<String,Object> addQuotes(Material m,MultipartFile[] files,HttpSession session,HttpServletRequest request,Model model,HttpServletResponse response) throws IOException{
		Map<String ,Object> map=new HashMap<String, Object>();
		AdminZaiXinJian admin=(AdminZaiXinJian)session.getAttribute("user");
		if(admin==null){
			map.put("result","login");
			return map;	
		}
		MultipartHttpServletRequest mult = (MultipartHttpServletRequest) request;
		//获取文件
		MultipartFile file = mult.getFile("files");
		if(file != null){
			String fileName = file.getOriginalFilename();
 	    	File path = new File(request.getSession().getServletContext().getRealPath("/")+"material");
	 		if(!path.exists()){
	 			path.mkdirs();//若不存在  ，则创建一个
	 		}
	 		FileOutputStream fos = new FileOutputStream(path+"/"+fileName);
	 		fos.write(file.getBytes());
	 		fos.flush();
	 		fos.close();
	 		m.setMaterial_name(fileName);
	 		materialService.insertMaterial(m);
	 		map.put("result","seccuss");
		}else{
			response.setContentType("text/html;charset=UTF-8");
			m.setMaterial_content(URLDecoder.decode(m.getMaterial_content(),"UTF-8"));
			materialService.insertMaterial(m);
	 		map.put("result","seccuss");
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping("1019/zai/xin/jian/addMaterialwen")
	public Map<String,Object> addQuoteswen(Material m,HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException{
		Map<String ,Object> map=new HashMap<String, Object>();
		AdminZaiXinJian admin=(AdminZaiXinJian)session.getAttribute("user");
		if(admin==null){
			map.put("result","login");
			return map;	
		}
		materialService.insertMaterial(m);
 		map.put("result","seccuss");
		return map;
	}
	
	//下载
	@RequestMapping("materialdownload")
	@ResponseBody
	public Map<String,Object> execute(Material m, HttpServletRequest req, HttpServletResponse resp,HttpSession session)
			throws Exception {
		Map<String,Object> map=new HashMap<String,Object>();
		if (m.getMaterial_name() != null) {
			String fileName = req.getSession().getServletContext().getRealPath("/material/" + m.getMaterial_name());
			resp.setHeader("Content-disposition", "attachment; filename=" +java.net.URLEncoder.encode(m.getMaterial_name(), "UTF-8"));
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
			//materialService.updateMaterial(m);
		}
		materialService.updateMaterial(m);
		map.put("result", "seccuss");
		return map;
	}
	
	//下载
	@RequestMapping("xiazaiwen")
	@ResponseBody
	public String xiazaiwen(String name, HttpServletRequest req, HttpServletResponse resp,HttpSession session)
			throws Exception {
		if (name != null) {
			String fileName = req.getSession().getServletContext().getRealPath(name);
			name=StringUtils.substringAfterLast(name, "/");
			System.out.println(name);
			resp.setHeader("Content-disposition", "attachment; filename=" +java.net.URLEncoder.encode(name, "UTF-8"));
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
			//materialService.updateMaterial(m);
		}
		return null;
	}
	
	//下载
	@RequestMapping("materialxiazai")
	@ResponseBody
	public String materialxiazai(Material m, HttpServletRequest req, HttpServletResponse resp,HttpSession session)
			throws Exception {
		if (m.getMaterial_name() != null) {
			String fileName = req.getSession().getServletContext().getRealPath("/material/" + m.getMaterial_name());
			resp.setHeader("Content-disposition", "attachment; filename=" +java.net.URLEncoder.encode(m.getMaterial_name(), "UTF-8"));
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
			//materialService.updateMaterial(m);
		}
		materialService.updateMaterial(m);
		return null;
	}
	
	@RequestMapping("ziliao")
	public String queryAllMaterialu(@RequestParam(required = false) String name,@RequestParam(required = false) String page,@RequestParam(required = false) String rows,Model model,HttpSession session,HttpServletRequest req){
		String user=(String)session.getAttribute("uid");
		if(user != null){
			//获取购物车总数
			Long carCount = cartService.countCart(user);
			model.addAttribute("carCount",carCount);
		}
		UserInfo u = userInfoService.selectByPrimaryKey(user);
		PageBean pageBean;
		if(page == null && rows == null){
			pageBean=new PageBean(1,10);
		}else{
			if(Integer.parseInt(page)>3){
				page="3";
			}
			pageBean=new PageBean(Integer.parseInt(page),10);
		}
		
		Map<String, Object> map = new HashMap<String,Object>();
		if(name!=null && !name.equals("")){
			map.put("material_name", "%"+name+"%");
		}
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Material> material=materialService.queryAll(map);
		List<Material> rand=materialService.queryByRAND();
		List<Material> desc=materialService.queryByDesc();
		List<Material> selectlimit=materialService.selectTiwenlimit();
		int total=materialService.getTotal(map);
		pageBean.setTotal(total);
		model.addAttribute("total", total);
		model.addAttribute("name", name);
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page", pageBean.getPage());
		model.addAttribute("pageSize", pageBean.getPageSize());
		model.addAttribute("material",material);
		model.addAttribute("selectlimit",selectlimit);
		model.addAttribute("rand",rand);
		model.addAttribute("desc",desc);
		model.addAttribute("user", u);
		return "material/index";
	}
	
	@RequestMapping("1019/zai/xin/jian/queryAllMaterial")
	public String queryAllMaterial(@RequestParam(required = false) String name,@RequestParam(required = false) String page,@RequestParam(required = false) String rows,Model model,HttpSession session){
		AdminZaiXinJian user=(AdminZaiXinJian)session.getAttribute("user");
		if(user==null){
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
			name=StringUtils.substringBefore(name, "%");

			map.put("material_name", "%"+name+"%");
		}
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Material> material=materialService.queryAll(map);
		int total=materialService.getTotal(map);
		pageBean.setTotal(total);
		model.addAttribute("total", total);
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page", pageBean.getPage());
		model.addAttribute("pageSize", pageBean.getPageSize());
		model.addAttribute("material",material);
		model.addAttribute("materialAll","materialAll");
		return "adminHome";
	}
	
	@RequestMapping("1019/zai/xin/jian/deleteMaterial")
	public String deleteMaterial(String fileNameOne,int id,HttpSession session,HttpServletRequest req){
		AdminZaiXinJian user=(AdminZaiXinJian)session.getAttribute("user");
		if(user==null){
			return "Adminlogin";
		}
		File path = new File(req.getSession().getServletContext().getRealPath("/")+"material");
	    delete(new File(path+"/"+fileNameOne)); 
		materialService.deletematerial(String.valueOf(id));
		return "redirect:/1019/zai/xin/jian/queryAllMaterial";
	}
	
	@RequestMapping("1019/zai/xin/jian/adminmaterialdownload")
	public String adminmaterialdownload(Material m, HttpServletRequest req, HttpServletResponse resp,HttpSession session)
			throws Exception {
		/*String uid=(String)session.getAttribute("uid");
		if(uid==null){
			return "login";
		}*/
		AdminZaiXinJian user=(AdminZaiXinJian)session.getAttribute("user");
		if(user==null){
			return "Adminlogin";
		}
		if (m.getMaterial_name() != null) {
			String fileName = req.getSession().getServletContext().getRealPath("/material/" + m.getMaterial_name());
			resp.setHeader("Content-disposition", "attachment; filename=" +java.net.URLEncoder.encode(m.getMaterial_name(), "UTF-8"));
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
			//materialService.updateMaterial(m);
		}
		return null;
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
	
	@RequestMapping("1019/zai/xin/jian/JumpW")
	public String JumpW(HttpSession session,HttpServletRequest req,Model model){
		AdminZaiXinJian user=(AdminZaiXinJian)session.getAttribute("user");
		if(user==null){
			return "Adminlogin";
		}
		model.addAttribute("addmaterial", "addmaterial");
		return "adminHome";
	}
	
	@RequestMapping("1019/zai/xin/jian/upData")
	public String upData(Material m,HttpSession session,HttpServletRequest req){
		AdminZaiXinJian user=(AdminZaiXinJian)session.getAttribute("user");
		if(user==null){
			return "Adminlogin";
		}
		materialService.updateMaterialAll(m);
		return "redirect:/1019/zai/xin/jian/queryAllMaterial";
	}
	
	@RequestMapping("1019/zai/xin/jian/queryByID")
	public String queryByID(Material m,HttpSession session,Model model,HttpServletRequest req){
		AdminZaiXinJian user=(AdminZaiXinJian)session.getAttribute("user");
		if(user==null){
			return "Adminlogin";
		}
		Material material=materialService.queryByID(m.getMaterial_id());
		model.addAttribute("material", material);
		model.addAttribute("materialup", "materialup");
		return "adminHome";
	}
	
	@ResponseBody
	@RequestMapping("1019/zai/xin/jian/upMaterialwen")
	public Map<String,Object> upMaterialwen(Material m,HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException{
		Map<String ,Object> map=new HashMap<String, Object>();
		AdminZaiXinJian admin=(AdminZaiXinJian)session.getAttribute("user");
		if(admin==null){
			map.put("result","login");
			return map;	
		}
		materialService.updateMaterialAll(m);
 		map.put("result","seccuss");
		return map;
	}
	
	@RequestMapping("ziliaowen")
	public String ziliaowen(Material m,Model model,HttpSession session,HttpServletRequest req){
		String user=(String)session.getAttribute("uid");
		if(user != null){
			//获取购物车总数
			Long carCount = cartService.countCart(user);
			model.addAttribute("carCount",carCount);
		}
		UserInfo u = userInfoService.selectByPrimaryKey(user);
		List<Material> rand=materialService.queryByRAND();
		List<Material> desc=materialService.queryByDesc();
		Material material=materialService.queryByID(m.getMaterial_id());
		materialService.updateMaterial(m);
		model.addAttribute("material", material);
		model.addAttribute("rand",rand);
		model.addAttribute("desc",desc);
		model.addAttribute("user", u);
		return "material/materialwen";
	}
	
	@RequestMapping("tiaozhutiwen")
	public String tiaozhutiwen(Model model,HttpSession session,HttpServletRequest req){
		String user=(String)session.getAttribute("uid");
		if(user != null){
			//获取购物车总数
			Long carCount = cartService.countCart(user);
			model.addAttribute("carCount",carCount);
		}else{
			return "login";
		}
		List<Material> rand=materialService.queryByRAND();
		List<Material> desc=materialService.queryByDesc();
		UserInfo u = userInfoService.selectByPrimaryKey(user);
		model.addAttribute("rand",rand);
		model.addAttribute("desc",desc);
		model.addAttribute("user", u);
		return "material/tiwen";
	}
	
	@RequestMapping("ziliaolistw")
	public String ziliaolistw(@RequestParam(required = false) String page,@RequestParam(required = false) String rows,Model model,HttpSession session,HttpServletRequest req){
		String user=(String)session.getAttribute("uid");
		if(user != null){
			//获取购物车总数
			Long carCount = cartService.countCart(user);
			model.addAttribute("carCount",carCount);
		}
		UserInfo u = userInfoService.selectByPrimaryKey(user);
		PageBean pageBean;
		if(page == null && rows == null){
			pageBean=new PageBean(1,10);
		}else{
			pageBean=new PageBean(Integer.parseInt(page),10);
		}
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Material> material=materialService.queryByWen(map);
		List<Material> rand=materialService.queryByRAND();
		List<Material> desc=materialService.queryByDesc();
		int total=materialService.getTotalWen(map);
		pageBean.setTotal(total);
		model.addAttribute("total", total);
		model.addAttribute("count", pageBean.getCount());
		model.addAttribute("page", pageBean.getPage());
		model.addAttribute("pageSize", pageBean.getPageSize());
		model.addAttribute("material",material);
		model.addAttribute("rand",rand);
		model.addAttribute("desc",desc);
		model.addAttribute("user", u);
		return "material/wenlist";
	}
	
	
	//添加
	@ResponseBody
	@RequestMapping("addMaterialuser")
	public Map<String,Object> addMaterialuser(Material m,HttpSession session,HttpServletRequest request,Model model,HttpServletResponse response) throws IOException{
		Map<String ,Object> map=new HashMap<String, Object>();
		String admin=(String)session.getAttribute("uid");
		if(admin==null){
			map.put("result","login");
			return map;	
		}
		m.setMaterial_userName(admin);
		materialService.insertMaterial(m);
 		map.put("result","seccuss");
		return map;
	}
	
	@RequestMapping("tiwenchak")
	public String tiwenchak(Material m,Model model,HttpSession session,HttpServletRequest req){
		String user=(String)session.getAttribute("uid");
		if(user != null){
			//获取购物车总数
			Long carCount = cartService.countCart(user);
			model.addAttribute("carCount",carCount);
		}
		UserInfo u = userInfoService.selectByPrimaryKey(user);
		Material material=materialService.selectTiwen(m.getMaterial_id());
		List<Replay> replay=replayService.queryAll(m.getMaterial_id());
		List<Material> rand=materialService.queryByRAND();
		List<Material> desc=materialService.queryByDesc();
		model.addAttribute("replay",replay);
		model.addAttribute("material",material);
		model.addAttribute("rand",rand);
		model.addAttribute("desc",desc);
		model.addAttribute("user", u);
		return "material/tiwenchakan";
	}
	
	@RequestMapping("usertiwen")
	public String usertiwen(@RequestParam(required = false) String page,@RequestParam(required = false) String rows,Model model,HttpSession session,HttpServletRequest req){
		String user=(String)session.getAttribute("uid");
		if(user != null){
			//获取购物车总数
			Long carCount = cartService.countCart(user);
			model.addAttribute("carCount",carCount);
		}
		PageBean pageBean;
		if(page == null && rows == null){
			pageBean=new PageBean(1,10);
		}else{
			pageBean=new PageBean(Integer.parseInt(page),10);
		}
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("material_userName", user);
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		UserInfo u = userInfoService.selectByPrimaryKey(user);
		List<Material> material=materialService.UserselectTiwen(map);
		List<Material> rand=materialService.queryByRAND();
		List<Material> desc=materialService.queryByDesc();
		List<Material> selectlimit=materialService.selectTiwenlimit();
		model.addAttribute("selectlimit",selectlimit);
		model.addAttribute("material",material);
		model.addAttribute("rand",rand);
		model.addAttribute("desc",desc);
		model.addAttribute("user", u);
		return "material/tiwenlist";
	}
	
	//添加
	@ResponseBody
	@RequestMapping("addReplay")
	public Map<String,Object> addReplay(Replay r,HttpSession session,HttpServletRequest request,Model model,HttpServletResponse response) throws IOException{
		Map<String ,Object> map=new HashMap<String, Object>();
		String admin=(String)session.getAttribute("uid");
		if(admin==null){
			map.put("result","login");
			return map;	
		}
		r.setReplayuseruid(admin);
		replayService.insertService(r);
 		map.put("result","seccuss");
		return map;
	}
	
	//删除
	@ResponseBody
	@RequestMapping("deleteReplay")
	public Map<String,Object> deleteReplay(Replay r,HttpSession session,HttpServletRequest request,Model model,HttpServletResponse response) throws IOException{
		Map<String ,Object> map=new HashMap<String, Object>();
		String admin=(String)session.getAttribute("uid");
		if(admin==null){
			map.put("result","login");
			return map;	
		}
		UserInfo u = userInfoService.selectByPrimaryKey(admin);
		if(u.getCount()!=null && u.getCount()==1){
			replayService.deletereplay(r.getReplayid());
	 		map.put("result","seccuss");
		}else{
			map.put("result","fail");
		}
		return map;
	}
	
	//删除
	@ResponseBody
	@RequestMapping("deleteMaterial")
	public Map<String,Object> deleteMaterial(Material m,HttpSession session,HttpServletRequest request,Model model,HttpServletResponse response) throws IOException{
		Map<String ,Object> map=new HashMap<String, Object>();
		String admin=(String)session.getAttribute("uid");
		if(admin==null){
			map.put("result","login");
			return map;	
		}
		UserInfo u = userInfoService.selectByPrimaryKey(admin);
		if(u.getCount()!=null && u.getCount()==1){
			materialService.deletematerial(Integer.toString(m.getMaterial_id()));
	 		map.put("result","seccuss");
		}else{
			map.put("result","fail");
		}
		return map;
	}
	
}
