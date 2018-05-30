package com.zikezhi.entity;

import java.util.Date;
/**
 * 用户
 * @author lenovo
 *
 */
public class UserInfo {
    private String useruid;

    private String usericon;

    private String username;

    private String password;

    private Date regtime;

    private Date lasttime;

    private String lastip;

    private String regip;

    private String qq;

    private String qqmail;

    private String sex;

    private String telephone;

    private String salt;

    private Integer count;

    private String activity;

    private String mail;
    
    private String supplieruid;
    
    private Integer excellent;
    
    private Integer good;
    
    private Integer average;
    
    private String authority;

    private String alipay;

    private Integer countsearch;

    private String realname;

    private String realtelphone;

    private String realaddress;

    private String expressaddress;
    
    private String u_personalid;

    public String getUseruid() {
        return useruid;
    }

    public void setUseruid(String useruid) {
        this.useruid = useruid == null ? null : useruid.trim();
    }

    public String getUsericon() {
        return usericon;
    }

    public void setUsericon(String usericon) {
        this.usericon = usericon == null ? null : usericon.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Date getRegtime() {
        return regtime;
    }

    public void setRegtime(Date regtime) {
        this.regtime = regtime;
    }

    public Date getLasttime() {
        return lasttime;
    }

    public void setLasttime(Date lasttime) {
        this.lasttime = lasttime;
    }

    public String getLastip() {
        return lastip;
    }

    public void setLastip(String lastip) {
        this.lastip = lastip == null ? null : lastip.trim();
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

    public String getQqmail() {
        return qqmail;
    }

    public void setQqmail(String qqmail) {
        this.qqmail = qqmail == null ? null : qqmail.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt == null ? null : salt.trim();
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity == null ? null : activity.trim();
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail == null ? null : mail.trim();
    }
    
	public String getSupplieruid() {
		return supplieruid;
	}

	public void setSupplieruid(String supplieruid) {
		this.supplieruid = supplieruid;
	}

	public Integer getExcellent() {
		return excellent;
	}

	public void setExcellent(Integer excellent) {
		this.excellent = excellent;
	}

	public Integer getGood() {
		return good;
	}

	public void setGood(Integer good) {
		this.good = good;
	}

	public Integer getAverage() {
		return average;
	}

	public void setAverage(Integer average) {
		this.average = average;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

    public String getAlipay() {
        return alipay;
    }

    public void setAlipay(String alipay) {
        this.alipay = alipay;
    }

    public Integer getCountsearch() {
        return countsearch;
    }

    public void setCountsearch(Integer countsearch) {
        this.countsearch = countsearch;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getRealtelphone() {
        return realtelphone;
    }

    public void setRealtelphone(String realtelphone) {
        this.realtelphone = realtelphone;
    }

    public String getRealaddress() {
        return realaddress;
    }

    public void setRealaddress(String realaddress) {
        this.realaddress = realaddress;
    }

    public String getExpressaddress() {
        return expressaddress;
    }

    public void setExpressaddress(String expressaddress) {
        this.expressaddress = expressaddress;
    }

    public String getU_personalid() {
		return u_personalid;
	}

	public void setU_personalid(String u_personalid) {
		this.u_personalid = u_personalid;
	}

	@Override
    public String toString() {
        return "UserInfo{" +
                "useruid='" + useruid + '\'' +
                ", usericon='" + usericon + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", regtime=" + regtime +
                ", lasttime=" + lasttime +
                ", lastip='" + lastip + '\'' +
                ", regip='" + regip + '\'' +
                ", qq='" + qq + '\'' +
                ", qqmail='" + qqmail + '\'' +
                ", sex='" + sex + '\'' +
                ", telephone='" + telephone + '\'' +
                ", salt='" + salt + '\'' +
                ", count=" + count +
                ", activity='" + activity + '\'' +
                ", mail='" + mail + '\'' +
                ", supplieruid='" + supplieruid + '\'' +
                ", excellent=" + excellent +
                ", good=" + good +
                ", average=" + average +
                ", authority='" + authority + '\'' +
                ", alipay='" + alipay + '\'' +
                ", countsearch=" + countsearch +
                ", realname='" + realname + '\'' +
                ", realtelphone='" + realtelphone + '\'' +
                ", realaddress='" + realaddress + '\'' +
                ", expressaddress='" + expressaddress + '\'' +
                '}';
    }

}