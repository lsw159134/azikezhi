package com.zikezhi.entity;

import java.util.Date;

public class ResistanceResult {

	private String Product;
	private String Encapsulation ; //封装
	private String sousuo;
	private String zhuzhi;
	private String gonglv;
	private String jingquedu;
	private String Manufacturer;  // 品牌
	private int num;
	private int IsGoodsInStock;  //库存
	private String Price;
	private String productName;
	private String productuuid;
	private int complaintprice;
	private String description;
	private int complaintactuals;
	private Date uptime;
    private String baozhuang;
    private String danwei;
 
	public String getDanwei() {
		return danwei;
	}

	public void setDanwei(String danwei) {
		this.danwei = danwei;
	}

	public String getBaozhuang() {
		return baozhuang;
	}

	public void setBaozhuang(String baozhuang) {
		this.baozhuang = baozhuang;
	}

	public String getProduct() {
		return Product;
	}

	public void setProduct(String product) {
		Product = product;
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

	public Date getUptime() {
		return uptime;
	}

	public void setUptime(Date uptime) {
		this.uptime = uptime;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductuuid() {
		return productuuid;
	}

	public void setProductuuid(String productuuid) {
		this.productuuid = productuuid;
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

	public String getGonglv() {
		return gonglv;
	}

	public void setGonglv(String gonglv) {
		this.gonglv = gonglv;
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
		return Encapsulation;
	}

	public void setEncapsulation(String encapsulation) {
		Encapsulation = encapsulation;
	}



	public String getManufacturer() {
		return Manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		Manufacturer = manufacturer;
	}

	public int getIsGoodsInStock() {
		return IsGoodsInStock;
	}

	public void setIsGoodsInStock(int isGoodsInStock) {
		IsGoodsInStock = isGoodsInStock;
	}

	public String getPrice() {
		return Price;
	}

	public void setPrice(String price) {
		Price = price;
	}

	@Override
	public String toString() {
		return "ResistanceResult [Encapsulation=" + Encapsulation + ", sousuo=" + sousuo + ", zhuzhi=" + zhuzhi
				+ ", gonglv=" + gonglv + ", jingquedu=" + jingquedu + ", Manufacturer=" + Manufacturer + ", num=" + num
				+ ", IsGoodsInStock=" + IsGoodsInStock + ", Price=" + Price + "]";
	}



}
