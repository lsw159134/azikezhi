package com.zikezhi.entity;

import java.util.Date;
/**
 * 赞（踩）记录
 * @author lenovo
 *
 */
public class Evaluate {

	private int evaluate_id;
	
	private String evaluate_pid;//产品对象
	
	private String evaluate_uid;//用户

	private Date evaluate_time;//时间
	
	private String evaluate_sid;//商家
	
	private int evaluate_zan;//赞
	
	private int evaluate_cai;//踩
	
	public int getEvaluate_id() {
		return evaluate_id;
	}

	public void setEvaluate_id(int evaluate_id) {
		this.evaluate_id = evaluate_id;
	}

	public String getEvaluate_pid() {
		return evaluate_pid;
	}

	public void setEvaluate_pid(String evaluate_pid) {
		this.evaluate_pid = evaluate_pid;
	}

	public String getEvaluate_uid() {
		return evaluate_uid;
	}

	public void setEvaluate_uid(String evaluate_uid) {
		this.evaluate_uid = evaluate_uid;
	}

	public Date getEvaluate_time() {
		return evaluate_time;
	}

	public void setEvaluate_time(Date evaluate_time) {
		this.evaluate_time = evaluate_time;
	}

	public String getEvaluate_sid() {
		return evaluate_sid;
	}

	public void setEvaluate_sid(String evaluate_sid) {
		this.evaluate_sid = evaluate_sid;
	}

	public int getEvaluate_zan() {
		return evaluate_zan;
	}

	public void setEvaluate_zan(int evaluate_zan) {
		this.evaluate_zan = evaluate_zan;
	}

	public int getEvaluate_cai() {
		return evaluate_cai;
	}

	public void setEvaluate_cai(int evaluate_cai) {
		this.evaluate_cai = evaluate_cai;
	}

	
	
}
