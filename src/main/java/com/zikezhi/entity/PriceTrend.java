package com.zikezhi.entity;

import java.util.Date;

public class PriceTrend {

	private int pt_id;
	
	private Float pt_price;
	
	private Date pt_time;

	private String pt_pid;

	public int getPt_id() {
		return pt_id;
	}

	public void setPt_id(int pt_id) {
		this.pt_id = pt_id;
	}

	public Float getPt_price() {
		return pt_price;
	}

	public void setPt_price(Float pt_price) {
		this.pt_price = pt_price;
	}

	public Date getPt_time() {
		return pt_time;
	}

	public void setPt_time(Date pt_time) {
		this.pt_time = pt_time;
	}

	public String getPt_pid() {
		return pt_pid;
	}

	public void setPt_pid(String pt_pid) {
		this.pt_pid = pt_pid;
	}
	
}
