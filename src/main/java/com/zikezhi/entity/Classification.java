package com.zikezhi.entity;

import java.util.Date;
import java.util.List;
/**
 * 被动器件供应商分类（一级）
 * @author lenovo
 *
 */
public class Classification {
	
	private int classification_id;
	
	private String classification_name;
	
	private Date classification_time;
	
	private int classification_sort;
	
	private List<Subcategory> subcategorylist;
	
	private List<PassiveComponents> passivelist;

	public int getClassification_id() {
		return classification_id;
	}

	public void setClassification_id(int classification_id) {
		this.classification_id = classification_id;
	}

	public String getClassification_name() {
		return classification_name;
	}

	public void setClassification_name(String classification_name) {
		this.classification_name = classification_name;
	}

	public Date getClassification_time() {
		return classification_time;
	}

	public void setClassification_time(Date classification_time) {
		this.classification_time = classification_time;
	}

	public int getClassification_sort() {
		return classification_sort;
	}

	public void setClassification_sort(int classification_sort) {
		this.classification_sort = classification_sort;
	}

	public List<Subcategory> getSubcategorylist() {
		return subcategorylist;
	}

	public void setSubcategorylist(List<Subcategory> subcategorylist) {
		this.subcategorylist = subcategorylist;
	}

	public List<PassiveComponents> getPassivelist() {
		return passivelist;
	}

	public void setPassivelist(List<PassiveComponents> passivelist) {
		this.passivelist = passivelist;
	}
}
