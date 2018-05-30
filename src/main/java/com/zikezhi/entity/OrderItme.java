package com.zikezhi.entity;

import java.util.Date;

/**
 * 多订单对象
 * @author wrp
 *
 */
public class OrderItme {
	private String o_id;
	private String o_product;//产品名称
	private String o_number;//数量
	private Float o_price;//小计
	private String o_eid;//订单id
	private String o_pid;//产品id
	private Float o_one;//单价
	private Product p;
	private Express express;
	private Date o_date;
	private String o_package;//商品封装
	private String o_sid;//商家id
	
	private Supplier supplier;
	
	private String danwei;
	
	public String getDanwei() {
		return danwei;
	}
	public void setDanwei(String danwei) {
		this.danwei = danwei;
	}
	public Express getExpress() {
		return express;
	}
	public void setExpress(Express express) {
		this.express = express;
	}
	public Product getP() {
		return p;
	}
	public void setP(Product p) {
		this.p = p;
	}
	public String getO_id() {
		return o_id;
	}
	public void setO_id(String o_id) {
		this.o_id = o_id;
	}
	public String getO_product() {
		return o_product;
	}
	public void setO_product(String o_product) {
		this.o_product = o_product;
	}
	public String getO_number() {
		return o_number;
	}
	public void setO_number(String o_number) {
		this.o_number = o_number;
	}
	public Float getO_price() {
		return o_price;
	}
	public void setO_price(Float o_price) {
		this.o_price = o_price;
	}
	public String getO_eid() {
		return o_eid;
	}
	public void setO_eid(String o_eid) {
		this.o_eid = o_eid;
	}
	public String getO_pid() {
		return o_pid;
	}
	public void setO_pid(String o_pid) {
		this.o_pid = o_pid;
	}
	public Float getO_one() {
		return o_one;
	}
	public void setO_one(Float o_one) {
		this.o_one = o_one;
	}
	public Date getO_date() {
		return o_date;
	}
	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}
	public String getO_package() {
		return o_package;
	}
	public void setO_package(String o_package) {
		this.o_package = o_package;
	}
	public String getO_sid() {
		return o_sid;
	}
	public void setO_sid(String o_sid) {
		this.o_sid = o_sid;
	}
	public Supplier getSupplier() {
		return supplier;
	}
	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}
	
}
