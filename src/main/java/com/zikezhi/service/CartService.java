package com.zikezhi.service;

import java.util.List;

import com.zikezhi.entity.Cart;

public interface CartService {

	int insertSelective(Cart cart);
	
	int updateByPrimaryKeySelective(Cart cart);
	
	Cart queryByPid(String cart_pid,String uid);
	
	int deleteByPid(String cart_pid);
	
	int deleteByUid(String cart_uid);
	
	List<Cart> queryAll();
	
	//查询购物车总数
	Long countCart(String uid);
}
