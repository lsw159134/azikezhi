package com.zikezhi.entity;
/**
 * 收货地址对象
 * @author wrp
 *
 */
public class Uaddress {
	private String a_id;
	private String a_name;//收货人姓名
	private String a_phone;//收货人手机
	private String a_address;//收货人地址
	private String a_uid;//所属用户
	private String a_status;//状态 1.默认
	private String a_company;//公司名称
	private String a_gudingtel;//固定电话
	public String getA_id() {
		return a_id;
	}
	public String getA_gudingtel() {
		return a_gudingtel;
	}
	public void setA_gudingtel(String a_gudingtel) {
		this.a_gudingtel = a_gudingtel;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public String getA_phone() {
		return a_phone;
	}
	public void setA_phone(String a_phone) {
		this.a_phone = a_phone;
	}
	public String getA_address() {
		return a_address;
	}
	public void setA_address(String a_address) {
		this.a_address = a_address;
	}
	public String getA_uid() {
		return a_uid;
	}
	public void setA_uid(String a_uid) {
		this.a_uid = a_uid;
	}
	public String getA_status() {
		return a_status;
	}
	public void setA_status(String a_status) {
		this.a_status = a_status;
	}
	public String getA_company() {
		return a_company;
	}
	public void setA_company(String a_company) {
		this.a_company = a_company;
	}
	
}
