package com.zikezhi.entity;

import java.util.Date;
import java.util.List;
/**
 * 二级分类（被动器件供应商）
 * @author wrp
 *
 */
public class Subcategory {
	
	private int subcategory_id;
	
	private String subcategory_name;
	
	private int subcategory_classification;
	
	private int subcategory_sort;
	
	private Date subcategory_time;
	
	private List<PassiveComponents> passivelist;

	public int getSubcategory_id() {
		return subcategory_id;
	}

	public void setSubcategory_id(int subcategory_id) {
		this.subcategory_id = subcategory_id;
	}

	public String getSubcategory_name() {
		return subcategory_name;
	}

	public void setSubcategory_name(String subcategory_name) {
		this.subcategory_name = subcategory_name;
	}

	public int getSubcategory_classification() {
		return subcategory_classification;
	}

	public void setSubcategory_classification(int subcategory_classification) {
		this.subcategory_classification = subcategory_classification;
	}

	public int getSubcategory_sort() {
		return subcategory_sort;
	}

	public void setSubcategory_sort(int subcategory_sort) {
		this.subcategory_sort = subcategory_sort;
	}

	public Date getSubcategory_time() {
		return subcategory_time;
	}

	public void setSubcategory_time(Date subcategory_time) {
		this.subcategory_time = subcategory_time;
	}

	public List<PassiveComponents> getPassivelist() {
		return passivelist;
	}

	public void setPassivelist(List<PassiveComponents> passivelist) {
		this.passivelist = passivelist;
	}

	@Override
	public String toString() {
		return "Subcategory [subcategory_id=" + subcategory_id + ", subcategory_name=" + subcategory_name
				+ ", subcategory_classification=" + subcategory_classification + ", subcategory_sort="
				+ subcategory_sort + ", subcategory_time=" + subcategory_time + "]";
	}
}
