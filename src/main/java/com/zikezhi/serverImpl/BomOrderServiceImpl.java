package com.zikezhi.serverImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.BomOrderMapper;
import com.zikezhi.entity.BomOrder;
import com.zikezhi.service.BomOrderService;

@Service("bomOrderService")
public class BomOrderServiceImpl implements BomOrderService {

	@Autowired
	private BomOrderMapper bomOrderMapper;
	
	
	@Override
	public int insertSelective(BomOrder bom) {
		return bomOrderMapper.insertSelective(bom);
	}

	@Override
	public int updateByPrimaryKeySelective(BomOrder bom) {
		return bomOrderMapper.updateByPrimaryKeySelective(bom);
	}

	@Override
	public List<BomOrder> queryAll(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return bomOrderMapper.queryAll(map);
	}

	@Override
	public BomOrder selectByid(int id) {
		return bomOrderMapper.selectByid(id);
	}

	@Override
	public int queryByDateCount(String edate) {
		return bomOrderMapper.queryByDateCount(edate);
	}

	@Override
	public List<BomOrder> querybomuserphone(String uid) {
		return bomOrderMapper.querybomuserphone(uid);
	}

	@Override
	public Float queryByfanUserBom(String uid) {
		return bomOrderMapper.queryByfanUserBom(uid);
	}

	@Override
	public List<String> queryByTotalExpress() {
		return bomOrderMapper.queryByTotalExpress();
	}

	@Override
	public List<String> queryByStatus() {
		return bomOrderMapper.queryByStatus();
	}

	@Override
	public long getTotalAll(Map<String, Object> map) {
		return bomOrderMapper.getTotalAll(map);
	}
											
}
