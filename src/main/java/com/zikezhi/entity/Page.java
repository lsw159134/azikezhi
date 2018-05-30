package com.zikezhi.entity;

/**
 * 
 * @author ponder
 * @version 1.0
 * @Date 2016年9月2日
 * @Description: TODO(用一句话描述这个方法的作用)
 * 
 * @ClassName Page.java
 * 
 */

public class Page {

	/** 第几页 **/
	private int page;

	/** 每页多少条记录 **/
	private int pageSize;

	public Page(int page, int pageSize) {
		this.page = page - 1;
		this.pageSize = pageSize;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page - 1;
	}

	public int getStart() {
		return page * pageSize;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
}