package com.zikezhi.entity;

import java.util.Date;
/**
 * 替换型号
 * @author lenovo
 *
 */
public class Replace {

	private int replace_id;
	
	private String replace_name;
	
	private Date replace_time;
	
	private String replace_product;
	
	private String replace_adminname;
	
	private String replace_status;

	public int getReplace_id() {
		return replace_id;
	}

	public void setReplace_id(int replace_id) {
		this.replace_id = replace_id;
	}

	public String getReplace_name() {
		return replace_name;
	}

	public void setReplace_name(String replace_name) {
		this.replace_name = replace_name;
	}

	public Date getReplace_time() {
		return replace_time;
	}

	public void setReplace_time(Date replace_time) {
		this.replace_time = replace_time;
	}

	public String getReplace_product() {
		return replace_product;
	}

	public void setReplace_product(String replace_product) {
		this.replace_product = replace_product;
	}

	public String getReplace_adminname() {
		return replace_adminname;
	}

	public void setReplace_adminname(String replace_adminname) {
		this.replace_adminname = replace_adminname;
	}

	public String getReplace_status() {
		return replace_status;
	}

	public void setReplace_status(String replace_status) {
		this.replace_status = replace_status;
	}
	
}
