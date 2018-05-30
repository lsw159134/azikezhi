package com.zikezhi.serverImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zikezhi.dao.CartMapper;
import com.zikezhi.entity.Cart;
import com.zikezhi.service.CartService;

@Service("cartService")
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper cartMapper;
	
	@Override
	public int insertSelective(Cart cart) {
		// TODO Auto-generated method stub
		return cartMapper.insertSelective(cart);
	}

	@Override
	public int updateByPrimaryKeySelective(Cart cart) {
		// TODO Auto-generated method stub
		return cartMapper.updateByPrimaryKeySelective(cart);
	}

	@Override
	public Cart queryByPid(String cart_pid,String uid) {
		// TODO Auto-generated method stub
		return cartMapper.queryByPid(cart_pid,uid);
	}

	@Override
	public int deleteByPid(String cart_pid) {
		// TODO Auto-generated method stub
		return cartMapper.deleteByPid(cart_pid);
	}

	@Override
	public int deleteByUid(String cart_uid) {
		// TODO Auto-generated method stub
		return cartMapper.deleteByUid(cart_uid);
	}

	@Override
	public List<Cart> queryAll() {
		// TODO Auto-generated method stub
		return cartMapper.queryAll();
	}

	@Override
	public Long countCart(String uid) {
		// TODO Auto-generated method stub
		return cartMapper.countCart(uid);
	}

}
