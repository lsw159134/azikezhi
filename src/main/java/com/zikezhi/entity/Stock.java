package com.zikezhi.entity;

import java.util.Date;
/**
 * （库存管理）用户系统
 * @author lenovo
 *
 */
public class Stock {
	
	private String stock_id;
	
	private String stock_product;
	
	private String stock_brand;
	
	private String stock_package;
	
	private String stock_lotnumber;
	
	private String stock_number;
	
	private Float stock_price;
	
	private String stock_position;
	
	private Date stock_addtime;
	
	private Date stock_uptime;
	
	private String stock_danwei1;
	
	private String stock_huoqi;
	
	private String stock_beizhu;
	
	private String stock_danwei2;
	
	private String stock_baozhuangnum;
	
	private String stock_quality;
	
	private String stock_uid;
	
	private String stock_supplier;
	
	private String stock_address;

	public String getStock_id() {
		return stock_id;
	}

	public void setStock_id(String stock_id) {
		this.stock_id = stock_id;
	}

	public String getStock_product() {
		return stock_product;
	}

	public void setStock_product(String stock_product) {
		this.stock_product = stock_product == null ? null : stock_product.trim();
		this.stock_product = this.stock_product.toUpperCase();
	}

	public String getStock_brand() {
		return stock_brand;
	}

	public void setStock_brand(String stock_brand) {
		this.stock_brand = stock_brand == null ? null : stock_brand.trim();
		this.stock_brand = this.stock_brand.toUpperCase();
	}

	public String getStock_package() {
		return stock_package;
	}

	public void setStock_package(String stock_package) {
		this.stock_package = stock_package == null ? null : stock_package.trim();
		this.stock_package = this.stock_package.toUpperCase();
	}

	public String getStock_lotnumber() {
		return stock_lotnumber;
	}

	public void setStock_lotnumber(String stock_lotnumber) {
		this.stock_lotnumber = stock_lotnumber == null ? null : stock_lotnumber.trim();
		this.stock_lotnumber = this.stock_lotnumber.toUpperCase();
	}

	public String getStock_number() {
		return stock_number;
	}

	public void setStock_number(String stock_number) {
		this.stock_number = stock_number;
	}

	public Float getStock_price() {
		return stock_price;
	}

	public void setStock_price(Float stock_price) {
		this.stock_price = stock_price;
	}

	public String getStock_position() {
		return stock_position;
	}

	public void setStock_position(String stock_position) {
		this.stock_position = stock_position;
	}

	public Date getStock_addtime() {
		return stock_addtime;
	}

	public void setStock_addtime(Date stock_addtime) {
		this.stock_addtime = stock_addtime;
	}

	public Date getStock_uptime() {
		return stock_uptime;
	}

	public void setStock_uptime(Date stock_uptime) {
		this.stock_uptime = stock_uptime;
	}

	public String getStock_danwei1() {
		return stock_danwei1;
	}

	public void setStock_danwei1(String stock_danwei1) {
		this.stock_danwei1 = stock_danwei1;
	}

	public String getStock_huoqi() {
		return stock_huoqi;
	}

	public void setStock_huoqi(String stock_huoqi) {
		this.stock_huoqi = stock_huoqi;
	}

	public String getStock_beizhu() {
		return stock_beizhu;
	}

	public void setStock_beizhu(String stock_beizhu) {
		this.stock_beizhu = stock_beizhu;
	}

	public String getStock_danwei2() {
		return stock_danwei2;
	}

	public void setStock_danwei2(String stock_danwei2) {
		this.stock_danwei2 = stock_danwei2;
	}

	public String getStock_baozhuangnum() {
		return stock_baozhuangnum;
	}

	public void setStock_baozhuangnum(String stock_baozhuangnum) {
		this.stock_baozhuangnum = stock_baozhuangnum;
	}

	public String getStock_quality() {
		return stock_quality;
	}

	public void setStock_quality(String stock_quality) {
		this.stock_quality = stock_quality;
	}

	public String getStock_uid() {
		return stock_uid;
	}

	public void setStock_uid(String stock_uid) {
		this.stock_uid = stock_uid;
	}

	public String getStock_supplier() {
		return stock_supplier;
	}

	public void setStock_supplier(String stock_supplier) {
		this.stock_supplier = stock_supplier;
	}

	public String getStock_address() {
		return stock_address;
	}

	public void setStock_address(String stock_address) {
		this.stock_address = stock_address;
	}

}
