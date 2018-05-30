package com.zikezhi.serverImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.SubcategoryMapper;
import com.zikezhi.entity.Subcategory;
import com.zikezhi.service.SubcategoryService;

@Service("subcategoryService")
public class SubcategoryServiceImpl implements SubcategoryService {

	@Autowired
	private SubcategoryMapper subcategoryMapper;
	
	@Override
	public int insertSelective(Subcategory s) {
		return subcategoryMapper.insertSelective(s);
	}

	@Override
	public int updateByPrimaryKeySelective(Subcategory s) {
		return subcategoryMapper.updateByPrimaryKeySelective(s);
	}

	@Override
	public List<Subcategory> queryAll(int cid) {
		return subcategoryMapper.queryAll(cid);
	}

	@Override
	public List<Subcategory> selectBySort(Subcategory s) {
		return subcategoryMapper.selectBySort(s);
	}

	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return subcategoryMapper.delete(id);
	}

}
