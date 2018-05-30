package com.zikezhi.entity;

import java.util.Date;
/**
 * 搜索记录
 * @author lenovo
 *
 */
public class SearchTable {
    private String searchuuid;

    private String content;

    private Date time;

    private String ip;
    
    private String count;
    
    private String search_uid;
    
    public String getSearchuuid() {
        return searchuuid;
    }

    public void setSearchuuid(String searchuuid) {
        this.searchuuid = searchuuid == null ? null : searchuuid.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getSearch_uid() {
		return search_uid;
	}

	public void setSearch_uid(String search_uid) {
		this.search_uid = search_uid;
	}

	@Override
    public String toString() {
        return "SearchTable{" +
                "searchuuid='" + searchuuid + '\'' +
                ", content='" + content + '\'' +
                ", time=" + time +
                ", ip='" + ip + '\'' +
                ", count='" + count + '\'' +
                '}';
    }
}