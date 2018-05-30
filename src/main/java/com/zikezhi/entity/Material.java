package com.zikezhi.entity;

import java.util.Date;

/**
 * 资料文档
 * @author lenovo
 *
 */
public class Material {

	private int material_id;
	
	private String material_name;
	
	private int material_frequency;
	
	private String material_label;
	
	private Date material_time;
	
	private String material_content;
	
	private String material_userName;
	
	private Date material_alterTime;
	
	private int material_channelId;
	
	private UserInfo user;

	public int getMaterial_id() {
		return material_id;
	}

	public void setMaterial_id(int material_id) {
		this.material_id = material_id;
	}

	public String getMaterial_name() {
		return material_name;
	}

	public void setMaterial_name(String material_name) {
		this.material_name = material_name;
	}

	public int getMaterial_frequency() {
		return material_frequency;
	}

	public void setMaterial_frequency(int material_frequency) {
		this.material_frequency = material_frequency;
	}

	public String getMaterial_label() {
		return material_label;
	}

	public void setMaterial_label(String material_label) {
		this.material_label = material_label;
	}

	public Date getMaterial_time() {
		return material_time;
	}

	public void setMaterial_time(Date material_time) {
		this.material_time = material_time;
	}

	public String getMaterial_content() {
		return material_content;
	}

	public void setMaterial_content(String material_content) {
		this.material_content = material_content;
	}

	public String getMaterial_userName() {
		return material_userName;
	}

	public void setMaterial_userName(String material_userName) {
		this.material_userName = material_userName;
	}

	public Date getMaterial_alterTime() {
		return material_alterTime;
	}

	public void setMaterial_alterTime(Date material_alterTime) {
		this.material_alterTime = material_alterTime;
	}

	public int getMaterial_channelId() {
		return material_channelId;
	}

	public void setMaterial_channelId(int material_channelId) {
		this.material_channelId = material_channelId;
	}

	public UserInfo getUser() {
		return user;
	}

	public void setUser(UserInfo user) {
		this.user = user;
	}
}
