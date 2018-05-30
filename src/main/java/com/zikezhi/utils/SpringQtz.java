 package com.zikezhi.utils;

import javax.annotation.Resource;

import com.zikezhi.entity.Brand;
import com.zikezhi.service.BrandService;
import com.zikezhi.service.ProductService;
/**
 * 定时任务
 * @author wrp
 *
 */
public class SpringQtz {  
    
	@Resource(name="brandService")
	private BrandService brandService;
	
	@Resource(name = "productService")
	private ProductService productService;
    
    protected void execute() {  
    	int temp = (int) ( 3000 * Math.random() + 1000);
    	System.out.println(temp);
    	Brand b=new Brand();
    	b.setBrand_id(1);
    	b.setBrand_sortimg(temp);
    	brandService.updateByPrimaryKeySelective(b);
    	productService.upsuppliername();
    }  
    /*
    public static void main(String[] args) {
    	execute();
	}*/
}
