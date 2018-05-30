package com.zikezhi.entity;

/*
 * 
 * 电阻参数
 * 
 */

public class Resistance {

	
	private String fengzhuang;
	private String zhuzhi;
	private String gonglv;
	private String jingquedu;
	private String pinpai;
	private String stock; //库存
	private String privice;
	private int num;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getFengzhuang() {
		return fengzhuang;
	}
	public void setFengzhuang(String fengzhuang) {
		this.fengzhuang = fengzhuang;
	}
	public String getZhuzhi() {
		return zhuzhi;
	}
	public void setZhuzhi(String zhuzhi) {
		this.zhuzhi = zhuzhi;
	}
	public String getGonglv() {
		return gonglv;
	}
	public void setGonglv(String gonglv) {
		this.gonglv = gonglv;
	}
	public String getJingquedu() {
		return jingquedu;
	}
	public void setJingquedu(String jingquedu) {
		this.jingquedu = jingquedu;
	}
	public String getPinpai() {
		return pinpai;
	}
	public void setPinpai(String pinpai) {
		this.pinpai = pinpai;
	}
	public String getStock() {
		return stock;
	}
	public void setStock(String stock) {
		this.stock = stock;
	}
	public String getPrivice() {
		return privice;
	}
	public void setPrivice(String privice) {
		this.privice = privice;
	}
	@Override
	public String toString() {
		return "Resistance [fengzhuang=" + fengzhuang + ", zhuzhi=" + zhuzhi + ", gonglv=" + gonglv + ", jingquedu="
				+ jingquedu + ", pinpai=" + pinpai + ", stock=" + stock + ", privice=" + privice + ", num=" + num + "]";
	}
	
	
	
	
}
