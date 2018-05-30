package com.zikezhi.serverImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.PrimaryMapper;
import com.zikezhi.entity.Primary;
import com.zikezhi.service.PrimaryService;

@Service("primaryService")
public class PrimaryServiceImpl implements PrimaryService {
	
	@Autowired
	private PrimaryMapper primaryMapper;

	@Override
	public int insertSelective(Primary bom) {
		return primaryMapper.insertSelective(bom);
	}

	@Override
	public int updateByPrimaryKeySelective(Primary cart) {
		return primaryMapper.updateByPrimaryKeySelective(cart);
	}

	@Override
	public List<Primary> queryAll() {
		return primaryMapper.queryAll();
	}

	@Override
	public Primary selectByid(int id) {
		return primaryMapper.selectByid(id);
	}

	@Override
	public int queryByDateCount(String edate) {
		return primaryMapper.queryByDateCount(edate);
	}

	@Override
	public List<Primary> querybomuserphone(String uid) {
		return primaryMapper.querybomuserphone(uid);
	}

	@Override
	public int deletePrimary(int id) {
		return primaryMapper.deletePrimary(id);
	}

	@Override
	public int queryPrimaryName(Primary p) {
		return primaryMapper.queryPrimaryName(p);
	}

	@Override
	public List<Primary> select_primary_name(String primary_id) {
		return primaryMapper.select_primary_name(primary_id);
	}

	@Override
	public List<Primary> indexseleprimary() {
		return primaryMapper.indexseleprimary();
	}

	@Override
	public List<Primary> moreSort() {
		return primaryMapper.moreSort();
	}

}
