package com.zikezhi.service;

import com.zikezhi.entity.SupplierUser;

/**
 * @author ponder
 * @version 1.0
 * @Date 2016年8月24日
 * @Description: TODO(用一句话描述这个方法的作用)
 * 
 * @ClassName SupplierUserService.java
 * 
 */

public interface SupplierUserService {
	
	public int deleteByPrimaryKey(String supplieruseruuid);

	public int insert(SupplierUser record);

	public int insertSelective(SupplierUser record);

	public SupplierUser selectByPrimaryKey(String supplieruseruuid);

	public int updateByPrimaryKeySelective(SupplierUser record);

	public int updateByPrimaryKey(SupplierUser record);

}
