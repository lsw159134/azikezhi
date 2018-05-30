package com.zikezhi.serverImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.BrandMapper;
import com.zikezhi.entity.Brand;
import com.zikezhi.service.BrandService;

@Service("brandService")
public class BrandServiceImapl implements BrandService {

	@Autowired
	private BrandMapper brandMapper;
	
	@Override
	public int insertSelective(Brand b) {
		return brandMapper.insertSelective(b);
	}

	@Override
	public int updateByPrimaryKeySelective(Brand b) {
		return brandMapper.updateByPrimaryKeySelective(b);
	}

	@Override
	public int deleteByid(int id) {
		return brandMapper.deleteByid(id);
	}

	@Override
	public List<Brand> queryAll() {
		return brandMapper.queryAll();
	}

	@Override
	public List<Brand> queryBydesc() {
		return brandMapper.queryBydesc();
	}

	@Override
	public int getTotal() {
		return brandMapper.getTotal();
	}

	@Override
	public List<Brand> queryByname() {
		return brandMapper.queryByname();
	}

	@Override
	public int queryBy(String name) {
		// TODO Auto-generated method stub
		return brandMapper.queryBy(name);
	}

	@Override
	public int seleSort() {
		// TODO Auto-generated method stub
		return brandMapper.seleSort();
	}

}
