package com.zikezhi.entity;

import java.util.Date;
import java.util.List;
/**
 * 销售（用户系统）
 * @author lenovo
 *
 */
public class XiaoShou {

	private String xs_id;
	
	private String xs_type;//类型
	
	private String xs_kehu;//客户
	
	private String xs_name;//联系人
	
	private String xs_phone;//电话
	
	private String xs_address;//地址
	
	private Float xs_yingshou;//应收
	
	private Float xs_shishou;//实收
	
	private Float xs_othermoney;//其他
	
	private String xs_pay;//收款方式
	
	private Date xs_shoukuandate;//预计收款时间
	
	private String xs_status;//状态
	
	private String xs_beizhu;
	
	private String xs_uid;
	
	private Date xs_addtime;
	
	private List<Rkreport> rkreportList;

	public String getXs_id() {
		return xs_id;
	}

	public void setXs_id(String xs_id) {
		this.xs_id = xs_id;
	}

	public String getXs_type() {
		return xs_type;
	}

	public void setXs_type(String xs_type) {
		this.xs_type = xs_type;
	}

	public String getXs_kehu() {
		return xs_kehu;
	}

	public void setXs_kehu(String xs_kehu) {
		this.xs_kehu = xs_kehu;
	}

	public String getXs_name() {
		return xs_name;
	}

	public void setXs_name(String xs_name) {
		this.xs_name = xs_name;
	}

	public String getXs_phone() {
		return xs_phone;
	}

	public void setXs_phone(String xs_phone) {
		this.xs_phone = xs_phone;
	}

	public String getXs_address() {
		return xs_address;
	}

	public void setXs_address(String xs_address) {
		this.xs_address = xs_address;
	}

	public Float getXs_yingshou() {
		return xs_yingshou;
	}

	public void setXs_yingshou(Float xs_yingshou) {
		this.xs_yingshou = xs_yingshou;
	}

	public Float getXs_shishou() {
		return xs_shishou;
	}

	public void setXs_shishou(Float xs_shishou) {
		this.xs_shishou = xs_shishou;
	}

	public Float getXs_othermoney() {
		return xs_othermoney;
	}

	public void setXs_othermoney(Float xs_othermoney) {
		this.xs_othermoney = xs_othermoney;
	}

	public String getXs_pay() {
		return xs_pay;
	}

	public void setXs_pay(String xs_pay) {
		this.xs_pay = xs_pay;
	}

	public Date getXs_shoukuandate() {
		return xs_shoukuandate;
	}

	public void setXs_shoukuandate(Date xs_shoukuandate) {
		this.xs_shoukuandate = xs_shoukuandate;
	}

	public String getXs_beizhu() {
		return xs_beizhu;
	}

	public void setXs_beizhu(String xs_beizhu) {
		this.xs_beizhu = xs_beizhu;
	}

	public String getXs_uid() {
		return xs_uid;
	}

	public void setXs_uid(String xs_uid) {
		this.xs_uid = xs_uid;
	}

	public Date getXs_addtime() {
		return xs_addtime;
	}

	public void setXs_addtime(Date xs_addtime) {
		this.xs_addtime = xs_addtime;
	}

	public List<Rkreport> getRkreportList() {
		return rkreportList;
	}

	public void setRkreportList(List<Rkreport> rkreportList) {
		this.rkreportList = rkreportList;
	}

	public String getXs_status() {
		return xs_status;
	}

	public void setXs_status(String xs_status) {
		this.xs_status = xs_status;
	}
	
}
