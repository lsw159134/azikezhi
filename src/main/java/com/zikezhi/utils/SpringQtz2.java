package com.zikezhi.utils;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import com.zikezhi.entity.Product;
import com.zikezhi.entity.RandomText;
import com.zikezhi.entity.Supplier;
import com.zikezhi.service.BrandService;
import com.zikezhi.service.ProductService;
import com.zikezhi.service.RandomTextService;
import com.zikezhi.service.SupplierService;
/**
 * 定时任务
 * @author wrp
 *
 */
public class SpringQtz2 {  
	
	@Resource(name = "supplierService")
	private SupplierService supplierService;
	
	@Resource(name = "productService")
	private ProductService productService;
    
	 @Resource(name="brandService")
	private BrandService brandService;
	 
	 @Resource(name = "randomTextService")
	 private RandomTextService randomTextService;
    
    protected  void execute() {  
    	List<Product> shelves = productService.seleShelves();
		List<Product> hot = productService.seleHot();
		List<Product> deal=productService.seleDeal();
		List<Supplier> supplier=supplierService.queryBySupplierXin();
		Map<String,Object> map=new HashMap<String,Object>();
		List<RandomText> rand=randomTextService.query(map);
		int x=supplierService.getCount(map);
		int chengjiao=brandService.seleSort();
		int p=productService.getSupplierProductCount(map);
		List<Product> productList=productService.seleZaiXianProduct(map);
		map.put("keyword", "ATMEGA");
		map.put("start", 0);
		map.put("size", 50);
		List<Product> product=productService.list(map);
		long total=productService.getTotal(map);
    }  
}
