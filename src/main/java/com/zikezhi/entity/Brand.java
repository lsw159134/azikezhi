package com.zikezhi.entity;

import java.util.Date;

public class Brand {

	private int brand_id;
	
	private String brand_name;
	
	private Date brand_time;
	
	private String brand_img;
	
	private int brand_sortimg;

	public int getBrand_id() {
		return brand_id;
	}

	public void setBrand_id(int brand_id) {
		this.brand_id = brand_id;
	}

	public String getBrand_name() {
		return brand_name;
	}

	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}

	public Date getBrand_time() {
		return brand_time;
	}

	public void setBrand_time(Date brand_time) {
		this.brand_time = brand_time;
	}

	public String getBrand_img() {
		return brand_img;
	}

	public void setBrand_img(String brand_img) {
		this.brand_img = brand_img;
	}

	public int getBrand_sortimg() {
		return brand_sortimg;
	}

	public void setBrand_sortimg(int brand_sortimg) {
		this.brand_sortimg = brand_sortimg;
	}
	
}
