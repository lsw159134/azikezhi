package com.zikezhi.entity;

import java.util.Date;

public class SupplierUser {
    private String supplieruseruuid;

    private String suppliername;

    private String ipaddress;

    private String passwd;

    private String cellphone;

    private String email;

    private Date regtime;

    private Byte sex;

    private Date lastlogintime;

    private String regip;

    private String qq;

    private String city;

    private String bussinesslicence;

    private Float credit;

    private String supplieruuid;

    public String getSupplieruseruuid() {
        return supplieruseruuid;
    }

    public void setSupplieruseruuid(String supplieruseruuid) {
        this.supplieruseruuid = supplieruseruuid == null ? null : supplieruseruuid.trim();
    }

    public String getSuppliername() {
        return suppliername;
    }

    public void setSuppliername(String suppliername) {
        this.suppliername = suppliername == null ? null : suppliername.trim();
    }

    public String getIpaddress() {
        return ipaddress;
    }

    public void setIpaddress(String ipaddress) {
        this.ipaddress = ipaddress == null ? null : ipaddress.trim();
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd == null ? null : passwd.trim();
    }

    public String getCellphone() {
        return cellphone;
    }

    public void setCellphone(String cellphone) {
        this.cellphone = cellphone == null ? null : cellphone.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Date getRegtime() {
        return regtime;
    }

    public void setRegtime(Date regtime) {
        this.regtime = regtime;
    }

    public Byte getSex() {
        return sex;
    }

    public void setSex(Byte sex) {
        this.sex = sex;
    }

    public Date getLastlogintime() {
        return lastlogintime;
    }

    public void setLastlogintime(Date lastlogintime) {
        this.lastlogintime = lastlogintime;
    }

    public String getRegip() {
        return regip;
    }

    public void setRegip(String regip) {
        this.regip = regip == null ? null : regip.trim();
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq == null ? null : qq.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getBussinesslicence() {
        return bussinesslicence;
    }

    public void setBussinesslicence(String bussinesslicence) {
        this.bussinesslicence = bussinesslicence == null ? null : bussinesslicence.trim();
    }

    public Float getCredit() {
        return credit;
    }

    public void setCredit(Float credit) {
        this.credit = credit;
    }

    public String getSupplieruuid() {
        return supplieruuid;
    }

    public void setSupplieruuid(String supplieruuid) {
        this.supplieruuid = supplieruuid == null ? null : supplieruuid.trim();
    }
}