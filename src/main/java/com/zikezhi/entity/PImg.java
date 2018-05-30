package com.zikezhi.entity;

import java.util.Date;
/**
 * 图片
 * @author lenovo
 *
 */
public class PImg {
	private String p_imgid     ;
	private String p_imgname   ;
	private String p_imgpid    ;
	private String p_imgstauts ;
	private Date   p_imgtime   ;
	private Date   p_imguptime ;
	public Date getP_imguptime() {
		return p_imguptime;
	}
	public void setP_imguptime(Date p_imguptime) {
		this.p_imguptime = p_imguptime;
	}
	public String getP_imgid() {
		return p_imgid;
	}
	public void setP_imgid(String p_imgid) {
		this.p_imgid = p_imgid;
	}
	public String getP_imgname() {
		return p_imgname;
	}
	public void setP_imgname(String p_imgname) {
		this.p_imgname = p_imgname;
	}
	public String getP_imgpid() {
		return p_imgpid;
	}
	public void setP_imgpid(String p_imgpid) {
		this.p_imgpid = p_imgpid;
	}
	public String getP_imgstauts() {
		return p_imgstauts;
	}
	public void setP_imgstauts(String p_imgstauts) {
		this.p_imgstauts = p_imgstauts;
	}
	public Date getP_imgtime() {
		return p_imgtime;
	}
	public void setP_imgtime(Date p_imgtime) {
		this.p_imgtime = p_imgtime;
	}
}
