package com.zikezhi.service;

import java.util.List;
import java.util.Map;

import com.zikezhi.entity.Supplier;

/**
 * @author ponder
 * @version 1.0
 * @Date 2016年8月24日
 * @Description: TODO(用一句话描述这个方法的作用)
 * 
 * @ClassName SupplierService.java
 * 
 */

public interface SupplierService {

	/**
	 * 分页查询
	 */
	List<Supplier> list(Map<String, Object> map);

	Long getTotal(String keyword);

	int deleteByPrimaryKey(String supplieruuid);

	int insert(Supplier record);

	int insertSelective(Supplier record);

	Supplier selectByPrimaryKey(String supplieruuid);

	int updateByPrimaryKeySelective(Supplier record);

	int updateByPrimaryKeyWithBLOBs(Supplier record);

	int updateByPrimaryKey(Supplier record);

	List<Supplier> selectRand();

	String selectSupplierName(String supplierName);

	List<Supplier> selectByNews(Map<String, Object> map);

	int getCount(Map<String, Object> map);

	Supplier seleSupplierUid(String uid);

	List<Supplier> selepanduan(Supplier s);

	// String updateBySupplierNameSelective(Supplier supplier);

	List<Supplier> productlist(Map<String, Object> map);

	int getTotallist(Map<String, Object> map);

	List<Supplier> queryBySupplierXin();

	List<Supplier> selectByproductByQuality(Map<String, Object> map);

	List<Supplier> seleSupplierByname(String name);

	int queryBysname(String name, String tel1, String tel2);

	Supplier querySupplierBySupplierName(String supplierName);

}
