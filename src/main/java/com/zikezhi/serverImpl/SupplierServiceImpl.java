package com.zikezhi.serverImpl;

import com.zikezhi.dao.SupplierMapper;
import com.zikezhi.entity.Supplier;
import com.zikezhi.service.SupplierService;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 
 * @author ponder
 * @version 1.0
 * @Date 2016年9月2日
 * 
 * @ClassName SupplierServiceImpl.java
 * 
 */

@Service("supplierService")
public class SupplierServiceImpl implements SupplierService {

	@Resource
	private SupplierMapper supplierMapper;

	public List<Supplier> list(Map<String, Object> map) {
		return supplierMapper.list(map);
	}

	public Long getTotal(String keyword) {
		return supplierMapper.getTotal(keyword);
	}

	public int deleteByPrimaryKey(String supplieruuid) {
		return supplierMapper.deleteByPrimaryKey(supplieruuid);
	}

	public int insert(Supplier record) {
		return supplierMapper.insert(record);
	}

	public int insertSelective(Supplier record) {
		return supplierMapper.insertSelective(record);
	}

	public Supplier selectByPrimaryKey(String supplieruuid) {
		return supplierMapper.selectByPrimaryKey(supplieruuid);
	}

	public int updateByPrimaryKeySelective(Supplier record) {
		return supplierMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKeyWithBLOBs(Supplier record) {
		return supplierMapper.updateByPrimaryKeyWithBLOBs(record);
	}

	public int updateByPrimaryKey(Supplier record) {
		return supplierMapper.updateByPrimaryKey(record);
	}

	public List<Supplier> selectRand() {
		return supplierMapper.selectRand();
	}

	public String selectSupplierName(String supplierName) {
		return supplierMapper.selectSupplierName(supplierName);
	}

	@Override
	public List<Supplier> selectByNews(Map<String, Object> map) {
		return supplierMapper.selectByNews(map);
	}

	@Override
	public Supplier seleSupplierUid(String uid) {
		return supplierMapper.seleSupplierUid(uid);
	}

	@Override
	public List<Supplier> selepanduan(Supplier s) {
		return supplierMapper.selepanduan(s);
	}

	@Override
	public List<Supplier> productlist(Map<String, Object> map) {
		return supplierMapper.productlist(map);
	}

	@Override
	public int getTotallist(Map<String, Object> map) {
		return supplierMapper.getTotallist(map);
	}

	@Override
	public List<Supplier> queryBySupplierXin() {
		return supplierMapper.queryBySupplierXin();
	}

	@Override
	public int getCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return supplierMapper.getCount(map);
	}

	@Override
	public List<Supplier> selectByproductByQuality(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return supplierMapper.selectByproductByQuality(map);
	}

	@Override
	public List<Supplier> seleSupplierByname(String name) {
		// TODO Auto-generated method stub
		return supplierMapper.seleSupplierByname(name);
	}

	@Override
	public int queryBysname(String name, String tel1, String tel2) {
		// TODO Auto-generated method stub
		return supplierMapper.queryBysname(name, tel1, tel2);
	}

	@Override
	public Supplier querySupplierBySupplierName(String supplierName) {
		// TODO Auto-generated method stub
		return supplierMapper.querySupplierBySupplierName(supplierName);
	}

	// public Integer updateBySupplierNameSelective(Supplier supplier){
	// return supplierMapper.updateBySupplierNameSelective(supplier);
	// }
}
