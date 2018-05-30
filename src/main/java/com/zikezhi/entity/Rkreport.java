package com.zikezhi.entity;

import java.util.Date;

/**
 * 出/入库记录
 * @author lenovo
 *
 */
public class Rkreport {

	private int id;
	
	private int rkreport_status;
	
	private String rkreport_num;
	
	private String rkreport_supplier;
	
	private String rkreport_fangshi;
	
	private Date rkreport_time;
	
	private String rkreport_address;
	
	private String rkreport_uid;
	
	private String rkreport_stockid;
	
	private Float rkreport_price;
	
	private String rkreport_xsid;
	
	private Stock stock;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRkreport_status() {
		return rkreport_status;
	}

	public void setRkreport_status(int rkreport_status) {
		this.rkreport_status = rkreport_status;
	}

	public String getRkreport_num() {
		return rkreport_num;
	}

	public void setRkreport_num(String rkreport_num) {
		this.rkreport_num = rkreport_num;
	}

	public String getRkreport_supplier() {
		return rkreport_supplier;
	}

	public void setRkreport_supplier(String rkreport_supplier) {
		this.rkreport_supplier = rkreport_supplier;
	}

	public String getRkreport_fangshi() {
		return rkreport_fangshi;
	}

	public void setRkreport_fangshi(String rkreport_fangshi) {
		this.rkreport_fangshi = rkreport_fangshi;
	}

	public Date getRkreport_time() {
		return rkreport_time;
	}

	public void setRkreport_time(Date rkreport_time) {
		this.rkreport_time = rkreport_time;
	}

	public String getRkreport_address() {
		return rkreport_address;
	}

	public void setRkreport_address(String rkreport_address) {
		this.rkreport_address = rkreport_address;
	}

	public String getRkreport_uid() {
		return rkreport_uid;
	}

	public void setRkreport_uid(String rkreport_uid) {
		this.rkreport_uid = rkreport_uid;
	}

	public String getRkreport_stockid() {
		return rkreport_stockid;
	}

	public void setRkreport_stockid(String rkreport_stockid) {
		this.rkreport_stockid = rkreport_stockid;
	}

	public Float getRkreport_price() {
		return rkreport_price;
	}

	public void setRkreport_price(Float rkreport_price) {
		this.rkreport_price = rkreport_price;
	}

	public String getRkreport_xsid() {
		return rkreport_xsid;
	}

	public void setRkreport_xsid(String rkreport_xsid) {
		this.rkreport_xsid = rkreport_xsid;
	}

	public Stock getStock() {
		return stock;
	}

	public void setStock(Stock stock) {
		this.stock = stock;
	}
}
