package com.zikezhi.entity;

import java.util.Date;
/**
 * bom订单对象
 * @author wrp
 *
 */
public class BomOrder {
	private int bom_id;
	private String bom_content;//bom内容
	private Float bom_price;//价钱
	private String bom_remarks;//备注
	private String bom_userphone;//用户
	private Date bom_date;//时间
	private String bom_address;//收获地址
	private String bom_phone;//收货联系方式
	private String bom_name;//收货人姓名
	private String bom_identifier;//订单编号
	private String bom_status;//订单状态
	private String bom_invoice;//发票
	private String bom_mode;//支付方式
	private String bom_kuaidi;//快递
	private String bom_help;//快递单号
	private Float bom_fan;//返利
	private Float bom_profit;
	
	private UserInfo user;

	public String getBom_help() {
		return bom_help;
	}
	public void setBom_help(String bom_help) {
		this.bom_help = bom_help;
	}
	public String getBom_kuaidi() {
		return bom_kuaidi;
	}
	public void setBom_kuaidi(String bom_kuaidi) {
		this.bom_kuaidi = bom_kuaidi;
	}
	public String getBom_mode() {
		return bom_mode;
	}
	public void setBom_mode(String bom_mode) {
		this.bom_mode = bom_mode;
	}
	public String getBom_invoice() {
		return bom_invoice;
	}
	public void setBom_invoice(String bom_invoice) {
		this.bom_invoice = bom_invoice;
	}
	public UserInfo getUser() {
		return user;
	}
	public void setUser(UserInfo user) {
		this.user = user;
	}
	public int getBom_id() {
		return bom_id;
	}
	public void setBom_id(int bom_id) {
		this.bom_id = bom_id;
	}
	public String getBom_content() {
		return bom_content;
	}
	public void setBom_content(String bom_content) {
		this.bom_content = bom_content;
	}
	public Float getBom_price() {
		return bom_price;
	}
	public void setBom_price(Float bom_price) {
		this.bom_price = bom_price;
	}
	public String getBom_remarks() {
		return bom_remarks;
	}
	public void setBom_remarks(String bom_remarks) {
		this.bom_remarks = bom_remarks;
	}
	public String getBom_userphone() {
		return bom_userphone;
	}
	public void setBom_userphone(String bom_userphone) {
		this.bom_userphone = bom_userphone;
	}
	
	public Date getBom_date() {
		return bom_date;
	}
	
	public void setBom_date(Date bom_date) {
		this.bom_date = bom_date;
	}
	public String getBom_address() {
		return bom_address;
	}
	public void setBom_address(String bom_address) {
		this.bom_address = bom_address;
	}
	public String getBom_phone() {
		return bom_phone;
	}
	public void setBom_phone(String bom_phone) {
		this.bom_phone = bom_phone;
	}
	public String getBom_name() {
		return bom_name;
	}
	public void setBom_name(String bom_name) {
		this.bom_name = bom_name;
	}
	public String getBom_identifier() {
		return bom_identifier;
	}
	public void setBom_identifier(String bom_identifier) {
		this.bom_identifier = bom_identifier;
	}
	public String getBom_status() {
		return bom_status;
	}
	public void setBom_status(String bom_status) {
		this.bom_status = bom_status;
	}
	public Float getBom_fan() {
		return bom_fan;
	}
	public void setBom_fan(Float bom_fan) {
		this.bom_fan = bom_fan;
	}
	
	public Float getBom_profit() {
		return bom_profit;
	}
	public void setBom_profit(Float bom_profit) {
		this.bom_profit = bom_profit;
	}
	@Override
	public String toString() {
		return "BomOrder [bom_id=" + bom_id + ", bom_content=" + bom_content + ", bom_price=" + bom_price
				+ ", bom_remarks=" + bom_remarks + ", bom_userphone=" + bom_userphone + ", bom_date=" + bom_date
				+ ", bom_address=" + bom_address + ", bom_phone=" + bom_phone + ", bom_name=" + bom_name
				+ ", bom_identifier=" + bom_identifier + ", bom_status=" + bom_status + ", bom_invoice=" + bom_invoice
				+ ", bom_mode=" + bom_mode + ", bom_kuaidi=" + bom_kuaidi + ", bom_help=" + bom_help + ", bom_fan="
				+ bom_fan + ", user=" + user + "]";
	}
	
}
