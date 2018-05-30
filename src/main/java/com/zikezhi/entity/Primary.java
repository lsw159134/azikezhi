package com.zikezhi.entity;

import java.util.Date;
import java.util.List;

/**
 * 一级分类
 * @author wrp
 *
 */
public class Primary {
	
	private int primary_id;
	
	private String primary_name;//分类名称
	
	private Date primary_addtime;//添加时间
	
	private int primarytotal;//下属分类数量
	
	private int primary_sorting;//分类排序
	
	private List<Second> secondList;
	
	public List<Second> getSecondList() {
		return secondList;
	}

	public void setSecondList(List<Second> secondList) {
		this.secondList = secondList;
	}
	public int getPrimary_id() {
		return primary_id;
	}
	
	public void setPrimary_id(int primary_id) {
		this.primary_id = primary_id;
	}
	
	public String getPrimary_name() {
		return primary_name;
	}
	
	public void setPrimary_name(String primary_name) {
		this.primary_name = primary_name;
	}
	
	public Date getPrimary_addtime() {
		return primary_addtime;
	}
	
	public void setPrimary_addtime(Date primary_addtime) {
		this.primary_addtime = primary_addtime;
	}

	public int getPrimarytotal() {
		return primarytotal;
	}

	public void setPrimarytotal(int primarytotal) {
		this.primarytotal = primarytotal;
	}

	public int getPrimary_sorting(){
		return primary_sorting;
	}
	
	public void setPrimary_sorting(int primary_sorting){
		this.primary_sorting=primary_sorting;
	}
}
