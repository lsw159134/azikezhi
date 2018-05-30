package com.zikezhi.service;

import java.util.List;

import com.zikezhi.entity.Discount;

public interface DiscountService {

	int insertSelective(Discount record);

    int updateByPrimaryKeySelective(Discount record);

	List<Discount> queryByPid(String pid);

	List<Discount> queryByMin(Discount discount);

}
