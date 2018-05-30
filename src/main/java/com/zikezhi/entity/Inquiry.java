package com.zikezhi.entity;

import java.util.Date;

/**
 * 询价（采购）
 * @author lenovo
 *
 */
public class Inquiry {
	
	private int inquiry_id;
	
	private String inquiry_product;
	
	private String inquiry_package;
	
	private String inquiry_number;
	
	private Float inquiry_price;
	
	private Date inquiry_date;
	
	private String inquiry_uid;
	
	private String username;
	
	private String telephone;
	
	private String inquiry_status;
	
	private String inquiry_supplier;
	
	private String inquiry_supplieruuid;
	
	private String inquiry_lotnumber;
	
	private String inquiry_brand;
	
	private String inquiry_telphone;
	
	private String inquiry_utilnumber;
	
	private String inquiry_priceutil;
	
	private Supplier supplier;
	
	private String inquiry_quality;
	
	private UserInfo user;

	public int getInquiry_id() {
		return inquiry_id;
	}

	public void setInquiry_id(int inquiry_id) {
		this.inquiry_id = inquiry_id;
	}

	public String getInquiry_product() {
		return inquiry_product;
	}

	public void setInquiry_product(String inquiry_product) {
		this.inquiry_product = inquiry_product;
	}

	public String getInquiry_package() {
		return inquiry_package;
	}

	public void setInquiry_package(String inquiry_package) {
		this.inquiry_package = inquiry_package;
	}

	public String getInquiry_number() {
		return inquiry_number;
	}

	public void setInquiry_number(String inquiry_number) {
		this.inquiry_number = inquiry_number;
	}

	public Float getInquiry_price() {
		return inquiry_price;
	}

	public void setInquiry_price(Float inquiry_price) {
		this.inquiry_price = inquiry_price;
	}

	public Date getInquiry_date() {
		return inquiry_date;
	}

	public void setInquiry_date(Date inquiry_date) {
		this.inquiry_date = inquiry_date;
	}

	public String getInquiry_uid() {
		return inquiry_uid;
	}

	public void setInquiry_uid(String inquiry_uid) {
		this.inquiry_uid = inquiry_uid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getInquiry_status() {
		return inquiry_status;
	}

	public void setInquiry_status(String inquiry_status) {
		this.inquiry_status = inquiry_status;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getInquiry_supplier() {
		return inquiry_supplier;
	}

	public void setInquiry_supplier(String inquiry_supplier) {
		this.inquiry_supplier = inquiry_supplier;
	}

	public String getInquiry_supplieruuid() {
		return inquiry_supplieruuid;
	}

	public void setInquiry_supplieruuid(String inquiry_supplieruuid) {
		this.inquiry_supplieruuid = inquiry_supplieruuid;
	}

	public String getInquiry_lotnumber() {
		return inquiry_lotnumber;
	}

	public void setInquiry_lotnumber(String inquiry_lotnumber) {
		this.inquiry_lotnumber = inquiry_lotnumber;
	}

	public String getInquiry_brand() {
		return inquiry_brand;
	}

	public void setInquiry_brand(String inquiry_brand) {
		this.inquiry_brand = inquiry_brand;
	}

	public String getInquiry_telphone() {
		return inquiry_telphone;
	}

	public void setInquiry_telphone(String inquiry_telphone) {
		this.inquiry_telphone = inquiry_telphone;
	}

	public String getInquiry_utilnumber() {
		return inquiry_utilnumber;
	}

	public void setInquiry_utilnumber(String inquiry_utilnumber) {
		this.inquiry_utilnumber = inquiry_utilnumber;
	}

	public String getInquiry_priceutil() {
		return inquiry_priceutil;
	}

	public void setInquiry_priceutil(String inquiry_priceutil) {
		this.inquiry_priceutil = inquiry_priceutil;
	}

	public String getInquiry_quality() {
		return inquiry_quality;
	}

	public void setInquiry_quality(String inquiry_quality) {
		this.inquiry_quality = inquiry_quality;
	}

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public UserInfo getUser() {
		return user;
	}

	public void setUser(UserInfo user) {
		this.user = user;
	}
	
}
