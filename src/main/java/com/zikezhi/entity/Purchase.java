package com.zikezhi.entity;

import java.util.Date;
/**
 * 采购
 * @author wrp
 *
 */
public class Purchase {
	private int purchase_id;
	
	private String purchase_model;//型号
	
	private String purchase_name;//采购人
	
	private int purchase_number;//数量
	
	private String purchase_supplier;//供应商信息
	
	private Float purchase_one;//单价
	
	private String purchase_encapsulation;//封装
	
	private Date purchase_time;//时间
	
	public int getPurchase_id() {
		return purchase_id;
	}

	public void setPurchase_id(int purchase_id) {
		this.purchase_id = purchase_id;
	}

	public String getPurchase_model() {
		return purchase_model;
	}

	public void setPurchase_model(String purchase_model) {
		this.purchase_model = purchase_model;
	}

	public String getPurchase_name() {
		return purchase_name;
	}

	public void setPurchase_name(String purchase_name) {
		this.purchase_name = purchase_name;
	}

	public int getPurchase_number() {
		return purchase_number;
	}

	public void setPurchase_number(int purchase_number) {
		this.purchase_number = purchase_number;
	}

	public String getPurchase_supplier() {
		return purchase_supplier;
	}

	public void setPurchase_supplier(String purchase_supplier) {
		this.purchase_supplier = purchase_supplier;
	}

	public Float getPurchase_one() {
		return purchase_one;
	}

	public void setPurchase_one(Float purchase_one) {
		this.purchase_one = purchase_one;
	}

	public String getPurchase_encapsulation() {
		return purchase_encapsulation;
	}

	public void setPurchase_encapsulation(String purchase_encapsulation) {
		this.purchase_encapsulation = purchase_encapsulation;
	}

	public Date getPurchase_time() {
		return purchase_time;
	}

	public void setPurchase_time(Date purchase_time) {
		this.purchase_time = purchase_time;
	}
	
}
