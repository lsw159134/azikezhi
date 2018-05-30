package com.zikezhi.entity;

import java.util.Date;

public class SjZhuCe {
	private String id;
	private String comPany;    //公司
	private String tel;        //手机号
	private String userName;   //昵称
	private String passWord;   //密码
	private Integer shiro;	   //审核
	private String faDingRen;  //法定人
	private String zuoJiOne;   //座机1
	private String zuoJiTwo;   //座机2
	private String zuoJiThree; //座机3
	private String zuoJiFour;  //座机4
	private String address;    //地址
	private String email;      //邮箱
	private String qq;         //QQ
	private String chuanZhen;  //传真	
	private Date createTime;   //创建时间
	private Date lastTime;     //更新时间
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id ;
	}
	public String getComPany() {
		return comPany;
	}
	public void setComPany(String comPany) {
		this.comPany = comPany;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public Integer getShiro() {
		return shiro;
	}
	public void setShiro(Integer shiro) {
		this.shiro = shiro;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord ;
	}
	public String getFaDingRen() {
		return faDingRen;
	}
	public void setFaDingRen(String faDingRen) {
		this.faDingRen = faDingRen;
	}
	public String getZuoJiOne() {
		return zuoJiOne;
	}
	public void setZuoJiOne(String zuoJiOne) {
		this.zuoJiOne = zuoJiOne;
	}
	public String getZuoJiTwo() {
		return zuoJiTwo;
	}
	public void setZuoJiTwo(String zuoJiTwo) {
		this.zuoJiTwo = zuoJiTwo;
	}
	public String getZuoJiThree() {
		return zuoJiThree;
	}
	public void setZuoJiThree(String zuoJiThree) {
		this.zuoJiThree = zuoJiThree;
	}
	public String getZuoJiFour() {
		return zuoJiFour;
	}
	public void setZuoJiFour(String zuoJiFour) {
		this.zuoJiFour = zuoJiFour;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getChuanZhen() {
		return chuanZhen;
	}
	public void setChuanZhen(String chuanZhen) {
		this.chuanZhen = chuanZhen;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getLastTime() {
		return lastTime;
	}
	public void setLastTime(Date lastTime) {
		this.lastTime = lastTime;
	}		
}
