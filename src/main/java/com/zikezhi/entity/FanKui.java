package com.zikezhi.entity;

import java.util.Date;
/**
 * 反馈
 * @author lenovo
 *
 */
public class FanKui {
	private int fankuiid;
	private String fankui_pid;
	private Date fankui_time;
	private String fankuitext;
	private String fankui_product;
	
	public String getFankui_product() {
		return fankui_product;
	}
	public void setFankui_product(String fankui_product) {
		this.fankui_product = fankui_product;
	}
	public String getFankuitext() {
		return fankuitext;
	}
	public void setFankuitext(String fankuitext) {
		this.fankuitext = fankuitext;
	}
	public int getFankuiid() {
		return fankuiid;
	}
	public void setFankuiid(int fankuiid) {
		this.fankuiid = fankuiid;
	}
	public String getFankui_pid() {
		return fankui_pid;
	}
	public void setFankui_pid(String fankui_pid) {
		this.fankui_pid = fankui_pid;
	}
	public Date getFankui_time() {
		return fankui_time;
	}
	public void setFankui_time(Date fankui_time) {
		this.fankui_time = fankui_time;
	}
}
