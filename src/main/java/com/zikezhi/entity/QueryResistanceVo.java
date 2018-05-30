package com.zikezhi.entity;

public class QueryResistanceVo {

	private String encapsulation; //封装
	private String sousuo;
	private String zhuzhi;
	private String jingquedu;
	private String manufacturer; //品牌
	private int num;
	private int isGoodsInStock;  //库
	private String productName;
	private int complaintprice;
	private String description;
	private int complaintactuals;
    private int start;
    private int size;
	private int totalSales;
	private String baozhuang;
	
	
	public String getBaozhuang() {
		return baozhuang;
	}

	public void setBaozhuang(String baozhuang) {
		this.baozhuang = baozhuang;
	}

	public int getTotalSales() {
		return totalSales;
	}

	public void setTotalSales(int totalSales) {
		this.totalSales = totalSales;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getIsGoodsInStock() {
		return isGoodsInStock;
	}

	public void setIsGoodsInStock(int isGoodsInStock) {
		this.isGoodsInStock = isGoodsInStock;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getComplaintprice() {
		return complaintprice;
	}

	public void setComplaintprice(int complaintprice) {
		this.complaintprice = complaintprice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getComplaintactuals() {
		return complaintactuals;
	}

	public void setComplaintactuals(int complaintactuals) {
		this.complaintactuals = complaintactuals;
	}

	public String getSousuo() {
		return sousuo;
	}

	public void setSousuo(String sousuo) {
		this.sousuo = sousuo;
	}

	public String getZhuzhi() {
		return zhuzhi;
	}

	public void setZhuzhi(String zhuzhi) {
		this.zhuzhi = zhuzhi;
	}


	public String getJingquedu() {
		return jingquedu;
	}

	public void setJingquedu(String jingquedu) {
		this.jingquedu = jingquedu;
	}


	public int getNum() {
		
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getEncapsulation() {
		return encapsulation;
	}

	public void setEncapsulation(String encapsulation) {
		this.encapsulation = encapsulation;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	@Override
	public String toString() {
		return "QueryResistanceVo [encapsulation=" + encapsulation + ", sousuo=" + sousuo + ", zhuzhi=" + zhuzhi
				+ ", jingquedu=" + jingquedu + ", manufacturer=" + manufacturer + ", num=" + num + ", isGoodsInStock="
				+ isGoodsInStock + ", productName=" + productName + ", complaintprice=" + complaintprice
				+ ", description=" + description + ", complaintactuals=" + complaintactuals + "]";
	}

	


}
