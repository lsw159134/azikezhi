package com.zikezhi.entity;

import java.util.Date;
import java.util.List;

public class Product {
	private String productuuid;
     private String productName;//用来区别 新加的 类型
	private String product;//产品型号
	private String zhuzhi;
	private String jingquedu;
	private String supplier;//供应商

	private String description;//交易说明

	private String manufacturer;//品牌

	private String lotnumber;//批号

	private String encapsulation;//封装

	private String isgoodsinstock;//现货

	private String danwei;
	private String baozhuang;
	
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

	private Float price;//价格
	
	private Integer quality;//质量
	
	private int totalSales;// 在线购累计售出（销售总量）
	
	private String p_data;//资料
	
	private String product_miaoshu;

	private String product_primary;//1级
	
	private int product_selling;//热销
	
	private Cart cart;//购物车对应
	
	private Float subtotal;//小计
	
	private Date uptime;//修改时间
	
	private Primary primary;//一级分类对应
	
	private Second second;//二级分类对应
	
	private String product_booking;//代售信息
	
	private Brand brand;
	
	private Evaluate evaluate;
	
	private Supplier supplierlist;
	
	private String sort_miaoshu;
	
	private Date time;
	
	private int product_evaluatezai;
	
	private int product_evaluatecai;
	
	
	
	
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

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getTotalSales() {
		return totalSales;
	}

	public void setTotalSales(int totalSales) {
		this.totalSales = totalSales;
	}

	public int getProduct_evaluatezai() {
		return product_evaluatezai;
	}

	public void setProduct_evaluatezai(int product_evaluatezai) {
		this.product_evaluatezai = product_evaluatezai;
	}

	public int getProduct_evaluatecai() {
		return product_evaluatecai;
	}

