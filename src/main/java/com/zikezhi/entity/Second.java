package com.zikezhi.entity;

import java.util.Date;

public class Second {
	private int second_id;
	
	private String second_name;//分类名称
	
	private Date second_addtime;//添加时间
	
	private int second_primaryid;//所属一级分类
	
	private Product product;

	public int getSecond_id() {
		return second_id;
	}

	public void setSecond_id(int second_id) {
		this.second_id = second_id;
	}

	public String getSecond_name() {
		return second_name;
	}

	public void setSecond_name(String second_name) {
		this.second_name = second_name;
	}

	public Date getSecond_addtime() {
		return second_addtime;
	}

	public void setSecond_addtime(Date second_addtime) {
		this.second_addtime = second_addtime;
	}

	public int getSecond_primaryid() {
		return second_primaryid;
	}

	public void setSecond_primaryid(int second_primaryid) {
		this.second_primaryid = second_primaryid;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
}
