package com.zikezhi.entity;

import java.util.Date;

public class Quote {
	
	private int quote_id;
	
	private String quote_name;//客户
	
	private String quote_status;//报价状态
	
	private String quote_product;//型号
	
	private String quote_lotnumber;//批号
	
	private Date quote_date;//时间
	
	private String quote_uid;//所属用户
	
	private String quote_number;//数量
	
	private String quote_price;//价格
	
	private String quote_brand;//品牌
	
	private String quote_package;//封装
	
	private String quote_telephone;//联系方式
	
	private String quote_utilnumber;
	
	private String quote_priceutil;
	
	private String quote_quality;
	
	private UserInfo user;

	public int getQuote_id() {
		return quote_id;
	}

	public void setQuote_id(int quote_id) {
		this.quote_id = quote_id;
	}

	public String getQuote_name() {
		return quote_name;
	}

	public void setQuote_name(String quote_name) {
		this.quote_name = quote_name;
	}

	public String getQuote_status() {
		return quote_status;
	}

	public void setQuote_status(String quote_status) {
		this.quote_status = quote_status;
	}

	public String getQuote_product() {
		return quote_product;
	}

	public void setQuote_product(String quote_product) {
		this.quote_product = quote_product == null ? null : quote_product.trim();
		this.quote_product = this.quote_product.toUpperCase();
	}

	public String getQuote_lotnumber() {
		return quote_lotnumber;
	}

	public void setQuote_lotnumber(String quote_lotnumber) {
		this.quote_lotnumber = quote_lotnumber;
	}

	public Date getQuote_date() {
		return quote_date;
	}

	public void setQuote_date(Date quote_date) {
		this.quote_date = quote_date;
	}

	public String getQuote_uid() {
		return quote_uid;
	}

	public void setQuote_uid(String quote_uid) {
		this.quote_uid = quote_uid;
	}

	public String getQuote_number() {
		return quote_number;
	}

	public void setQuote_number(String quote_number) {
		this.quote_number = quote_number;
	}

	public String getQuote_price() {
		return quote_price;
	}

	public void setQuote_price(String quote_price) {
		this.quote_price = quote_price;
	}

	public String getQuote_brand() {
		return quote_brand;
	}

	public void setQuote_brand(String quote_brand) {
		this.quote_brand = quote_brand;
	}

	public String getQuote_package() {
		return quote_package;
	}

	public void setQuote_package(String quote_package) {
		this.quote_package = quote_package;
	}

	public String getQuote_telephone() {
		return quote_telephone;
	}

	public void setQuote_telephone(String quote_telephone) {
		this.quote_telephone = quote_telephone;
	}

	public String getQuote_utilnumber() {
		return quote_utilnumber;
	}

	public void setQuote_utilnumber(String quote_utilnumber) {
		this.quote_utilnumber = quote_utilnumber;
	}

	public String getQuote_priceutil() {
		return quote_priceutil;
	}

	public void setQuote_priceutil(String quote_priceutil) {
		this.quote_priceutil = quote_priceutil;
	}

	public String getQuote_quality() {
		return quote_quality;
	}

	public void setQuote_quality(String quote_quality) {
		this.quote_quality = quote_quality;
	}

	public UserInfo getUser() {
		return user;
	}

	public void setUser(UserInfo user) {
		this.user = user;
	}
	
}
