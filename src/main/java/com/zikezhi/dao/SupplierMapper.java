package com.zikezhi.dao;

import org.apache.ibatis.annotations.Param;

import com.zikezhi.entity.Supplier;

import java.util.List;
import java.util.Map;

public interface SupplierMapper {
    int deleteByPrimaryKey(String supplieruuid);

    int insert(Supplier record);

    int insertSelective(Supplier record);

    Supplier selectByPrimaryKey(String supplieruuid);

    int updateByPrimaryKeySelective(Supplier record);

    int updateByPrimaryKeyWithBLOBs(Supplier record);

    int updateByPrimaryKey(Supplier record);
    
    List<Supplier> list(Map<String, Object> map);
    
    Long getTotal(@Param("keyword") String keyword);
    
	List<Supplier> selectRand();
	
	String selectSupplierName(String supplierName);
	
	Integer updateBySupplierNameSelective(@Param("supplier") Supplier supplier);

    List<Supplier> selectByNews(Map<String,Object> map);
    
    int getCount(Map<String,Object> map);
    
    Supplier seleSupplierUid(String uid);
    
    List<Supplier> selepanduan(Supplier s);
    
    List<Supplier> productlist(Map<String,Object> map);
    
    int getTotallist(Map<String,Object> map);
    
    List<Supplier> queryBySupplierXin();
    
    List<Supplier> selectByproductByQuality(Map<String,Object> map);

	List<Supplier> seleSupplierByname(String name);
	
	int queryBysname(String name,String tel1,String tel2);
	
	Supplier querySupplierBySupplierName(String supplierName);
}