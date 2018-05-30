package com.zikezhi.entity;

import java.util.Date;
/**
 * 提现记录
 * @author wrp
 *
 */
public class WithdrawAL {
	private String w_id;
	
	private Float w_price;//提现金额
	
	private Date w_date;//提现时间
	
	private String w_account;//提现支付宝 
	
	private String w_uid;//提现用户id
	
	private String w_alipayName;//支付宝用户名称
	
	private String w_status;//打款状态：1 表示未打款 	2 表示已打款

	private String username;//用户名称
	private String telephone;//用户电话
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getW_id() {
		return w_id;
	}

	public void setW_id(String w_id) {
		this.w_id = w_id;
	}

	public Float getW_price() {
		return w_price;
	}

	public void setW_price(Float w_price) {
		this.w_price = w_price;
	}

	public Date getW_date() {
		return w_date;
	}

	public void setW_date(Date w_date) {
		this.w_date = w_date;
	}

	public String getW_account() {
		return w_account;
	}

	public void setW_account(String w_account) {
		this.w_account = w_account;
	}

	public String getW_uid() {
		return w_uid;
	}

	public void setW_uid(String w_uid) {
		this.w_uid = w_uid;
	}

	public String getW_alipayName() {
		return w_alipayName;
	}

	public void setW_alipayName(String w_alipayName) {
		this.w_alipayName = w_alipayName;
	}

	public String getW_status() {
		return w_status;
	}

	public void setW_status(String w_status) {
		this.w_status = w_status;
	}
	
	
}
