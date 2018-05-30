package com.zikezhi.dao;

import java.util.List;

import com.zikezhi.entity.Cart;

public interface CartMapper {

	int insertSelective(Cart cart);
	
	int updateByPrimaryKeySelective(Cart cart);
	
	Cart queryByPid(String cart_pid,String uid);
	
	int deleteByPid(String cart_id);
	
	int deleteByUid(String cart_uid);
	
	List<Cart> queryAll();
	
	//查询购物车总数
	Long countCart(String uid);
	
}
