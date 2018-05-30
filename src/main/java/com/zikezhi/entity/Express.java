package com.zikezhi.entity;

import java.util.Date;
import java.util.List;

/**
 * 订单对象
 * @author wrp
 *
 */
public class Express {
	

	//订单id
    private String express;
    private String panduan;
    
    public String getPanduan() {
    	return panduan;
    }
    
    public void setPanduan(String panduan) {
    	this.panduan = panduan;
    }

    //所属快递公司
    private String expressname;

    //订单个数
    private String expressnumber;

    //收货人
    private String name;

    //收货人电话
    private String telphone;
    
    //收货人地址
    private String address;

    //订单状态
    private String status;

    //快递单号
    private String help;

    //用户id
    private String useruid;
    
    //商家id
    private String express_sid;

    //商品名称
    private String product;

    //商品id
    private String productuid;
    
    //商品封装
    private String express_package;
    
    //订单金额
    private Float eprice;
    
    //订单单价
    private Float one;
    
    //返利金额
    private Float fan;
    
    //订单备注
    private String beizhu;
    
    //下单时间
    private Date edate;
    
    //支付方式
    private String mode;
    
    private String e_invoice;//发票
    
    private Float express_profit;
    
    //优惠金额
    private Float preferentialamount;
    
    private String ordernumber;
    
    private String express_biaoqian;
    
    private Supplier supplierlist;
    
    public String getExpress_biaoqian() {
		return express_biaoqian;
	}

	public void setExpress_biaoqian(String express_biaoqian) {
		this.express_biaoqian = express_biaoqian;
	}

	public String getOrdernumber() {
		return ordernumber;
	}

	public void setOrdernumber(String ordernumber) {
		this.ordernumber = ordernumber;
	}

	private String discountdescription;
    
    private Float discountprice;
    
    private Float price;
    
    private String supplier;
    
    private UserInfo user;
    
    private List<OrderItme> order;
    
    private Product p;
    

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public UserInfo getUser() {
		return user;
	}

	public void setUser(UserInfo user) {
		this.user = user;
	}

	public Product getP() {
		return p;
	}

	public void setP(Product p) {
		this.p = p;
	}

	public List<OrderItme> getOrder() {
		return order;
	}

	public void setOrder(List<OrderItme> order) {
		this.order = order;
	}

	public Float getDiscountprice() {
		return discountprice;
	}

	public void setDiscountprice(Float discountprice) {
		this.discountprice = discountprice;
	}

	public String getSupplier() {
		return supplier;
	}

	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getExpress() {
        return express;
    }

    public void setExpress(String express) {
        this.express = express == null ? null : express.trim();
    }

    public String getExpressname() {
        return expressname;
    }

    public void setExpressname(String expressname) {
        this.expressname = expressname == null ? null : expressname.trim();
    }

    public String getExpressnumber() {
        return expressnumber;
    }

    public void setExpressnumber(String expressnumber) {
        this.expressnumber = expressnumber == null ? null : expressnumber.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone == null ? null : telphone.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getStatus() {
        return status;
    }

	public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getHelp() {
        return help;
    }

    public void setHelp(String help) {
        this.help = help == null ? null : help.trim();
    }

    public String getExpress_sid() {
		return express_sid;
	}

	public void setExpress_sid(String express_sid) {
		this.express_sid = express_sid;
	}

	public String getUseruid() {
        return useruid;
    }

    public void setUseruid(String useruid) {
        this.useruid = useruid;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

	public String getExpress_package() {
		return express_package;
	}

	public void setExpress_package(String express_package) {
		this.express_package = express_package;
	}

	public String getProductuid() {
        return productuid;
    }

    public void setProductuid(String productuid) {
        this.productuid = productuid;
    }

    public Float getEprice() {
		return eprice;
	}

	public Float getOne() {
		return one;
	}

	public void setOne(Float one) {
		this.one = one;
	}

	public void setEprice(Float eprice) {
		this.eprice = eprice;
	}

	public Float getFan() {
		return fan;
	}

	public void setFan(Float fan) {
		this.fan = fan;
	}

	public String getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public Date getEdate() {
		return edate;
	}

	public void setEdate(Date edate) {
		this.edate = edate;
	}

	public String getE_invoice() {
		return e_invoice;
	}

	public void setE_invoice(String e_invoice) {
		this.e_invoice = e_invoice;
	}

	public Float getPreferentialamount() {
		return preferentialamount;
	}

	public void setPreferentialamount(Float preferentialamount) {
		this.preferentialamount = preferentialamount;
	}

	public String getDiscountdescription() {
		return discountdescription;
	}

	public void setDiscountdescription(String discountdescription) {
		this.discountdescription = discountdescription;
	}

	public Float getExpress_profit() {
		return express_profit;
	}

	public void setExpress_profit(Float express_profit) {
		this.express_profit = express_profit;
	}

	public Supplier getSupplierlist() {
		return supplierlist;
	}

	public void setSupplierlist(Supplier supplierlist) {
		this.supplierlist = supplierlist;
	}

	@Override
    public String toString() {
        return "Express{" +
                "express='" + express + '\'' +
                ", expressname='" + expressname + '\'' +
                ", expressnumber='" + expressnumber + '\'' +
                ", name='" + name + '\'' +
                ", telphone='" + telphone + '\'' +
                ", address='" + address + '\'' +
                ", status='" + status + '\'' +
                ", help='" + help + '\'' +
                ", useruid='" + useruid + '\'' +
                ", product='" + product + '\'' +
                ", productuid='" + productuid + '\'' +
                ", eprice='" + eprice + '\'' +
                ", fan='" + fan + '\'' +
                ", beizhu='" + beizhu + '\'' +
                ", edate='" + edate + '\'' +
                '}';
    }
}