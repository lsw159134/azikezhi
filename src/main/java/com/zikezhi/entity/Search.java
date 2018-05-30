package com.zikezhi.entity;

/**
 * 
 * @author ponder
 * @version 1.0
 * @Date 2016年9月6日 
 * 
 * @ClassName Search.java
 * 
*/

public class Search {

	//关键字
	private String keyword;
	
	//表名
	private String tableName;

	public Search(){}
	
	public Search(String keyword, String tableName){
		this.keyword = keyword;
		this.tableName = tableName;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	@Override
	public String toString() {
		return "Search [keyword=" + keyword + ", tableName=" + tableName + "]";
	}
}
