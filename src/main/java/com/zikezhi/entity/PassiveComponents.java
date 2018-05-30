package com.zikezhi.entity;

import java.util.Date;
/**
 * 被动器件供应商
 * @author lenovo
 *
 */
public class PassiveComponents {
    private String passivecomponentsuid;

    private String name;

    private String phone;

    private String phone1;

    private String phone2;

    private Integer down;

    private Integer up;

    private String cellphone;

    private String cellphone1;

    private String qq;

    private String qq1;

    private String qq2;

    private String qq3;

    private String address;

    private String illustration;

    private String explain1;

    private String explain2;

    private String explain3;

    private String label;

    private String label1;

    private int passive_cid;

    private int passive_sid;

    private Date time;
    
    private Subcategory subcategory;

    public String getPassivecomponentsuid() {
        return passivecomponentsuid;
    }

    public void setPassivecomponentsuid(String passivecomponentsuid) {
        this.passivecomponentsuid = passivecomponentsuid == null ? null : passivecomponentsuid.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getPhone1() {
        return phone1;
    }

    public void setPhone1(String phone1) {
        this.phone1 = phone1 == null ? null : phone1.trim();
    }

    public String getPhone2() {
        return phone2;
    }

    public void setPhone2(String phone2) {
        this.phone2 = phone2 == null ? null : phone2.trim();
    }

    public Integer getDown() {
        return down;
    }

    public void setDown(Integer down) {
        this.down = down;
    }

    public Integer getUp() {
        return up;
    }

    public void setUp(Integer up) {
        this.up = up;
    }

    public String getCellphone() {
        return cellphone;
    }

    public void setCellphone(String cellphone) {
        this.cellphone = cellphone == null ? null : cellphone.trim();
    }

    public String getCellphone1() {
        return cellphone1;
    }

    public void setCellphone1(String cellphone1) {
        this.cellphone1 = cellphone1 == null ? null : cellphone1.trim();
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq == null ? null : qq.trim();
    }

    public String getQq1() {
        return qq1;
    }

    public void setQq1(String qq1) {
        this.qq1 = qq1 == null ? null : qq1.trim();
    }

    public String getQq2() {
        return qq2;
    }

    public void setQq2(String qq2) {
        this.qq2 = qq2 == null ? null : qq2.trim();
    }

    public String getQq3() {
        return qq3;
    }

    public void setQq3(String qq3) {
        this.qq3 = qq3 == null ? null : qq3.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getIllustration() {
        return illustration;
    }

    public void setIllustration(String illustration) {
        this.illustration = illustration;
    }

    public String getExplain1() {
        return explain1;
    }

    public void setExplain1(String explain1) {
        this.explain1 = explain1 == null ? null : explain1.trim();
    }

    public String getExplain2() {
        return explain2;
    }

    public void setExplain2(String explain2) {
        this.explain2 = explain2 == null ? null : explain2.trim();
    }

    public String getExplain3() {
        return explain3;
    }

    public void setExplain3(String explain3) {
        this.explain3 = explain3 == null ? null : explain3.trim();
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label == null ? null : label.trim();
    }

    public String getLabel1() {
        return label1;
    }

    public void setLabel1(String label1) {
        this.label1 = label1 == null ? null : label1.trim();
    }

    public int getPassive_cid() {
        return passive_cid;
    }

    public void setPassive_cid(int passive_cid) {
        this.passive_cid = passive_cid;
    }

    public int getPassive_sid() {
        return passive_sid;
    }

    public void setPassive_sid(int passive_sid) {
        this.passive_sid = passive_sid;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Subcategory getSubcategory() {
		return subcategory;
	}

	public void setSubcategory(Subcategory subcategory) {
		this.subcategory = subcategory;
	}

	@Override
    public String toString() {
        return "PassiveComponents{" +
                "passivecomponentsuid='" + passivecomponentsuid + '\'' +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", phone1='" + phone1 + '\'' +
                ", phone2='" + phone2 + '\'' +
                ", down=" + down +
                ", up=" + up +
                ", cellphone='" + cellphone + '\'' +
                ", cellphone1='" + cellphone1 + '\'' +
                ", qq='" + qq + '\'' +
                ", qq1='" + qq1 + '\'' +
                ", qq2='" + qq2 + '\'' +
                ", qq3='" + qq3 + '\'' +
                ", address='" + address + '\'' +
                ", illustration='" + illustration + '\'' +
                ", explain1='" + explain1 + '\'' +
                ", explain2='" + explain2 + '\'' +
                ", explain3='" + explain3 + '\'' +
                ", label='" + label + '\'' +
                ", label1='" + label1 + '\'' +
                ", passive_cid='" + passive_cid + '\'' +
                ", passive_sid='" + passive_sid + '\'' +
                ", time='" + time + '\'' +
                '}';
    }
}