package com.zikezhi.utils;

public class SjPageBean {

	/**
	 * 分页
	 * @author 
	 *
	 */

		private int page; // 当前页
		private int pageSize; // 一页显示的个数
		@SuppressWarnings("unused")
		private int start;	//从第几条记录开始查
		private int total;	//记录的总条数
		private int count;	//总页数
		
		
		public SjPageBean(int page, int pageSize) {
			super();
			this.page = page;
			this.pageSize = pageSize;
		}
		
		public int getPage() {
			return page;
		}
		public void setPage(int page) {
			this.page = page;
		}
		
		public int getPageSize() {
			return pageSize;
		}

		public void setPageSize(int pageSize) {
			this.pageSize = pageSize;
		}

		public int getStart() {
			return (page-1)*pageSize;
		}

		public void setStart(int start) {
			this.start = start;
		}

		public int getTotal() {
			return total;
		}

		public void setTotal(int total) {
			this.total = total;
		}

		public int getCount() {
			count=(3*total)%pageSize==0 ? (3*total)/pageSize : (3*total)/pageSize+1;
			return count;
		}

		public void setCount(int count) {
			this.count = count;
		}
		
		
}
