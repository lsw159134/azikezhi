package com.zikezhi.entity;

import java.util.Date;
import java.util.List;

public class Supplier {
    private String supplieruuid;	//供应商UUID
    
    private String suppliername;	//供应商名

    private String supplierposition;	//地址1

    private String repoposition;	//地址2

    private String validityperiod; 	//场地有效期
    
    private String telphone4;	//电话

    private String telphone3;	//电话

    private String telphone2;	//电话

    private String telphone1;	//电话

    private String telphone;	//电话
 
    private String cellphone;	//手机

    private String fax;	//传真

    private String email;	//邮箱 

    private String brandoperation;	//经营品牌

    private String supplierphotos;	//	公司相册

    private String qualification;	//资质证书

    private String evaluate;	//评价

    private Boolean ischeck;	//是否审核

    private String supplierprefile;	//供应商相关文件
    
    private String supplier_bieming;
    
    private String qq;	//QQ号
    
    private String qq2;
    
    private String supplier_uid;//用户
    
    private Date time;
    
    private String supplier_label1;/**标签 */
    
    private String supplier_label2;
    
    private String supplier_label3;
    
    private String supplier_label4;
    
    private String supplier_label5;
    
    private List<Product> productList;
    
    private UserInfo user;
    
	public String getSupplieruuid() {
        return supplieruuid;
    }

    public void setSupplieruuid(String supplieruuid) {
        this.supplieruuid = supplieruuid == null ? null : supplieruuid.trim();
    }
    
    public String getSuppliername() {
		return suppliername;
	}

	public void setSuppliername(String suppliername) {
		this.suppliername = suppliername;
	}

	public String getSupplierposition() {
        return supplierposition;
    }

    public void setSupplierposition(String supplierposition) {
        this.supplierposition = supplierposition == null ? null : supplierposition.trim();
    }

    public String getSupplier_bieming() {
		return supplier_bieming;
	}

	public void setSupplier_bieming(String supplier_bieming) {
		this.supplier_bieming = supplier_bieming;
	}

	public String getRepoposition() {
        return repoposition;
    }

    public void setRepoposition(String repoposition) {
        this.repoposition = repoposition == null ? null : repoposition.trim();
    }

    public String getValidityperiod() {
        return validityperiod;
    }

    public void setValidityperiod(String validityperiod) {
        this.validityperiod = validityperiod == null ? null : validityperiod.trim();
    }
    
    public String getTelphone4() {
        return telphone4;
    }

    public void setTelphone4(String telphone4) {
        this.telphone4 = telphone4 == null ? null : telphone4.trim();
    }

    public String getTelphone3() {
        return telphone3;
    }

    public void setTelphone3(String telphone3) {
        this.telphone3 = telphone3 == null ? null : telphone3.trim();
    }

    public String getTelphone2() {
        return telphone2;
    }

    public void setTelphone2(String telphone2) {
        this.telphone2 = telphone2 == null ? null : telphone2.trim();
    }

    public String getTelphone1() {
        return telphone1;
    }

    public void setTelphone1(String telphone1) {
        this.telphone1 = telphone1 == null ? null : telphone1.trim();
    }

    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone == null ? null : telphone.trim();
    }

    public String getCellphone() {
        return cellphone;
    }

    public void setCellphone(String cellphone) {
        this.cellphone = cellphone == null ? null : cellphone.trim();
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax == null ? null : fax.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getBrandoperation() {
        return brandoperation;
    }

    public void setBrandoperation(String brandoperation) {
        this.brandoperation = brandoperation == null ? null : brandoperation.trim();
    }

    public String getSupplierphotos() {
        return supplierphotos;
    }

    public void setSupplierphotos(String supplierphotos) {
        this.supplierphotos = supplierphotos == null ? null : supplierphotos.trim();
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification == null ? null : qualification.trim();
    }

    public String getEvaluate() {
        return evaluate;
    }

    public void setEvaluate(String evaluate) {
        this.evaluate = evaluate == null ? null : evaluate.trim();
    }

    public Boolean getIscheck() {
        return ischeck;
    }

    public void setIscheck(Boolean ischeck) {
        this.ischeck = ischeck;
    }

    public String getSupplierprefile() {
        return supplierprefile;
    }

    public void setSupplierprefile(String supplierprefile) {
        this.supplierprefile = supplierprefile == null ? null : supplierprefile.trim();
    }

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getQq2() {
		return qq2;
	}

	public void setQq2(String qq2) {
		this.qq2 = qq2;
	}

	public String getSupplier_uid() {
		return supplier_uid;
	}

	public void setSupplier_uid(String supplier_uid) {
		this.supplier_uid = supplier_uid;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getSupplier_label1() {
		return supplier_label1;
	}

	public void setSupplier_label1(String supplier_label1) {
		this.supplier_label1 = supplier_label1;
	}

	public String getSupplier_label2() {
		return supplier_label2;
	}

	public void setSupplier_label2(String supplier_label2) {
		this.supplier_label2 = supplier_label2;
	}

	public String getSupplier_label3() {
		return supplier_label3;
	}

	public void setSupplier_label3(String supplier_label3) {
		this.supplier_label3 = supplier_label3;
	}

	public String getSupplier_label4() {
		return supplier_label4;
	}

	public void setSupplier_label4(String supplier_label4) {
		this.supplier_label4 = supplier_label4;
	}

	public String getSupplier_label5() {
		return supplier_label5;
	}

	public void setSupplier_label5(String supplier_label5) {
		this.supplier_label5 = supplier_label5;
	}

	public List<Product> getProductList() {
		return productList;
	}

	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}

	public UserInfo getUser() {
		return user;
	}

	public void setUser(UserInfo user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Supplier [supplieruuid=" + supplieruuid + ", suppliername=" + suppliername + ", supplierposition="
				+ supplierposition + ", repoposition=" + repoposition + ", validityperiod=" + validityperiod
				+ ", telphone4=" + telphone4 + ", telphone3=" + telphone3 + ", telphone2=" + telphone2 + ", telphone1="
				+ telphone1 + ", telphone=" + telphone + ", cellphone=" + cellphone + ", fax=" + fax + ", email="
				+ email + ", brandoperation=" + brandoperation + ", supplierphotos=" + supplierphotos
				+ ", qualification=" + qualification + ", evaluate=" + evaluate + ", ischeck=" + ischeck
				+ ", supplierprefile=" + supplierprefile + ", qq=" + qq + ", qq2=" + qq2 + "]";
	}

}