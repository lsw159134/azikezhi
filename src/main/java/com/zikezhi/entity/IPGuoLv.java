package com.zikezhi.entity;

import java.util.Date;
/**
 * ip过滤
 * @author lenovo
 *
 */
public class IPGuoLv {
	
	private int ip_id;
	
	private String ip_ip;
	
	private Date ip_time;

	public int getIp_id() {
		return ip_id;
	}

	public void setIp_id(int ip_id) {
		this.ip_id = ip_id;
	}

	public String getIp_ip() {
		return ip_ip.trim();
	}

	public void setIp_ip(String ip_ip) {
		this.ip_ip = ip_ip.trim();
	}

	public Date getIp_time() {
		return ip_time;
	}

	public void setIp_time(Date ip_time) {
		this.ip_time = ip_time;
	}
	
	
	
}
