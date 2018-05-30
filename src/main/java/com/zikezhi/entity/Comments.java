package com.zikezhi.entity;

import java.util.Date;

public class Comments {
    private String commentsuid;

    private Integer commentsid;

    private String useruid;

    private String content;

    private Integer likecount;
    
    private Integer unlikecount;

    private Date createdtime;

    private String topictype;

    private String parentuid;

    private Byte delflag;

    private String level;

    private String path;

    private String remark;

    private String ip;

    private String postkey;

    private String activity;

    public String getCommentsuid() {
        return commentsuid;
    }

    public void setCommentsuid(String commentsuid) {
        this.commentsuid = commentsuid == null ? null : commentsuid.trim();
    }

    public Integer getCommentsid() {
        return commentsid;
    }

    public void setCommentsid(Integer commentsid) {
        this.commentsid = commentsid;
    }

    public String getUseruid() {
        return useruid;
    }

    public void setUseruid(String useruid) {
        this.useruid = useruid == null ? null : useruid.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getLikecount() {
        return likecount;
    }

    public void setLikecount(Integer likecount) {
        this.likecount = likecount;
    }
    
    public Integer getUnlikecount() {
		return unlikecount;
	}

	public void setUnlikecount(Integer unlikecount) {
		this.unlikecount = unlikecount;
	}

	public Date getCreatedtime() {
        return createdtime;
    }

    public void setCreatedtime(Date createdtime) {
        this.createdtime = createdtime;
    }

    public String getTopictype() {
        return topictype;
    }

    public void setTopictype(String topictype) {
        this.topictype = topictype == null ? null : topictype.trim();
    }

    public String getParentuid() {
        return parentuid;
    }

    public void setParentuid(String parentuid) {
        this.parentuid = parentuid == null ? null : parentuid.trim();
    }

    public Byte getDelflag() {
        return delflag;
    }

    public void setDelflag(Byte delflag) {
        this.delflag = delflag;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level == null ? null : level.trim();
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path == null ? null : path.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

    public String getPostkey() {
        return postkey;
    }

    public void setPostkey(String postkey) {
        this.postkey = postkey == null ? null : postkey.trim();
    }

	public String getActivity() {
		return activity;
	}

	public void setActivity(String activity) {
		this.activity = activity;
	}

	@Override
	public String toString() {
		return "Comments [commentsuid=" + commentsuid + ", commentsid=" + commentsid + ", useruid=" + useruid
				+ ", content=" + content + ", likecount=" + likecount + ", createdtime=" + createdtime + ", topictype="
				+ topictype + ", parentuid=" + parentuid + ", delflag=" + delflag + ", level=" + level + ", path="
				+ path + ", remark=" + remark + ", ip=" + ip + ", postkey=" + postkey + ", activity=" + activity + "]";
	}
    
}