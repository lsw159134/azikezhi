package com.zikezhi.entity;

import java.util.Date;

/**
 * 购物车对象
 * 
 * @author
 * 
 */
public class Cart{
	
	private String cart_id;
	private String cart_pid;//商品id
	private String cart_uid;//用户id
	private int cart_number;//数量
	private Date cart_date;//时间
	private UserInfo user;
	private Product p;
	private String panduan;
	
	
	public String getPanduan() {
		return panduan;
	}

	public void setPanduan(String panduan) {
		this.panduan = panduan;
	}

	public String getCart_id() {
		return cart_id;
	}

	public void setCart_id(String cart_id) {
		this.cart_id = cart_id;
	}

	public String getCart_pid() {
		return cart_pid;
	}

	public void setCart_pid(String cart_pid) {
		this.cart_pid = cart_pid;
	}

	public String getCart_uid() {
		return cart_uid;
	}

	public void setCart_uid(String cart_uid) {
		this.cart_uid = cart_uid;
	}

	public int getCart_number() {
		return cart_number;
	}

	public void setCart_number(int cart_number) {
		this.cart_number = cart_number;
	}

	public Date getCart_date() {
		return cart_date;
	}

	public void setCart_date(Date cart_date) {
		this.cart_date = cart_date;
	}

	public UserInfo getUser() {
		return user;
	}

	public void setUser(UserInfo user) {
		this.user = user;
	}

	public Product getP() {
		return p;
	}

	public void setP(Product p) {
		this.p = p;
	}

	// 购物总计:
	private float total;

	public Float getTotal() {
		return total;
	}

}
