package com.zikezhi.serverImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.ClassificationMapper;
import com.zikezhi.entity.Classification;
import com.zikezhi.service.ClassificationService;

@Service("classificationService")
public class ClassificationServiceImpl implements ClassificationService {

	@Autowired
	private ClassificationMapper classificationMapper;
	
	@Override
	public int insertSelective(Classification classification) {
		return classificationMapper.insertSelective(classification);
	}

	@Override
	public int updateByclassificationKeySelective(Classification classification) {
		return classificationMapper.updateByclassificationKeySelective(classification);
	}

	@Override
	public List<Classification> queryAll() {
		return classificationMapper.queryAll();
	}

	@Override
	public List<Classification> selectBySort(int sort) {
		return classificationMapper.selectBySort(sort);
	}

	@Override
	public int queryclassificationName(Classification c) {
		return classificationMapper.queryclassificationName(c);
	}

	@Override
	public int delete(int id) {
		return classificationMapper.delete(id);
	}

	@Override
	public List<Classification> selepassice() {
		return classificationMapper.selepassice();
	}
												
}
