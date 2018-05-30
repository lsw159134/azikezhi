package com.zikezhi.serverImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.DiscountMapper;
import com.zikezhi.entity.Discount;
import com.zikezhi.service.DiscountService;

@Service("discountService")
public class DiscountServiceImpl implements DiscountService {

	@Autowired
    private DiscountMapper discountMapper;
	
	@Override
	public int insertSelective(Discount record) {
		// TODO Auto-generated method stub
		return discountMapper.insertSelective(record);
	}

	@Override
	public int updateByPrimaryKeySelective(Discount record) {
		// TODO Auto-generated method stub
		return discountMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public List<Discount> queryByPid(String pid) {
		// TODO Auto-generated method stub
		return discountMapper.queryByPid(pid);
	}

	@Override
	public List<Discount> queryByMin(Discount discount) {
		// TODO Auto-generated method stub
		return discountMapper.queryByMin(discount);
	}

}
