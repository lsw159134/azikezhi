package com.zikezhi.entity;

import java.util.Date;
/**
 * 私人备注
 * @author lenovo
 *
 */
public class Remarks {

	private int remarks_id;
	
	private String remarks_contest;
	
	private String remarks_suid;
	
	private String remarks_userid;
	
	private Date remarks_time;
	
	private Supplier supplier;
	
	private UserInfo user;

	public int getRemarks_id() {
		return remarks_id;
	}

	public void setRemarks_id(int remarks_id) {
		this.remarks_id = remarks_id;
	}

	public String getRemarks_contest() {
		return remarks_contest;
	}

	public void setRemarks_contest(String remarks_contest) {
		this.remarks_contest = remarks_contest;
	}

	public String getRemarks_suid() {
		return remarks_suid;
	}

	public void setRemarks_suid(String remarks_suid) {
		this.remarks_suid = remarks_suid;
	}

	public String getRemarks_userid() {
		return remarks_userid;
	}

	public void setRemarks_userid(String remarks_userid) {
		this.remarks_userid = remarks_userid;
	}

	public Date getRemarks_time() {
		return remarks_time;
	}

	public void setRemarks_time(Date remarks_time) {
		this.remarks_time = remarks_time;
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

	@Override
	public String toString() {
		return "Remarks [remarks_id=" + remarks_id + ", remarks_contest=" + remarks_contest + ", remarks_suid="
				+ remarks_suid + ", remarks_userid=" + remarks_userid + ", remarks_time=" + remarks_time + "]";
	}

}