	public void setProduct_evaluatecai(int product_evaluatecai) {
		this.product_evaluatecai = product_evaluatecai;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Evaluate getEvaluate() {
		return evaluate;
	}

	public void setEvaluate(Evaluate evaluate) {
		this.evaluate = evaluate;
	}

	public String getSort_miaoshu() {
		return sort_miaoshu;
	}

	public void setSort_miaoshu(String sort_miaoshu) {
		this.sort_miaoshu = sort_miaoshu;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public String getSort_lianjie() {
		return sort_lianjie;
	}

	public void setSort_lianjie(String sort_lianjie) {
		this.sort_lianjie = sort_lianjie;
	}

	public String getSort_waishe() {
		return sort_waishe;
	}

	public void setSort_waishe(String sort_waishe) {
		this.sort_waishe = sort_waishe;
	}

	public String getSort_io() {
		return sort_io;
	}

	public void setSort_io(String sort_io) {
		this.sort_io = sort_io;
	}

	public String getSort_ram() {
		return sort_ram;
	}

	public void setSort_ram(String sort_ram) {
		this.sort_ram = sort_ram;
	}

	public String getSort_shujuzhuanhuan() {
		return sort_shujuzhuanhuan;
	}

	public void setSort_shujuzhuanhuan(String sort_shujuzhuanhuan) {
		this.sort_shujuzhuanhuan = sort_shujuzhuanhuan;
	}

	public String getSort_dianya() {
		return sort_dianya;
	}

	public void setSort_dianya(String sort_dianya) {
		this.sort_dianya = sort_dianya;
	}

	public String getSort_wendu() {
		return sort_wendu;
	}

	public void setSort_wendu(String sort_wendu) {
		this.sort_wendu = sort_wendu;
	}

	public String getProduct_booking() {
		return product_booking;
	}

	public void setProduct_booking(String product_booking) {
		this.product_booking = product_booking;
	}

	private String sort_lianjie;
	private String sort_waishe;
	private String sort_io;
	private String sort_ram;
	private String sort_shujuzhuanhuan;
	private String sort_dianya;
	private String sort_wendu;

	public String getProduct_miaoshu() {
		return product_miaoshu;
	}

	public void setProduct_miaoshu(String product_miaoshu) {
		this.product_miaoshu = product_miaoshu;
	}

	public Primary getPrimary() {
		return primary;
	}

	public void setPrimary(Primary primary) {
		this.primary = primary;
	}

	public Second getSecond() {
		return second;
	}

	public void setSecond(Second second) {
		this.second = second;
	}

	public String getProduct_primary() {
		return product_primary;
	}

	public void setProduct_primary(String product_primary) {
		this.product_primary = product_primary;
	}

	public int getProduct_selling() {
		return product_selling;
	}

	public void setProduct_selling(int product_selling) {
		this.product_selling = product_selling;
	}

	public Date getUptime() {
		return uptime;
	}

	public void setUptime(Date uptime) {
		this.uptime = uptime;
	}

	public Float getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(Float subtotal) {
		this.subtotal = subtotal;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public String getP_data() {
		return p_data;
	}

	public void setP_data(String p_data) {
		this.p_data = p_data;
	}

	private String document;

	private String image;

	
	private String keywords;

	private String complaint;

	private String supplieruuid;
	
	private Integer complaintprice;

	private Integer complaintactuals;

	private Integer complaintoriginal;

	private String qq;

	private List<Discount> discountList;
	
	private List<PImg> pimgList;

	
	public List<PImg> getPimgList() {
		return pimgList;
	}

	public void setPimgList(List<PImg> pimgList) {
		this.pimgList = pimgList;
	}

	public List<Discount> getDiscountList() {
		return discountList;
	}

	public void setDiscountList(List<Discount> discountList) {
		this.discountList = discountList;
	}

	public String getProductuuid() {
		return productuuid;
	}

	public void setProductuuid(String productuuid) {
		this.productuuid = productuuid == null ? null : productuuid.trim();
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product == null ? null : product.trim();
		this.product = this.product.toUpperCase();
	}

	public String getSupplier() {
		return supplier;
	}

	public void setSupplier(String supplier) {
		this.supplier = supplier == null ? null : supplier.trim();
		this.supplier = this.supplier.toUpperCase();
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description == null ? null : description.trim();
		this.description = this.description.toUpperCase();
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer == null ? null : manufacturer.trim();
		this.manufacturer = this.manufacturer.toUpperCase();
	}

	public String getLotnumber() {
		return lotnumber;
	}

	public void setLotnumber(String lotnumber) {
		this.lotnumber = lotnumber == null ? null : lotnumber.trim();
		this.lotnumber = this.lotnumber.toUpperCase();
	}

	public String getEncapsulation() {
		return encapsulation;
	}

	public void setEncapsulation(String encapsulation) {
		this.encapsulation = encapsulation == null ? null : encapsulation.trim();
		this.encapsulation = this.encapsulation.toUpperCase();
	}

	public String getIsgoodsinstock() {
		return isgoodsinstock;
	}

	public void setIsgoodsinstock(String isgoodsinstock) {
		this.isgoodsinstock = isgoodsinstock == null ? null : isgoodsinstock.trim();
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getDocument() {
		return document;
	}

	public void setDocument(String document) {
		this.document = document == null ? null : document.trim();
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image == null ? null : image.trim();
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords == null ? null : keywords.trim();
	}

	public String getComplaint() {
		return complaint;
	}

	public void setComplaint(String complaint) {
		this.complaint = complaint == null ? null : complaint.trim();
	}

	public Integer getQuality() {
		return quality;
	}

	public void setQuality(Integer quality) {
		this.quality = quality;
	}

	public String getSupplieruuid() {
		return supplieruuid;
	}

	public void setSupplieruuid(String supplieruuid) {
		this.supplieruuid = supplieruuid == null ? null : supplieruuid.trim();
	}

	public Integer getComplaintprice() {
		return complaintprice;
	}

	public void setComplaintprice(Integer complaintprice) {
		this.complaintprice = complaintprice;
	}

	public Integer getComplaintactuals() {
		return complaintactuals;
	}

	public void setComplaintactuals(Integer complaintactuals) {
		this.complaintactuals = complaintactuals;
	}

	public Integer getComplaintoriginal() {
		return complaintoriginal;
	}

	public void setComplaintoriginal(Integer complaintoriginal) {
		this.complaintoriginal = complaintoriginal;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public Supplier getSupplierlist() {
		return supplierlist;
	}

	public void setSupplierlist(Supplier supplierlist) {
		this.supplierlist = supplierlist;
	}

	@Override
	public String toString() {
		return "Product [productuuid=" + productuuid + ", product=" + product + ", supplier=" + supplier
				+ ", description=" + description + ", manufacturer=" + manufacturer + ", lotnumber=" + lotnumber
				+ ", encapsulation=" + encapsulation + ", isgoodsinstock=" + isgoodsinstock + ", price=" + price
				+ ", quality=" + quality + ", p_data=" + p_data + ", product_miaoshu=" + product_miaoshu
				+ ", product_primary=" + product_primary + ", product_selling=" + product_selling + ", cart=" + cart
				+ ", subtotal=" + subtotal + ", uptime=" + uptime + ", primary=" + primary + ", second=" + second
				+ ", product_booking=" + product_booking + ", brand=" + brand + ", evaluate=" + evaluate
				+ ", supplierlist=" + supplierlist + ", sort_miaoshu=" + sort_miaoshu + ", time=" + time
				+ ", product_evaluatezai=" + product_evaluatezai + ", product_evaluatecai=" + product_evaluatecai
				+ ", sort_lianjie=" + sort_lianjie + ", sort_waishe=" + sort_waishe + ", sort_io=" + sort_io
				+ ", sort_ram=" + sort_ram + ", sort_shujuzhuanhuan=" + sort_shujuzhuanhuan + ", sort_dianya="
				+ sort_dianya + ", sort_wendu=" + sort_wendu + ", document=" + document + ", image=" + image
				+ ", keywords=" + keywords + ", complaint=" + complaint + ", supplieruuid=" + supplieruuid
				+ ", complaintprice=" + complaintprice + ", complaintactuals=" + complaintactuals
				+ ", complaintoriginal=" + complaintoriginal + ", qq=" + qq + ", discountList=" + discountList
				+ ", pimgList=" + pimgList + "]";
	}

/*	@Override
	public String toString() {
		return "Product [productuuid=" + productuuid + ", product=" + product + ", supplier=" + supplier
				+ ", description=" + description + ", manufacturer=" + manufacturer + ", lotnumber=" + lotnumber
				+ ", encapsulation=" + encapsulation + ", isgoodsinstock=" + isgoodsinstock + ", price=" + price
				+ ", document=" + document + ", image=" + image + ", keywords=" + keywords + ", complaint=" + complaint
				+ ", quality=" + quality + ", supplieruuid=" + supplieruuid + ", complaintprice=" + complaintprice
				+ ", complaintactuals=" + complaintactuals + ", complaintoriginal=" + complaintoriginal + ", qq=" + qq
				+ "]";
	}

*/

}