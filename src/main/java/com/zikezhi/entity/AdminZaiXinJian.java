package com.zikezhi.entity;

import java.util.Date;

/**
 * 管理员（权限）
 * @author wrp
 *
 */
public class AdminZaiXinJian {
	private String admin_id;//主键
	private String admin_adminAccountNumber;//账号
	private String admin_adminpassword;//密码
	private String admin_jurisdiction;//一级权限
	private String admin_status;//状态
	private String admin_adminName;//管理员名称
	private Date admin_addtime;//添加时间
	private Date admin_uptime;//修改时间
	private String admin_Explain;//权限说明
	private String admin_Thatadd;//
	private String admin_shrio;//多个权限
	private String up;
	private String admin_loginIp1;
	private String admin_loginIp2;
	private String admin_loginIp3;

	public String getAdmin_Thatadd() {
		return admin_Thatadd;
	}

	public void setAdmin_Thatadd(String admin_Thatadd) {
		this.admin_Thatadd = admin_Thatadd;
	}

	public String getAdmin_Explain() {
		return admin_Explain;
	}

	public void setAdmin_Explain(String admin_Explain) {
		this.admin_Explain = admin_Explain;
	}

	public String getUp() {
		return up;
	}

	public void setUp(String up) {
		this.up = up;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_adminAccountNumber() {
		return admin_adminAccountNumber;
	}

	public void setAdmin_adminAccountNumber(String admin_adminAccountNumber) {
		this.admin_adminAccountNumber = admin_adminAccountNumber;
	}

	public String getAdmin_adminpassword() {
		return admin_adminpassword;
	}

	public void setAdmin_adminpassword(String admin_adminpassword) {
		this.admin_adminpassword = admin_adminpassword;
	}

	public String getAdmin_jurisdiction() {
		return admin_jurisdiction;
	}

	public void setAdmin_jurisdiction(String admin_jurisdiction) {
		this.admin_jurisdiction = admin_jurisdiction;
	}

	public String getAdmin_status() {
		return admin_status;
	}

	public void setAdmin_status(String admin_status) {
		this.admin_status = admin_status;
	}

	public Date getAdmin_uptime() {
		return admin_uptime;
	}

	public String getAdmin_adminName() {
		return admin_adminName;
	}

	public void setAdmin_adminName(String admin_adminName) {
		this.admin_adminName = admin_adminName;
	}

	public Date getAdmin_addtime() {
		return admin_addtime;
	}

	public void setAdmin_addtime(Date admin_addtime) {
		this.admin_addtime = admin_addtime;
	}

	public Date getUptime() {
		return admin_uptime;
	}

	public void setAdmin_uptime(Date admin_uptime) {
		this.admin_uptime = admin_uptime;
	}

	public String getAdmin_shrio() {
		return admin_shrio;
	}

	public void setAdmin_shrio(String admin_shrio) {
		this.admin_shrio = admin_shrio;
	}

	public String getAdmin_loginIp1() {
		return admin_loginIp1;
	}

	public void setAdmin_loginIp1(String admin_loginIp1) {
		this.admin_loginIp1 = admin_loginIp1;
	}

	public String getAdmin_loginIp2() {
		return admin_loginIp2;
	}

	public void setAdmin_loginIp2(String admin_loginIp2) {
		this.admin_loginIp2 = admin_loginIp2;
	}

	public String getAdmin_loginIp3() {
		return admin_loginIp3;
	}

	public void setAdmin_loginIp3(String admin_loginIp3) {
		this.admin_loginIp3 = admin_loginIp3;
	}

	@Override
	public String toString() {
		return "AdminZaiXinJian [admin_id=" + admin_id + ", admin_adminAccountNumber=" + admin_adminAccountNumber
				+ ", admin_adminpassword=" + admin_adminpassword + ", admin_jurisdiction=" + admin_jurisdiction
				+ ", admin_status=" + admin_status + ", admin_adminName=" + admin_adminName + ", admin_addtime="
				+ admin_addtime + ", admin_uptime=" + admin_uptime + ", admin_Explain=" + admin_Explain
				+ ", admin_Thatadd=" + admin_Thatadd + ", admin_shrio=" + admin_shrio + ", up=" + up
				+ ", admin_loginIp1=" + admin_loginIp1 + ", admin_loginIp2=" + admin_loginIp2 + ", admin_loginIp3="
				+ admin_loginIp3 + "]";
	}
	
}
