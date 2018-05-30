package com.zikezhi.entity;

import java.util.Date;

public class Discount {
	
	private String discount_id;
	private String discount_pid;//产品id
	private int discount_numbermin;//开始数量
	private int discount_numbermax;//结束数量
	private Float discount_price;//价格
	
	private String discount_unit;//单位
	
	private String discount_status;//状态 1.一阶 2. 二阶 3.三阶

	private Date discount_date;//添加时间
	
	public String getDiscount_id() {
		return discount_id;
	}

	public void setDiscount_id(String discount_id) {
		this.discount_id = discount_id;
	}

	public String getDiscount_pid() {
		return discount_pid;
	}

	public void setDiscount_pid(String discount_pid) {
		this.discount_pid = discount_pid;
	}

	public int getDiscount_numbermin() {
		return discount_numbermin;
	}

	public void setDiscount_numbermin(int discount_numbermin) {
		this.discount_numbermin = discount_numbermin;
	}

	public int getDiscount_numbermax() {
		return discount_numbermax;
	}

	public void setDiscount_numbermax(int discount_numbermax) {
		this.discount_numbermax = discount_numbermax;
	}

	public Float getDiscount_price() {
		return discount_price;
	}

	public void setDiscount_price(Float discount_price) {
		this.discount_price = discount_price;
	}

	public String getDiscount_status() {
		return discount_status;
	}

	public void setDiscount_status(String discount_status) {
		this.discount_status = discount_status;
	}

	public String getDiscount_unit() {
		return discount_unit;
	}

	public void setDiscount_unit(String discount_unit) {
		this.discount_unit = discount_unit;
	}

	public Date getDiscount_date() {
		return discount_date;
	}

	public void setDiscount_date(Date discount_date) {
		this.discount_date = discount_date;
	}
	
}
